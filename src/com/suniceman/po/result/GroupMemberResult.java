package com.suniceman.po.result;

import java.util.List;

import com.suniceman.po.User;

public class GroupMemberResult {
    public User getOwner() {
        return owner;
    }
    
    public void setOwner(User owner) {
        this.owner = owner;
    }
    
    public List<User> getList() {
        return list;
    }
    
    public void setList(List<User> list) {
        this.list = list;
    }
    
    private User owner;
    private List<User> list;
}
