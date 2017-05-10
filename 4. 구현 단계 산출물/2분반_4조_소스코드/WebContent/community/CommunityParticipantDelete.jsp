<%@page import="project.community.CommunityControl"%>
<%@page import="project.community.CommunityParticipant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 여기에 엔티티 클래스 및 컨트롤 클래스 추가할것 -->
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />
<jsp:setProperty name="em" property="*" />

<jsp:useBean id="community" class="project.community.Community" />
<jsp:useBean id="communityControl" class="project.community.CommunityControl" />
<jsp:useBean id="communityParticipant" class="project.community.CommunityParticipant" />
<jsp:useBean id="communityParticipantControl" class="project.community.CommunityParticipantControl" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<body>

	<!-- 여기서부터 데이터 처리  -->

	<%
		Integer o = (Integer) session.getAttribute("login");
	    Integer isLogin = -1 ;
	   	if ( o != null )
	    {      
		       isLogin = (Integer)session.getAttribute("login");
		       
		       if ( isLogin == 0 )
		       {
		          nor = (project.member.NormalMemberData) session.getAttribute("member");    
		          mem.memberID = nor.memberID;
		       }
		       else
		       {
		          em = (project.member.EmployeeData) session.getAttribute("member");     
		          mem.memberID = em.memberID;
		       }
	    }
		int communityNo = Integer.valueOf(request.getParameter("communityNo"));
	   	
	   	CommunityParticipant op = new CommunityParticipant();
	   	op = communityParticipantControl.selectCommunityOperator(communityNo);
	   	
	   	if( op.memberID.equals(mem.memberID)){
	   		community = communityControl.selectCommunity(String.valueOf(communityNo));
	   		community.closingDate = "폐지";
	   		communityControl.updateCommunity(community);
	   	}
	   	else{
	   		communityParticipant.communityNo = communityNo;
			communityParticipant.memberID = mem.memberID;
			communityParticipant.participationSeparation = 2;
			communityParticipantControl.updateCommunityParticipant(communityParticipant);
	   	}
		

	%>

	<!-- 데이터 처리후 원래의 View로 돌려줄것 -->
	<script type="text/javascript">
	alert("신청완료");
	location.href="CommunityReadView.jsp";
	</script>

</body>
</html>