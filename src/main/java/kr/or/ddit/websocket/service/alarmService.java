package kr.or.ddit.websocket.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.socket.WebSocketSession;

import kr.or.ddit.vo.MessageVO;

@Service
public class alarmService {

	@Inject
	LoginStateService loginStateService;
	
	public static void sendAlarm(WebSocketSession session, MessageVO vo) {
		// TODO Auto-generated method stub
		/*	
			Map<String, WebSocketSession> sessions = LoginStateService.sessions;
			
		*/
	}

}
