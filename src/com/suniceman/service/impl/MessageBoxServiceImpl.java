package com.suniceman.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suniceman.mapper.MessageBoxMapper;
import com.suniceman.po.MessageBox;
import com.suniceman.service.MessageBoxService;

@Service
public class MessageBoxServiceImpl implements MessageBoxService {
    
    @Autowired
    private MessageBoxMapper messageBoxMapper;
    
    @Override
    public void save(MessageBox messageBox) {
        // TODO Auto-generated method stub
        messageBoxMapper.save(messageBox);
    }
    
    @Override
    public List<MessageBox> getMyMessage(int friendId) {
        // TODO Auto-generated method stub
        return messageBoxMapper.getMyMessage(friendId);
    }
    
    @Override
    public void agreeFriend(MessageBox messageBox) {
        // TODO Auto-generated method stub
        messageBoxMapper.agreeFriend(messageBox);
    }
    
    @Override
    public MessageBox findByFriendIdAndUserId(MessageBox messageBox) {
        // TODO Auto-generated method stub
        return messageBoxMapper.findByFriendIdAndUserId(messageBox);
    }
    
    @Override
    public void refuseFriend(MessageBox messageBox) {
        // TODO Auto-generated method stub
        messageBoxMapper.refuseFriend(messageBox);
    }
    
    @Override
    public int getMessageCount(int id) {
        // TODO Auto-generated method stub
        return messageBoxMapper.getMessageCount(id);
    }
    
}
