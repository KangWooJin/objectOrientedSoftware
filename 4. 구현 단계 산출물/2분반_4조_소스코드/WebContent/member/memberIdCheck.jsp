<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    
    <!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기는 기본셋팅이라 건들지 말것 -->
   <jsp:useBean id="memberControl" class="project.member.MemberControl" />
   <jsp:useBean id="em" class="project.member.EmployeeData" />
   <jsp:useBean id="nor" class="project.member.NormalMemberData" />
   <jsp:useBean id="mem" class="project.member.MemberData"/>
   
   <!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기에 추가할것 -->
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 홈페이지 제목 부분  -->

<title>직원회원가입</title>




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

<!-- 자신의 javascript를 추가하는 곳 -->

</head>



<body>

<%
	String id = request.getParameter("ID");
	
	System.out.print(id);
	boolean check = memberControl.isID(id);
	
	if ( check )
	{
		%>
			<script>
				alert("아이디가 중복입니다.");
				history.go(-1);
			</script>
		<%
	}
	else
	{
		%>
			<script>
				alert("아이디가  사용가능합니다.");
				history.go(-1);
			</script>
		<%
	}
	
	
%>


</body>
</html>