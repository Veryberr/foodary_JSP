<%@page import="com.foodary.vo.DietList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸드어리 보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/threeGrid.css"/>
</head>
<body>
<div class="container">
   <div class="header">
      <jsp:include page="./headerAfter.jsp"></jsp:include>
   </div>
	<div class="main" align="center" style="text-align: center;">
<%
   request.setCharacterEncoding("UTF-8");
%>
   		<span style="background: #fafcd9; font-size: 35pt; font-weight: 900;">푸드어리 보기</span>
		<div class="diet">
			<form action="dietUpdateOK.jsp" method="post">
			<c:set var="list" value="${userFoodList.list}"/>
			<table width="1500" align="center" border="0" cellpadding="10" cellspacing="10">
			   <!-- 1 -->
			   <tr>
			      <th colspan="1">
			          <span style="background: lavender; font-size: 30pt; font-weight: 900;">날짜</span>
			      </th>
			      <th colspan="8\4">
			        <input type="text" name="dietWriteDate" value="${list[0].userFoodDate}" style="width: 48%; height: 90%; text-align: center;" readonly="readonly"/>
			            <input type="text" name="dietWriteTime" value="${list[0].userFoodTime}" style="width: 48%; height: 90%; text-align: center;" readonly="readonly"/> 
			      </th>
			   </tr>
			   <!-- 2 -->
			   <c:forEach var="uvo" items="${list}">
			   <tr>
			      <th><span style="background: lavender; font-size: 25pt;">음식 이름</span> :&nbsp; 
			         <input type="text" name="userFoodName" value="${uvo.userFoodName}" style="width: 50%; height: 50%; text-align: center;" readonly="readonly"/>      
			      </th>
			      <th><span style="background: lavender; font-size: 25pt;">칼로리</span> :&nbsp; 
			         <input type="text" name="userKcal" value="${uvo.userKcal}" style="width: 30%; height: 50%; text-align: center;" readonly="readonly"/> &nbsp;kcal 
			      </th>
			      <th><span style="background: lavender; font-size: 25pt;">탄수화물</span> :&nbsp; 
			         <input type="text" name="userCarbs" value="${uvo.userCarbs}" style="width: 30%; height: 50%; text-align: center;" readonly="readonly"/> &nbsp;g
			      </th>
			      <th><span style="background: lavender; font-size: 25pt;">단백질</span> :&nbsp; 
			         <input type="text" name="userProtein" value="${uvo.userProtein}" style="width: 30%; height: 50%; text-align: center;" readonly="readonly"/> &nbsp;g  
			      </th>
			      <th><span style="background: lavender; font-size: 25pt;">지방</span> :&nbsp; 
			         <input type="text" name="userFat" value="${uvo.userFat}" style="width: 30%; height: 50%; text-align: center;" readonly="readonly"/> &nbsp;g
			      </th>
			   </tr>
			   </c:forEach>
			   <c:set var="list" value="${dietList.list}"/>
			   <!-- 3 -->
			   <tr>
			      <th colspan="1"><span style="background: lavender; font-size: 30pt;">메모</span></th>
			      <th colspan="4">
			         <textarea 
			            rows="10" 
			            name="dietMemo" 
			            style="resize: none; width: 90%; height: 90%; vertical-align: middle; padding: 10px;"
			            readonly="readonly"
			            >${list[0].dietMemo}</textarea>
			      </th>
			   </tr>
			   <!-- 4 사진 올리기 추후 기능 추가-->
			   <tr style="display: none;">
			      <th colspan="2">사진</th>
			      <td colspan="7">
			         <input type="file" value="사진 업로드" style="margin-left: 20px;"/>
			      </td>
			      <th style="width: 150px;">
			         <input type="button" value="업로드 완료!" style="width: 100px; height: 30px;" onclick=""/>         
			      </th>
			   </tr>
			   <!-- 5 -->
			   <tr>
			      <th colspan="10">
			         <button
			            type="submit" 
			            style="background: none; border: 0; cursor: pointer;">
						<span style="background: #baffda; font-size: 25pt; font-weight: 900;">수정하기</span>
			         </button>&nbsp;&nbsp;   
			         <button 
			            type="button" 
			             style="background: none; border: 0; cursor: pointer;"
			            onclick="location.href='dietDeleteOK.jsp?idx=${list[0].idx}&dietWriteDate=${list[0].dietWriteDate}&dietWriteTime=${list[0].dietWriteTime}'">
			            <span style="background: #baffda; font-size: 25pt; font-weight: 900;">삭제하기</span>
			            </button>&nbsp;&nbsp;
			         <button
			            type="button" 
			            onclick="location.href='dietListView.jsp?dietWriteDate=${list[0].dietWriteDate}'" 
			             style="background: none; border: 0; cursor: pointer;">
			            <span style="background: #baffda; font-size: 25pt; font-weight: 900;">목록보기</span>
			            </button>&nbsp;&nbsp;
			      </th>
			   </tr>
			</table>
		</form>
		</div>
	</div>
   <div class="footer">
      <jsp:include page="./footerAfter.jsp"></jsp:include>
   </div>
</body>
</html>