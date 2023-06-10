<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>EveryWare</title>
<link rel="stylesheet" href="/resources/LoginStyle.css" />

<style type="text/css">
body{
	background: rgba(230, 230, 230, 0.15);
}

.emp_profile {
	width: 50px;
	height: 50px;
	border-radius: 100%;
}

.chat_profile {
	display: flex;
}

.emp_name {
	display: flex;
	flex: 2;
	padding-left: 15px;
	align-items: center;
}

.emp_dep {
	display: flex; flex : 1;
	align-items: center;
	flex: 1;
}

.profileList {
	overflow: auto;
}


.external-event {
	display: flex;
}

.external-event span {
	flex: 6;
}

#add-new-event {
	float: right;
}

.form-check-label {
	padding-left: 20px;
}

.eventRemoveBtn {
	float: right;
	display: inline-block;
	width: 23px;
	height: 23px;
}

#create_room {
	position: absolute;
	width: 100%;
	height: 100%;
	background: white;
	text-align: center;
	transform: translateY(-400px);
	transition: 0.18s ease;
	overflow:auto;
}

#modify {
	float: right;
	margin: 10px;
}

#modal h4 {
	margin: 0;
}
#profile_search_input{
	display: inline-block;
	width: 60%;
}
#profile_search{
	padding: 5px 20px;
}
.chat_profile{
	transition: 0.18s ease
}
#selected_search_list li{
	display: flex;
	flex-direction: column;
	float: left;
	margin: 5px;
	font-size: 11px;
}
#selected_search_list {
	display: inline-block;
	margin: 10px 10px;
}
.cur_chatroom{
	display: none;
    width: 400px;
    height: 440px;
    background: gray;
    border: 1px solid rgba(255, 255, 255, 0.5);
    border-radius: 20px;
    box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
    font-weight: bold;
    overflow: hidden;
    transition: transform 0.2s ease, height 0.2s ease;
    position: absolute;
    z-index: 100;
    right: 435px;
    bottom: 30px;
}
.chatroom{
	position: relative;
    height: 350px;
    background: #c0c0c0;
    overflow: auto;
}
.chatroom_date{
	text-align: center;
	font-size: 10px;
	margin: 5px;
	color: white;
}
.chatroom_header {
    display: flex;
    justify-content: space-between;
    height: 30px;
    color: white;
    position: relative;
    z-index: 100;
    background: gray;
}
.chatroom_footer{
	display: flex;
    padding-top: 10px;
    background: gray;
    justify-content: center;
}
.chatroom_profile{
	display: flex;
	flex-wrap: wrap;
	width: 50px;
	height: 44px;
	border: 1px solid white;
	border-radius: 4px
}
.chatroom_profile_element{
	flex:1;
	display: flex;	
	margin: 1px;
	justify-content: center; /* 수평 가운데 정렬 */
  	align-items: center; /* 수직 가운데 정렬 */
}
.chatroom_profile_img{
	display: inline-block;
	width: 20px;
	height: 20px;
	border-radius: 6px;

}
.chatroom_profile_two{
	position: relative;
}
.chatroom_profile_two img{
	width: 23px;
	height: 23px;
}

