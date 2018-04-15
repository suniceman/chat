package com.suniceman.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suniceman.mapper.MessageMapper;
import com.suniceman.po.Message;
import com.suniceman.po.MessageVo;
import com.suniceman.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {
    
    @Autowired
    private MessageMapper messageMapper;
    
    @Override
    public void saveMessage(Message message) {
        // TODO Auto-generated method stub
        messageMapper.saveMessage(message);
    }
    
    @Override
    public int showCount(MessageVo messageVo) {
        // TODO Auto-generated method stub
        return messageMapper.showCount(messageVo);
    }
    
    @Override
    public List<MessageVo> showByPage(MessageVo messageVo) {
        // TODO Auto-generated method stub
        return messageMapper.showByPage(messageVo);
    }
    
    @Override
    public void deleteByUserId(int id) {
        // TODO Auto-generated method stub
        messageMapper.deleteByUserId(id);
    }
    
    @Override
    public void deleteById(int id) {
        // TODO Auto-generated method stub
        messageMapper.deleteById(id);
    }
    
}
