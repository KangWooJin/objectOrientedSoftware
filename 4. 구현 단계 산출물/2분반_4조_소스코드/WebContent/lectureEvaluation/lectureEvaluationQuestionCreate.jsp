<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="leq"
	class="project.lectureEvaluation.LectureEvaluationQuestion" />
<%@ page
	import="project.lectureEvaluation.LectureEvaluationQuestionControl"%>
<jsp:setProperty name="leq" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%LectureEvaluationQuestionControl leqc = new LectureEvaluationQuestionControl();  %>
	<%
session.setAttribute("evaluationQuestionNumber", null);
session.setAttribute("fixedChoiceQuestionnaireID", null);
%>
	<%boolean flag = leqc.insert(leq); 
	if(flag == true){%>
	<script>alert("성공적으로 등록되었습니다.")
location.href="lectureEvaluationQuestionCreateView.jsp"</script>
	<% 
	}
	else{
		
		%><script>alert("등록을 실패했습니다.")
		location.href="lectureEvaluationQuestionCreateView.jsp"</script>
	<% 
	}
	%>
</body>
</html>