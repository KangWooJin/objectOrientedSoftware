<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <% request.setCharacterEncoding("UTF-8"); %>
  
	<jsp:useBean id="commentControl" class="project.bulletinBoard.CommentControl" />
	<jsp:useBean id="commentData" class="project.bulletinBoard.CommentData" />
	<jsp:setProperty property="*" name="commentData"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
		session.setAttribute("bbd", String.valueOf(commentData.bulletinBoardNum));
		session.setAttribute("bbmd", String.valueOf(commentData.bulletinBoardMessageNum));
		System.out.println("aaaaaaaaaaaaa");
		System.out.println(commentData.commentContent);
		commentControl.insertComment(commentData); 
		%>
		
		<script>
			location.href="bulletinBoardMessageDetailReadView.jsp";
		</script>
</body>
</html>