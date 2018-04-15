package com.suniceman.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.suniceman.po.BigGroup;
import com.suniceman.po.Group;
import com.suniceman.po.GroupUser;
import com.suniceman.po.JsonResult;
import com.suniceman.po.MessageBox;
import com.suniceman.po.User;
import com.suniceman.service.BigGroupService;
import com.suniceman.service.GroupService;
import com.suniceman.service.MessageBoxService;
import com.suniceman.service.UserService;
import com.suniceman.util.Md5Util;

@Controller
@RequestMapping("/user")
public class UserController {
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private GroupService groupService;
    
    @Autowired
    private BigGroupService bigGroupService;
    
    @Autowired
    private MessageBoxService messageBoxService;
    
    @RequestMapping("/login")
    public String login() {
        return "login/login";
    }
    
    @RequestMapping("/forgot")
    public String forgot() {
        return "login/forgot";
    }
    
    @ResponseBody
    @RequestMapping("/getList")
    public Object getList(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        user.setStatus("online");
        
        JsonResult jsonResult = new JsonResult();
        jsonResult.setCode(0);
        jsonResult.setMsg("");
        Map data = new HashMap();
        data.put("mine", user);
        int userId = user.getId();
        List<Group> groupList = groupService.findByUserId(userId);
        List friends = new ArrayList();
        if (!groupList.isEmpty() && groupList.size() != 0) {
            for (Group group : groupList) {
                Map friend = new HashMap();
                friend.put("id", group.getId());
                friend.put("groupname", group.getGroupname());
                int groupId = group.getId();
                List<User> userList = userService.findByGroupId(groupId);
                List<User> userList2 = new ArrayList<User>();
                for (User user2 : userList) {
                    user2.setAvatar("/cdn/" + user2.getAvatar());
                    userList2.add(user2);
                }
                friend.put("list", userList2);
                friends.add(friend);
            }
        }
        data.put("friend", friends);
        
        List<BigGroup> bigGroupList = bigGroupService.findBigGroupByUserId(userId);
        
        List groups = new ArrayList();
        if (!bigGroupList.isEmpty() && bigGroupList.size() != 0) {
            for (BigGroup bigGroup : bigGroupList) {
                Map group = new HashMap();
                group.put("id", bigGroup.getId());
                group.put("groupname", bigGroup.getGroupname());
                group.put("avatar", "/cdn/" + bigGroup.getAvatar());
                groups.add(group);
            }
        }
        data.put("group", groups);
        jsonResult.setData(data);
        return jsonResult;
    }
    
    @ResponseBody
    @RequestMapping("/getmsg")
    public Object getmsg(HttpServletRequest request) {
        Map result = new HashMap();
        result.put("code", 0);
        result.put("pages", 1);
        List message = new ArrayList();
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        List<MessageBox> messageBoxList = messageBoxService.getMyMessage(user.getId());
        
        if (!messageBoxList.isEmpty() && messageBoxList.size() != 0) {
            for (MessageBox messageBox : messageBoxList) {
                User requersUser = userService.findById(messageBox.getUserId());
                Map info = new HashMap();
                info.put("id", messageBox.getId());
                info.put("content", "申请添加你为好友");
                info.put("from", messageBox.getUserId());
                info.put("remark", messageBox.getRemark());
                info.put("time", "时间" + messageBox.getCreatedTime());
                Map requersUserMap = new HashMap();
                requersUserMap.put("id", requersUser.getId());
                requersUserMap.put("avatar", "/cdn/" + requersUser.getAvatar());
                requersUserMap.put("username", requersUser.getUsername());
                requersUserMap.put("sign", requersUser.getSign());
                info.put("user", requersUserMap);
                message.add(info);
            }
        }
        result.put("data", message);
        
        return result;
    }
    
    @ResponseBody
    @RequestMapping("/getAllUsers")
    public Object getAllUsers(HttpServletRequest request, HttpServletResponse resopnse) throws Exception {
        JsonResult jsonResult = new JsonResult();
        jsonResult.setCode(0);
        jsonResult.setMsg("");
        Map data = new HashMap();
        List<User> userList = userService.findAll();
        List<User> userList2 = new ArrayList<User>();
        for (User user : userList) {
            user.setAvatar("/cdn/" + user.getAvatar());
            userList2.add(user);
        }
        data.put("members", userList.size());
        data.put("list", userList2);
        jsonResult.setData(data);
        return jsonResult;
    }
    
