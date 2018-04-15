package com.suniceman.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suniceman.mapper.UserMapper;
import com.suniceman.po.GroupUser;
import com.suniceman.po.User;
import com.suniceman.po.UserVo;
import com.suniceman.service.UserService;

@Service
public class UserServiceImpl implements UserService {
    
    @Autowired
    private UserMapper userMapper;
    
    @Override
    public void regist(User user) {
        // TODO Auto-generated method stub
        userMapper.regist(user);
    }
    
    @Override
    public User login(String email) {
        // TODO Auto-generated method stub
        return userMapper.login(email);
    }
    
    @Override
    public void updatePassword(User user) {
        // TODO Auto-generated method stub
        userMapper.updatePassword(user);
    }
    
    @Override
    public List<User> findByGroupId(int groupId) {
        // TODO Auto-generated method stub
        return userMapper.findByGroupId(groupId);
    }
    
    @Override
    public void changeSign(User user) {
        // TODO Auto-generated method stub
        userMapper.changeSign(user);
    }
    
    @Override
    public void deleteFriend(GroupUser groupUser) {
        // TODO Auto-generated method stub
        userMapper.deleteFriend(groupUser);
    }
    
    @Override
    public User findByName(String username) {
        // TODO Auto-generated method stub
        return userMapper.findByName(username);
    }
    
    @Override
    public List<User> findAll() {
        // TODO Auto-generated method stub
        return userMapper.findAll();
    }
    
    @Override
    public User findById(int userId) {
        // TODO Auto-generated method stub
        return userMapper.findById(userId);
    }
    
    @Override
    public User loginBack(String username) {
        // TODO Auto-generated method stub
        return userMapper.loginBack(username);
    }
    
    @Override
    public int showCount(UserVo userVo) {
        // TODO Auto-generated method stub
        return userMapper.showCount(userVo);
    }
    
    @Override
    public List<User> showByPage(UserVo userVo) {
        // TODO Auto-generated method stub
        return userMapper.showByPage(userVo);
    }
    
    @Override
    public void delete(int id) {
        // TODO Auto-generated method stub
        userMapper.delete(id);
    }
    
    @Override
    public void changeAdminPassword(User admin) {
        // TODO Auto-generated method stub
        userMapper.changeAdminPassword(admin);
    }
    
    @Override
    public User checkName(String name) {
        // TODO Auto-generated method stub
        return userMapper.checkName(name);
    }
    
    @Override
    public void updateUser(User user) {
        // TODO Auto-generated method stub
        userMapper.updateUser(user);
    }
}
