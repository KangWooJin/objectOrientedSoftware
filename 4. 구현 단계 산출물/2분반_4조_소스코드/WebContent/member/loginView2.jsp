<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">


<title>Signin Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
    	String id = request.getParameter("ID");
        String password = request.getParameter("password");
        
        //out.println(id + " " + password) ;
        String memberID = memberControl.login(id, password);
        
       session.setAttribute("login", null);
        
    	if ( memberID != null )
    	{
    		 int type = memberControl.getMemberType(memberID);
    	        if ( type == 0 )
    	        {
    	        	nor = memberControl.selectNormalMember(memberID);
    	        	session.setAttribute("member", nor);
    	        	session.setAttribute("login", 0);
    	        	
    	        	
    	        	
    	        	
    	        }
    	        else if ( type == 1 )
    	        {
    	        	em = memberControl.selectEmployeeData(memberID);
    	        	session.setAttribute("member", em);
    	        	session.setAttribute("login",1);
    	        	
    	        }
    	        
    		%>
	<Script>
    			alert("로그인 성공");
    			location.href="../main/mainView.jsp";
    			
    		</Script>
	<%
    		
    	}
    	else
    	{
    		%>
	<Script>
    			alert("아이디 또는 비밀번호를 잘 못 입력하셨습니다.");
    			
    			
    			history.go(-1);
    		</Script>
	<%
    	}
    %>

</body>
</html>