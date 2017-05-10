<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

%>
<%@ page import="project.lecture.LectureControl" %>
<%@ page import="project.lecture.LectureData"%>

<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기에 추가할것 -->
<jsp:useBean id="lectureControl" class="project.lecture.LectureControl" />
<jsp:useBean id="lectureData" class="project.lecture.LectureData" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 홈페이지 제목 부분  -->
<title>수강조회</title>

<!-- 기본셋팅 값 건들지말것 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-theme.css" />
<link href="../css/innerStyle.css" type="text/css" rel="stylesheet" />
</head>
<body>

	<% 
	int msgType = lectureControl.cancelLecture(request.getParameter("memberID"),request.getParameter("processCode"));
	
	if(msgType == 1){%>
		<script>alert("성공적으로 수강 취소 되었습니다.")</script>
		<script>location.href="lectureReadView.jsp";</script>
	<%}
	else {%>
		<script>alert("수강 취소를 실패했습니다.")</script>
		<script>history.go(-1);</script>
	<%}%>
	
	
	
</body>
</html>