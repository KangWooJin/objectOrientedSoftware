<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<jsp:useBean id="bulletinBoardMessageControl" class="project.bulletinBoard.BulletinBoardMessageControl" />
	<jsp:useBean id="bulletinBoardMessageData" class="project.bulletinBoard.BulletinBoardMessageData" />
	<jsp:setProperty property="*" name="bulletinBoardMessageData"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
		session.setAttribute("bbd", String.valueOf(bulletinBoardMessageData.bulletinBoardNum));
		
		String str1 = request.getParameter("bulletinBoardNum");
		String str2 = request.getParameter("bulletinBoardMessageNum");
		
		bulletinBoardMessageControl.delete(Integer.parseInt(str1), Integer.parseInt(str2));
		%>
		
		<script>
			location.href="bulletinBoardMessageReadView.jsp";
		</script>
</body>
</html>