    @RequestMapping("/regist")
    private String register(User user, HttpServletRequest request, MultipartFile pictureFile)
            throws IllegalStateException, IOException {
        String pictureName = UUID.randomUUID()
                + pictureFile.getOriginalFilename().substring(pictureFile.getOriginalFilename().lastIndexOf("."));
        String pathPicture = "/home/cdn/" + pictureName;
        File filePicture = new File(pathPicture);
        pictureFile.transferTo(filePicture);
        user.setAvatar(pictureName);
        user.setPassword(Md5Util.getMd5(user.getPassword()));
        userService.regist(user);
        String email = user.getEmail();
        User registUser = userService.login(email);
        int registUserId = registUser.getId();
        groupService.createDefaultGroup(registUserId);
        groupService.joinDefaultGroup(registUserId);
        return "login/login";
    }
    
    @RequestMapping("/dologin")
    public String doLogin(User user, HttpServletRequest request, HttpServletResponse response) {
        String email = user.getEmail();
        String loginPwd = Md5Util.getMd5(user.getPassword());
        User loginUser = userService.login(email);
        
        if (null != loginUser && loginUser.getPassword().equals(loginPwd)) {
            HttpSession session = request.getSession();
            loginUser.setPassword(null);
            loginUser.setAvatar("/cdn/" + loginUser.getAvatar());
            session.setAttribute("user", loginUser);
            return "redirect:/chat/chat.action";
        } else {
            request.setAttribute("email", email);
            request.setAttribute("password", user.getPassword());
            request.setAttribute("errorMessage", "用户名或密码错误!");
            return "login/login";
        }
    }
    
    @RequestMapping("/check")
    public String check(User user, HttpServletRequest request, HttpServletResponse response) {
        String email = user.getEmail();
        user.setPassword(Md5Util.getMd5(user.getPassword()));
        User loginUser = userService.login(email);
        if (null != loginUser) {
            int count = 0;
            if (loginUser.getQuestionOne().equals(user.getQuestionOne())) {
                count++;
            }
            
            if (loginUser.getQuestionTwo().equals(user.getQuestionTwo())) {
                count++;
            }
            
            if (loginUser.getQuestionThree().equals(user.getQuestionThree())) {
                count++;
            }
            if (count >= 2) {
                userService.updatePassword(user);
                return "login/login";
            } else {
                request.setAttribute("email", email);
                request.setAttribute("password", user.getPassword());
                request.setAttribute("errorMessage", "邮箱或密保不正确!");
                return "login/forgot";
            }
        } else {
            request.setAttribute("email", email);
            request.setAttribute("password", user.getPassword());
            request.setAttribute("errorMessage", "邮箱或密保不正确!");
            return "login/forgot";
        }
    }
    
    @RequestMapping("/changeSign")
    public @ResponseBody
    String changeSign(HttpServletRequest request, HttpServletResponse resopnse) throws Exception {
        resopnse.setCharacterEncoding("UTF-8");
        String sign = request.getParameter("sign");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        user.setSign(sign);
        userService.changeSign(user);
        return "success";
    }
    
    // 删除好友
    @RequestMapping("/deleteFriend")
    public @ResponseBody
    String deleteFriend(HttpServletRequest request, HttpServletResponse resopnse) throws Exception {
        resopnse.setCharacterEncoding("UTF-8");
        String friendId = request.getParameter("friendId");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        // 互相删除好友
        GroupUser groupUser = new GroupUser();
        groupUser.setUserId(Integer.parseInt(friendId));
        groupUser.setOwnId(user.getId());
        userService.deleteFriend(groupUser);
        // 从对方的好友列表中讲自己删除
        GroupUser groupUser2 = new GroupUser();
        groupUser2.setUserId(user.getId());
        groupUser2.setOwnId(Integer.parseInt(friendId));
        userService.deleteFriend(groupUser2);
        
        return "success";
    }
    
    // 分组重命名
    @RequestMapping("/groupRename")
    public @ResponseBody
    String groupRename(HttpServletRequest request, HttpServletResponse resopnse) throws Exception {
        resopnse.setCharacterEncoding("UTF-8");
        String groupId = request.getParameter("groupId");
        String groupName = request.getParameter("groupName");
        
        Group group = new Group();
        group.setId(Integer.parseInt(groupId));
        group.setGroupname(groupName);
        groupService.renameGroup(group);
        return "success";
    }
    
    // 新建分组
    @RequestMapping("/createGroup")
    public @ResponseBody
    String createGroup(HttpServletRequest request, HttpServletResponse resopnse) throws Exception {
        resopnse.setCharacterEncoding("UTF-8");
        String groupName = request.getParameter("groupName");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Group group = new Group();
        group.setUserId(user.getId());
        group.setGroupname(groupName);
        groupService.createGroup(group);
        return "success";
    }
    
