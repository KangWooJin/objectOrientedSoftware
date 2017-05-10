<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />
<jsp:setProperty name="nor" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%

	String password = request.getParameter("password");
	project.member.NormalMemberData newNor = new project.member.NormalMemberData();	

	newNor = (project.member.NormalMemberData) session.getAttribute("member");
	
	out.println("password1" + newNor.password);
	out.println("password2" + password);
	
	if ( !password.equals(""))
		newNor.password = password ;
	
	newNor.name = nor.name ;
	newNor.address = nor.address ;
	newNor.email = nor.email ;
	newNor.phoneNo = nor.phoneNo ;
	newNor.centerName = nor.centerName ;
	newNor.position = nor.position ;
	newNor.duty = nor.duty ;
	newNor.department = nor.department ;
	
	
	
	memberControl.updateNormalMember(newNor);
	session.setAttribute("member", newNor);
	
	
	
	
	
%>

	<script type="text/javascript">
	alert("수정완료");
	location.href="NormalMemberUpdateView.jsp";
</script>

</body>
</html>