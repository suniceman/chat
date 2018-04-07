package com.suniceman.socket.manager;

import com.suniceman.po.SocketUser;

public interface IUserManager {
    
    boolean addUser(SocketUser user);
    
    boolean removeUser(SocketUser user);
    
    int getOnlineCount();
    
    SocketUser getUser(int userId);
    
}
