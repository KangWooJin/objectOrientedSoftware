<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="fcq"
	class="project.lectureEvaluation.FixedChoiceQuestionnaire" />
<%@ page
	import="project.lectureEvaluation.FixedChoiceQuestionnaireControl"%>
<jsp:setProperty name="fcq" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	session.setAttribute("fixedChoiceQuestionnaireID", null);
	session.setAttribute("evaluationQuestionNumber", null);

	FixedChoiceQuestionnaireControl fcqc = new FixedChoiceQuestionnaireControl();  %>
	<%boolean flag = fcqc.insert(fcq); 
	if(flag == true){%>
	<script>alert("���������� ��ϵǾ����ϴ�.")
location.href="fixedChoiceQuestionnaireCreateView.jsp"</script>
	<% 
	}
	else{
		
		%><script>alert("����� �����߽��ϴ�.")
		location.href="fixedChoiceQuestionnaireCreateView.jsp"</script>
	<% 
	}
	%>
</body>
</html>