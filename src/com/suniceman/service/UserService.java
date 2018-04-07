package com.suniceman.service;

import java.util.List;

import com.suniceman.po.GroupUser;
import com.suniceman.po.User;

public interface UserService {
    
    void regist(User user);
    
    User login(String email);
    
    void updatePassword(User user);
    
    List<User> findByGroupId(int groupId);
    
    void changeSign(User user);
    
    void deleteFriend(GroupUser groupUser);
}
