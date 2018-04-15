package com.suniceman.po;

import java.io.Serializable;

public class MessageBox implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    private int id;
    private int userId;
    private int friendId;
    private int status;
    private String remark;
    private int groupId;
    private String createdTime;
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public int getFriendId() {
        return friendId;
    }
    
    public void setFriendId(int friendId) {
        this.friendId = friendId;
    }
    
    public int getStatus() {
        return status;
    }
    
    public void setStatus(int status) {
        this.status = status;
    }
    
    public String getRemark() {
        return remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }
    
    public int getGroupId() {
        return groupId;
    }
    
    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }
    
    public String getCreatedTime() {
        return createdTime;
    }
    
    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }
    
}
