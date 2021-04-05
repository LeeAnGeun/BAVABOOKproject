<%@page import="java.text.ParseException"%>
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
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style type="text/css">
body {
    margin: 0;
    background: #F1EDEA;
}

</style>

<title>관리자 수정페이지</title>
</head>
<body>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({dateFormat: 'yy/mm/dd'});
  } );
  </script>
<%
BookDto book = (BookDto)request.getAttribute("book");

%>
<header style="height: 5em">

<h1>관리자 수정 페이지</h1>

</header>


<!-- /////////////////////////책소개부분//////////////////////////// -->
 <form action="loginimg" method="post" name="userInfo" enctype="multipart/form-data">
 <input type="hidden" name="checkFlag" value="update" />
<div class="layer">
<div class="container">
  <div class="row p-4">
   <div class="col-sm-9">
      <div class="row">
         <div class="col-sm-5 service-wrap" >
            <div class="center-block bookimg" style="text-align: center; display: inline-block;">
            <label for="newImg">
               
                  <img id="bookImg" class="img-responsive bookimg" src="https://image.aladin.co.kr/product/26809/94/cover500/k572730190_1.jpg">
               
            </label>
            <input type="file" name="bookimage" id="newImg" style="display: none; width: 100%;">
            </div>
         </div>   

         <div class="col-sm-7 p-5">
            <%-- <div><input name="booktitle" value="<%=book.getBooktitle() %>"></div> --%>
           
       
            <table class="table table-borderless table-sm">
               <col width="100">
               <tr>
               <th colspan="2">
               <tr>
                  <th>책 제목</th>
                  <td><input type="text"  name="booktitle" placeholder="책제목"  value="<%=book.getBooktitle() %>"></td>
               </tr>
               <tr>
                  <th>장르</th>
                  <td>
                  <select class="category" name="categories">
                      <option value="100"  <%if(book.getCategories() == 100) {%>selected<%} %>>시</option>
                        <option value="200" <%if(book.getCategories() == 200) {%>selected<%} %>>소설</option>
                        <option value="300" <%if(book.getCategories() == 300) {%>selected<%} %>>에세이</option>
                        <option value="400" <%if(book.getCategories() == 400) {%>selected<%} %>>자기계발</option>
                        <option value="500" <%if(book.getCategories() == 500) {%>selected<%} %>>경제</option>
                        <option value="600" <%if(book.getCategories() == 600) {%>selected<%} %>>역사</option>
                        <option value="700" <%if(book.getCategories() == 700) {%>selected<%} %>>예술</option>
                        <option value="800" <%if(book.getCategories() == 800) {%>selected<%} %>>과학</option>
                        <option value="900" <%if(book.getCategories() == 900) {%>selected<%} %>>사회</option>
                        <option value="1000" <%if(book.getCategories() == 1000) {%>selected<%} %>>만화</option>
                   </select>
                   </td>
               </tr>
               <tr>
                  <th>작가</th>
                  <td><input type="text"  name="author" placeholder="작가"  value="<%=book.getAuthor()%>"></td>
               </tr>
               <tr>
                  <th>북헤더</th>
                  <td><input type="text"  name="bookheader" placeholder="북헤더"  value="<%=book.getBookheader()%>"></td>
               </tr>
               <tr>
                  <th>발행일</th>
                  <td><input type="text" name="issudate"  placeholder="발행일" id="datepicker" value=""></td>
               </tr>
               <tr>
                  <th>출판사</th>
                  <td><input type="text" name="publisher" placeholder="출판사" value="<%=book.getPublisher()%>"></td>
               </tr>
            </table>
         <input type="hidden" name="bookNumber" placeholder="출판사" value="<%=book.getBooknum()%>">
            <div class="col-sm-12 p-3" style="border: 1px solid black">
               <div class="row">
                     <div class="col-sm-6 p-4">
                         <button type="submit">수정 완료</button>
                         <button type="button" onclick="deleteBook('<%=book.getBooknum() %>')">삭제</button>
                     </div>
                  </div>
            </div>   
            
         </div>
      </div>
           
       </div>
   </div>
</div>
</div>
 </form> 

 <script type="text/javascript">        
var sel_file;

$(document).ready(function() {
    $("#newImg").on("change", handleImgFileSelect);
    
}); 

function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $("#bookImg").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    });
}

function deleteBook(bookNum){
   location.href = "book?param=deleteBook&booknum="+bookNum;
}
</script>

</body>
</html>