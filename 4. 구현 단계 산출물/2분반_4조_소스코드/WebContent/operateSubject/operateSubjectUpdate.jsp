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
<jsp:useBean id="operateSubjectControl" class="project.operateSubject.OperateSubjectControl" />
<jsp:useBean id="operateSubjectData" class="project.operateSubject.OperateSubjectData" />
<jsp:setProperty name="operateSubjectData" property="*" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<body>
	<%boolean flag = operateSubjectControl.updateOperateSubject(operateSubjectData);%>
	<% if (flag == true) {
	%>
	<script>
		alert("운영과목 수정 성공!");
		location.href="operateSubjectReadView.jsp";
		</script>
	<%} else {%>
	<script>alert("운영과목 수정 실패");
		location.href="operateSubjectReadView.jsp";
		</script>
	<%
		}
	%>
</body>
</html>