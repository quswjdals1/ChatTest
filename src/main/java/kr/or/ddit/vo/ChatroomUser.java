package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ChatroomUser {
	private int roomId;
	private String empId;
	private String lastReadMessageId;
	
	private EmployeeVO employee;
}
