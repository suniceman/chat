package com.suniceman.po;

import java.util.List;

public class FriendGroup extends Group {
    private static final long serialVersionUID = 1L;
    private int online;
    private List<User> list;
    
    public int getOnline() {
        return online;
    }
    
    public void setOnline(int online) {
        this.online = online;
    }
    
    public List<User> getList() {
        return list;
    }
    
    public void setList(List<User> list) {
        this.list = list;
    }
    
}