.chatroom_profile_img_two{
	position: absolute;
	left:20px;
	top:20px;
}
.chatroom_profile_img_one{
	position: absolute;
	left: 5px;
	top: 5px;
}
.chatroom_profile_only img{
	height: 37px;
    width: 40px;
}
.chatrooms{
	display: flex;
	margin: 5px 0;
}
.chatroomList{
	overflow: auto;
}
.chat_message_profile_img{
	width: 20px;
	height: 20px;
	border-radius: 100%;
}
.chat_message{
	display: flex;
}
.my_message{
	text-align: right;
	justify-content: flex-end;
}
.others_message{
	text-align: left;
	justify-content: flex-start;
}
.chat_message_img{
	width: 100px;
}
.chat_message_img img{
	width: 100%;
	height: auto;
}
.chat_message_name{
	font-size: 12px;
	padding-top: 7px;
}
.chat_message_content{
	font-size: 14px;
	margin: 8px;
	padding: 0 5px;
	background: white;
	border-radius: 5px;
}
.chat_message_unread_count{
	display:flex;
	flex-direction:column;
	justify-content:flex-end;
	font-size: 12px;
	color: yellow;
	padding-bottom: 7px;
}
.chat_message_time{
	display:flex;
	flex-direction:column;
	justify-content:flex-end;
	font-size: 12px;
    font-weight: 100;
    margin: 0 3px;
    padding-bottom: 7px;
}
.chat_message_profile{
    padding-top: 4px;
}
</style>
</head>
<body>
<div class="chatroom_profile">
	<div class="chatroom_profile_element chatroom_profile_only">
		<img class="chatroom_profile_img" src="/resources/images/Anne-Marie(앤마리)-2002.jpg">
	</div>
</div>
<div class="chatroom_profile chatroom_profile_two">
	<div class="chatroom_profile_element">
		<img class="chatroom_profile_img chatroom_profile_img_one" src="/resources/images/Anne-Marie(앤마리)-2002.jpg">
	</div>
	<div class="chatroom_profile_element">
		<img class="chatroom_profile_img chatroom_profile_img_two" src="/resources/images/Anne-Marie(앤마리)-2002.jpg">
	</div>
</div>
<div class="chatroom_profile">
	<div class="chatroom_profile_element">
		<img class="chatroom_profile_img" src="/resources/images/Anne-Marie(앤마리)-2002.jpg">
	</div>
	<div class="chatroom_profile_element">
		<img class="chatroom_profile_img" src="/resources/images/Anne-Marie(앤마리)-2002.jpg">
	</div>
	<div class="chatroom_profile_element">
		<img class="chatroom_profile_img" src="/resources/images/Anne-Marie(앤마리)-2002.jpg">
	</div>
</div>

<div class="chatroom_profile">
	<div class="chatroom_profile_element">
		<img class="chatroom_profile_img" src="/resources/images/Anne-Marie(앤마리)-2002.jpg">
	</div>
	<div class="chatroom_profile_element">
		<img class="chatroom_profile_img" src="/resources/images/Anne-Marie(앤마리)-2002.jpg">
	</div>
	<div class="chatroom_profile_element">
		<img class="chatroom_profile_img" src="/resources/images/Anne-Marie(앤마리)-2002.jpg">
	</div>
	<div class="chatroom_profile_element">
		<img class="chatroom_profile_img" src="/resources/images/Anne-Marie(앤마리)-2002.jpg">
	</div>
