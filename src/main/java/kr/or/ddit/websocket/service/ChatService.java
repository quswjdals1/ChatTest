package kr.or.ddit.websocket.service;

import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.socket.WebSocketSession;

import kr.or.ddit.vo.ChatRoomVO;
import kr.or.ddit.vo.MessageVO;

@Service
public class ChatService {
	
	// 채팅방이 아닌 다른 기능을 사용중일 경우 내가 가진 모든 채팅방으로부터 메세지가 오면 알림을 띄우기 위한 맵
	// 로그인 되자마자 자신이 포함된 모든 방에 대해서 자신에 세션을 모두 넣어준다.
	private static Map<Integer, ChatRoomVO> rooms =new ConcurrentHashMap<Integer, ChatRoomVO>();
	
	// 실제 채팅방에 들어가 메세지를 보고있는 사람상태정보가 들어있는 맵
	private static Map<Integer, Set<String>> roomUserState =new ConcurrentHashMap<Integer, Set<String>>();
	
	@Inject
	LoginStateService loginStateService;
	
	public void chatroomUpdate(WebSocketSession session,MessageVO messageVO) {
		/*
			
			1. messageVo의 state를 확인해서 로그인한건지 로그아웃한건지 확인
			
			로그인인경우 
			1) messageVO의 sender 정보를 확인해서 해당 보낸이의 모든 대화방VO를 db에서 가져온다.
			2) 대화방 VO 목록들을 하나하나 FOR문 돌면서 
			 if(rooms.containkey(대화방VO.getRoomId())){
			 	ChatroomVO chatroomVO = rooms.get(대화방VO.getRoomId())
			 	map<String,session> sessions =chatroomVO.getSessions()
			 	sessions.put(messageVO.getSender(),session)
			 	chatroomVO.setSession(sessions)
			 	room.put(대화방VO.getRoomId(),chatroomVO)
			 }else{  //새로 방을 만들어서 rooms에 넣어야 하는 경우
			 	ChatroomVO chatroomVO = new ChatroomVO()
			 	chatroomVO.setRoomId(대화방VO.getRoomId())
			 	map<String,session> sessions =chatroomVO.getSessions()
			 	sessions.put(messageVO.getSender(),session)
			 	chatroomVO.setSession(sessions)
			 	room.put(대화방VO.getRoomId(),chatroomVO)
			 }
			 
			 로그아웃인경우 
			1) messageVO의 sender 정보를 확인해서 해당 보낸이의 모든 대화방VO를 db에서 가져온다.
			2) 대화방 VO 목록들을 하나하나 FOR문 돌면서 
			 if(rooms.containkey(대화방VO.getRoomId())){
			 	ChatroomVO chatroomVO = rooms.get(대화방VO.getRoomId())
			 	map<String,session> sessions =chatroomVO.getSessions()
			 	sessions.remove(messageVO.getSender())
			 	if(sessions.size==0){
			 		rooms.remove(대화방VO.getRoomId());
			 	}else{
			 		chatroomVO.setSession(sessions)
			 		room.put(대화방VO.getRoomId(),chatroomVO)
			 	}
			 }
			
		*/
		
	}
	/*
 	db가서 대화방 존재 확인
 	
	if(첫 대화방이면){
		db에서 대화방 생성, room_id 발급,첫메세지 발송
	}else{ 기존에 있던 대화방
		db에서 대화방vo 가져와서 거기 인원에 싹다뿌리기
	}
*/
	
	


