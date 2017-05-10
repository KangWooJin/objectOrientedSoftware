<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>

<%@ page import = "java.util.*" %>
<%@ page import = "project.community.*" %>
<jsp:useBean id="communityBulletinBoardMessageControl" class="project.community.CommunitybulletinBoardMessageControl" />
<jsp:useBean id="communityBulletinBoardMessage" class="project.community.CommunityBulletinBoardMessage" />
<jsp:useBean id="communityBulletinBoardMessageCommentControl" class="project.community.CommunityBulletinBoardMessageCommentControl" />
<jsp:useBean id="communityBulletinBoardMessageComment" class="project.community.CommunityBulletinBoardMessageComment" />


<jsp:setProperty property="*" name="communityBulletinBoardMessageComment"/>

 <jsp:useBean id="memberControl" class="project.member.MemberControl" />
   <jsp:useBean id="em" class="project.member.EmployeeData" />
   <jsp:useBean id="nor" class="project.member.NormalMemberData" />
   <jsp:useBean id="mem" class="project.member.MemberData"/>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 기본셋팅 값 건들지말것 -->
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-theme.css" />
<link href="../css/innerStyle.css" type="text/css" rel="stylesheet" />
<title>Insert title here</title>
<SCRIPT type="text/javascript" src="../js/function.js"></SCRIPT>
</head>

<body>
		<%
		out.println(communityBulletinBoardMessageComment.commentContent);
		out.println(communityBulletinBoardMessageComment.communityBulletBoardMessageCommentNo);
		out.println(communityBulletinBoardMessageComment.communityBulletinBoardMessageNo);
		out.println(communityBulletinBoardMessageComment.communityBulletinBoardNo);
		out.println(communityBulletinBoardMessageComment.name);
		out.println(communityBulletinBoardMessageComment.openingDate);
		
		
		out.println(String.valueOf(communityBulletinBoardMessageComment.communityBulletinBoardNo) +  String.valueOf(communityBulletinBoardMessageComment.communityBulletinBoardMessageNo));
		session.setAttribute("cbbd", String.valueOf(communityBulletinBoardMessageComment.communityBulletinBoardNo));
		session.setAttribute("cbbmd", String.valueOf(communityBulletinBoardMessageComment.communityBulletinBoardMessageNo));
		
		
		communityBulletinBoardMessageCommentControl.insertCommunityBulletinBoardMessageComment(communityBulletinBoardMessageComment);
		%>
		
		<script>
			location.href="communityBulletinBoardMessageReadDetailView.jsp";
		</script>
</body>
</html>