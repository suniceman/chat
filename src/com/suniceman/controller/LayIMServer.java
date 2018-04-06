package com.suniceman.controller;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.context.annotation.Configuration;

@ServerEndpoint("/websocket")
public class LayIMServer {
    
    @OnOpen
    public void open(Session session, @PathParam("uid") int uid) {
    }
    
    @OnMessage
    public void receiveMessage(String message, Session session) {
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
