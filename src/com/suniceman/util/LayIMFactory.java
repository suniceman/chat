package com.suniceman.util;

import com.suniceman.socket.manager.IUserManager;
import com.suniceman.socket.manager.UserManager;

public class LayIMFactory {
    
    // 创建在线人员管理工具
    public static IUserManager createManager() {
        return UserManager.getInstance();
    }
}
