package com.suniceman.mapper;

import java.util.List;

import com.suniceman.po.Message;
import com.suniceman.po.MessageVo;

public interface MessageMapper {
    
    void saveMessage(Message message);
    
    int showCount(MessageVo messageVo);
    
    List<MessageVo> showByPage(MessageVo messageVo);
    
    void deleteByUserId(int id);
    
    void deleteById(int id);
    
}
