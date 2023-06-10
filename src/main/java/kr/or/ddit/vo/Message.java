package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Message {
	private int messageId;
	private String messageContent;
	private Date createDate;
	private String messageType;
	private int roomId;
	private String empId;
	
	private EmployeeVO employeeVO;
	private MessageImg messageImg;
}
