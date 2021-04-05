<%@page import="book.BookDto"%>
<%@page import="club.ClubDto"%>
<%@page import="club.CardDto"%>
<%@page import="login.LoginDao"%>
<%@page import="login.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//	List<MemberDto> dto = request.getAttribute("memberlist");  
//클럽시퀀스
//클럽 리스트 받아오기 > 테이블로 표현
//
%>
<%	MemberDto user = (MemberDto)session.getAttribute("userId");
	List<MemberDto> memlist = (List<MemberDto>)request.getAttribute("memlist");
	List<CardDto> cardlist = (List<CardDto>)request.getAttribute("cardlist");
	
	boolean isMember, isMaster;
	isMember = (boolean)request.getAttribute("isMember");
	isMaster = (boolean)request.getAttribute("isMaster");
	System.out.println("isMember = " + isMember + "isMaster = " + isMaster);
	
	int size = memlist.size(); boolean loopout = false;
	ClubDto club = (ClubDto)request.getAttribute("club");
	int clubseq = (Integer)request.getAttribute("clubseq");
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/main.css" rel="stylesheet" />
  <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  
  <link href="css/book.css" rel="stylesheet" />
  <link href="css/action.css" rel="stylesheet" />
  
  
  <!-- css -->
    <link href="css/action.css" rel="stylesheet" />
  
   <!-- 애니메이션용 링크 -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
   
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	
<title>소모임 상세화면</title>
<style type="text/css">
*{ margin: 0; padding: 0; font-family: Fugaz One; color: #ab906e; }

.logo{
	overflow: hidden;
	width: 100px;
	height: 30px;
	margin-left: 30px;
	margin-top: 5px;
}
.logo > img{
	width: 100%;	
}
.navbar{
	background-color: #f1edea;
	height: 60px;
	padding: 0;
	margin: 0;
}
.btn{
    background-color: #ab906e;
    color: white;
}
.btn:hover{
    background-color: #4b4b49;
    color: white;
}
.clubintro{
	padding-top: 10px;
	border: solid black 1px;
	border-radius: 20px;
}
.table{
	min-width: 500px;
}

input:focus,
.clubintrotext{
	border: none;
	background-color: none;
	outline: none;
}

.clubimg{
	position: relative;
    overflow: hidden;
	margin: 0px auto 0 auto;
	height: 200px;
	width: 100%;
}
.clubimg>img{
    position: absolute;
    width: 100%;
	top: 50%;
	left: 50%;
    transform: translate(-50%, -50%);
}

.userpic{
    position: relative;
    overflow: hidden;
    border-radius: 50%;
    border: solid #ab906e;
    height: 50px; width:50px;
    margin: 20px;
    margin-bottom: 0;
}

.userpic>img{
    position: absolute;
    width: 200%;
	top: 47%;
	left: 46%;
    transform: translate(-50%, -50%);
}

.card-wrap{
	margin:20px;
    width:200px;
    height: 300px;
	transform-style: preserve-3d;
	transition: all 1s;
	border-radius: 10px;
}
.card-front{
	position: absolute;
    overflow: hidden;
    border-radius: 5px;
    height: 300px;
    width: 200px;
    transform: rotateY(0deg);
    z-index: 2;
}
.card-front img{
    height: 100%;
	top: 50%;
	position: absolute;
	left: 50%;
    transform: translate(-50%, -50%);
}
.card-back{
	position: absolute;
	height: 300px;
	width: 200px;
	border-radius: 5px;
    background-color: #f1edea;
    transform: rotateY(180deg);
    z-index: 1;
}
.card-wrap:hover{
	transform: rotateY(180deg);
}
</style>
</head>
<body>

<header style="height: 60px;">
</header>

<main>
<div class="container">

<div class="container pt-3" style="height: 160px">

	<%if(size<1){ %>
	<h4>모임에 참가한 인원이 없습니다.</h4>
	<div class="row"></div>
	
	<%}else{%>
	<h4><span id="clublinkcount"><%=size%></span>명의 사람이 이 모임에 참가하고 있습니다.</h4>
	<div class="row">
		
	<%for(int i=0; i<size; i++){
		MemberDto dto = memlist.get(i);%>
		
		<div class="text-center p-0">
		<div class="userpic"><img src="./img/user.png" alt="./img/user.png"></div>
		<span id="userid"><%=dto.getUserid()%></span>
		</div>
		
		<%if(i>10){%>
			<div class="text-center pt-4">
			<i class="fa fa-ellipsis-h fa-3x" aria-hidden="true"></i>
			</div>
			<%loopout = true;}%>
		<%if(loopout) break;
	}%>
	</div>
	<%}%>
</div>


<div class="container" style= "height: 500px;">
<div class="row">
	<div class="col-sm-3 mt-5 ">
		<div class="card">
		
		<div class="clubimg" ><%=club.getClubimage()%>
	        <img src="https://image.yes24.com/goods/87005231/L" alt="">
	    </div>
		
		<div class="col-10 mx-auto mt-4 text-center" style="height: 70px;">
			<h5><span><b><%=club.getClubtitle()%></b></span></h5>
	    </div>
		
		<div class="card-body text-center p-0">
		<div class="userpic mx-auto"><img src="./img/user.png" alt="./img/user.png"></div>
		<span id="userid"><%=club.getUserid()%></span><br><br>
		</div>
		<!-- //CLUBSEQ, CLUBTITLE, CLUBTEXT, CLUBDATE, M.USERID, CLUBIMAGE// -->

	    
	    </div>
	    
	</div>

	<div class="col-sm-9 mt-5 ml-0" >
	
		<div class="col p-2 pr-4 text-right" style="height: 70px; ">
			<button class="btn btn-lg" type="button" id="joinclub">가입하기</button>
			<button class="btn btn-lg" type="button" id="updateclub">모임 수정하기</button>
			<button class="btn btn-lg" type="button" id="addcard" >카드추가하기</button>
			<input id="isMem" type="hidden" value="<%=isMember %>">
			<input id="isMst" type="hidden" value="<%=isMaster %>">
			<input id="clubseq" type="hidden" value="<%=clubseq %>">
			<% if(user!=null){ %>
			<input id="membernum" type="hidden" value="<%=user.getMembernum() %>">
			<% } %>
		</div>
		
		<div class="col" style="height: 400px">
			<div class="container m-0">		
			<table class="table"  style="border-style: hidden;">
			<col width="200px"><col width="200px">
			<tr><td>소모임명</td><td>
			<input class="clubintrotext" type="text" name="clubtitle" readonly="readonly" value="<%=club.getClubtitle()%>"></td></tr>
			<tr><td>소모임장</td><td><input class="clubintrotext" type="text" name="userid" readonly="readonly" value="<%=club.getUserid()%>"></td></tr>
			<tr><td>소모임창설일</td><td><input class="clubintrotext" type="text" name="clubdate" readonly="readonly" value="<%=club.getClubdate()%>"></td></tr>
			<tr class="update" height="120px"><td>우리 모임 소개</td><td>
			<textarea class="clubintrotext" rows="8" cols="80" name="clubtext" id="clubtext" readonly="readonly" style="resize: none;"><%=club.getClubtext()%></textarea>
			</td></tr>			
			</table>
			</div>
		</div>
	</div>

</div>
</div>

	<div class="container" style="border: solid black; height: 350px">
		<div class="row ">
		
			<%if(cardlist.size()<1){ %>
			<h4>생성된 카드가 없습니다.</h4>
			
			<%}else{%>
		
			<%for(int i=0; i<cardlist.size(); i++){
				CardDto dto = cardlist.get(i);%>
				
			<a href="club?param=talklist&cardseq=<%=dto.getCardseq()%>" class="cardclick">
				<div class="card-wrap">
					<div class="card-front">
				        <img src="https://image.yes24.com/goods/<%=dto.getBooknum()%>/L" alt="<%=dto.getBooknum()%>">
				    </div>
				    
				    <div class="card-back">
				        <div class="card-info">카드뒷면<br><%=dto.getCardtitle()%><br><%=dto.getCardtext()%></div>
				    </div>
			    </div>
			</a>	    
		
			<%}}%>
			
			<a href="club?param=talklist&cardseq=5000" class="cardclick">
			<div class="card-wrap">
				<div class="card-front">
			        <img src="https://image.yes24.com/goods/93510657/L" alt="기린의 타자기">
			    </div>
			    
			    <div class="card-back">
			        <div class="card-info">카드뒷면</div>
			    </div>
		    </div>
		    </a>
		    
		   	<div class="card-wrap">
				<div class="card-front">
			        <img src="https://image.yes24.com/goods/93510658/L" alt="기린의 타자기">
			    </div>
			    
			    <div class="card-back">
			        <div class="card-info">카드뒷면</div>
			    </div>
		  	</div>
		        
		</div>
	</div>

</div>

</main>


<footer>
</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	let b = true;
	
	if($("#isMem").val()=="true"){
		$("#joinclub").hide();
		
	}else if($("#isMst").val()=="true"){
		$("#joinclub").hide();
		
	}else{
		$('.cardclick').click(function(e) { e.preventDefault(); });
		$("#joinclub").show();		
	}
	
	if($("#isMst").val()=="true"){
		$("#addcard").show();
		$("#updateclub").show();
	}else{
		$("#addcard").hide();
		$("#updateclub").hide();
	}
	
	$("#joinclub").click(function() {
		let clubseq = $("#clubseq").val();
		let membernum = $("#membernum").val();
			alert(clubseq);
			alert(membernum);
		if(membernum==null){ alert("로그인이 필요합니다."); return;}
		else{location.href="club?param=joinclub&clubseq=" + clubseq + "&membernum=" + membernum;}
	});
	
	$("#updateclub").click(function() {
		if(b==true){
			$(this).text("수정완료");
			$("#clubtext").removeAttr("readonly");
			$(".update").css("background-color","#f1edea");
			b=false;
			location.replace="club?param=joinclub";
		}else{
			$(this).text("모임 수정하기");
			$("#clubtext").attr("readonly",true);
			$(".update").css("background-color","");
			b=true;
		}
	});
	
	$("#addcard").click(function() {
		let clubseq = $("#clubseq").val();
		location.href="club?param=cardadd&clubseq=" + clubseq;
	});
});

</script>



</body>
</html>