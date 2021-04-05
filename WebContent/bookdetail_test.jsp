
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 <script>
        $(document).ready(function() {
            $('.counter').counterUp({
                delay: 10,
                time: 1000
            });
        });
    </script>

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="./js/10-10.js"></script>



  <!-- 부트스트랩 --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

 
 <!-- CSS -->
  <link href="css/main.css" rel="stylesheet" />
  <link href="css/bookdetail.css" rel="stylesheet" />
   <link rel="stylesheet" href="css/10-10.css"/>
      <link rel="stylesheet" href="css/star.css"/>
   <link rel="stylesheet" href="css/action.css"/>
   <link rel="stylesheet" href="css/10-10.css"/>
   
  <!-- summer note 사용시 추가 --> 
<script src="./js/summernote/summernote-lite.js"></script>
<script src="./js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="./css/summernote/summernote-lite.css">

 <!-- 애니메이션용 링크 -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

<title>책 디테일</title>
</head>
<body>

<header style="height: 5em">
<!-- 로고 -->
<nav class="navbar navbar-expand-sm fixed-top justify-content-end js-scroll-trigger">
	<div class="logo"><img alt="" src="./img/ab8962_logo.png"></div>
		<!-- 네비게이션 -->
			<div class="collapse navbar-collapse m-0 mr-5 justify-content-end" id="navbar-content">
			
			<ul class="navbar-nav ">
				<li class="nav-item">
					<a class="nav-link linkcol" href="main.jsp?content=home">처음으로</a>
				</li>
				<li class="nav-item">
					<a class="nav-link linkcol" href="main.jsp?content=book">책 추천받기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link linkcol" href="main.jsp?content=community">소통하기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link linkcol" href="main.jsp?content=mypage">내 서재로 가기</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle linkcol" href="main.jsp?content=login" id="navbardrop"
					   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">로그인</a>
				      <div class="dropdown-menu dropdown-menu-right"  aria-labelledby="navbardrop"  >
				        <a class="dropdown-item" href="#">로그인</a>
				        <a class="dropdown-item" href="#">내 서재로 가기</a>
				        <a class="dropdown-item" href="#">일정관리</a>
				      </div>
   				</li>
			</ul>	
   		</div>
   		
   		<button class="navbar-toggler" type="button" data-toggle="collapse"
			 data-target="#navbar-content" aria-controls="navbar-content" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span> 
		</button>
</nav>
</header>


