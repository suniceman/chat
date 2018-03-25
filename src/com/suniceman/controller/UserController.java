package com.suniceman.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suniceman.po.BigGroup;
import com.suniceman.po.FriendGroup;
import com.suniceman.po.JsonResultType;
import com.suniceman.po.StatusUser;
import com.suniceman.po.User;
import com.suniceman.po.result.BaseDataResult;
import com.suniceman.po.result.JsonResult;

@Controller
@RequestMapping("/user")
public class UserController {
    
    @SuppressWarnings("null")
    @ResponseBody
    @RequestMapping("/getList")
    public JsonResult getList() {
        JsonResult jsonResult = new JsonResult();
        BaseDataResult result = new BaseDataResult();
        jsonResult.setCode(JsonResultType.typeSuccess);
        jsonResult.setMsg("");
        // friend
        List<FriendGroup> friendGroups = null;
        List<User> users = null;
        // group
        List<BigGroup> groups = null;
        StatusUser statusUser = new StatusUser();
        statusUser.setStatus("在线");
        statusUser.setId(1);
        statusUser.setUsername("苏北陈");
        statusUser.setAvatar("http://suniceman.cn/cdn/200.jpg");
        statusUser.setFgid(1);
        statusUser.setSign("我是最帅的");
        
        FriendGroup friendGroup = new FriendGroup();
        friendGroup.setGroupname("最美工作室");
        friendGroup.setId(1);
        friendGroup.setOnline(1);
        // friendGroups.set(0, friendGroup);
        // result.setFriend(friendGroups);
        result.setMine(statusUser);
        jsonResult.setData(result);
        return jsonResult;
    }
}
