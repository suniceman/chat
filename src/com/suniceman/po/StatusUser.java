package com.suniceman.po;

public class StatusUser extends User {
    private static final long serialVersionUID = 1L;
    private String status;
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
}