<!-- /////////////////////////책소개부분//////////////////////////// -->
<div class="container">
  <div class="row p-4 animate__animated animate__fadeInUp">
	<div class="col-sm-8">
		<div class="row" style="margin-top: 30px;">
			<div class="col-sm-5 col-xs-12 gtco-container">
		    	 <div class='gtco-section gtco-products'>
		 		 	<div class="justify-content-center text-center">
	 		 		 	<a data-toggle="modal" data-target="#myModal" class="gtco-item two-row bg-img ">
	 		 		 		<div class="overlay">
								<div class="copy">
									<h3>미리보기</h3>
								</div>
							</div>	
		 		 		 	<img style="width: 100%" src="https://image.aladin.co.kr/product/26809/94/cover500/k572730190_1.jpg" >
	 		 			</a>
	 		 		</div>	
	 		 		 	
	 		 	</div>
			</div>		
	
			<div class="col-sm-7 p-3 ">
				<div>
					<h2 class = "p-2">동물농장</h2>
				</div>
				
				<table class="table table-borderless table-sm">
					<col width="100">
					<tr>
					<th colspan="2">
					<tr>
						<th>장르</th>				
						<td>과학</td>
					</tr>
					<tr>
						<th>작가</th>
						<td>민병관</td>
					</tr>
					<tr>
						<th>발행일</th>
					
						<td>2021-05-25</td>
					</tr>
					<tr>
						<th>출판사</th>
						<td>민음사</td>
					</tr>
				</table>
				<div class="col-sm-12 p-3" style="border: 1px solid black">
					<div class="row">
						<div class="col-sm-6 p-4">
						 	<h1 class="counter">4.5</h1>
						</div>
							<div class="col-sm-6 p-4">
						 		<h1 class="counter">251</h1>
							</div>
						</div>
				</div>	
			</div>
		</div>
		  	
	</div>
		<!-- //////////////////////////////소모임 부분////////////////////////////////////// --> 
	<div class=" col-sm-4 col-xs-12 p-4" style="border: 1px solid black">
		 	<div class="table-header">Header</div>
				<table class="table table-bordered table-hover table-main">
					<col width="20%"><col width="55%"><col width="25%">
					<thead> 
					<tr>
						<th>순위</th><th>소모임명</th><th>활동 수 </th>
					</tr>
					</thead>
					<tbody>
					<%
						for(int i=0; i<4;i++){
					%>
					
						<tr>
							<td><%=i+1 %></td>
							<td><a href="#"><span>소모임명ffffff</a></td>
							<td><span>활동수</span></td>
						</tr>
					
					<%
						}
					%>
				</tbody>
				</table>	
				<div class="table-footer">Footer </div>
			
		</div>
	</div>
	
			<!-- ////////////////////////////도서소개 독자후기//////////////////////////////////// --> 
	<!-- /////////////////상단부분 완////////////////// -->
	
	<div class="col-sm-12 p-4"> 		
	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs" role="tablist">
	    <li class="nav-item">
	      <a class="nav-link active" id="select1" data-toggle="tab" href="#bookheader">도서 소개</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" id="select2" data-toggle="tab" href="#answer">독자 후기</a>
	    </li>
	  </ul>
	
	  <!-- ////////////////////////////도서소개 /////////////////////////////////// --> 
	 <div class="tab-content">
	 	
	    <div id="bookheader" class="container tab-pane active"><br>
	    	 <div class='container'>
	    	 	<p>책제목</p>	
		    </div>
	 	 </div>
	 <!-- ////////////////////////////댓글 /////////////////////////////////// --> 
		  <div id="answer" class="container tab-pane fade"><br>
			  <div class="col-md-12 col-sm-12 p-5 animate__animated animate__fadeInUp">
		     		<%
	    	 	
						for(int i=0;i<7;i++){
							
					%>
				
					<div class="gtco-testimonial gtco-left" st>
						<div>
							<img src="./img/user_80px.jpg" ><br>
				   			<img src="./img/star_2.png">
						</div>
						<blockquote>
							<p>&ldquo;댓글을 열심히 적어보자&rdquo; </p>
							<p><cite class="author">&mdash; 사용자아이디</cite></p>
						</blockquote>	
				
					</div>	
			
						<%
							}
						%>
				</div>
				
					 <!-- 페이징 -->
				     <div class=" btn-toolbar text-center paging justify-content-center" role="toolbar" aria-label="Toolbar with button groups">	
						<div class="btn-group mr-2" role="group" aria-label="First group">
						
									<button type="button" class="btn" onclick="">1</button>	
									<button type="button" class="btn" onclick="">2</button>	
									<button type="button" class="btn" onclick="">3</button>	
									<button type="button" class="btn" onclick="">4</button>	
									<button type="button" class="btn" onclick="">5</button>									<button type="button" class="btn" onclick="">1</button>
									
								
						</div>
			    	</div>
		     		
					<!-- 데이터 기입하는 부분 -->
					<div>
					<form action="">
						<input type="hidden" value="책번호">
						<input type="hidden" value="작성자 number">
						
						<table>
							<tr>
								<td>
							   	  <div class="review_rating rating_point">
						                <div class="rating">
						                    <div class="ratefill"></div>
						                    <!-- [D] 해당 별점이 선택될 때 그 점수 이하의 input엘리먼트에 checked 클래스 추가 -->
						                    <input type="checkbox" name="rating star1" id="rating1" value="1" class="rate_radio" title="1점" >
						                    <label for="rating1"><img alt="" src="./img/#4b4b49_star.png" height="30px" width="30px"></label>
						                    <input type="checkbox" name="rating star2" id="rating2" value="2" class="rate_radio" title="2점" >
						                    <label for="rating2"><img alt="" src="./img/#4b4b49_star.png" height="30px" width="30px"></label>
						                    <input type="checkbox" name="rating star3" id="rating3" value="3" class="rate_radio" title="3점" >
						                    <label for="rating3"><img alt="" src="./img/#4b4b49_star.png" height="30px" width="30px"></label>
						                    <input type="checkbox" name="rating star4" id="rating4" value="4" class="rate_radio" title="4점" >
						                    <label for="rating4"><img alt="" src="./img/#4b4b49_star.png" height="30px" width="30px"></label>
						                    <input type="checkbox" name="rating star5" id="rating5" value="5" class="rate_radio" title="5점" >
						                    <label for="rating5"><img alt="" src="./img/#4b4b49_star.png" height="30px" width="30px"></label>
						                </div>
						             </div>
									</td>
								<td align="right" style="padding-bottom: 30px"><input type="submit" class="btn btn-lg" value="Review"></td>
								
							</tr>
							<tr>
								<td colspan="2"> <textarea  id="summernote" name="revcontent"></textarea></td>
								<!-- summernote div로 사용 시 <div id="summernote">Hello Summernote</div>-->
							</tr>
							
						</table>
	
					</form>
					</div>
					
	
			
				</div> 			
		     </div>
	         
	   </div>
</div>

 <!-- The Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">책제목</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" align="center">
           <img src="https://image.aladin.co.kr/product/26809/94/cover500/k572730190_1.jpg" style="height: 600px">
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal">닫기</button>
        </div>
        

    </div>
  </div>
 </div>

<script src="./js/jquery.countTo.js"></script>

<script type="text/javascript">
<!-- summer note 웹 에디터 -->
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		  height: 200,
		  width:800,
		  minHeight: 100,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: "댓글을 기입하세요",   //placeholder	 		  
		  //툴바 변경
		   toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['para', ['ul', 'ol', 'paragraph']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']   
	});
});
</script>

<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
 <script type="text/javascript">
/*
 $(document).ready(function() {
	    var activee1 = $.cookie("activee1");
	    
	    if(activee1 == "1"){
	       $("#select1").removeClass('active');
	       $("#select2").addClass('active');
	    }
	    
	    $('#select2').click(function(){
	       activee1 = 1
	       $.cookie("activee", activee1,{ expires:1, path:'./'});
	    });
	    $('#select1').click(function(){
	       activee1 = 0
	       $.cookie("activee", activee1,{ expires:1, path:'./'});
	    });
	    
	 });*/

 </script>

<!-- 숫자 카운터  class="counter"-->
<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
<script src="/js/jquery.counterup.min.js"></script>

</body>
</html>