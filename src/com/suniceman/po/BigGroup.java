package com.suniceman.po;

import java.io.Serializable;

public class BigGroup implements Serializable {
    
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private int id;
    private String avatar;
    private String groupname;
    private int userId;
    private String createdTime;
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getAvatar() {
        return avatar;
    }
    
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    
    public String getGroupname() {
        return groupname;
    }
    
    public void setGroupname(String groupname) {
        this.groupname = groupname;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public String getCreatedTime() {
        return createdTime;
    }
    
    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }
}
