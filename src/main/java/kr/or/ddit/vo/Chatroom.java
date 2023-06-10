package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Chatroom {
	private int roomId;
	private String roomName;
	private Date createDate;
	private List<ChatroomUser> chatroomUsers;
}
