<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 여기에 엔티티 클래스 및 컨트롤 클래스 추가할것 -->
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />
<jsp:setProperty name="em" property="*" />

<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기에 추가할것 -->
<jsp:useBean id="centerControl" class="project.center.CenterControl" />
<jsp:useBean id="center" class="project.center.Center" />
<jsp:setProperty name="center" property="*" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<body>

	<!-- 여기서부터 데이터 처리  -->

	<%
	String memberID = request.getParameter("memberID");
	String centerNo = request.getParameter("centerNo");
	
	int num = memberControl.getMemberType(memberID);
	if ( num == -1 )
	{
		%>
			<script>
				alert("해당 직원을 찾을 수 없습니다. \n센터 조회 화면으로 이동합니다.");
				location.href="centerReadView.jsp";
				//history.go(-1);
			</script>
	<%
	}
	
	center = centerControl.selectCenter(centerNo);
	center.memberID = memberID;
	
	centerControl.updateCenter(center);
	
	%>

	<!-- 데이터 처리후 원래의 View로 돌려줄것 -->
	<script type="text/javascript">
	alert("센터장 수정 완료");
	location.href="centerReadView.jsp";
</script>

</body>
</html>