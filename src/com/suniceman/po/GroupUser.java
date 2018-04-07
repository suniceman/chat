package com.suniceman.po;

import java.io.Serializable;

public class GroupUser implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    private int id;
    private int groupId;
    private int userId;
    private int ownId;
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getGroupId() {
        return groupId;
    }
    
    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public int getOwnId() {
        return ownId;
    }
    
    public void setOwnId(int ownId) {
        this.ownId = ownId;
    }
}
