package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Chatroom;
import kr.or.ddit.vo.Message;
import kr.or.ddit.vo.MessageImg;

public interface ChatService {

	int createChatroom(Map<String, Object> map);

	List<Chatroom> selectChatroomAndUser(String empId);

	List<Message> selectMessages(int roomId);

	Chatroom selectChatroomAndUserByRoomId(int roomId);

	MessageImg selectMessageImg(int messageId);

}
