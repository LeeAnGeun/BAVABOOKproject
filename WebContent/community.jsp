<%@page import="club.ClubDto"%>
<%@page import="db.DBConnection"%>
<%@page import="login.MemberDto"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("utf-8");
MemberDto mem = (MemberDto)request.getSession().getAttribute("userId");

List<ClubDto> clublist = (List)request.getAttribute("clublist");
System.out.println("clublist = " + clublist );
Integer listRow = (Integer)request.getAttribute("listRow");
String cmPage1 = (String)request.getAttribute("cmPage");
String pageNumber1 = (String)request.getAttribute("pageNumber");
String search = (String)request.getAttribute("search");
System.out.println("search = " + search );
int cmPage = Integer.parseInt(cmPage1);
int pageNumber = Integer.parseInt(pageNumber1);
%>

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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link href="css/main.css" rel="stylesheet" />

<title>클럽 메인화면</title>
<style type="text/css">
*{ margin: 0; padding: 0; font-family: Fugaz One; color: #ab906e; }
.logo{
	overflow: hidden;
	width: 100px;
	height: 30px;
	margin-left: 30px;
	margin-top: 5px;
}
.logo > img{width: 100%;}
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
.table{
	width: 100%;
	border-spacing: 0;
}
.table col{
	width: 25%;
}
#_search{
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
}

.clubimg{
    position: relative;
	overflow: hidden;
	height: 150px;
}
.clubimg img{
	position: absolute;
	height: 98%;
	top: 50%;
	left: 50%;
    transform: translate(-50%, -50%);
    box-shadow: 10px 2px 15px 2px gray;
}
.row-shlef{
    position: relative;
    margin-bottom: -22px;
    z-index: 2;
}
.shelf-back{
	background-image: url("./img/shelf.png");
	background-repeat: no-repeat;
	background-position: bottom;
	background-size: 100%;
}
.table{
	border-style: hidden; 
}
.table td{
	padding-bottom: 23px;
}
</style>
</head>
<body>

<script type="text/javascript">
$(document).ready(function() {
	let search = "<%=search %>";
	if(search == "") return;
	$("#_search").val(search);
});
</script>

<header>
</header>

<main>

<div class="container mt-5">
<div class="row">
<div class="col-9 px-5">
	<table class="table" >
	<col><col><col><col>
	<tr><th colspan="4"><h3>소모임</h3></th></tr>
	<%if(clublist == null || clublist.size() == 0){%>
	<tr><td colspan="4">소모임이 없습니다</td></tr>
	<%}else{%>
	<tr class="shelf-back">
	<%for(int i=0; i<clublist.size(); i++){
		ClubDto dto = clublist.get(i);%>
		<td>
			
			<span id="userid"><%=dto.getClubtitle() %></span>
			<div class="col clubimg" >
				<a href="club?param=getclubdetail&clubseq=<%=dto.getClubseq()%>">
	           		<img src="./clubload/<%=dto.getClubimage() %>" onerror="this.src='./img/club1.png'">
	        	</a>
        	</div>
			
		</td>
		<%if( (i+1)%4==0 && i>1 ){%>
		</tr>
		<tr class="shelf-back">
	<%}}}%>

	</table><br>
	
	<div class="btn-toolbar" role="toolbar" aria-label="page" style="justify-content: center;"> <!-- 페이지 번호 -->
	<div class="btn-group" role="group" aria-label="...">
	<%for(int i = 0;i < cmPage; i++){
		if(pageNumber == i){%>
		<button type="button" class="btn btn-default"><%=i+1 %></button>
		<%}else{%>		
		<button type="button" class="btn btn-default" onclick="goPage(<%=i %>)"><%=i+1 %></button>
	<%}}%>
	</div>
	</div>
		
</div>

<!-- <tr style="height: 10px"><td colspan="4"><div class="bg-shlef1"></div><div class="shlef-wrap"><div class="shlef2"></div><div class="shlef-shadow mx-auto"></div></div></td></tr>
		<tr>	</tr> -->




<div class="col-3 p-0" style="height: 500px">
	<br>
	<div class="row m-0" >
		<label>소모임 검색</label>
		<input class="form-control col-9 m-0" type="text" placeholder="검색" id="_search" name="search" >
		<button class="btn col-3 m-0" onclick="search();" type="button" ><i class="fa fa-search" aria-hidden="true" style="color: white;"></i></button>
	</div>
	<br><br>
	<button class="btn col" id="addclub" type="button" data-toggle="modal" data-target="#exampleModal2" style="height: 60px">모임 만들기</button>
</div>
</div>
</div>
</main>



<div class="container">   
   <!-- 모달 테두리 -->
   <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog"
      aria-labelledby="title-dialog" aria-describedby="desc-txt" aria-hidden="true" >
      <div class="modal-dialog" role="document" >   <!-- 모달 본체 -->
         <div class="modal-content"><!-- 모달 내용 -->
               <h4 class="modal-title mt-5 ml-5" id="exampleModalLabel">소모임 생성</h4><!-- 모달 제목 -->
                  <!-- 모달 본문 -->
                  <div class="modal-body">
                     <form action="clubimg" id="frm" enctype="multipart/form-data" method="post">
                     		<% if(mem!=null){ %>
                     		<input type="hidden" value="<%=mem.getMembernum() %>" name="membernum">
                     		<% } %>
                            <div class="form-group row">
                                <label for="clubtitle" class="col-md-4 col-form-label text-md-right">소모임 제목</label>
                                <div class="col-md-6">
                                    <input type="text" id="clubtitle" class="form-control" name="clubtitle" placeholder="제목">
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="clubtext" class="col-md-4 col-form-label text-md-right">소모임 소개글</label>
                                <div class="col-md-6">
                                	<textarea rows="7" cols="" id="clubtext" class="form-control" name="clubtext" placeholder="소개글" style="resize: none;"></textarea>
                                </div>
                            </div>

                            <div align="center" class="form-group row">
                            <label for="clubtitle" class="col-md-4 col-form-label text-md-right">클럽 사진</label>
                                <input type="file" id="input_img" name="clubImg">
                            </div>

                            <div class="col-md-6 offset-md-4">
	                            <button type="button"  class="btn" id="writebtn">작성완료</button>
                            </div>
                     </form>
                  </div>

            <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
            
         </div>
      </div>
   </div>
</div>



<footer>
</footer>

<script type="text/javascript">
function goPage( pageNum ) {
	let search = document.getElementById("_search").value;
	location.href ="club?param=clublist&search=" + search + "&pageNumber=" + pageNum; 
}
function search() {
	let search = document.getElementById("_search").value;
	location.href ="club?param=clublist&search=" + search; 
}

// 작성완료 버튼 클릭시


$("#addclub").click(function () {
	let mem = "<%=mem %>";
	if(mem=="null"){
		alert("로그인해주세요1");
		
	}
	$("#exampleModal2").on('shown.bs.modal', function (e) {
		alert("로그인해주세요2-1");
		console.log('hello, world!');
		e.preventDefault();
		alert("로그인해주세요2-2");
	});
});

$("#exampleModal2").on('show.bs.modal', function (e) {
	alert("로그인해주세요2-1");
	console.log('hello, world!');
	e.preventDefault();
	alert("로그인해주세요2-2");
});

$("#writebtn").click(function () {
	if( $("#clubtitle").val() == ""){ // || $("#_pwd").val() == ""){
		alert("클럽제목을 입력하세요");
		return false;
	}else if ($("#clubtext").val() == ""){
		alert("클럽설명을 입력하세요");
		return false;
	}else {
		$("#frm").submit();	
	}
			
});
</script>

</body>
</html>