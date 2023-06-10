package kr.or.ddit.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.ddit.vo.MessageVO;
import kr.or.ddit.vo.loginStateVO;

@Component
public class LoginStateHandler extends TextWebSocketHandler {
	
	Map<String, WebSocketSession> map = new HashMap<String, WebSocketSession>();
	Set<String> loginUser = new HashSet<String>();
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(session.getId());
		String msg = message.getPayload();
		System.out.println(msg);
		Gson gson = new Gson();
		loginStateVO vo = gson.fromJson(msg, loginStateVO.class);
		if(vo.getState().equals("login")) {
			loginUser.add(vo.getName());
		}else {
			if(loginUser.contains(vo.getName())) {
				loginUser.remove(vo.getName());
			}
		}
		for(String key : map.keySet()) {
			WebSocketSession wss = map.get(key);
			
			try {
				if(key.equals(session.getId())) {
					JsonObject jo = new JsonObject();
					JsonElement users = gson.toJsonTree(loginUser);
					jo.add("res", users);
					jo.addProperty("type", "n");
					String res = gson.toJson(jo);
					TextMessage tm = new TextMessage(res.getBytes());
					wss.sendMessage(tm);
				}else {
					JsonObject jo = new JsonObject();
					JsonElement je = JsonParser.parseString(message.getPayload());
					jo.add("res", je);
					jo.addProperty("type", "o");
					String res = gson.toJson(jo);
					TextMessage tm = new TextMessage(res.getBytes());
					wss.sendMessage(tm);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionEstablished(session);
		map.put(session.getId(), session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		map.remove(session.getId());
		System.out.println(session.getId());
		super.afterConnectionClosed(session, status);
	}
}
