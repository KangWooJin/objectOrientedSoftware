<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 여기에 엔티티 클래스 및 컨트롤 클래스 추가할것 -->
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />
<jsp:setProperty name="em" property="*" />

<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기에 추가할것 -->
<jsp:useBean id="lectureControl" class="project.lecture.LectureControl" />
<jsp:useBean id="lectureData" class="project.lecture.LectureData" />
<jsp:setProperty name="lectureData" property="*" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강 신청</title>
</head>
<body>
	<%

	int msg = lectureControl.signup(lectureData);
	if(msg == 2){%>
		<script>alert("과정코드 또는 과정명이 존재하지 않습니다.!");</script>
		<script>location.href="signupView.jsp";</script>
	<%}
	else if(msg == 1){%>
		<script>alert("수강 신청이 성공적으로 완료되었습니다.");</script>
		<script>location.href="signupView.jsp";</script>
	<%}
	else if(msg == 3){%>
	<script>alert("해당 과정을 이미 수강 신청 하셨습니다..");</script>
	<script>location.href="signupView.jsp";</script>
	<%}%>
</body>
</html>