<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="project.bulletinBoard.*"%>
<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기는 기본셋팅이라 건들지 말것 -->
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />


<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기에 추가할것 -->
<jsp:useBean id="commentControl" class="project.bulletinBoard.CommentControl" />
<jsp:useBean id="commentData" class="project.bulletinBoard.CommentData" />
<jsp:useBean id="bulletinBoardMessageControl" class="project.bulletinBoard.BulletinBoardMessageControl" />
<jsp:useBean id="bulletinBoardMessage" class="project.bulletinBoard.BulletinBoardMessageData" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 홈페이지 제목 부분  -->

<title>게시글 상세 조회</title>


<!-- 기본셋팅 값 건들지말것 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-theme.css" />
<link href="../css/innerStyle.css" type="text/css" rel="stylesheet" />
<title>게시판 조회</title>
<SCRIPT type="text/javascript" src="../js/function.js"></SCRIPT>

<!-- 자신의 javascript를 추가하는 곳 -->
<script type="text/javascript">
function backBtn()
{
	location.href="bulletinBoardMessageReadView.jsp";
}
</script>
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
	</nav> </header>
	<!--  여기까지 화면의 목록!!!!!! -->


	<!-- 여기는 자신의 관리와 기능을 적을것 -->
	<h6>교육센터 통합 운영관리 시스템 - 게시글 관리 - 게시글 상세 조회</h6>

	<!-- 여기는 자신의 기능을 적을것-->
	<h3>게시글 상세 조회</h3>

	<!-- 여기서부터 jsp화면 출력하는 부분 건들지 말것  header에서 부터 드래그해서 복사할것-->

			<%
				String bNum = request.getParameter("bulletinBoardNum");
				
				if (bNum == null)
					session.setAttribute("bbd", session.getAttribute("bbd"));
				else
					session.setAttribute("bbd", bNum);		
				
				String bulletinBoardNum = (String)session.getAttribute("bbd");
				String bulletinBoardMessageNum = (String)session.getAttribute("bbmd");

				int num1 = -1;
				int num2 = -1;
				
				if(bulletinBoardMessageNum == null && bulletinBoardMessageNum == null) {
					num1 = Integer.parseInt(request.getParameter("bulletinBoardNum"));
					num2 = Integer.parseInt(request.getParameter("bulletinBoardMessageNum"));
				}
				else {
					num1 = Integer.parseInt(bulletinBoardNum);
					num2 = Integer.parseInt(bulletinBoardMessageNum);
				}
				
				bulletinBoardMessage = bulletinBoardMessageControl.selectBulletinBoardMessage(String.valueOf(num1), String.valueOf(num2));
				
				int y = bulletinBoardMessage.createDate  / 10000;
				int m = (bulletinBoardMessage.createDate  % 10000) / 100;
				int d = (bulletinBoardMessage.createDate  % 10000) % 100;
				
				String date = String.valueOf(y) + ". " + String.valueOf(m) + ". " + String.valueOf(d);
			%>
	
<fieldset>
<form action="commentCreate.jsp">
	<table width="100" align="center">
		<tr>
			<td colspan=5 align="center">
				<h3>[<%=bulletinBoardMessage.bulletinBoardMessageType%>] <%=bulletinBoardMessage.bulletinBoardMessage%></h3>
			</td>
		</tr>
		<tr>
			<td colspan=5 align="right">첨부파일 : <%=bulletinBoardMessage.attachment%></td>
		</tr>
		<tr>
			<td colspan=5 align="center">
				<textarea disabled cols="100" rows ="15">
					<%=bulletinBoardMessage.bulletinBoardMessageContent %>
				</textarea>
			</td>
		</tr>
		<tr>
			<td><a method="get" class="myButton" href="bulletinBoardMessageDelete.jsp?bulletinBoardNum=<%=num1%>&bulletinBoardMessageNum=<%=num2%>">게시글 삭제</a></td>
			<td colspan=5 align="right">작성자 : <%=bulletinBoardMessage.name%></td>
		</tr>
		<tr>
			<td colspan=5 align="right">작성일 : <%=date%></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan=5><h3>댓글</h3></td>
		</tr>
		
		<%
			ArrayList<CommentData> arr1 = commentControl.selectComment();
		
			for (int i = 0; i < arr1.size(); ++i) {
				if(num1 != arr1.get(i).bulletinBoardNum || num2 != arr1.get(i).bulletinBoardMessageNum)
					continue;
		%>
		
		<tr>
			<td align="center"><h4><%=arr1.get(i).creator%><h4></td>
			<td><%=arr1.get(i).commentContent%></td>
			<td width="150" align="right"><%=date%></td>
			<td width="15" align="right"><input class="myButton" type="button" id=commentModifyBtn name="commentModifyNum" value=수정></td>
			<td width="20" align="right"><a method="get" href="commentDelete.jsp?bulletinBoardNum=<%=num1%>&bulletinBoardMessageNum=<%=num2%>&commentNum=<%=arr1.get(i).commentNum%>">삭제</a></td>
		</tr>
		<tr>
			<td colspan=5>첨부파일 : <%=arr1.get(i).attachFile%></td>
		</tr>
		
		<%
			}
		%>
		
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan=5><textarea name="commentContent" cols="100" rows="3"></textarea></td>
		</tr>
		<tr>
			<td colspan=4 align="left" > <span style="float:left;">작성자 : </span> <input style="float:left;" type="text" name="creator"></td>
			<td align="right">
				<input class="myButton" type="submit" name="addBtn" value="댓글 등록">
				<input type="hidden" name="bulletinBoardNum" value="<%=num1%>">
				<input type="hidden" name="bulletinBoardMessageNum" value="<%=num2%>">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan=5 align="left"><input class="myButton" type="button" onclick="backBtn()" value="게시글 목록"></td>
		</tr>
	</table>
</form>
	
	</fieldset>
</body>
</html>