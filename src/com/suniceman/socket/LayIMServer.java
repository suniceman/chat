package com.suniceman.socket;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import net.sf.json.JSONObject;

import com.suniceman.po.SocketUser;
import com.suniceman.po.ToServerTextMessage;
import com.suniceman.socket.manager.OnLineUserManager;
import com.suniceman.socket.sender.MessageSender;
import com.suniceman.util.LayIMFactory;

@ServerEndpoint("/websocket/{uid}")
public class LayIMServer {
    
    @OnOpen
    public void open(Session session, @PathParam("uid") int uid) {
        SocketUser user = new SocketUser();
        user.setSession(session);
        user.setUserId(uid);
        
        // ���������б�
        LayIMFactory.createManager().addUser(user);
        print("��ǰ�����û���" + LayIMFactory.createManager().getOnlineCount());
        print("�����е��û�������" + new OnLineUserManager().getOnLineUsers().size());
    }
    
    @OnMessage
    public void receiveMessage(String message, Session session) {
        JSONObject json = JSONObject.fromObject(message);
        ToServerTextMessage toServerTextMessage = (ToServerTextMessage) JSONObject
                .toBean(json, ToServerTextMessage.class);
        // �õ����յĶ���
        MessageSender sender = new MessageSender();
        sender.sendMessage(toServerTextMessage);
    }
    
    @OnError
    public void error(Throwable t) {
        print(t.getMessage());
    }
    
    @OnClose
    public void close(Session session) {
        
    }
    
    private void print(String msg) {
        System.out.println(msg);
    }
}
