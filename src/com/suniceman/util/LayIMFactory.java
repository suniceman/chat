package com.suniceman.util;

import com.suniceman.socket.manager.IUserManager;
import com.suniceman.socket.manager.UserManager;

public class LayIMFactory {
    
    // ����������Ա������
    public static IUserManager createManager() {
        return UserManager.getInstance();
    }
}
