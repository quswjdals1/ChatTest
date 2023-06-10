package kr.or.ddit;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import kr.or.ddit.service.ChatService;
import kr.or.ddit.service.EmpService;
import kr.or.ddit.vo.Chatroom;
import kr.or.ddit.vo.ChatroomUser;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.Message;
import kr.or.ddit.vo.MessageImg;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private ChatService chatService; 
	
	@Inject 
	private EmpService empService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		List<EmployeeVO> empList = empService.selectEmployees();
		model.addAttribute("empList",empList);
		return "chat";
	}
	
	@RequestMapping(value = "/empChatList", method = RequestMethod.GET)
	public ResponseEntity<String> empList() {
		
		List<EmployeeVO> empList = empService.selectEmployees();
		String empId="test2";	//현제 접속자가 test2라고 가정, 구현할때는 세션에서 가져올 것
		List<Chatroom> chatroomList = chatService.selectChatroomAndUser(empId);
		Gson gson = new Gson();
		JsonObject jo = new JsonObject();
		JsonElement je = gson.toJsonTree(empList);
		JsonElement jr = gson.toJsonTree(chatroomList);
		jo.add("empList", je);
		jo.add("chatroomList", jr);
		String json = gson.toJson(jo);
		return new ResponseEntity<String>(json,HttpStatus.OK);
	}
	

	@RequestMapping(value = "/room/create", method = RequestMethod.POST)
	public ResponseEntity<String> roomCreate(@RequestBody Map<String, Object> map){

		int res =chatService.createChatroom(map);
		
		return new ResponseEntity<String>(res+"",HttpStatus.OK);
	}
	

	@RequestMapping(value = "/roomDetail/{roomId}", method = RequestMethod.POST,produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> roomDetail(@PathVariable int roomId){

		List<Message> messageList = chatService.selectMessages(roomId);
		Chatroom chatroomInfo = chatService.selectChatroomAndUserByRoomId(roomId);
		System.out.println(messageList);
		System.out.println(chatroomInfo);
		JsonObject jo = new JsonObject();
		Gson gson = new Gson();
		JsonElement jml = gson.toJsonTree(messageList);
		JsonElement jci = gson.toJsonTree(chatroomInfo);
		jo.add("messageList", jml);
		jo.add("chatroomInfo", jci);
		String json = gson.toJson(jo);
		return new ResponseEntity<String>(json,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/chatImgRead/{messageId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> chatImgRead(@PathVariable("messageId") int messageId) {
		
		MessageImg messageImg =chatService.selectMessageImg(messageId);
		
	    byte[] fileContent=null;
		try {
			File file = new File(messageImg.getFilePath());
			FileInputStream fis = new FileInputStream(file);
			fileContent = IOUtils.toByteArray(fis);
			fis.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	    // 응답 헤더 설정
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_PDF);
	    headers.setContentDispositionFormData("attachment", "file.pdf");
	    
	    return new ResponseEntity<>(fileContent, headers, HttpStatus.OK);
	}

}
