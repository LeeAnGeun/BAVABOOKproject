<%@page import="java.util.List"%>
<%@page import="login.MemberDto"%>
<%@page import="book.BookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
request.setCharacterEncoding("utf-8");
Object userId = session.getAttribute("userId");
MemberDto mem = null;

if(userId == null){ // 로그인 세션이 없을경우 
	%>
	<script>
	alert('로그인을 해 주십시오');
	location.href = "main.jsp?content=login"; // 다시 login창으로 돌아간다.
	</script>	
	<%
}

mem = (MemberDto)userId;
%>    
    
<%
Integer clubseq = (Integer)request.getAttribute("clubseq");
System.out.println("clubseq = " + clubseq);

System.out.println("book정보 가져오는 부분");
// 책을 가져옴
List<BookDto> Booklist = (List<BookDto>)request.getAttribute("Booklist");
System.out.println("1");
//전체 페이지 번호
int bookPage = Integer.parseInt((String)request.getAttribute("bookPage"));
System.out.println("2");
//페이징 번호
int pageNumber = Integer.parseInt((String)request.getAttribute("pageNumber"));
System.out.println("3");
//검색변수
String searchTitle = (String)request.getAttribute("searchTitle");
String searchText = (String)request.getAttribute("searchText");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <link href="css/main.css" rel="stylesheet" />
  <link href="css/book.css" rel="stylesheet" />
  <link href="css/action.css" rel="stylesheet" />
  
  
  <!-- css -->
    <link href="css/action.css" rel="stylesheet" />
  
   <!-- 애니메이션용 링크 -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
   
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>


<title>카드 추가</title>
</head>
<body>
<div class="container">
	<h2>카드 추가</h2>

	<div class="row">
	<div class="col-sm-8 col-xs-12">
		<div id="NewBook" class="container tab-pane active"><br>
   	<div class="gtco-container">
   	<div class='row gtco-section gtco-products'>
			<!-- 책을 가져오는 부분 -->
   	 		<%
   	 			if(Booklist == null || Booklist.size() == 0){
   	 		%>
   	 		<div>
   	 			<p>검색한 책이 없습니다.</p>
   	 		</div>
   	 		<%
   	 			}else{
   	 				for(int i=0;i<Booklist.size();i++){
   	 					BookDto dto = Booklist.get(i);
   	 				
		 		%>	
		 		<div class="col-sm-3 col-xs-12 service">
	 		 	<a href="#" id="booktitle" onclick="choice('<%=dto.getBooktitle() %>', '<%=dto.getBooknum() %>')"  class="gtco-item two-row bg-img animate__animated animate__fadeInUp">
	 		 		<div class="overlay">
					<div class="copy">
						<h3><%=dto.getBooktitle() %></h3>
						<p><%=dto.getAuthor() %></p>
					</div>
				</div>	
		 		 	<img class="service" src="https://image.aladin.co.kr/product/26809/94/cover500/k572730190_1.jpg" >
	 			</a>
	 			</div>	
	 			<%		}
	 			}%>	  	
	 		</div>
	</div>		
	</div>		
		
		<!-- 페이징 버튼 -->
		<div class="btn-toolbar justify-content-center paging" role="toolbar" aria-label="Toolbar with button groups"">	
			<div class="btn-group mr-2" role="group" aria-label="First group" >
			<%
				for(int i = 0;i<bookPage;i++){
					if(pageNumber == i){	//현재 페이지일  때
					%>
					<button type="button" class="btn" onclick="goPage(<%=i %>)"><%=i+1 %></button>
					<%
   	 				}
					else{
					%>
						<button type="button" class="btn" onclick="goPage(<%=i %>)"><%=i+1 %></button>
					<%
					}
				}
				%>
			</div>
    	</div>
    </div>
    
	<div class="col-sm-4 col-xs-12">
				
	<form id="frm" action="club" method="">
		<input type="hidden" value="cardaddAf" name="param">
		<input type="hidden" value="<%=clubseq %>" id="clubseq" name="clubseq">
		<table class="table table-border">
		<!-- <col width="200"><col width="500"> -->
		<tr>
			<th>카드 제목</th>
			<td>
				<input type="text" id="cardtitle" name="cardtitle">
			</td>
		</tr>
		<tr>
			<th>카드 코멘트</th>
			<td>
				<textarea rows="2" cols="23" id="cardtext" name="cardtext"></textarea>
			</td>
		</tr>
		<tr>
			<th>START</th>
			<td>
				<p><input type="text" id="startdate" name="startdate" ></p>
			</td>
		</tr>
		<tr>	
			<th>END</th>	
			<td>
				<p><input type="text" id="enddate" name="enddate" ></p>			
			</td>
			</tr>	
			
			<tr>	
			<th>선택한 책</th>	
			<td>
				<input type="text" id="choicebook" name="choicebook" value="" readonly="readonly">
				<input type="hidden" id="choicebooknum" name="choicebooknum" value="">		
			</td>
		</tr>
			
		<tr>	
			<th>검색</th>	
			<td>
			<div class="input-group mb-3">
				<select id="searchTitle" class="form-control">
			    	<option value="title">책제목</option>
					<option value="author">책저자</option>
			  	</select>
			    <input type="text" class="form-control" id="searchText" value="<%=searchText %>" placeholder="검색">
			    <div class="input-group-append">
			    	<button class="btn" type="button" onclick="searchBook()"><i class="fa fa-search" aria-hidden="true"></i></button>
			     </div>
			</div>
			</td>
		</tr>	
			<tr>
				<td colspan="2">
					<input class="btn pull-right" type="button" id="addcard" value="카드추가">
				</td>
			</tr>
		</table>
	</form>
		
		
		
	    	
	</div>
