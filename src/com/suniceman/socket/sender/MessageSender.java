package com.suniceman.socket.sender;

import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.websocket.Session;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.suniceman.po.SocketUser;
import com.suniceman.po.ToClientMessageResult;
import com.suniceman.po.ToClientMessageType;
import com.suniceman.po.ToClientTextMessage;
import com.suniceman.po.ToDBMessage;
import com.suniceman.po.ToServerMessageMine;
import com.suniceman.po.ToServerTextMessage;
import com.suniceman.po.User;
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
    
    public static MessageSender messageSender;
    
    @PostConstruct
    public void init() {
        messageSender = this;
    }
    
    // ������Ϣҵ���߼�
    public void sendMessage(ToServerTextMessage message) {
        
        int toUserId = message.getTo().getId();
        // ��ȡ������
        String sendUserId = Integer.toString(message.getMine().getId());
        String type = message.getTo().getType();
        // ��Ϣ��ǰ���ɣ��������ѭ�������ɻ��˷���Դ
        String toClientMessage = getToClientMessage(message);
        
        System.out.println(toClientMessage);
        System.out.println(userService + "1212123412");
        System.out.println("��ǰ��Ϣ������" + type);
        // ������==���Ƚϣ���Ϊһ����static final ֵ������һ�����ڶ����� == Ϊfalse
        if (type.equals(LayIMChatType.GROUP)) {
            List<User> userList = messageSender.userService.findAll();
            for (User user : userList) {
                // ���˵��Լ�
                if (!sendUserId.equals(user.getId())) {
                    sendMessage(user.getId(), toClientMessage);
                }
            }
        } else {
            sendMessage(toUserId, toClientMessage);
        }
        
        // ��󱣴浽���ݿ�
        // saveMessage(message);
        
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
    private void saveMessage(ToServerTextMessage message) {
        ToDBMessage dbMessage = new ToDBMessage();
        
        dbMessage.setSendUserId(message.getMine().getId());
        dbMessage.setAddtime(new Date().getTime());
        dbMessage.setChatType(message.getTo().getType().equals(LayIMChatType.FRIEND) ? LayIMChatType.CHATFRIEND
                : LayIMChatType.CHATGROUP);
        dbMessage.setMsgType(1);// ��������Ȳ��ܾ�����ͨ�����¼
        long groupId = getGroupId(message.getMine().getId(), message.getTo().getId(), message.getTo().getType());
        dbMessage.setGroupId(groupId);
        dbMessage.setMsg(message.getMine().getContent());
        
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
        
        toClientTextMessage.setUsername(mine.getUsername());
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
    
    // ���ɶ�Ӧ��groupId
    private long getGroupId(int sendUserId, int toUserId, String type) {
        
        // ������������죬ֱ�ӷ�����id�����򷵻� ����id�����
        if (type.equals(LayIMChatType.GROUP)) {
            return toUserId;
        }
        
        String sendUserIdStr = Integer.toString(sendUserId);
        String toUserIdStr = Integer.toString(toUserId);
        
        String groupIdStr = "";
        // ���չ̶�����������Ӧ��������
        if (sendUserId > toUserId) {
            groupIdStr = sendUserIdStr + toUserIdStr;
        } else {
            groupIdStr = toUserIdStr + sendUserIdStr;
        }
        
        long groupId = Long.parseLong(groupIdStr);
        return groupId;
    }
}
