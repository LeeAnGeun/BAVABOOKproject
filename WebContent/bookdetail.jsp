<%@page import="java.util.List"%>
<%@page import="book.BookReviewDto"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="book.BookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<meta charset="UTF-8">
<!-- 별점용 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- 부트스트랩 --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

 
 <!-- CSS -->
 <link href="./css/bookdetail.css" rel="stylesheet" />
 <link href="css/bookaction.css" rel="stylesheet" />
   

 <!-- 애니메이션용 링크 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

<!-- font font-family: 'Noto Serif KR', serif; -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">

<title>bookdetail</title>

<script>
        jQuery(document).ready(function($) {
            $('.counterRead').counterUp({
                delay: 10,
                time: 2000
            });
        });
        
        jQuery(document).ready(function($) {
            $('.counterStar').counterUp({
                delay: 20,
                time: 2000
            });
        });
    </script>

</head>
<body style="font-family: 'Noto Serif KR', serif;">

<%
BookDto book = (BookDto)request.getAttribute("book");
System.out.println(book.toString());
List<BookReviewDto> list = (List<BookReviewDto>)request.getAttribute("rev");

//전체 페이지 번호
int bookPage = Integer.parseInt((String)request.getAttribute("bookPage"));

//페이징 번호
int pageNumber = Integer.parseInt((String)request.getAttribute("pageNumber"));

//검색변수
String choice = (String)request.getAttribute("choice");

System.out.println(list.size());
System.out.println("전체페이지번호 : "+bookPage);
System.out.println("pageNumber : "+pageNumber);
System.out.println("select 변수 : "+choice);
%>

 <script type="text/javascript">
$(document).ready(function() {
   // 검색어 있는 경우
   let choice = "<%=choice %>";
   if(choice == "") return;

   obj.setAttribute("selected", "selected");

});
</script>

<div style="height: 4em">
</div>
<!-- /////////////////////////책소개부분//////////////////////////// -->
<div style="background-color: #f5f5f5;height: 390px;margin-top: -20px">
<div class="container">
  <div class="row" style="margin-top: 70px">
   <div class="col-sm-9" >
      <div class="row" >
      
         <div class="col-sm-5 col-xs-12 gtco-container">
              <div class='gtco-section gtco-products'>
                    <div align="center">
                     <a data-toggle="modal" data-target="#myModal" id="title" onclick="<%=book.getBooktitle() %>" class="gtco-item two-row animate__animated animate__fadeInUp" ">
                        <div class="overlay">
                        <div class="copy">
                        
                           <h3>미리보기</h3>
                        </div>
                     </div>   
                        <img style="width: 100%"; src="./img/bookimg/<%=book.getBookimage() %>.jpg" >
                    </a>
                 </div>      
              </div>
         </div>      
         <div class="col-sm-7 p-3 ">
            <div>
               <h2 class = "p-2 headBook"><%=book.getBooktitle() %></h2>
            </div>
            
            <table class="table table-borderless table-sm">
               <col width="100">
               <tr>
               <th colspan="2">
               <tr>
                  <th>장르</th>
                  <%
                  String category = "";
                  if(book.getCategories() == 100){
                     category = "시";
                  }else if(book.getCategories() == 200){
                     category = "소설";
                  }else if(book.getCategories() == 300){
                     category = "에세이";
                  }else if(book.getCategories() == 400){
                     category = "자기계발";
                  }else if(book.getCategories() == 500){
                     category = "경제";
                  }else if(book.getCategories() == 600){
                     category = "역사";
                  }else if(book.getCategories() == 700){
                     category = "예술";
                  }else if(book.getCategories() == 800){
                     category = "과학";
                  }else if(book.getCategories() == 900){
                     category = "사회";
                  }else if(book.getCategories() == 1000){
                     category = "만화";
                  }
                  %>
                  
                  <td><%=category %></td>
               </tr>
               <tr>
                  <th>작가</th>
                  <td><%=book.getAuthor() %></td>
               </tr>
               <tr>
                  <th>발행일</th>
                  <%
                  String issuedate = book.getIssudate();
                  DateFormat dF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.0");         //데이터가 2021-03-12 15:30으로 들어온다.
                  Date date = dF.parse(issuedate);            
                  SimpleDateFormat rdate1 = new SimpleDateFormat("yyyy-MM-dd");

               %>
                  <td><%=rdate1.format(date) %></td>
               </tr>
               <tr>
                  <th>출판사</th>
                  <td><%=book.getPublisher() %></td>
               </tr>
            </table>
            
            
            
            
            <div class="col-sm-12 animate__animated animate__fadeInUp">
               <div class="row">
                  <div class="col-sm-6 col-xs-6 p-3" style="text-align: center"">
                     <img src="./img/rating.png" class="countImg">
                      <h1 class="counterStar">4.5</h1>
                  </div>
                     <div class="col-sm-6 col-xs-6 p-3" style="text-align: center">
                     <img src="./img/readCount.png" class="countImg">
                     <h1 class="counterRead"><%=book.getBookreadcount() %></h1>
                      
                      <script src="//cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
                      <script src="./js/jquery.counterup.min.js"></script>
                      <script src="./js/jquery.waypoints.min.js"></script>
                         
                     </div>
                  </div>
               
               
               </div>   
            </div>
         </div>
      </div>

      <!-- //////////////////////////////소모임 부분////////////////////////////////////// --> 
       <div class="col-sm-3 col-xs-12">
          <div class="tTotal  animate__animated animate__fadeInRight">
          <div class="table-header">Running Club</div>
            <table class="table table-borderlsess table-hover table-main">
               <col width="20%"><col width="50%"><col width="30%">
               <thead> 
               <tr class="table-sm">
                  <th>순위</th><th>소모임명</th><th>활동수</th>
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
            <div class="table-footer">Join our club.</div>
         </div>
         </div>
      </div>
