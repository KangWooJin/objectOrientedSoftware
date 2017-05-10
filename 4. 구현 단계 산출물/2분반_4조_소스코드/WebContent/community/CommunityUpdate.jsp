<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기는 기본셋팅이라 건들지 말것 -->
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />

<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기에 추가할것 -->
<jsp:useBean id="community" class="project.community.Community" />
<jsp:useBean id="communityControl" class="project.community.CommunityControl" />
<jsp:useBean id="communityparticipant" class="project.community.CommunityParticipant" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<body>

	<!-- 여기서부터 데이터 처리  -->
	
	<%
	String communityNo = request.getParameter("communityNo");
	out.println(communityNo);
	community = communityControl.selectCommunity( communityNo );
	community.communityName = request.getParameter("communityName");
	community.communityExplanation = request.getParameter("communityExplanation");
	
	communityControl.updateCommunity(community);
	%>
	
	<!-- 데이터 처리후 원래의 View로 돌려줄것 -->
	<script type="text/javascript">
	alert("모임방 수정 완료");
	//모임방 상세조회 화면으로 전환
	
	location.href="CommunityReadView.jsp";
</script>

</body>
</html>