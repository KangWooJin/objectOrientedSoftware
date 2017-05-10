<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>

<%@ page import = "java.util.*" %>
<%@ page import = "project.community.*" %>
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData"/>

<jsp:useBean id="community" class="project.community.Community" />
<jsp:useBean id="communityControl" class="project.community.CommunityControl" />
<jsp:useBean id="communityparticipant" class="project.community.CommunityParticipant" />
<jsp:useBean id="communityParticipantControl" class="project.community.CommunityParticipantControl" />

<jsp:useBean id="communityBulletinBoardControl" class="project.community.CommunitybulletinBoardControl" />
<jsp:useBean id="communityBulletinBoard" class="project.community.CommunityBulletinBoard" />
<jsp:setProperty property="*" name="communityBulletinBoard"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 기본셋팅 값 건들지말것 -->
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-theme.css" />
<link href="../css/innerStyle.css" type="text/css" rel="stylesheet" />
<title>Insert title here</title>
<SCRIPT type="text/javascript" src="../js/function.js"></SCRIPT>
</head>

<body>
	<header>
	<%
		
		mem = (project.member.MemberData) session.getAttribute("member");
		Integer o = (Integer) session.getAttribute("login");
		Integer isLogin = -1 ;
		
        //out.println(id + " " + password) ;;
		
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
      
   
      
      if ( isLogin == 0 || isLogin == 1) {
         if ( isLogin == 0)
         {
               
	%>
   <div align="right">
      <table clsss="innor" id="innor">
         <tr align=center>
            <td colspan=3> <%= nor.name %> <% out.println( "( " + nor.ID + " ) 환영합니다.") ;%></td>
            
         </tr>
         <form action="../member/logout.jsp">
         <tr align=center>
            <td colspan=1 ><input class="myButton" type="submit" value="로그아웃"></td>
         </form>
         <form action="../member/NormalMemberReadView.jsp">
            <td colspan=1 ><input class="myButton" type="submit" value="마이페이지"></td>
         </form>
         </tr>
         
      </table>
   </div>
   <%      }
         else
         {
            %>
   <div align="right">
      <table clsss="innor" id="innor">
         <tr align=center>
            <td colspan=3> <%= em.name %> <% out.println( "( " + em.ID + " ) 환영합니다.") ;%></td>
            
         </tr>
         <form action="../member/logout.jsp">
         <tr align=center>
            <td colspan=1 ><input class="myButton" type="submit" value="로그아웃"></td>
         </form>
         <form action="../member/EmployeeMemberReadView.jsp">
            <td colspan=1 ><input class="myButton" type="submit" value="마이페이지"></td>
         </form>
         </tr>
         
      </table>
   </div>
            <%
         }
      }
      else {
   %>
      <div align="right">
      
      <table>
      <form action="../member/loginView2.jsp">
         <tr>
            <td>아이디</td>
            <td><input type="text" name="ID" value="s0001"></td>
            <td><input class="myButton" type="submit" value="로그인"></td>
         </tr>
         <tr>
            <td>비밀번호</td>
            <td><input type="password" name="password" value="1234"></td>
      </form>
      <form action="../member/RealNameAuthenticationTypeView.jsp">
            <td><input class="myButton" type="submit" value="회원가입"></td>
      </form>
         </tr>
      </table>
   </div>
   <% }
   %>
   </header>
	
	<nav>
		<%  
	
		if ( isLogin == 0 || isLogin == 1) {
			int type = 1;
			if(isLogin == 0){
				type = memberControl.getMemberType(nor.memberID);		
			}
			else if(isLogin == 1){
				type = memberControl.getMemberType(em.memberID);
			}
			if(type == 1){
	%>
		<%@ include file="../navStyle/navStyle.jsp"%>

	<%}
			else if(type == 0){
	%>			
		<%@ include file="../navStyle/navStyle2.jsp"%>
	<%		} 
		}
	else {%>
		<%@ include file="../navStyle/navStyle3.jsp"%>
	
	<%} %>
	</nav> </header>
<h6 class=subTitle> 교육센터 통합 운영관리 시스템 - 모임방 -  모임방상세조회(모임방 게시판조회)</h6>

<h3 class=mainTitle>모임방상세조회(모임방 게시판조회)</h3>
<%
   //모임방 상세조회에서 수정 버튼과 함께 communityNo 넘겨주는 태그 만들어 놓기
   String communityNo = request.getParameter("value");
  
%>

<fieldset >
	<legend>모임방 게시판 조회</legend>

	<div align="center">
	<table id=CommunityBulletinBoardReadTable border="1" cellspacing=0 align = "center" width="70%" cellpadding="15">
		<tr>
		   <td colspan=1>
		         <form action="CommunityParticipantRegisterView.jsp">
		            <input type="hidden" name=communityNo value=<%=communityNo%>>
		            <input type="submit" class="myButton"style="float:left;" value="신청자 목록">
		         </form>
		   </td>   
		   <td colspan=3 align=right>
		         <form action="CommunityParticipantDelete.jsp"><!-- 탈퇴처리하는 부분만들기 -->
		            <input type="hidden" name=communityNo value=<%=communityNo%>>
		            <input type="submit" class="myButton"style="float:right;" value="모임방 탈퇴">
		         </form>
		
		         <form action="CommunityUpdateView.jsp">
		         
		            <input type="hidden" name=communityNo value=<%=communityNo%>>
		            <input type="submit" class="myButton"style="float:right; margin-right:20px;" value="모임방 수정">
		         </form>
		   </td>
		</tr>      
         
		<tr align ="center" bgcolor="gray">
			<td width = "150"> 모임방 게시판 번호 </td>
			<td width = "150"> 모임방 게시판 명 </td>
			<td width = "100"> 개설일자 </td>
			<td width = "100"> 개설자 </td>
		</tr>				
		<%
			session.setAttribute("cbbd", null);
			ArrayList<CommunityBulletinBoard> arr1 = communityBulletinBoardControl.selectCommunityBulletinBoard(); 
		
	    	for (int i = 0; i < arr1.size(); ++i) {
	    %>

		<tr  align ="center">
		<td>
			<%= arr1.get(i).communityBulletinBoardNo %>
		</td>
		<td> 
			<a method="get" href="communityBulletinBoardMessageReadView.jsp?communityBulletinBoardNo=<%= arr1.get(i).communityBulletinBoardNo %>"><%= arr1.get(i).communityBulletinBoardName %></a>
		</td>
		<td>
			<%= arr1.get(i).openingDate %>
		</td>
		<td>
			<%= arr1.get(i).creator %>
		</td>
		<%
		}
		%>
		</tr>
		
		<tr align=center> <td colspan=4>&nbsp;</td> </tr>
		      <tr align=center> <td colspan=4>&nbsp;</td> </tr>
		      
		      <tr>
		         <td colspan=2 align=left>
		            <form action="CommunityParticipantReadView.jsp" align="left">
		               <input type="hidden" name=communityNo value=<%=communityNo%>>
		               <input type="hidden" name=memberID value=<%=mem.memberID%>>
		      <input class="myButton" type="submit" name="CommunityParticipantReadView" value="참여회원 조회">
		   </form>
		</td>
		
		<td colspan=2 align=right>
		   <form action="communityBulletinBoardCreateView.jsp" align="right">
		      <input type="hidden" name=communityNo value=<%=communityNo%>>
		     <!-- String communityNo = request.getParameter("communityNo"); -->
		       <input class="myButton" type="submit" name ="communityBulletinBoard" value ="등록">
		      </form>
		</td>
		</tr>
	</table>
	</div>
</fieldset>

</body>
</html>