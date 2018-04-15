package com.suniceman.po;

import java.io.Serializable;

public class Message implements Serializable {
    
    private static final long serialVersionUID = 1L;
    private int id;
    private int fromeUserId;
    private String fromAvatar;
    private String content;
    private String fromUserName;
    private int toUserId;
    private String toAvatar;
    private String type;
    private String toUserName;
    private String sendTime;
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getFromeUserId() {
        return fromeUserId;
    }
    
    public void setFromeUserId(int fromeUserId) {
        this.fromeUserId = fromeUserId;
    }
    
    public String getFromAvatar() {
        return fromAvatar;
    }
    
    public void setFromAvatar(String fromAvatar) {
        this.fromAvatar = fromAvatar;
    }
    
    public String getContent() {
        return content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    
    public String getFromUserName() {
        return fromUserName;
    }
    
    public void setFromUserName(String fromUserName) {
        this.fromUserName = fromUserName;
    }
    
    public int getToUserId() {
        return toUserId;
    }
    
    public void setToUserId(int toUserId) {
        this.toUserId = toUserId;
    }
    
    public String getToAvatar() {
        return toAvatar;
    }
    
    public void setToAvatar(String toAvatar) {
        this.toAvatar = toAvatar;
    }
    
    public String getType() {
        return type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    
    public String getToUserName() {
        return toUserName;
    }
    
    public void setToUserName(String toUserName) {
        this.toUserName = toUserName;
    }
    
    public String getSendTime() {
        return sendTime;
    }
    
    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
    }
    
}
