package com.suniceman.socket.manager;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.suniceman.po.SocketUser;

public class UserManager implements IUserManager {
    
    private static Map<String, SocketUser> socketUserMap;
    
    private final OnLineUserManager onLineUserManager;
    
    private UserManager() {
        socketUserMap = new ConcurrentHashMap<>();
        onLineUserManager = new OnLineUserManager();
    }
    
    private static UserManager manager = new UserManager();
    
    public static IUserManager getInstance() {
        return manager;
    }
    
    @Override
    public boolean addUser(SocketUser user) {
        
        String sessionUserId = Integer.toString(user.getUserId());
        removeUser(sessionUserId);
        socketUserMap.put(sessionUserId, user);
        // 加入在线列表缓存
        onLineUserManager.addUser(sessionUserId);
        return true;
    }
    
    @Override
    public boolean removeUser(SocketUser user) {
        String sessionUserId = Integer.toString(user.getUserId());
        onLineUserManager.removeUser(sessionUserId);
        return removeUser(sessionUserId);
    }
    
    @Override
    public int getOnlineCount() {
        return socketUserMap.size();
    }
    
    @Override
    public SocketUser getUser(int userId) {
        String key = Integer.toString(userId);
        if (socketUserMap.containsKey(key)) {
            return socketUserMap.get(key);
        }
        return new SocketUser();
    }
    
    private boolean removeUser(String sessionUserId) {
        socketUserMap.remove(sessionUserId);
        return true;
    }
}
