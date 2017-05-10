<%@page import="java.util.ArrayList"%>
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
      String memberID = request.getParameter("memberID");
      %>
      <script type="text/javascript">
      alert(memberID);
      </script>
      <%
      communityParticipant.communityNo = Integer.valueOf(request.getParameter("communityNo"));
      communityParticipant.memberID = memberID;
      communityParticipant.participationSeparation = 3;
      
      ArrayList<CommunityParticipant> participants = communityParticipantControl.selectCommunityParticipants(communityParticipant.communityNo);
      if( participants.size() == 0 )
         ;//href?로 모임방 상세조회화면으로 이동해주기!!!
               
      for (int i = 0; i < participants.size(); ++i) {

         if( participants.get(i).memberID != memberID )
            continue;
         
         if ( participants.get(i).participationSeparation == 1 ){
            communityParticipantControl.updateCommunityParticipant(communityParticipant);
            %>   <script type="text/javascript">
            alert("신청완료");
            location.href="CommunityReadView.jsp";
            </script><%
         }
         else{
            %>   <script type="text/javascript">
            alert("이미 해당 모임방의 참여회원 혹은 참여 신청자 입니다.");
            location.href="CommunityReadView.jsp";
            </script><%
         }
         
          }
      
      communityParticipantControl.insertCommunityParticipant(communityParticipant);
   %>

   <!-- 데이터 처리후 원래의 View로 돌려줄것 -->
   <script type="text/javascript">
   alert("신청완료");
   location.href="CommunityReadView.jsp";
   </script>

</body>
</html>