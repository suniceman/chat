package com.suniceman.po;

import java.io.Serializable;

public class User implements Serializable {
    
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private int id;
    private int fgid;
    private String sign;
    private String avatar;
    private String username;
    
    public int getFgid() {
        return fgid;
    }
    
    public void setFgid(int fgid) {
        this.fgid = fgid;
    }
    
    public User() {
        
    }
    
    public User(int id, String username, String sign, String avatar) {
        this.id = id;
        this.username = username;
        this.sign = sign;
        this.avatar = avatar;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getSign() {
        return sign;
    }
    
    public void setSign(String sign) {
        this.sign = sign;
    }
    
    public String getAvatar() {
        return avatar;
    }
    
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
}
