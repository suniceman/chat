package com.suniceman.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suniceman.mapper.GroupMapper;
import com.suniceman.po.Group;
import com.suniceman.po.GroupUser;
import com.suniceman.service.GroupService;

@Service
public class GroupServiceImpl implements GroupService {
    
    @Autowired
    private GroupMapper groupMapper;
    
    @Override
    public List<Group> findByUserId(int userId) {
        // TODO Auto-generated method stub
        return groupMapper.findByUserId(userId);
    }
    
    @Override
    public void createDefaultGroup(int registUserId) {
        // TODO Auto-generated method stub
        groupMapper.createDefaultGroup(registUserId);
    }
    
    @Override
    public void renameGroup(Group group) {
        // TODO Auto-generated method stub
        groupMapper.renameGroup(group);
    }
    
    @Override
    public void createGroup(Group group) {
        // TODO Auto-generated method stub
        groupMapper.createGroup(group);
    }
    
    @Override
    public Group findById(int parseInt) {
        // TODO Auto-generated method stub
        return groupMapper.findById(parseInt);
    }
    
    @Override
    public void deleteById(int id) {
        // TODO Auto-generated method stub
        groupMapper.deleteById(id);
    }
    
    @Override
    public void deleteFriendsById(int id) {
        // TODO Auto-generated method stub
        groupMapper.deleteFriendsById(id);
    }
    
    @Override
    public void moveFriend(GroupUser groupUser) {
        // TODO Auto-generated method stub
        groupMapper.moveFriend(groupUser);
    }
    
    @Override
    public void joinDefaultGroup(int registUserId) {
        // TODO Auto-generated method stub
        groupMapper.joinDefaultGroup(registUserId);
    }
}
