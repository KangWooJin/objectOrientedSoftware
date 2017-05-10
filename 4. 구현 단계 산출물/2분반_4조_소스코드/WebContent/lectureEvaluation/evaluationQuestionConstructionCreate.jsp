<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="eqc"
	class="project.lectureEvaluation.EvaluationQuestionConstruction" />
<%@ page
	import="project.lectureEvaluation.EvaluationQuestionConstructionControl"%>
<jsp:setProperty name="eqc" property="*" />
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

	EvaluationQuestionConstructionControl eqcc = new EvaluationQuestionConstructionControl();  %>
	<%boolean flag = eqcc.insert(eqc); 
	if(flag == true){%>
	<script>alert("성공적으로 등록되었습니다.")
location.href="evaluationQuestionConstructionCreateView.jsp"</script>
	<% 
	}
	else{
		
		%><script>alert("등록을 실패했습니다.")
		location.href="evaluationQuestionConstructionCreateView.jsp"</script>
	<% 
	}
	%>
</body>
</html>