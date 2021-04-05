<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="css/main.css" rel="stylesheet" />

</head>
<body>

<h1>login page</h1>

<form action="login?param=loginpro" method="post">
<input type="text" name="id" id="id" placeholder="아이디">
<input type="text" name="pwd" id="pwd" placeholder="패스워드">
<button type="submit">로그인</button>
<button type="button" onclick="account()">회원가입</button>
<br>
<a href="#">아이디 저장하기</a><input type="checkbox" id="chk_save_id">
<br>
<a href="login?param=findId">아이디찾기</a>
<br>
<a href="login?param=findPassword">비밀번호찾기</a>

</form>
</body>

<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function account() {	
//	console.log("123")
	location.href = "login?param=register";

let user_id = $.cookie("user_id");
if(user_id != null){	// 저장된 id가 있음
	alert("쿠키 있음");
	$("#userid").val( user_id );
	$("#chk_save_id").prop("checked", true);
	}
};	

$("#chk_save_id").click(function() {
	
	if( $("#chk_save_id").is(":checked") ){
//		alert('첵크됨');
		if( $("#userid").val().trim() == "" ){
			alert('id를 입력해 주세요');
			$("#chk_save_id").prop("checked", false);			
		}else{
			// 쿠키를 저장
			$.cookie("user_id", $("#userid").val().trim(), { expires:7, path:'./'});
		}
	}
	else{
		$.removeCookie("user_id", { path:'./' });
	}
	
}); 



</script>

</body>
</html>