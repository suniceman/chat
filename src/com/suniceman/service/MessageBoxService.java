package com.suniceman.service;

import java.util.List;

import com.suniceman.po.MessageBox;

public interface MessageBoxService {
    
    void save(MessageBox messageBox);
    
    List<MessageBox> getMyMessage(int id);
    
    void agreeFriend(MessageBox messageBox);
    
    MessageBox findByFriendIdAndUserId(MessageBox messageBox);
    
    void refuseFriend(MessageBox messageBox);
    
    int getMessageCount(int id);
    
}
