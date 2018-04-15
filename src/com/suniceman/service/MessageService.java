package com.suniceman.service;

import java.util.List;

import com.suniceman.po.Message;
import com.suniceman.po.MessageVo;

public interface MessageService {
    
    public void saveMessage(Message message);
    
    public int showCount(MessageVo messageVo);
    
    public List<MessageVo> showByPage(MessageVo messageVo);
    
    public void deleteByUserId(int id);
    
    public void deleteById(int id);
}
