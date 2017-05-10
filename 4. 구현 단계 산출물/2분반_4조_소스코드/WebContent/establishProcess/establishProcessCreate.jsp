<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="project.establishProcess.EstablishProcessControl"%>
<%@ page import="project.establishProcess.EstablishProcessData"%>

<!-- 여기에 엔티티 클래스 및 컨트롤 클래스 추가할것 -->
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />
<jsp:setProperty name="em" property="*" />

<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기에 추가할것 -->
<jsp:useBean id="establishProcessControl" class="project.establishProcess.EstablishProcessControl" />
<jsp:useBean id="establishProcessData" class="project.establishProcess.EstablishProcessData" />
<jsp:setProperty name="establishProcessData" property="*" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%	


			String isApply = request.getParameter("isApply");
			String isAccepted = request.getParameter("isAccepted");

			int msg = establishProcessControl.createEstablishProcess(establishProcessData,isApply,isAccepted);
			if(msg == 0){%>
				<script>alert("운영과목코드 또는 과정코드가 비었습니다.!");</script>
				<script>location.href="establishProcessCreateView.jsp";</script>
			<%}
			else if(msg == 1){%>
				<script>alert("개설과정을 성공적으로 등록했습니다.");</script>
				<script>location.href="establishProcessCreateView.jsp";</script>
			<%}
		    else if(msg == 2){%>
				<script>alert("개설과정코드가 중복됩니다.");</script>
				<script>location.href="establishProcessCreateView.jsp";</script>
			<%}
			 else if(msg == 3){ %>	
             	  <script>alert("운영과목코드가 존재하지 않습니다.");</script>
				  <script>location.href="establishProcessCreateView.jsp";</script>
             <% }
             else if(msg == 4) { %>
             	<script>alert("강사 ID가 존재하지 않습니다.");</script>
				<script>location.href="establishProcessCreateView.jsp";</script>
			<%} 
			else if(msg == 5) {%>
				<script>alert("ID 타입이 강사가 아닙니다.");</script>
				<script>location.href="establishProcessCreateView.jsp";</script>
			<%} %>
</body>
</html>