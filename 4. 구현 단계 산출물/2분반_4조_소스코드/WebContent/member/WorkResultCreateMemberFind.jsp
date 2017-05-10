<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="project.member.EmployeeData"%>

<% request.setCharacterEncoding("UTF-8"); %>

<!-- 여기에 엔티티 클래스 및 컨트롤 클래스 추가할것 -->
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />
<jsp:setProperty name="em" property="*" />

<jsp:useBean id="work" class="project.workresult.WorkResult" />
<jsp:useBean id="workControl"
	class="project.workresult.WorkResultControl" />
<jsp:setProperty name="work" property="*" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<body>

	<!-- 여기서부터 데이터 처리  -->

	<%
	String name = request.getParameter("name");
	String phoneNo = request.getParameter("phoneNo");
	ArrayList<EmployeeData> arr = memberControl.findMember(name,phoneNo);
	
	
	
	
	if ( arr.size() == 0 )
	{
		session.setAttribute("eArr", null);
		%>
		
		<script type="text/javascript">
		alert("조회실패");
		location.href="WorkResultCreateView.jsp";
		</script>
		<%
	}
	else
	{
		
		session.setAttribute("eArr", arr);
		%>
		<!-- 데이터 처리후 원래의 View로 돌려줄것 -->
			<script type="text/javascript">
			alert("조회성공");
			location.href="WorkResultCreateView.jsp";
		</script>
		<%
		
	}
%>

	

</body>
</html>