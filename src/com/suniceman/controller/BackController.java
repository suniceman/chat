package com.suniceman.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.suniceman.po.MessageVo;
import com.suniceman.po.User;
import com.suniceman.po.UserVo;
import com.suniceman.service.GroupService;
import com.suniceman.service.MessageService;
import com.suniceman.service.UserService;
import com.suniceman.util.Md5Util;

@Controller
@RequestMapping("/back")
public class BackController {
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private MessageService messageService;
    
    @Autowired
    private GroupService groupService;
    
    @RequestMapping("/login")
    public String login() {
        return "back/login";
    }
    
    @RequestMapping("/dologin")
    public String doLogin(User user, HttpServletRequest request, HttpServletResponse response) {
        String username = user.getUsername();
        String loginPwd = Md5Util.getMd5(user.getPassword());
        User loginUser = userService.loginBack(username);
        
        if (null != loginUser && loginUser.getPassword().equals(loginPwd)) {
            HttpSession session = request.getSession();
            loginUser.setPassword(null);
            session.setAttribute("admin", loginUser);
            return "redirect:/back/main.action";
        } else {
            request.setAttribute("username", username);
            request.setAttribute("password", user.getPassword());
            request.setAttribute("errorMessage", "用户名或密码错误!");
            return "back/login";
        }
    }
    
    @RequestMapping("/showMessage")
    public String showMessage(Model model, HttpServletRequest request, HttpServletResponse response)
            throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        MessageVo messageVo = new MessageVo();
        String content = request.getParameter("content");
        String currentPage = request.getParameter("currentPage");
        
        if (content != null && !"".equals(content)) {
            content = new String(content.getBytes("ISO-8859-1"), "UTF-8");
        }
        messageVo.setContent(content);
        int maxPageNum = messageService.showCount(messageVo);
        maxPageNum = maxPageNum % 10 == 0 ? maxPageNum / 10 : maxPageNum / 10 + 1;
        int curPage;
        if (null == currentPage || "".equals(currentPage)) {
            curPage = 1;
        } else {
            curPage = Integer.parseInt(currentPage);
            if (curPage < 1) {
                curPage = 1;
            }
            if (curPage > maxPageNum) {
                curPage = maxPageNum;
            }
        }
        
        messageVo.setPageNum((curPage - 1) * 10);
        List<MessageVo> messageVoList = messageService.showByPage(messageVo);
        model.addAttribute("messageVoList", messageVoList);
        model.addAttribute("currentPage", curPage);
        model.addAttribute("maxPageNum", maxPageNum);
        model.addAttribute("content", content);
        return "back/message";
    }
    
    @RequestMapping("/delMessage")
    public String delMessage(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        messageService.deleteById(id);
        return "redirect:showMessage.action";
    }
    
    @RequestMapping("/main")
    public String main() {
        return "back/main";
    }
    
    @RequestMapping("/backLogout")
    public String backLogout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/back/login.action";
    }
    
    @RequestMapping("/addUser")
    public String addUser() {
        return "back/createUser";
    }
    
    @RequestMapping("/editUser")
    public String editUser(Model model, HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.findById(id);
        model.addAttribute("editUser", user);
        return "back/editUser";
    }
    
    @RequestMapping("/createUser")
    public String createUser(User user, MultipartFile pictureFile, HttpServletRequest request)
            throws IllegalStateException, IOException {
        String pictureName = UUID.randomUUID()
                + pictureFile.getOriginalFilename().substring(pictureFile.getOriginalFilename().lastIndexOf("."));
        String pathPicture = "/home/cdn/" + pictureName;
        File filePicture = new File(pathPicture);
        pictureFile.transferTo(filePicture);
        user.setAvatar(pictureName);
        String pwd = Md5Util.getMd5(user.getPassword());
        user.setPassword(pwd);
        userService.regist(user);
        
        String email = user.getEmail();
        User registUser = userService.login(email);
        int registUserId = registUser.getId();
        groupService.createDefaultGroup(registUserId);
        groupService.joinDefaultGroup(registUserId);
        return "redirect:showUser.action";
    }
    
    @RequestMapping("/updateUser")
    public String updateUser(User user, HttpServletRequest request) {
        String pwd = Md5Util.getMd5(user.getPassword());
        user.setPassword(pwd);
        userService.updateUser(user);
        return "redirect:showUser.action";
    }
    
    @RequestMapping("/checkName")
    public void checkName(HttpServletRequest request, HttpServletResponse resopnse) throws Exception {
        resopnse.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        User user = userService.checkName(name);
        PrintWriter out = resopnse.getWriter();
        if (null != user) {
            out.print("right");
        } else {
            out.print("error");
        }
        out.flush();
        out.close();
    }
    
    @RequestMapping("/showUser")
    public String showUser(Model model, HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String currentPage = request.getParameter("currentPage");
        if (username != null && !"".equals(username)) {
            username = new String(username.getBytes("ISO-8859-1"), "UTF-8");
        }
        UserVo userVo = new UserVo();
        userVo.setUsername(username);
        int maxPageNum = userService.showCount(userVo);
        maxPageNum = maxPageNum % 10 == 0 ? maxPageNum / 10 : maxPageNum / 10 + 1;
        int curPage;
        if (null == currentPage || "".equals(currentPage)) {
            curPage = 1;
        } else {
            curPage = Integer.parseInt(currentPage);
            if (curPage < 1) {
                curPage = 1;
            }
            if (curPage > maxPageNum) {
                curPage = maxPageNum;
            }
        }
        userVo.setPageNum((curPage - 1) * 10);
        
        List<User> userList = userService.showByPage(userVo);
        model.addAttribute("userList", userList);
        model.addAttribute("currentPage", curPage);
        model.addAttribute("maxPageNum", maxPageNum);
        model.addAttribute("username", username);
        return "back/userManagement";
    }
    
    @RequestMapping("/updatePassword")
    public String updatePassword() {
        return "back/updatePassword";
    }
    
    @RequestMapping("/checkPassword")
    public void pwd(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String oldPassword = request.getParameter("oldPassword");
        HttpSession session = request.getSession();
        User admin = (User) session.getAttribute("admin");
        oldPassword = Md5Util.getMd5(oldPassword);
        admin = userService.findById(admin.getId());
        PrintWriter out = response.getWriter();
        if (!admin.getPassword().equals(oldPassword)) {
            out.print("error");
        } else {
            out.print("right");
        }
        out.flush();
        out.close();
    }
    
    @RequestMapping("/changePassword")
    public void changePassword(User user, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User admin = (User) session.getAttribute("admin");
        String password = Md5Util.getMd5(user.getPassword());
        admin.setPassword(password);
        userService.changeAdminPassword(admin);
        session.invalidate();
        response.getWriter().print(
                "<script>alert('修改密码成功！请重新登录！');window.open('/chat/back/login.action','_top')</script>");
    }
    
    @RequestMapping("/delUser")
    public String delUser(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        userService.delete(id);
        
        // 删除此人的聊天记录
        messageService.deleteByUserId(id);
        return "redirect:showUser.action";
    }
}
