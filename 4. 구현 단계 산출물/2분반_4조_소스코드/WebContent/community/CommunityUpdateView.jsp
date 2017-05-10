<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기는 기본셋팅이라 건들지 말것 -->
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />

<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기에 추가할것 -->
<jsp:useBean id="community" class="project.community.Community" />
<jsp:useBean id="communityControl" class="project.community.CommunityControl" />
<jsp:useBean id="communityparticipant" class="project.community.CommunityParticipant" />
<jsp:useBean id="communityParticipantControl" class="project.community.CommunityParticipantControl" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 홈페이지 제목 부분  -->

<title>모임방 등록</title>

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
<SCRIPT type="text/javascript" src="../js/community.js"></SCRIPT>
<!-- 자신의 javascript를 추가하는 곳 -->

</head>


<body>
	<!-- 여기서부터 jsp화면 출력하는 부분 건들지 말것  header에서 부터 드래그해서 복사할것-->
	
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
         }
         else
         {
            em = (project.member.EmployeeData) session.getAttribute("member");     
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
	</nav>
	<!--  여기까지 화면의 목록!!!!!! -->


	<!-- 여기는 자신의 관리와 기능을 적을것 -->
	<h6>교육센터 통합 운영관리 시스템 - 모임방 - 모임방 수정</h6>

	<!-- 여기는 자신의 기능을 적을것-->
	<h3>모임방 수정</h3>

	<!-- 여기서부터 jsp화면 출력하는 부분 건들지 말것  header에서 부터 드래그해서 복사할것-->
	<%
	String communityNo = request.getParameter("communityNo");
	String memberID = request.getParameter("memberID");
	community = communityControl.selectCommunity(communityNo);
	out.print(communityNo);
	communityparticipant = communityParticipantControl.selectCommunityOperator(Integer.valueOf(communityNo));

	if ( memberID != null && !mem.memberID.equals(communityparticipant.memberID) ){
		%>
		<script>
		alert("모임방 운영자만 모임방 수정이 가능합니다.");
		history.go(-1);
		</script>
		<%
	}
		
	%>
	
	<div align="center">
		<form action="CommunityUpdate.jsp" onSubmit="return checkInputException( this )">
			<table width="60%" cellpadding="1" align="center">
				
				<tr>
					<td align=right>모임방 명</td>
					<td><input id=communityName type="text" name=communityName size=60 style="width: 200px;" value="<%=community.communityName%>"></td>
				</tr>
				
				<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
				
				<tr>
					<td align=right>모임방 설명</td>
					<td><textarea cols="60" rows="10" id="communityExplanation" name="communityExplanation" ><%=community.communityExplanation %></textarea></td>
				</tr>
				
				<tr align=center> <td colspan=2>&nbsp;</td> </tr>
				<tr align=center> <td colspan=2>&nbsp;</td> </tr>
				
				<tr>
					<td colspan=2 align=center >
						<input type="hidden" name=communityNo value=<%=communityNo%>> 
						<input type="hidden" name=flag id="flag" value="update">
						<input type="submit" class="myButton" style="margin-right:20px;" onclick="checkInputException()" value="등록" >
						<input type="button" onclick="cancleBtn()" style="margin-right:150px;" class="myButton" value="취소">
					</td>
				</tr>
				
			</table>
			</form>
	</div>
	
</body>
</html>