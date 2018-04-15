package com.suniceman.po;

import java.io.Serializable;

public class UserVo implements Serializable {
    
    private static final long serialVersionUID = 1L;
    private int id;
    private String username;
    private String password;
    private String email;
    private String sign;
    private String avatar;
    private double money;
    private String questionOne;
    private String questionTwo;
    private String questionThree;
    private String createdTime;
    private String status;
    private int roleId;
    private int pageNum;
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
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
    
    public double getMoney() {
        return money;
    }
    
    public void setMoney(double money) {
        this.money = money;
    }
    
    public String getQuestionOne() {
        return questionOne;
    }
    
    public void setQuestionOne(String questionOne) {
        this.questionOne = questionOne;
    }
    
    public String getQuestionTwo() {
        return questionTwo;
    }
    
    public void setQuestionTwo(String questionTwo) {
        this.questionTwo = questionTwo;
    }
    
    public String getQuestionThree() {
        return questionThree;
    }
    
    public void setQuestionThree(String questionThree) {
        this.questionThree = questionThree;
    }
    
    public String getCreatedTime() {
        return createdTime;
    }
    
    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public int getRoleId() {
        return roleId;
    }
    
    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
    
    public int getPageNum() {
        return pageNum;
    }
    
    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }
    
}