	public void sendMessage(WebSocketSession session, MessageVO messageVO) {
		/*	
		 	보낸사람 정보, roomid, 메세지 내용이 포함된 vo를 받아서 해당 roomid에 있는
		 	유저 세션에 모두 메세지를 보내는 작업
		 	
			if(rooms.containkey(messageVO.getRoomId())){
				ChatroomVO chatroomVO = rooms.get(messageVO.getRoomId())
				map<String,session> sessions =chatroomVO.getSessions()
	
				
				**db로 해당 방 멤버들의 id를 가져옴(해당 각각 member에는 마지막 읽은 메세지id인 last_read_message_id가 있음)
				ex)List<Member> members=~~dao.selectRoomMember(roomId)
				
				**db로 메세지를 insert함(이떄 selectkey로 messageId를 받아옴)
				ex) int messageId = dao.insertMessage(messageVO);
				
				**db로 roomUserState에 현재 채팅방을 보고있는 사람들에 대해서 읽음처리(마지막 읽은 메세지 갱신)를 해줌
				ex) Set<String> set = roomUserState.get(messageVO.getRoomId())
					for(String userId: set){
						dao.updateLastMessage(userId,messageId)
					}
					
				** 위에서 구한 members.size()-set.size()가 안읽은 사람의 수이므로 해당 값을 메세지에 포함시킴	
				unReadTotal =  members.size()-set.size()
				gson gson = new gson()
				message.setTotalMemberCount(unReadTotal)
				gson.toJson(messageVO)
				TextMessage tm = new TextMessage(messageVO.getMessage.getByte())
				
				
				for(Member member : members){
					if(sessions.containkey(member.getId())){
						WebsocketSession wss = sessions.get(member.getId())
						wss.sendMessage(tm)
					}
				}

			}
		*/
		
	}

	public void inChatroom(WebSocketSession session, MessageVO messageVO) {
		/*
			roomUserState 맵에서 들어온 roomid로 set을 찾고, 있는경우 해당 set에 자신의 이름을 넣어준다.
			roomUserState 맵에 해당 roomid가 없는경우 roomid로 set을 만들어 해당 set에 자신의 userid를 넣어준다.
			
			if(roomUserState.containkey(messageVO.getRoomId())){
				Set<String> set = roomUserState.get(messageVO.getRoomId())
				set.add(messageVO.getSender())
				roomUserState.put(messageVO.getRoomId(),set)
			}else{
				Set<String> set = new hashSet<String>();
				set.add(messageVO.getSender())
				roomUserState.put(messageVO.getRoomId(),set)
			}
			
			채팅방 목록에서 하나의 채팅방을 눌렀을 때 상대방 입장에서 읽음처리가 되도록 메시지 보내기
			messageVO안에 roomid 정보가 있을것임 type이 in으로 올것이기 때문에 그대로 in으로 보내기
			************************************
			**db작업으로 해당 채팅방 내용 모두 읽음 처리 후**
			**(보낸이의 마지막읽은 메세지만 갱신해주면 됨)**
			************************************
			if(rooms.containkey(messageVO.getRoomId())){
				ChatroomVO chatroomVO = rooms.get(messageVO.getRoomId())
				map<String,session> sessions =chatroomVO.getSessions()
				TextMessage tm = new TextMessage(messageVO.getMessage.getByte())
				for(String id :sessions.keySet()){
					
					sessions.get(id).sendMessage(tm)
					** 이 메세지를 받은 사람들은 모두 안읽음 숫자를 업데이트 해야할 것	
					** 생각해본 방법
					** 1.이 메세지를 받으면 브라우저측에서 ajax로 db에서 채팅기록을 가져와 채팅화면에 
					** 다시 뿌리는 것
				}
			}
		*/
		
	}
	public void outChatroom(WebSocketSession session, MessageVO messageVO) {
		/*	roomUserState 맵에서 해당 나간 roomid로 set을 찾고, 해당 set에서 자신의 이름을 지워준다
			만약 자신 혼자인 경우엔 해당 roomid 자체를 roomUserState맵에서 지워준다.
			if(roomUserState.containkey(messageVO.getRoomId())){
				Set<String> set = roomUserState.get(messageVO.getRoomId());
				if(set.size()==1){
					roomUserState.remove(messageVO.getRoomId());
				}else{
					set.remove(messageVO.getSender())
					roomUserState.put(messageVO.getRoomId(),set)
				}
			}
			
			
		*/
		
	}

}
