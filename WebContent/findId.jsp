<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.form-gap {
	margin: 0 auto;
    padding-top: 70px;
    
}


</style>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
﻿<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="css/fonts.css" rel="stylesheet" />

<title>Insert title here</title>
</head>
<body>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<div class="form-gap"></div>
<div class="container">
	<div class="row">
		<!-- <div class="col-md-4 col-md-offset-4"> -->
      <div class="text-center">
        <h3 style="font-size: 30px;"><i class="fa fa-lock fa-4x"></i></h3>
        <h2 class="text-center">아이디 찾기</h2>
        <p>가입 시 입력한 정보를 기재해주세요.</p>
         	<div>
             <label>
             <input id="email" name="email" placeholder="Email address" size="30">
             </label>
           </div>
           <div>  
             <label>
             <input id="phone" name="phone" placeholder="Phone number" size="30">
             </label>
           </div>
            <input type="button" class="btn btn-lg btn-light btn-block" onclick="findId()" value="아이디 찾기">
        </div>
    </div>
</div>



<script type="text/javascript">

function findId() {
	$.ajax({
		url : 'login?param=findIdPro',
		type : 'POST',
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		data : { "email":$("#email").val() 
					, "phone" : $("#phone").val()	
					},
		success : function (data) {
			console.log(data)
			if(data.userId ){
				alert("검색된 아이디:"+data.userId)
			}else{
				alert("해당 정보로 검색된 아이디가 없습니다.")
				
			}
		},
		
		error:function() {
			alert('error');
		}
	});
};


</script>
</body>
</html>