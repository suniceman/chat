package com.suniceman.po;

import java.io.Serializable;

public class Group implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    private int id;
    private String groupname;
    private String createdTime;
    private int userId;
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getGroupname() {
        return groupname;
    }
    
    public void setGroupname(String groupname) {
        this.groupname = groupname;
    }
    
    public String getCreatedTime() {
        return createdTime;
    }
    
    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
}
