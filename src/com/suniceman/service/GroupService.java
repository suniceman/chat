package com.suniceman.service;

import java.util.List;

import com.suniceman.po.Group;

public interface GroupService {
    
    List<Group> findByUserId(int userId);
    
    void createDefaultGroup(int registUserId);
    
    void renameGroup(Group group);
    
    void createGroup(Group group);
    
    Group findById(int parseInt);
    
    void deleteById(int id);
    
    void deleteFriendsById(int id);
}
