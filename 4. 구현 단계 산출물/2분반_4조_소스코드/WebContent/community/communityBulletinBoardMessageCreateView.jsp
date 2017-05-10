<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>

<%@ page import = "java.util.*" %>
<%@ page import = "project.community.*" %>

<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData"/>

<jsp:useBean id="communityBulletinBoardControl" class="project.community.CommunitybulletinBoardControl" />
<jsp:useBean id="communityBulletinBoard" class="project.community.CommunityBulletinBoard" />
<jsp:useBean id="communityBulletinBoardMessageControl" class ="project.community.CommunitybulletinBoardMessageControl"/>
<jsp:useBean id="communityBulletinBoardMessage" class="project.community.CommunityBulletinBoardMessage" />

<jsp:setProperty property="*" name="communityBulletinBoard"/>
<jsp:setProperty property="*" name="communityBulletinBoardMessage"/>
   
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
	</nav> </header>

<h6 class=subTitle> 교육센터 통합 운영관리 시스템 - 모임방 - 모임방 게시판 - 모임방 게시글</h6>

<h3 class=mainTitle>모임방 게시글</h3>

<%
	String num = request.getParameter("communityBulletinBoardNo");
	
	session.setAttribute("cbbd", num);
%>

<form action = "communityBulletinBoardMessageCreate.jsp">
	<fieldset>
		<legend> 모임방 게시글 등록 </legend>
		
		<table id=CommunityBulletinBoardMessageCreateTable border="1" cellspacing=0 align="center" >
			<tr align="center">
				<td bgcolor="gray"> 모임방 게시글 유형 </td>
				<td colspan="2"> 
					<SELECT name="communityKindOfbulletinBoardMessage">
							<OPTION selected>공지사항</OPTION>
							<OPTION>자료실</OPTION>
							<OPTION>질문과 답변</OPTION>
							<OPTION>자유게시판</OPTION>
					</SELECT>
				</td>
			
			<tr align="center">
				<td bgcolor="gray"> 제목 </td>
				<td colspan="2"> <input type = "text" name ="title" width = "200" style="width:300px"> </td>
			</tr>
			<tr align="center">
				<td bgcolor="gray"> 내용 </td>
				<td colspan="2"> <textarea name = "bulletinBoardMessageContentcontent" cols = "80" rows = "20"> </textarea> </td> 
			</tr>
			
			<tr align="center">
				<td bgcolor="gray"> 작성자 </td>
				<td colspan="2"> <input type = "text" name ="name" width = "200"> </td>
			</tr>
			
			<tr align="center">
				<td bgcolor="gray"> 공개 범위 </td>
				<td>
				<input type ="radio" name ="wholeNoticeSatus" value = "전체 공지"/> 전체 공지
				</td>
				<td>
				<input type ="radio" name ="wholeNoticeSatus" value = "센터 공지"/> 센터 공지
				</td>
			</tr>
			
			<tr align="center" rowspan ="2">
      			<td bgcolor="gray"> 첨부파일 </td>
      			<td>
      				<input type = "text" name = "attachment" style="width:300px">
      			</td>
      			<td>	
         			<select name = "attachment2" size = 4 style="width:300px">
            		<option> 첨부파일1</option>
            		<option selected> 첨부파일2</option>
        			</select>        		
      			</td>
      			<td>
      				<input type = "hidden" name="searchContent" value="0000">
      				
      			</td>
      			<td>
      				<input type = "hidden" name="communityBulletinBoardNo" value="<%=num %>">
      			</td>
  			</tr>
		</table>
		<div align="center">
			<input class="myButton" type="submit" id="addBtn" value="등록">		
			<input class="myButton" type ="button" onclick="cancleBtn()" value="취소">
		</div>
	</fieldset>
</form>


</body>
</html>