</div>
</div>
   
         <!-- ////////////////////////////도서소개 독자후기//////////////////////////////////// --> 

   <!-- /////////////////상단부분 완////////////////// -->
<div class="container" style="margin-top: 30px">   
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
              <p><%=book.getBookheader() %></p>   
          </div>
        </div>
    <!-- ////////////////////////////댓글 /////////////////////////////////// --> 
        <div id="answer" class="container tab-pane fade" style="width:800px">
                 <%
                    if(list == null || list.size() == 0){
                 %>
                 <div >
                    <p class="animate__animated animate__fadeInUp" style="margin-top: 20px;">댓글이 없습니다. 댓글을 적어주세요.</p>
                 </div>
                 <%
                    }else{
                 %>
                 
                 <div class="animate__animated animate__fadeInUp">
                  <div style="height: 40px;margin-bottom:-20px;">
                     <select class="form-control form-control-sm float-right col-sm-2" name="choice">
                          <option value="revdate">최신순</option>
                          <option value="rating">별점순</option>
                       </select>
               </div>
                 
                 <%
                  for(int i=0;i<list.size();i++){
                     BookReviewDto rev = list.get(i);
               %>
               
               
               <div class="col-md-12 col-sm-12 p-5 animate__animated animate__fadeInUp">
                  <div class="gtco-testimonial gtco-left">
                     <div style="position: relative;">   
                        <img src="./img/user_80px.jpg" ><br>
                           <%
                                 int rating = rev.getRating();
                                 if(rating>0 && rating <= 1 ){
                                    %>
                                    <img src="./assets/img/star_2.png" >
                                    <%
                                 }else if(rating>1 && rating <= 2 ){
                                    %>
                                    <img src="./assets/img/star_2.png">
                                    <%
                                 }else if(rating>2 && rating <= 3 ){
                                    %>
                                    <img src="./assets/img/star_2.png">
                                    <%
                                 }else if(rating>3 && rating <= 4 ){
                                    %>
                                    <img src="./assets/img/star_2.png""> 
                                    <%
                                 }else if(rating>4 && rating <= 5 ){
                                    %>
                                    <img src="./assets/img/star_2.png">
                                    <%
                                 }
                              %>
                     </div>
                     <blockquote>
                        <p><%=rev.getRevcontent()%></p>
                        <p><cite class="author"><%=rev.getUserid() %></cite></p>
                     </blockquote>   
                  </div>
               </div>   
                  <%
                     }
                    }
                  %>
            
                <!-- 페이징 -->
                 <div class=" btn-toolbar text-center paging justify-content-center" role="toolbar" aria-label="Toolbar with button groups">   
                  <div class="btn-group mr-2" role="group" aria-label="First group">
                  <%
                     for(int i = 0;i<bookPage;i++){
                        if(pageNumber == i){   //현재 페이지일  때
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
                 
               <!-- 데이터 기입하는 부분 -->
               <div align="center">
                  <button type="button" class="btn btn-block" id="answerPop" style="margin-bottom: 30px;">REVIEW 작성</button>
                  <div id="answerTable" align="center">
                  <form id="frm" action="book?param=answer" class="animate__animated animate__fadeInTop">

                  <input type="hidden" value="책번호">
                  <input type="hidden" value="작성자 number">
                  
                  <table>
                     <tr>
                        <td>
                         <link rel="stylesheet" href="./css/starRate.css"/>
                             <script type="text/javascript" src="./js/starRate.js"></script>
                                   <!-- 선택 안하면?  -->
                             <input type="hidden" name="rate" id="rate" value="0"/>
                               
                              <div class="review_rating rating_point">
                                   
                                     <div class="rating">
                                      <div class="ratefill"></div>
                                         <!-- [D] 해당 별점이 선택될 때 그 점수 이하의 input엘리먼트에 checked 클래스 추가 -->
                                         <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                                         <label for="rating1" style="background-image: url('./img/starrate.png')"></label>
                                         <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                                         <label for="rating2" style="background-image: url('./img/starrate.png')"></label>
                                         <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                                         <label for="rating3" style="background-image: url('./img/starrate.png')"></label>
                                         <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                                         <label for="rating4" style="background-image: url('./img/starrate.png')"></label>
                                         <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                                         <label for="rating5" style="background-image: url('./img/starrate.png')"></label>
                                     </div>
                                     
                                       <div class="warning_msg">별점을 선택해 주세요.</div>
                              </div>
                    
                           </td>
                        <td align="right" style="padding-bottom: 30px"><input type="button"  name="save" id="save" class="btn btn-lg" value="Review">
                        </td>
                        
                     </tr>
                     
                      <!-- summer note 사용시 추가 --> 
                     <script src="./js/summernote/summernote-lite.js"></script>
                     <script src="./js/summernote/lang/summernote-ko-KR.js"></script>
                     <link rel="stylesheet" href="./css/summernote/summernote-lite.css">
                  
                     
                     <tr>
                        <td colspan="2">
                          <div class="warning_msg2">5자 이상의 리뷰 내용을 작성해 주세요.</div>
                        <div class="review_contents">
                           <textarea class="review_textarea"  id="summernote" name="revcontent"></textarea>
                        </div>
                     </td>
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
          <h4 class="modal-title"><%=book.getBooktitle() %></h4>
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
<script type="text/javascript">

function goPage(pagenum){
   let choice = document.getElementById("choice").value;
   let booknum = <%=book.getBooknum()%>

   location.href = "book?param=bookdetail&choice="+choice+"&pageNumber="+pagenum+"&booknum="+booknum+"&active="+sel;
   
}
</script>

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
        lang: "ko-KR",               // 한글 설정
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
       
    });
    */
 </script>

</body>
</html>