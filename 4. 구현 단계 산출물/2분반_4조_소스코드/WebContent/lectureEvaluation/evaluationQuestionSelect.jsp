<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<%
	request.setCharacterEncoding("UTF-8");
%>

    <jsp:useBean id="eqc"
	class="project.lectureEvaluation.EvaluationQuestionConstruction" />
<jsp:useBean id="eqcControl"
	class="project.lectureEvaluation.EvaluationQuestionConstructionControl" />
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	session.setAttribute("evaluationQuestionNumber", request.getParameter("evaluationQuestionNumber"));
	
	String test = (String)session.getAttribute("evaluationQuestionNumber");
	out.println(test);
%>
<script type="text/javascript">
location.href="evaluationQuestionConstructionCreateView.jsp";
</script>
</body>
</html>