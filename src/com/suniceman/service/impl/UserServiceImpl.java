package com.suniceman.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suniceman.mapper.UserMapper;
import com.suniceman.po.User;
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
}
