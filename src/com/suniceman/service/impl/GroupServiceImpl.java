package com.suniceman.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suniceman.mapper.GroupMapper;
import com.suniceman.po.Group;
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
    
}
