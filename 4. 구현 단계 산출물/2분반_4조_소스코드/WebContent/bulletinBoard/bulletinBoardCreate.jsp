<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<jsp:useBean id="bulletinBoardControl" class="project.bulletinBoard.BulletinBoardControl" />
	<jsp:useBean id="bulletinBoardData" class="project.bulletinBoard.BulletinBoardData" />
	<jsp:setProperty property="*" name="bulletinBoardData"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<% System.out.println("aaaaaaaaaaaaaaa"); %>
		<%System.out.println(bulletinBoardData.bulletinBoardNum); %>
		<%System.out.println(bulletinBoardData.creator); %>
		<% bulletinBoardControl.insertBulletinBoard(bulletinBoardData); %>
		
		<script>
			location.href="bulletinBoardReadView.jsp";
		</script>
</body>
</html>