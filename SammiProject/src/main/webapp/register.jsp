<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입 사이트</title>
		<link rel="stylesheet" type="text/css" href="./css/styles.css">
	</head>
	<body id="createBody">
	<div>
	<header>
	
		<div class="use_list_box">
			<div class="use_list">
				
					<a href="Main.jsp" class="use_main">
						<span><img src="./img/로고.png" class="logo"></span>
					</a>
		          
				<ul class="use">
					<li>
						<a href="login.jsp" class="use_logout" title="로그인" >
							<span><img src="./img/login.png" class="login"><br>LOGIN</span>
						</a>
					</li>
					<li>
						<a href="MyPage.jsp" class="use_mypage" title="마이페이지">
							<span><img src="./img/유저.png" class="user"><br>MY</span>
						</a>
					</li>
					<li>
						<a href="MyPageLikeList.jsp" class="use_likelist" title="찜매물">
							<span><img src="./img/찜.png" class="like"><br>찜</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</header>
	<section class="transparent-section">
	<div id ="registerH">
	<h1>회원가입</h1>
	</div>
	<div id="background">
        
	          <form action="RegisterServlet" method="post">  
	            <div class="registerinputstyle">
	            <div id="d0">
	                <label for="ID">아이디 : </label>
	                <input type="text" placeholder="아이디를 입력하세요." id="ID" name="ID" required>
                    <!-- 중복체크 버튼 -->
					<input type="submit" value="중복체크" id="checkButton">
	            </div>
	            
	            <div id="d1">
	                <label for="PASSWORD">비밀번호 : </label>
	                <input type="PASSWORD" placeholder="비밀번호를 입력하세요." id="PASSWORD" name="PASSWORD" required><br>
					<p id="pm"></p>
	            </div>
						
	            	
	            <div id="d2">
	                <label for="PWCHECK">비밀번호 확인 : </label>
	                <input type="PASSWORD" placeholder="비밀번호를 확인하세요." id="PWCHECK" name="PWCHECK" required>
                    <input type="button" value="비밀번호 확인" onclick="checkPW(),submitPassword()" id="checkPwButton"><br>
	            </div>
	            
	            <div id="d3">  
	                <label for="PHONE_NUMBER">전화번호 : </label>
	                <input type="text" placeholder="번호를 입력하세요.(-제외)"id="PHONE_NUMBER" name="PHONE_NUMBER" required><br>
	            </div>
	            <div id="d4">
	                <label for="EMAIL">이메일 : </label>
	                <input type="email"placeholder="이메일을 입력하세요." id="EMAIL" name="EMAIL"><br>
	            </div>
                <div id="d5">
	                <label for="ADDRESS" style="margin-left:120px;">주소 : 서울특별시 강남구</label><br>
	               	<input type="text" placeholder="동을 입력하세요." id="ADDRESS" name="ADDRESS" required><br>
	            </div>
	            <div id="d6">    
                    <button type="submit" id="createIdButton" onclick="createUser()">회원가입</button>
	            </div>
                </div>
	    </form>
		
		</div>
	</section>
	</div>	

	<script>
	function createUser () {

	var userId = document.getElementById("ID");
	var userPw = document.getElementById("PASSWORD");



	if(userId.value === undefined || userId.value === "" || userId.value.length === 0 ) {
      	alert('ID를 입력하세요');
      	userId.focus();
      	return false;
   	}
       	if(userPw.value === undefined || userPw.value === "" || userPw.value.length === 0 ) {
      	alert('비밀번호를 입력하세요');
      	userPw.focus();
      	return false;
  		}
	}


	function checkPW () {
	
	var pw = document.getElementById("PASSWORD");
	var pwCheck = document.getElementById("PWCHECK");


	if(pw.value === "" || pwCheck.value=== ""){
		alert("비밀번호/비밀번호 확인을 입력하세요.");
		return false;
	}
	else if(pw.value === pwCheck.value){
		alert("비밀번호가 일치합니다.");
		return true;
	}else if(pw.value.length ===0||pwCheck.value.length ===0){
		alert("비밀번호/비밀번호 확인을 입력해주세요.");
		return false;	
	}else{
		alert("비밀번호 확인을 잘못 입력하셨습니다. 다시 입력하세요.");
		pwCheck.focus();
		return false;
		}
	
	}

	function submitPassword(){
    
	var password = document.getElementById("PASSWORD").value;
    var confirmpassword = document.getElementById("PWCHECK").value;
    /*
    정규식을 활용해서 
    영문자    소       대문자     숫자       특수문자  포함하기         8 ~ 32
     /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,32}$/
    */
    var passwordPattarn = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,32}$/;
    var errorPW = document.getElementById("pm");

    if(!password.match(passwordPattarn)){
        errorPW.textContent = "비밀번호는 8~32자의 영문 대문자, 소문자, 특수문자, 숫자를 포함해야합니다.";
        return false;
    } else {
        errorPW.textContent = ""; //유효한 경우 오류 메세지 지우기   
    }

    if(password !== confirmpassword){
        errorPW.textContent = "비밀번호와 비밀번호 확인이 일치하지 않습니다."
        return false;
    } else {
        errorPW.textContent = "";
    }
    
    return true; 
	}


	function pwmsg(){
    
	var pwCheck = document.getElementById("PASSWORD");
    var msg = "영문자 대/소문자, 특수문자, 숫자를 포함한 8 ~ 32 자";
    document.getElementById("pm").textContent = msg;
	}

	</script>
	</body>
</html>