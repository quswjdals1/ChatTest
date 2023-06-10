package kr.or.ddit.websocket;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import kr.or.ddit.vo.MessageVO;
import kr.or.ddit.websocket.service.ChatService;
import kr.or.ddit.websocket.service.LoginStateService;


@Controller
public class WebSocketHandler extends TextWebSocketHandler {
	
	@Inject
	LoginStateService loginStateService;
	@Inject
	ChatService chatService;

	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		String msg = message.getPayload();
		System.out.println(msg);
		Gson gson = new Gson();
		MessageVO vo = gson.fromJson(msg, MessageVO.class);
		System.out.println(vo);
		if(vo.getType().equals("l")) {	//로그인,로그아웃 상태 메세지
			
			loginStateService.loginState(session, vo);
			chatService.chatroomUpdate(session, vo);
			
		}else if(vo.getType().equals("m")){ // 채팅메세지
			
			chatService.sendMessage(session,vo);
			
		}else if(vo.getType().equals("in")){	//특정 채팅방 들어갔을 때(읽음처리)
			chatService.inChatroom(session,vo);
		}else if(vo.getType().equals("out")){	//특정 채팅방 나갔을 때(이후부터 안읽음 처리 되도록)
			chatService.outChatroom(session,vo);
		}										//채팅방 생성은 비동기로 해결하자
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionEstablished(session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
	}
}
