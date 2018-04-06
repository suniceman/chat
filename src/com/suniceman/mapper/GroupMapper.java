package com.suniceman.mapper;

import java.util.List;

import com.suniceman.po.Group;

public interface GroupMapper {
    
    List<Group> findByUserId(int userId);
    
    void createDefaultGroup(int registUserId);
    
}
