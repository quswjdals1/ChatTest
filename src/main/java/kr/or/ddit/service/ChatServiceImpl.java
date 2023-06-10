package kr.or.ddit.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ChatMapper;
import kr.or.ddit.mapper.EmpMapper;
import kr.or.ddit.vo.Chatroom;
import kr.or.ddit.vo.Message;
import kr.or.ddit.vo.MessageImg;

@Service
public class ChatServiceImpl implements ChatService {

	@Inject
	private ChatMapper mapper;

	@Override
	public int createChatroom(Map<String, Object> map) {
		boolean flag=false;	// true되면 에러 있는거
		List<String> selectedList = (List<String>)map.get("selectedList");
		String roomName = (String)map.get("roomName");
		
		Chatroom chatroom = new Chatroom();
		chatroom.setRoomName(roomName);
		int res = mapper.createChatroom(chatroom);
		if(res>0) {
			
			for (String empId : selectedList) {
				Map<String, Object> tempMap = new HashMap<String, Object>();
				tempMap.put("roomId", chatroom.getRoomId());
				tempMap.put("empId", empId);
				res = mapper.createChatroomUser(tempMap);
				if(res==0) {
					flag = true;
				}
			}
			
		}else {
			flag=true;
		}
		
		if(flag) {
			return 0;
		}else {
			return 1;
		}
	}

	@Override
	public List<Chatroom> selectChatroomAndUser(String empId) {
		// TODO Auto-generated method stub
		return mapper.selectChatroomAndUser(empId);
	}

	@Override
	public List<Message> selectMessages(int roomId) {
		// TODO Auto-generated method stub
		return mapper.selectMessages(roomId);
	}

	@Override
	public Chatroom selectChatroomAndUserByRoomId(int roomId) {
		// TODO Auto-generated method stub
		return mapper.selectChatroomAndUserByRoomId(roomId);
	}

	@Override
	public MessageImg selectMessageImg(int messageId) {
		// TODO Auto-generated method stub
		return mapper.selectMessageImg(messageId);
	}
	


}
