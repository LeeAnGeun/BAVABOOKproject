<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="book.BookDto"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  

<style type="text/css">

body {
    margin: 0;
    height: 100%;
    background: #F1EDEA;
}

.btn-search{
  background: #e9974d;
  color: #fff;
  transition: background-color 0.3s linear;
}

.btn-search:hover{
  background: #e9974d;
  color: #fff;
  transition: background-color 0.3s linear;
}
input.search{
  border-radius: 0;
  width: 100%;
  color: #666;
  border: 1px solid #E8E8E8;
}
.input-group input.search:focus{
  outline: 0.5 #e9974d;
}
.form-control{
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
  border: 1px solid #E8E8E8;
}
 .box {
   background: black;
   border-radius: 4px;
   height: 100%;
   width: 100%;
}

.col-lg-3, .col-md-4, .col-xs-7{
    margin-top: 30px !important;
}

.searchBox{
  
}

.itemBox{
    max-height: 450px;
    width: 160px;
    height: 240px;
    }
.innerbox{
   visibility:hidden;
   position:relative; 
   width: 100%;
   height: 100%;
   background: black;
   top: -100%;
   color:white;
}

.write{
   width: 80px;
   height: 80px;
   border-radius: 50%;
   display: flex;
   justify-content: center;
   align-items: center;
   position: fixed;
   right: 100px;
   bottom:100px;
   cursor: pointer;
   font-size: 40px;
   background: #f2f2f2;
   color: #696969;

} 
.write:hover{
  background: #e9974d;
  color: #fff;
  transition: background-color 0.3s linear;
}

</style>

<title>master page</title>
</head>
<body>
<%
//책 리스트
List<BookDto> bookList = (List<BookDto>)request.getAttribute("bookList");
String error = (String)request.getAttribute("error");

%>

<%
if(error != null) {
if(error.equals("deleteOk")){
%>
<script type="text/javascript">
alert("책 삭제 완료")
</script>  
<%   
}
if(error.equals("bookdelete")){
%>
<script type="text/javascript">
alert("책 삭제 실패")
</script>   
<% 
}
}
%> 


<div class="container">

<h1>관리자 페이지</h1>
<!-- 검색 -->

   <div class="row searchBox">
   <select class="form-control col-2" id="searchTitle">
           <option value="title">책제목</option>
           <option value="author">책저자</option>
        </select>
        <input class="form-control col-6" type="text" placeholder="검색" id="searchText">
        <button class="btn btn-search col-1" type="button" onclick="searchBook()">search</button>
   </div>


   <div class="row bookListBox">
   <%for(int i=0;i<bookList.size();i++){%>
      <div class="col-lg-3 col-md-4 col-xs-7 itemBox" >
          <img class="box" src="<%=request.getContextPath()+"/upload/"+bookList.get(i).getBookimage()%>" >
         <div class="innerbox " >
         <div class="center-block" style="height: 80%">
            <h1 style="text-align: center;"><%=bookList.get(i).getBooktitle() %></h1>
         </div>

            <div class="center-block" style="text-align: center;">
               <button type="button" class="btn btn-primary" onclick="updateBook('<%=bookList.get(i).getBooknum() %>')">수정</button>
               <button type="button" class="btn btn-danger" onclick="deleteBook('<%=bookList.get(i).getBooknum() %>')">삭제</button>
            </div>   
         </div>
      </div>
      <%} %>


     </div>
      <div class="write" onclick="writeBook()">
<i class="fa fa-pencil" aria-hidden="true"></i>
   </div>
</div>

<input type="hidden" value="1" id="pageNumber" />



<script>
function writeBook(){
   location.href = "book?param=bookInsert";
}
function searchBook(){
   let searchTitle = document.getElementById("searchTitle").value;
   let searchText = document.getElementById("searchText").value;
   
   location.href = "book?param=masterPage&searchTitle="+searchTitle+"&searchText="+searchText;
}

function goPage(pageNumber){
   let searchTitle = document.getElementById("searchTitle").value;
   let searchText = document.getElementById("searchText").value;

   location.href = "book?param=masterPage&searchTitle="+searchTitle+"&searchText="+searchText+"&pageNumber="+pageNumber+"&active="+sel;
}

function pagebtn(menu){
   let searchTitle = document.getElementById("searchTitle").value;
   let searchText = document.getElementById("searchText").value;
   
   location.href="book?param=masterPage&searchTitle="+searchTitle+"&searchText="+searchText+"&menu="+menu;
}

function updateBook(booknum){
   location.href =  "book?param=updateBook&booknum="+booknum
}
function deleteBook(booknum){
   location.href =  "book?param=deleteBook&booknum="+booknum
}
$(document).ready(function(){
      $('.itemBox').each(function(i){
         $(this).mouseover(function() {
            console.log("ok")
            $(this).children('.innerbox').css("visibility","visible")
         })
         $(this).mouseout(function() {
            console.log("ok")
            $(this).children('.innerbox').css("visibility","hidden")
         })
      });
      
      
   });

$(document).on('mouseover','.itemBox',function(){
   $(this).children('.innerbox').css("visibility","visible");
}) 
$(document).on('mouseout','.itemBox',function(){
   $(this).children('.innerbox').css("visibility","hidden");
})    
$(window).scroll(function() {
   

    if  (Math.round( $(window).scrollTop()) == $(document).height() - $(window).height()){
       console.log($("#pageNumber").val())
       var contextPath = "${pageContext.request.contextPath}";
       $.ajax({
            type: "POST",
            url: "book?param=booklistScroll",
            headers: { 'Access-Control-Allow-Origin': '*' },
            data: { 'pageNumber': $("#pageNumber").val() },
            dataType: "text",
            context: this,
            success: function(res) {
               const obj = JSON.parse(res);
               var html =""
               console.log(obj)
               if(obj.msg){
                  $("#pageNumber").val( parseInt($("#pageNumber").val()) + 1)
                  for(var i=0;i<obj.msg.length;i++){
                     html += '<div class="col-lg-3 col-md-4 col-xs-7  itemBox" >'
                     html   += '<img class="box" src="'+contextPath+'/upload/'+obj.msg[i].bookimage+'">'
                     html   += '<div class="innerbox ">'
                     html += '<div class="center-block" style="height: 80%">'
                     html += '<h1 style="text-align: center;">'+obj.msg[i].bookimage+'</h1></div>'
                     html += '<div class="center-block" style="text-align: center;">' 
                     html += '<button type="button" class="btn btn-primary" onclick="updateBook('+obj.msg[i].booknum+')">수정</button>' 
                     html += '<button type="button" class="btn btn-danger" onclick="deleteBook('+obj.msg[i].booknum+')">삭제</button>'
                     html += '</div></div></div>'         
                  }
                  $(".bookListBox").append(html)
                  console.log(html)
               }
            },
            error: function(req) {
               console.log("fail")
            }
         })
      }
   });   

</script>
</body>
</html>s