</div>
</div>

<script type="text/javascript">
	function searchBook(){
		let clubseq = document.getElementById("clubseq").value;
		
		let searchTitle = document.getElementById("searchTitle").value;
		let searchText = document.getElementById("searchText").value;
		
		location.href = "club?param=cardadd&clubseq=" +clubseq+ "&searchTitle=" + searchTitle + "&searchText=" + searchText;
	}
	
	function goPage(pageNumber){
		let clubseq = document.getElementById("clubseq").value;
		
		let searchTitle = document.getElementById("searchTitle").value;
		let searchText = document.getElementById("searchText").value;
	
		location.href = "club?param=cardadd&clubseq=" +clubseq+ "&searchTitle=" + searchTitle + "&searchText=" + searchText + "&pageNumber=" + pageNumber;
	}
	
	function choice(booktitle, booknum){
		alert(booknum);
		
		$("#choicebook").val(booktitle);
		$("#choicebooknum").val(booknum);
	}

</script>

<script type="text/javascript">
$(document).ready(function() {
	
	let week = ['일', '월', '화', '수', '목', '금', '토'];
	
	$("#startdate").datepicker({
		dateFormat: "yy/mm/dd",
		dayNamesMin: week,
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		onSelect: function( d ) {
			let arr = d.split('/');
			
			$("#year").val( arr[0].trim() );
			$("#month").val( arr[1] );
			$("#day").val( arr[2] );
			
			let weekday = new Date( $("#startdate").datepicker( { dateFormat:"yy/mm/dd"} ).val() );
			
			$("#week").val( week[weekday.getDay()] );
		}
	});
	
 	$("#enddate").datepicker({
		dateFormat: "yy/mm/dd",
		dayNamesMin: week,
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		onSelect: function( d ) {
			let arr = d.split('/');
			
			$("#eyear").val( arr[0].trim() );
			$("#emonth").val( arr[1] );
			$("#eday").val( arr[2] );
			
			let weekday = new Date( $("#enddate").datepicker( { dateFormat:"yy/mm/dd"} ).val() );
			
			$("#week").val( week[weekday.getDay()] );
		}
	}); 
	
	$("#addcard").click(function() {
		
		if($("#cardtitle").val() == "" ){
			alert("카드 제목을 입력해주세요");
			return;
		} 
		else if ($("#cardtext").val() == ""){
			alert("카드 코멘트를 입력해주세요");
			return;
		}
		else if( $("#startdate").val() == ""){ // || $("#_pwd").val() == ""){
			alert("시작 날짜를 선택해주세요");
			return;
		}
		else if ($("#enddate").val() == ""){
			alert("끝나는 날짜를 선택해주세요");
			return;
		}
		else if ($("#choicebook").val() == ""){
			alert("책을 선택해주세요");
			return;
		}
		
		$("#frm").submit();	
				
	});
	
});
</script>

</body>
</html>