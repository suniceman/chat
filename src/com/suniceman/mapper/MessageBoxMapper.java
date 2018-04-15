package com.suniceman.mapper;

import java.util.List;

import com.suniceman.po.MessageBox;

public interface MessageBoxMapper {
    
    void save(MessageBox messageBox);
    
    List<MessageBox> getMyMessage(int friendId);
    
    void agreeFriend(MessageBox messageBox);
    
    MessageBox findByFriendIdAndUserId(MessageBox messageBox);
    
    void refuseFriend(MessageBox messageBox);
    
    int getMessageCount(int id);
    
}