</div>
	오론쪽 하단 버튼 원래는 안보이는 거임 확인 할려고 채팅방 투명하게 만듬
	<br /> 닫으려면 오른쪽 상단 Close 누르셈
	<div class="msgBtn">MSG</div>
	<div class="wrapper">
		<div class="wrapper-header">
			<nav>GroupWare</nav>
			<nav id="msgClose">Close</nav>
		</div>

		<div class="wrapper-content">
			<div class="form-box login profileList">
				<h4>
					<button id="createRoomBtn">방생성</button>
				</h4>
				<div id="profile_list">
				</div>
				<div class="login-register"></div>
			</div>
			<div id='create_room'>
				<div id="profile_search_group">
				  <input id="profile_search_input" placeholder="검색">
				  <button id="profile_search_btn" type="button">검색</button>
				  <button id="profile_search_cancle" type="button">X</button>
				</div>
				<div id="profile_search">
				</div>
			</div>

			<div class="form-box register chatroomList">
				<h4>채팅방</h4>
				<div id="chatroom_list">
				</div>
				<div class="login-register"></div>
			</div>
		</div>

		<div class="wrapper-footer">
			<p>
				<a href="#" class="register-link">프로필</a>
			</p>
			<p>
				<a href="#" class="login-link">채팅</a>
			</p>
		</div>
	</div>

	<div class="cur_chatroom">
		<div class="chatroom_header">
			<div>프로필 사진들+name<span class="cur_chatroom_total">5</span></div>
			<nav id="cur_chatroom_close_btn">x</nav>
		</div>
		<div class="chatroom">
			
		</div>
		<div class="chatroom_footer">
			<textarea rows="2" cols="30"></textarea>
			<button type="button" id="send_btn">전송</button>
		</div>
	</div>

	테스트용 현재 접속 아이디:<input type="text" id="testName">

	<script src="/resources/Loginscript.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script type="text/javascript">
	$(()=>{
    	var createRoomBtn = $("#createRoomBtn")	// 프로필에서의 방생성버튼
    	var createRoomBtn2= $("#create_room_btn")	//방생성 클릭 후 프로필 검색창에서의 생성버튼
    	createRoomBtn.on("click",function(){
    		$("#create_room").css("transform","translateY(0px)")
 
    	})
    	$("#profile_search_cancle").on("click",function(){
    		$("#create_room").css("transform","translateY(-400px)")
    	})
    	
    	$("#profile_search_input").on("input",function(){
    		var searchWord = $(this).val()
    		
    		var profiles=$("#profile_search .emp_name")
    		$.each(profiles,function(i,v){
    			if(!v.innerText.includes(searchWord)){
    				$(this).parent().fadeOut('fast')
    			}else{
    				$(this).parent().fadeIn("fast")
    			}
    		})
    	})
    	
    	$("#profile_search").on("click",".chat_profile",function(){
    		var checkFlag = $("input[type=checkbox]",this).is(':checked')
    		console.log(checkFlag)
    		if(checkFlag){
    			$("input[type=checkbox]",this).prop('checked', false).trigger('change');
    		}else{
    			$("input[type=checkbox]",this).prop('checked', true).trigger('change');
    		}
    		
    	})
    	$("#profile_search").on("change",".empcheck",function(){
    		
    		var id = $(this).parents(".chat_profile").attr("id")
    		console.log(id)
    		var totalChecked = $(".empcheck:checked").length
    		if(totalChecked==0){
				if($("#selected_search_list").length!=0){
					$("#selected_search_list").remove()
				}
    		}else{
    			if($(this).is(":checked")){
    				if($("#selected_search_list").length!=0){
	    				var profileImg=$("#profile_search #"+id+" .emp_profile").clone()
	    				var li = $("<li id='"+id+"'></li>")
	    				var textName = $("#profile_search #"+id+" .emp_name").text()
	    				if(textName.length>3){
	    					textName = textName.substr(0,3)+".."
	    				}else{
	    					textName = textName.substr(0,3)
	    				}
	    				li.append(profileImg)
	    				li.append(textName)
	    				li.insertBefore($("#create_room_btn"))
					}else{
		    			var ssl = $("<ul id='selected_search_list'></ul>")
		    			var createBtn = $("<button type='button' id='create_room_btn'>생성</button>")
		    			var profileImg=$("#profile_search #"+id+" .emp_profile").clone()
	    				var li = $("<li id='"+id+"'></li>")
	    				var textName = $("#profile_search #"+id+" .emp_name").text()
	    				if(textName.length>3){
	    					textName = textName.substr(0,3)+".."
	    				}else{
	    					textName = textName.substr(0,3)
	    				}
	    				li.append(profileImg)
	    				li.append(textName)
		    			ssl.append(li)
		    			ssl.append(createBtn)
		    			ssl.insertBefore("#profile_search_group")
					}
    			}else{
    				$("#selected_search_list #"+id).remove()
    			}
    			
    		}
    		
    	})

    	$(".msgBtn").on("click",function(){
    		$.ajax({
    			  url: '/empChatList',
    			  method: 'get',
    			  dataType: 'json',
    			  success: function(res) {
    				  // 채팅프로필 목록 넣는작업 시작
    				  $("#profile_search").empty()
    				  $("#profile_list").empty()
					  $.each(res.empList,function(i,v){
	    				  var search_profile =`<div class="chat_profile" id="\${v.empId }">
												<div class="emp_profile_div">
												<img class="emp_profile"
													src="/resources/images/Anne-Marie(앤마리)-2002.jpg">
												</div>
					
												<div class="emp_name">\${v.empName }(\${v.empId })</div>
												<div class="emp_dep">
													<input type="checkbox" class="empcheck">
												</div>
											</div>`
	    				  

							var prfile_list	=	`<div class="chat_profile" id="\${v.empId }">
													<div class="emp_profile_div">
														<img class="emp_profile"
															src="/resources/images/Anne-Marie(앤마리)-2002.jpg">
													</div>

													<div class="emp_name">\${v.empName }(\${v.empId })</div>
													<div class="emp_dep">\${v.depId }</div>
												</div>`

											
	    				  $("#profile_search").append(search_profile)
	    				  $("#profile_list").append(prfile_list)
	    			  })
    				  // 채팅프로필 목록 넣는작업 끝
    				  // 채팅방 목록 넣는작업 시작
    				  $("#chatroom_list").empty()
					  $.each(res.chatroomList,function(i,v){
						 /*  <div class="chatroom_profile chatroom_profile_two">
								<div class="chatroom_profile_element">
									<img class="chatroom_profile_img profile_one" src="/resources/images/Anne-Marie(앤마리)-2002.jpg">
								</div>
								<div class="chatroom_profile_element">
									<img class="chatroom_profile_img profile_two" src="/resources/images/Anne-Marie(앤마리)-2002.jpg">
								</div>
							</div> */
						var chatroomEl=""
						var users=""
						$.each(v.chatroomUsers,function(i,v){
							if(i>0){
								users+=","
							}
							users+=v.employee.empName;
						})
						 
						if(users.length>10){
							users=users.substr(0,10)+".."
						}
						var option=""	
						if(v.chatroomUsers.length==1){
							option=" chatroom_profile_only"
						}else if(v.chatroomUsers.length==2){
							option=" chatroom_profile_two"
						}

  
						chatroomEl =`<div class="chatrooms" id="\${v.roomId }">
										 <div class="chatroom_profile\${option}">`
						for(var i=0; i<v.chatroomUsers.length; i++){
							if(i>3){
								break;
							}
							option2=""
							if(v.chatroomUsers.length==2){
								if(i==0){
									option2=" chatroom_profile_img_one"
								}else{
									option2=" chatroom_profile_img_two"
								}	
							}
								
							chatroomEl+=`<div class="chatroom_profile_element">
											<img class="chatroom_profile_img \${option2}" src="/resources/images/Anne-Marie(앤마리)-2002.jpg">
										</div>`
						}			
										 
						chatroomEl +=   `</div>
											<div class="chatroom_name">\${v.roomName }(\${users })</div>
											<div class="chatroom_last_time">
												오후 06:30
											</div>
										</div>`
				

	    				  $("#chatroom_list").append(chatroomEl)
	    			  })
    				  // 채팅방 목록 넣는작업 끝 
    				  
    			  },
    			  error: function(xhr, status, error) {
    			    // 요청이 실패했을 때 실행할 코드
    			    console.log('요청 실패: ' + error);
    			  }
    		});
    	})
    	
    	$("#chatroom_list").on("click",".chatrooms",function(){
    		var roomId = $(this).attr("id")
    		console.log(roomId)
    		
    		$.ajax({
		    	  url: '/roomDetail/'+roomId,
		    	  type: 'post',
		    	  contentType: 'application/json',
		    	  success: function(res) {
		    		$(".chatroom").empty()
		    	    res = JSON.parse(res)
		    	    console.log(res.chatroomInfo)
		    	    console.log(res.messageList)
		    	    var chatroomUsers=res.chatroomInfo.chatroomUsers
		    	    
		    	    //현재 누른 채팅방의 헤더에 정보넣기
		    	    var headerText=$(".chatroom_header div")
		    	    var roomName=res.chatroomInfo.roomName
		    	    var totalCount = res.chatroomInfo.chatroomUsers.length
		    	    console.log(totalCount)
		    	    var temp="("
		    	    $.each(res.chatroomInfo.chatroomUsers,function(i,v){
		    	    	if(i!=0){
		    	    		temp+=", "
		    	    	}
		    	    	temp+=v.employee.empName;
		    	    })
		    	    if(temp.length>13){
		    	    	temp=temp.substr(0,25)+".."
		    	    }
		    	    temp+=")"
		    	    
		    	    roomName+=temp;
		    	    headerText.text(roomName)
		    	    totalCountEl= $("<span style='color:purple;'>"+totalCount+"</span>")
		    	    headerText.append(totalCountEl)
		    		//현재 누른 채팅방의 헤더에 정보넣기 끝
		    		//현재 누른 채팅방에  메세지 정보넣기
		    		if(res.messageList!=null&& res.messageList.length>0){
		    			
		    			var empId = $("#testName").val()//테스트용 현제 접속empid변수
		    			var chattingList = $(".chatroom")
		    			var date = "";
		    			$.each(res.messageList,function(i,v){
		    				var dateObj=new Date(v.createDate)
		    				var dateOpt={ year: 'numeric', month: 'long', day: 'numeric', weekday: 'long' };
		    				var formattedDate = dateObj.toLocaleDateString('ko-KR', dateOpt);		// 포맷: "2023년 6월 10일 토요일"
		    				if(date!=formattedDate){
		    					date=formattedDate;
		    					var dateP = $("<p class='chatroom_date'></p>")
		    					dateP.text(formattedDate)
		    					chattingList.append(dateP);
		    				}
		    				var senderId = v.employeeVO.empId
		    				var isOtherMessage = false;
		    				if(senderId!=empId){
		    					isOtherMessage = true;
		    				}
		    				
		    				if(isOtherMessage){			//남이 보낸 메세지면(프로필 메세지 등이 왼쪽에 치우쳐야하며 순서가 프로필,메세지,읽음유무 순이여야함)
		    				
			    				var message=$("<div class='chat_message others_message' id='"+v.messageId+"'></div>")
			    				var messageProfile=$("<div class='chat_message_profile'><img class='chat_message_profile_img' src='/resources/images/Anne-Marie(앤마리)-2002.jpg'></div>")
			    				var messageEmpName=$("<div class='chat_message_name'>"+v.employeeVO.empName+"</div>")
			    				var messageContent=$("<div class='chat_message_content'>"+v.messageContent+"</div>")
			    				var messageImg=""
			    				if(v.messageType=='f'){
			    					messageImg=$("<div class='chat_message_img'><img src='/chatImgRead/"+v.messageId+"'></div>")
			    				}
		    					messageContent.append(messageImg)
			    				var unreadCount = ""
			    				var tempCnt=0;
			    				$.each(chatroomUsers,function(j,k){
			    					if(v.messageId>k.lastReadMessageId){
			    						tempCnt++;
			    					}
			    				})
			    				if(tempCnt!=0){
			    					unreadCount=tempCnt;
			    				}
			    				var messageUnreadCount = $("<div class='chat_message_unread_count'>"+unreadCount+"</div>") 
			    				var messageTime = dateFormatTime(v.createDate)
			    				var messageTime = $("<div class='chat_message_time'>"+messageTime+"</div>")
			    				message.append(messageProfile).append(messageEmpName).append(messageContent).append(messageUnreadCount).append(messageTime)
			    				chattingList.append(message)
		    				}else{						//내가 보낸 메세지면(프로필 메세지 등이 오른쪽으로 치우쳐야하며 순서도 읽음유무,메세지,프로필 순이여야함)
		    											// 제일 바깥 변수명 message만 class에 my_message로 되어있고 append순서만 다를뿐 위와 같다.
		    					var message=$("<div class='chat_message my_message' id='"+v.messageId+"'></div>")
			    				var messageProfile=$("<div class='chat_message_profile'><img class='chat_message_profile_img' src='/resources/images/Anne-Marie(앤마리)-2002.jpg'></div>")
			    				var messageEmpName=$("<div class='chat_message_name'>"+v.employeeVO.empName+"</div>")
			    				var messageContent=$("<div class='chat_message_content'>"+v.messageContent+"</div>")
			    				var messageImg=""
			    				if(v.messageType=='f'){
				    				messageImg=$("<div class='chat_message_img'><img src='/chatImgRead/"+v.messageId+"'></div>")
				    			}
			    				messageContent.append(messageImg)
			    				var unreadCount = ""
			    				var tempCnt=0;
			    				$.each(chatroomUsers,function(j,k){
			    					if(v.messageId>k.lastReadMessageId){
			    						tempCnt++;
			    					}
			    				})
			    				if(tempCnt!=0){
			    					unreadCount=tempCnt;
			    				}
			    				var messageUnreadCount = $("<div class='chat_message_unread_count'>"+unreadCount+"</div>") 
			    				var messageTime = dateFormatTime(v.createDate)
			    				var messageTime = $("<div class='chat_message_time'>"+messageTime+"</div>")
			    				message.append(messageTime).append(messageUnreadCount).append(messageContent).append(messageEmpName).append(messageProfile)
			    				chattingList.append(message)
		    				}
		    			})
		    		}
		    		//현재 누른 채팅방에  메세지 정보넣기 끝
		    	    	
		    	    setTimeout(function() {
		    	    	 var element = document.getElementsByClassName('chatroom')[0];
						element.scrollTop = element.scrollHeight;
					}, 10);
		    	    $(".cur_chatroom").css("display","block")
		    	  
		    	  },
		    	  error: function(xhr, status, error) {
		    	    console.log("error :"+status)
		    	  }
		    });
    		
    		
    	})

    	
    	$(document).on("click","#create_room_btn",function(){
    		var selected = $("#selected_search_list li")
    		var selectedList = selected.map(function() {
    		    return $(this).attr('id');
    		  }).get();
    		
    		var roomName=prompt("방제목 입력:")
    		if(roomName==null|| roomName==""){
    			alert("방제목을 입력해 주세요")
    			return false;
    		}
    		var obj = {
    				selectedList:selectedList,
    				roomName : roomName
    		}
    		
    		console.log(JSON.stringify(selectedList))
    		
    		
		    $.ajax({
		    	  url: '/room/create',
		    	  type: 'post',
		    	  data: JSON.stringify(obj),
		    	  contentType: 'application/json',
		    	  success: function(res) {
		    	    if(res==1){
		    	    	
		    	    }else{
		    	    	alert("서버에러, 다시시도해주세요.")
		    	    }
		    	  },
		    	  error: function(xhr, status, error) {
		    	    console.log("error :"+status)
		    	  }
		    });
    		
    		
    	})
    	
  
    	
    	
    	
    	
    	$("#cur_chatroom_close_btn").on("click",function(){
    		$(".cur_chatroom").css("display","none")
    	})
    	$(".login-link").on("click",function(){
    		$("#selected_search_list").remove()
    		$(".empcheck").prop("checked",false)
    		$("#create_room").css("transform","translateY(-400px)")
    	})
    	$("#msgClose").on("click",function(){
    		$("#selected_search_list").remove()
    		$("#create_room").css("transform","translateY(-400px)")
    		$(".cur_chatroom").css("display","none")
    	})
    })

function dateFormatTime(date){	// 오후 3:25 이런식의 포맷으로 바꿔주는 함수
		var dateString = date;

		var dateObj = new Date(dateString);

		var hours = dateObj.getHours();
		var minutes = dateObj.getMinutes();
		var amPm = hours >= 12 ? '오후' : '오전';
		hours = hours % 12;
		hours = hours ? hours : 12; // 0시를 12시로 변경

		var formattedTime = amPm + ' ' + hours + ':' + (minutes < 10 ? '0' + minutes : minutes);
		return formattedTime;
}
	
    </script>
</body>
</html>

