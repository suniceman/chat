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
 * ������Ϣ�� ���дӿͻ��˵�����˵���Ϣת�������������Ϣ���� ToServerTextMessageת��ΪToClientTextMessage
 * ����ǵ��ģ�ֱ�Ӵӻ���ȡ�������session������Ϣ���ͣ�Ⱥ������Ҫ�ӻ�����ȡ����Ⱥ�������˵�id���б���������Ϣ��
 * ����������Ҫ�Ż�������񣬼���100����ֻ��һ�������ߣ�����˷�99�Σ�δ���Ż���
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
    
    // ������Ϣҵ���߼�
    public void sendMessage(ToServerTextMessage message) {
        
        int toUserId = message.getTo().getId();
        // ��ȡ������
        int sendUserId = message.getMine().getId();
        String type = message.getTo().getType();
        // ��Ϣ��ǰ���ɣ��������ѭ�������ɻ��˷���Դ
        String toClientMessage = getToClientMessage(message);
        
        System.out.println("��ǰ��Ϣ������" + type);
        // ������==���Ƚϣ���Ϊһ����static final ֵ������һ�����ڶ����� == Ϊfalse
        if (type.equals(LayIMChatType.GROUP)) {
            List<User> userList = messageSender.userService.findAll();
            for (User user : userList) {
                // ���˵��Լ�
                if (sendUserId != user.getId()) {
                    sendMessage(user.getId(), toClientMessage);
                }
            }
        } else {
            sendMessage(toUserId, toClientMessage);
        }
        
        // ��󱣴浽���ݿ�
        saveMessage(message);
        
    }
    
    // �������û���
    private void sendMessage(Integer userId, String message) {
        SocketUser user = LayIMFactory.createManager().getUser(userId);
        if (user.isExist()) {
            if (user.getSession() == null) {
                System.out.println("���û������� ");
            } else {
                Session session = user.getSession();
                if (session.isOpen()) {
                    // �����û���Ҫ���յ�����Ϣ
                    session.getAsyncRemote().sendText(message);
                }
            }
        } else {
            System.out.println("���û������� ");
        }
    }
    
    // ���浽���ݿ�
    // ��Ҫ���뵽����
    private void saveMessage(ToServerTextMessage toServerTextMessage) {
        Message message = new Message();
        User mine = messageSender.userService.findById(toServerTextMessage.getMine().getId());
        if (toServerTextMessage.getTo().getType().equals("group")) {
            message.setToUserName("������");
        } else {
            User friend = messageSender.userService.findById(toServerTextMessage.getTo().getId());
            if (friend == null) {
                message.setToUserName("��ɾ��");
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
        // ��������Ϣ���浽DB
        messageSender.messageService.saveMessage(message);
    }
    
    // ���ݿͻ��˷���������Ϣ�����췢�ͳ�ȥ����Ϣ
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
        
        // Ⱥ��ͺ���ֱ�����첻ͬ��Ⱥ���id �� ��id�������Ƿ����˵�id
        if (toClientTextMessage.getType().equals(LayIMChatType.GROUP)) {
            toClientTextMessage.setId(message.getTo().getId());
        } else {
            toClientTextMessage.setId(mine.getId());
        }
        toClientTextMessage.setTimestamp(new Date().getTime());
        
        // ����ͳһ��Ϣ�ӿ�
        ToClientMessageResult result = new ToClientMessageResult();
        result.setMsg(toClientTextMessage);
        result.setType(ToClientMessageType.TYPE_TEXT_MESSAGE);
        
        return JSONArray.fromObject(result).toString();
    }
    
}
