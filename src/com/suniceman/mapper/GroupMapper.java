package com.suniceman.mapper;

import java.util.List;

import com.suniceman.po.Group;
import com.suniceman.po.GroupUser;

public interface GroupMapper {
    
    List<Group> findByUserId(int userId);
    
    void createDefaultGroup(int registUserId);
    
    void renameGroup(Group group);
    
    void createGroup(Group group);
    
    Group findById(int parseInt);
    
    void deleteById(int id);
    
    void deleteFriendsById(int id);
    
    void moveFriend(GroupUser groupUser);
    
    void joinDefaultGroup(int registUserId);
    
    void addFriend(GroupUser mineGroupUser);
}
