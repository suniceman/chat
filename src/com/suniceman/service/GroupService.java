package com.suniceman.service;

import java.util.List;

import com.suniceman.po.Group;

public interface GroupService {
    
    List<Group> findByUserId(int userId);
    
    void createDefaultGroup(int registUserId);
}