    // 删除分组
    @RequestMapping("/deleteGroup")
    public @ResponseBody
    String deleteGroup(HttpServletRequest request, HttpServletResponse resopnse) throws Exception {
        resopnse.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("groupId"));
        groupService.deleteFriendsById(id);
        groupService.deleteById(id);
        return "success";
    }
    
    // 移动好友分组
    @RequestMapping("/moveFriend")
    public @ResponseBody
    String moveFriend(HttpServletRequest request, HttpServletResponse resopnse) throws Exception {
        resopnse.setCharacterEncoding("UTF-8");
        int groupId = Integer.parseInt(request.getParameter("groupId"));
        int friendId = Integer.parseInt(request.getParameter("friendId"));
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        GroupUser groupUser = new GroupUser();
        
        groupUser.setGroupId(groupId);
        groupUser.setOwnId(user.getId());
        groupUser.setUserId(friendId);
        groupService.moveFriend(groupUser);
        return "success";
    }
    
    // searchFriend 查找好友
    
    @RequestMapping("/searchFriend")
    public @ResponseBody
    User searchFriend(HttpServletRequest request, HttpServletResponse resopnse) throws Exception {
        resopnse.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        User user = userService.findByName(username);
        
        return user;
    }
    
    @RequestMapping("/saveRequest")
    public @ResponseBody
    String saveRequest(HttpServletRequest request, HttpServletResponse resopnse) throws Exception {
        resopnse.setCharacterEncoding("UTF-8");
        int groupId = Integer.parseInt(request.getParameter("groupId"));
        String remark = request.getParameter("remark");
        int friendId = Integer.parseInt(request.getParameter("friendId"));
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        MessageBox messageBox = new MessageBox();
        messageBox.setFriendId(friendId);
        messageBox.setStatus(0);
        messageBox.setGroupId(groupId);
        messageBox.setRemark(remark);
        messageBox.setUserId(user.getId());
        messageBoxService.save(messageBox);
        return "success";
    }
    
    // 添加好友
    @RequestMapping("/agreeFriend")
    public @ResponseBody
    String agreeFriend(HttpServletRequest request, HttpServletResponse resopnse) throws Exception {
        resopnse.setCharacterEncoding("UTF-8");
        int uid = Integer.parseInt(request.getParameter("uid"));
        int groupId = Integer.parseInt(request.getParameter("groupId"));
        HttpSession session = request.getSession();
        // 当前在线的用户
        User user = (User) session.getAttribute("user");
        MessageBox messageBox = new MessageBox();
        messageBox.setUserId(uid);
        messageBox.setFriendId(user.getId());
        
        // 添加我的好友分组
        GroupUser mineGroupUser = new GroupUser();
        mineGroupUser.setGroupId(groupId);
        mineGroupUser.setOwnId(user.getId());
        mineGroupUser.setUserId(uid);
        groupService.addFriend(mineGroupUser);
        
        // 添加好友的好友分组
        GroupUser friendGroupUser = new GroupUser();
        MessageBox messageBox2 = messageBoxService.findByFriendIdAndUserId(messageBox);
        friendGroupUser.setGroupId(messageBox2.getGroupId());
        friendGroupUser.setOwnId(uid);
        friendGroupUser.setUserId(user.getId());
        
        groupService.addFriend(friendGroupUser);
        
        messageBoxService.agreeFriend(messageBox);
        
        return "success";
    }
    
    @RequestMapping("/refuseFriend")
    public @ResponseBody
    String refuseFriend(HttpServletRequest request, HttpServletResponse resopnse) throws Exception {
        resopnse.setCharacterEncoding("UTF-8");
        int uid = Integer.parseInt(request.getParameter("uid"));
        
        HttpSession session = request.getSession();
        // 当前在线的用户
        User user = (User) session.getAttribute("user");
        MessageBox messageBox = new MessageBox();
        messageBox.setUserId(uid);
        messageBox.setFriendId(user.getId());
        
        messageBoxService.refuseFriend(messageBox);
        return "success";
    }
    
    @RequestMapping("/getMessageCount")
    public @ResponseBody
    int getMessageCount(HttpServletRequest request, HttpServletResponse resopnse) throws Exception {
        HttpSession session = request.getSession();
        // 当前在线的用户
        User user = (User) session.getAttribute("user");
        
        return messageBoxService.getMessageCount(user.getId());
    }
    
}
