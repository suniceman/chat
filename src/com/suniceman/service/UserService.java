package com.suniceman.service;

import java.util.List;

import com.suniceman.po.GroupUser;
import com.suniceman.po.User;
import com.suniceman.po.UserVo;

public interface UserService {
    
    void regist(User user);
    
    User login(String email);
    
    void updatePassword(User user);
    
    List<User> findByGroupId(int groupId);
    
    void changeSign(User user);
    
    void deleteFriend(GroupUser groupUser);
    
    User findByName(String username);
    
    List<User> findAll();
    
    User findById(int userId);
    
    User loginBack(String username);
    
    int showCount(UserVo userVo);
    
    List<User> showByPage(UserVo userVo);
    
    void delete(int id);
    
    void changeAdminPassword(User admin);
    
    User checkName(String name);
    
    void updateUser(User user);
}
