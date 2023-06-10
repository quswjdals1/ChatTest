package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Chatroom;
import kr.or.ddit.vo.Message;
import kr.or.ddit.vo.MessageImg;

public interface ChatMapper {

	int createChatroom(Chatroom chatroom);

	int createChatroomUser(Map<String, Object> map);

	List<Chatroom> selectChatroomAndUser(String empId);

	List<Message> selectMessages(int roomId);

	Chatroom selectChatroomAndUserByRoomId(int roomId);

	MessageImg selectMessageImg(int messageId);


}
