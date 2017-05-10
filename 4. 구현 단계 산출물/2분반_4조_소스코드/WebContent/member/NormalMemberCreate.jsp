<%@page import="project.member.ResponsibilitySubject"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="account" class="project.member.Account" />
<jsp:useBean id="career" class="project.member.Career" />
<jsp:useBean id="respon" class="project.member.ResponsibilitySubject" />
<jsp:useBean id="operateSubject"
	class="project.operateSubject.OperateSubjectData" />
<jsp:useBean id="operateSubjectControl"
	class="project.operateSubject.OperateSubjectControl" />
	
	
<jsp:setProperty name="nor" property="*" />
<jsp:setProperty name="em" property="*" />
<jsp:setProperty name="account" property="*" />
<jsp:setProperty name="career" property="*" />
<jsp:setProperty name="respon" property="*" />

<html>
<head>
<title>setProperty 테스트</title>
</head>
<body>

	<%
		String value = request.getParameter("memberType");
	%>
	<%
		if (value.equals("0")) {
			nor.memberID = "S" + memberControl.sCount++;
			memberControl.insertNormalMember(nor);
		} else {
			em.memberID = "E" + memberControl.eCount++;

			account.memberID = em.memberID;
			career.memberID = em.memberID;
			respon.memberID = em.memberID;
			String subjectName = request.getParameter("subjectName");

			out.println(subjectName);
			String subjectCode = operateSubjectControl.selectSubjectName(subjectName);
			out.println(subjectCode);
			project.member.ResponsibilitySubject r = new project.member.ResponsibilitySubject();
			r.memberID = em.memberID;
			r.responsibilitySubject = subjectCode;

			memberControl.insertEmployee(em);
			memberControl.insertAccount(account);
			//memberControl.insertCareer(career);

			memberControl.insertResponsibilitySubject(r);
		}
	%>
	<script>
		alert("회원가입 성공!");
		location.href = "../main/mainView.jsp";
	</script>
</body>
</html>