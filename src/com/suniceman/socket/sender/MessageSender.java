package com.suniceman.socket.sender;

import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.websocket.Session;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.suniceman.po.Message;
import com.suniceman.po.SocketUser;
import com.suniceman.po.ToClientMessageResult;
import com.suniceman.po.ToClientMessageType;
import com.suniceman.po.ToClientTextMessage;
import com.suniceman.po.ToServerMessageMine;
import com.suniceman.po.ToServerTextMessage;
import com.suniceman.po.User;
import com.suniceman.service.MessageService;
import com.suniceman.service.UserService;
import com.suniceman.socket.LayIMChatType;
import com.suniceman.util.LayIMFactory;

/**
 * 发送信息类 所有从客户端到服务端的消息转发到此类进行消息处理 ToServerTextMessage转换为ToClientTextMessage
 * 如果是单聊，直接从缓存取出对象的session进行消息发送，群聊则需要从缓存中取出该群里所有人的id进行遍历发送消息，
 * 遍历过后需要优化在线与否，假如100人中只有一个人在线，则会浪费99次（未做优化）
 */
@Component
public class MessageSender {
    
    @Autowired
    private UserService userService;
    @Autowired
    private MessageService messageService;
    
    public static MessageSender messageSender;
    
    @PostConstruct
    public void init() {
        messageSender = this;
    }
    
    // 发送信息业务逻辑
    public void sendMessage(ToServerTextMessage message) {
        
        int toUserId = message.getTo().getId();
        // 获取发送人
        int sendUserId = message.getMine().getId();
        String type = message.getTo().getType();
        // 消息提前生成，否则进行循环内生成会浪费资源
        String toClientMessage = getToClientMessage(message);
        
        System.out.println("当前消息类型是" + type);
        // 不能用==做比较，因为一个是static final 值，另外一个是在对象中 == 为false
        if (type.equals(LayIMChatType.GROUP)) {
            List<User> userList = messageSender.userService.findAll();
            for (User user : userList) {
                // 过滤掉自己
                if (sendUserId != user.getId()) {
                    sendMessage(user.getId(), toClientMessage);
                }
            }
        } else {
            sendMessage(toUserId, toClientMessage);
        }
        
        // 最后保存到数据库
        saveMessage(message);
        
    }
    
    // 给单个用户发
    private void sendMessage(Integer userId, String message) {
        SocketUser user = LayIMFactory.createManager().getUser(userId);
        if (user.isExist()) {
            if (user.getSession() == null) {
                System.out.println("该用户不在线 ");
            } else {
                Session session = user.getSession();
                if (session.isOpen()) {
                    // 构造用户需要接收到的消息
                    session.getAsyncRemote().sendText(message);
                }
            }
        } else {
            System.out.println("该用户不在线 ");
        }
    }
    
    // 保存到数据库
    // 需要加入到队列
    private void saveMessage(ToServerTextMessage toServerTextMessage) {
        Message message = new Message();
        User mine = messageSender.userService.findById(toServerTextMessage.getMine().getId());
        if (toServerTextMessage.getTo().getType().equals("group")) {
            message.setToUserName("聊天室");
        } else {
            User friend = messageSender.userService.findById(toServerTextMessage.getTo().getId());
            if (friend == null) {
                message.setToUserName("已删除");
            } else {
                message.setToUserName(friend.getUsername());
            }
        }
        message.setFromeUserId(toServerTextMessage.getMine().getId());
        message.setFromAvatar(toServerTextMessage.getMine().getAvatar());
        message.setContent(toServerTextMessage.getMine().getContent());
        message.setFromUserName(mine.getUsername());
        message.setToUserId(toServerTextMessage.getTo().getId());
        message.setToAvatar(toServerTextMessage.getTo().getAvatar());
        message.setType(toServerTextMessage.getTo().getType());
        // 将聊天信息保存到DB
        messageSender.messageService.saveMessage(message);
    }
    
    // 根据客户端发送来的消息，构造发送出去的消息
    /*
     * username: data.mine.username , avatar: data.mine.avatar , id:
     * data.mine.id , type: data.to.type , content:data.mine.content ,
     * timestamp: new Date().getTime()
     */
    private String getToClientMessage(ToServerTextMessage message) {
        
        ToClientTextMessage toClientTextMessage = new ToClientTextMessage();
        
        ToServerMessageMine mine = message.getMine();
        User myInfo = messageSender.userService.findById(mine.getId());
        toClientTextMessage.setUsername(myInfo.getUsername());
        toClientTextMessage.setAvatar(mine.getAvatar());
        toClientTextMessage.setContent(mine.getContent());
        toClientTextMessage.setType(message.getTo().getType());
        
        // 群组和好友直接聊天不同，群组的id 是 组id，否则是发送人的id
        if (toClientTextMessage.getType().equals(LayIMChatType.GROUP)) {
            toClientTextMessage.setId(message.getTo().getId());
        } else {
            toClientTextMessage.setId(mine.getId());
        }
        toClientTextMessage.setTimestamp(new Date().getTime());
        
        // 返回统一消息接口
        ToClientMessageResult result = new ToClientMessageResult();
        result.setMsg(toClientTextMessage);
        result.setType(ToClientMessageType.TYPE_TEXT_MESSAGE);
        
        return JSONArray.fromObject(result).toString();
    }
    
}
