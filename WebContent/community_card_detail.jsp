<%@page import="club.CardDto"%>
<%@page import="club.TalkDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	//로그인 정보가져오기 request.getAttribute("");
	String membernum = "100";
	List<TalkDto> talklist = (List<TalkDto>)request.getAttribute("talklist");
	CardDto card = (CardDto)request.getAttribute("card");
	int cardseq = (Integer)request.getAttribute("cardseq");%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link href="css/main.css" rel="stylesheet" />
<title>카드화면</title>
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


.cardimg{
	margin-left: 20px;
    position: relative;
    overflow: hidden;
    background-color: #f1edea; 
    height: 150px; 
    width: 100px;
    box-shadow: 2px 2px 6px 1px #4b4b49;
}
.cardimg img{
 	position: absolute;
    height: 100%;
	top: 50%;
	left: 50%;
    transform: translate(-50%, -50%);
}

.centerline{
    border-right: dotted #ab906e;
}


.chatbox{
    height: 750px; 
	margin-bottom: 20px;
    padding: 0;
    padding-bottom: 100px; /* 85 */
}
.chatcontent{
    background-color: /* #f1edea; */ ;
    height: 100%; width: 100%; 
    overflow-y: scroll;
    padding: 0;
}
.userpic{
    position: relative;
    overflow: hidden;
    border-radius: 50%;
    border: solid #ab906e;
    height: 50px; width: 50px;
    margin: 20px; margin-bottom: 5px;
    /* box-shadow: 3px 3px 5px 1px #ab896e; */
}
.userpic>img{
    position: absolute;
    width: 200%;
	top: 47%;
	left: 46%;
    transform: translate(-50%, -50%);
}
.talk{
    margin: 0;
    line-height: 100%;
}
.talkbox{
	line-height:20px;
	color: black;
    position: relative;
    border: solid #ab906e 2px;
    margin: 30px 6px 20px 20px;
    padding: 10px;
    border-radius: 10px;
    max-width: 600px;
    /* box-shadow: 3px 3px 5px 1px #ab896e; */
}
.talkbox:after {
    content: "";
    width: 15px;
    height: 15px;
    background: white;
    border-top: solid #ab906e 2px;
    border-left: solid #ab906e 2px;
    position: absolute;
    top: 10px;
    left: -10px;
    transform: skewX(45deg);
}
.input-group{
    position: absolute;
    bottom: 0;
}
.input-group textarea{
    resize: none;
    border-top-right-radius: 0; 
    border-bottom-right-radius: 0;
}
.input-group .btn{ height: 85px;}
.fa{color:white}

</style>

</head>
<body>


<main>
<div class="container mt-3">
<div class="row">
<div class="col-sm-3 pt-4 centerline" >
    <div class="col">
        <h2>소모임 타이틀:<%=card.getCardtitle() %></h2>
        <h3>카드 타이틀:<%=card.getCardtitle() %></h3>
        <br>
    </div>

    <div class="container cardimg">
        <img src="https://image.yes24.com/goods/93510656/L" alt="기린의 타자기">
    </div>
</div>
<div class="col-sm-9 pt-4">

	<div class="col chatbox" style="background-color: white;">
	    <div class="col chatcontent">
	    
	    <% for(TalkDto dto : talklist){ %>
	    	<div class="row talk align-self-end">
		    	<div align="center">
		        	<div class="userpic"><img src="./img/user.png" alt=""></div>
		        	<span id="userid"><%=dto.getUserid()%></span>
		        </div>
	        	<p class="talkbox"><%=dto.getTalkcontent()%></p>
	        	<p class="align-self-end"><%=dto.getTalkdate() %></p>
	        </div>
	   <% } %>
	    </div>
	    
	    <div class="input-group">
	        <form class="form-inline" action="club?param=talkadd" method="post" style="width: 100%;">
	        <textarea class="form-control col-11" name="talkcontent" id="talkcontent" cols="58" rows="3" placeholder="내용입력"></textarea>
	        <button class="btn col-1" type="submit"><i class="fa fa-angle-double-right fa-2x" aria-hidden="true"></i></button>
	        <input type="hidden" name="cardseq" id="cardseq" value="<%=cardseq%>">
	        <input type="hidden" name="membernum" value="<%=membernum%>">
	        </form>
	    </div>
	</div>

</div>

</div> <!-- 로우 끝 -->
</div> <!-- 전체칸 끝 -->
</main>


	    <script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
	    <script type="text/javascript"> //스크롤위치저장, 커서자동이동, 10초마다 새로고침
		    $(document).ready(function() {
		    	//let nowscroll = $(".chatcontent")[0].scrollHeight;스크롤 마지막
		    	let nowscroll = $.cookie("nowscroll");
		    	$(".chatcontent").scrollTop(nowscroll); //쿠키에서 스크롤 받아와서 셋팅 
		    	
			    $('#talkcontent').focus(); // 커서를 입력칸에
			    
			    $(".chatcontent").scroll(function () { //스크롤 변경시 값 받아옴
		    		nowscroll = $(".chatcontent").scrollTop(); //변수에 저장
		    		$.cookie("nowscroll", nowscroll,{ //쿠키에 저장
    		    		expires:1, path:'./'});
		    	});
			    
	            $("#talkcontent").keydown(function(key) {
	                if (key.keyCode == 13) { $("form").submit(); }		});
	            
	            /* let cardseq = $("#cardseq").val();
	            setTimeout(function() { 
	            	location.replace("club?param=talklist&cardseq="+cardseq) },10000); */
	        });
	    </script>
	    
	    
<footer>
</footer>

</body>
</html>