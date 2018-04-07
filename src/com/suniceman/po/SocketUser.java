package com.suniceman.po;

import javax.websocket.Session;

public class SocketUser {
    public Session getSession() {
        return session;
    }
    
    public void setSession(Session session) {
        this.session = session;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public boolean isExist() {
        return this.userId > 0;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    private Session session;
    private int userId;
    
    @Override
    public String toString() {
        return session.getId() + "_" + userId;
    }
}
