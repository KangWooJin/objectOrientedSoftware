<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
%><%@ page
	import="project.lectureEvaluation.EvaluationResultControl"%>
<jsp:useBean id="er"
	class="project.lectureEvaluation.EvaluationResult" />
<jsp:setProperty name="er" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	
		EvaluationResultControl erc = new EvaluationResultControl();
	%>
	<%
		boolean flag = erc.insert(er);
		if (flag == true) {
	%>
	<script>
		alert("성공적으로 등록되었습니다.")
		location.href = "evaluationResultCreateView.jsp"
	</script>
	<%
		} else {
	%><script>
			alert("등록을 실패했습니다.")
			location.href = "evaluationResultCreateView.jsp"
		</script>
	<%
		}
	%>
</body>
</html>