<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>

<%@ page import = "java.util.*" %>
<%@ page import = "project.community.*" %>

<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData"/>

<jsp:useBean id="communityBulletinBoardMessageControl" class="project.community.CommunitybulletinBoardMessageControl" />
<jsp:useBean id="communityBulletinBoardMessage" class="project.community.CommunityBulletinBoardMessage" />
<jsp:useBean id="communityBulletinBoardMessageCommentControl" class="project.community.CommunityBulletinBoardMessageCommentControl" />
<jsp:useBean id="communityBulletinBoardMessageComment" class="project.community.CommunityBulletinBoardMessageComment" />

<jsp:setProperty property="*" name="communityBulletinBoardMessage"/>
<jsp:setProperty property="*" name="communityBulletinBoardMessageComment"/>


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

<script type="text/javascript">
function backBtn()
{
	location.href="communityBulletinBoardMessageReadView.jsp";
}
</script>
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

<body>
<h6 class=subTitle> 교육센터 통합 운영관리 시스템 - 모임방 - 모임방 게시판 - 모임방 게시글 상세 조회</h6>

<h3 class=mainTitle>모임방 게시글 상세 조회</h3>

<%				
	String cbNum = request.getParameter("communityBulletinBoardNo");
	
	
	if ( cbNum == null )
	{
		session.setAttribute("cbbd", session.getAttribute("cbbd"));
	}
	else
	{
		session.setAttribute("cbbd", cbNum);
	}
	
	
	String communityBulletinBoardNo = (String)session.getAttribute("cbbd");
	String communityBulletinBoardMessageNo = (String)session.getAttribute("cbbmd");
	
	int num1 = -1;
	int num2 = -1;
	
	if(communityBulletinBoardMessageNo == null ) {
		num1 = Integer.parseInt(request.getParameter("communityBulletinBoardNo"));
		num2 = Integer.parseInt(request.getParameter("communityBulletinBoardMessageNo"));
	}
	else {
		
		num1 = Integer.parseInt(communityBulletinBoardNo);
		num2 = Integer.parseInt(communityBulletinBoardMessageNo);
	}
	
	communityBulletinBoardMessage = communityBulletinBoardMessageControl.selectCommunityBulletinBoardMessage(String.valueOf(num1), String.valueOf(num2));
%>
		<fieldset >
		<legend>모임방 게시글 상세 조회</legend>
			
		<table id=CommunityBulletinBoardMessageDetailReadTable border="1" cellspacing=0 align = "center" width="500">
			<tr align ="center">
				<td width = "150" bgcolor="gray"> 게시글 유형 </td>
				<td width = "400">
				<%= communityBulletinBoardMessage.communityKindOfbulletinBoardMessage %>
				</td>
			</tr>
		
			<tr align ="center">
				<td width = "150" bgcolor="gray"> 제목 </td>
				<td width = "400">
				<%= communityBulletinBoardMessage.title %>
				</td>
			</tr>
			<tr align ="center">
				<td width = "150" bgcolor="gray"> 내용 </td>
				<td width = "400">
					<textarea style="width:100%" rows=10>
						<%= communityBulletinBoardMessage.bulletinBoardMessageContentcontent %>
					</textarea>
				</td>
			</tr>
			<tr align ="center">
				<td width = "150" bgcolor="gray"> 첨부파일 </td>
				<td width = "400">
					<%= communityBulletinBoardMessage.attachment %>
				</td>
			</tr>		
		</table>
		
		<div align="center">
			<input class="myButton" type="button" onclick="backBtn()" value="게시글 목록">
		</div>
		<br>
	</fieldset>
	
		<table id=CommunityBulletinBoardMessageCommentCreatetable border="1" cellspacing=0 align="center" width="500">
			<%
				ArrayList<CommunityBulletinBoardMessageComment> arr1 = communityBulletinBoardMessageCommentControl.selectCommunityBulletinBoardMessageComment();
			
				for (int i = 0; i < arr1.size(); ++i) {
					if(num1 != arr1.get(i).communityBulletinBoardNo || num2 != arr1.get(i).communityBulletinBoardMessageNo)
						continue;
			%>
			
			<tr align="center">
				<td width="250" colspan="4"> <%= arr1.get(i).openingDate %></td>
			</tr>
			<tr align="center">
				<td bgcolor="gray" width="100"> 작성자 </td>
				<td width="200"> <%= arr1.get(i).name %> </td>
				
				<td width="50"> <input type="button" id=commentModifyBtn value="수정"> </td>
				<td width="50"> <input type="button" id=commentDeleteBtn value="삭제"> </td>
			</tr>
			<tr align="center">
				<td bgcolor="gray" width="100"> 댓글 내용</td>
				<td width="400" colspan="3"> <%= arr1.get(i).commentContent %> </td>
				
			<%
				}
			%>
			</tr>
		</table>
		<br>
		<form action = "communityBulletinBoardMessageCommentCreate.jsp">
		<table id=CommunityBulletinBoardMessageCommentCreateTable border="1" cellspacing=0 align = "center" width="500">
			<tr align="center" >
				<td bgcolor="gray" width="100" align="center"> 작성자 </td>
				<td colspan="2" width="400" colspan="2"> <input type="text" name="name" width="100"></td>
			</tr>
			<tr align="center">
				<td bgcolor="gray" width="100" align="center"> 댓글 내용 </td>
				<td width="400"> 
					<textarea style="width:100%"  name = "commentContent" cols = "50" rows = "5"> </textarea> 
				</td>
				<td>
					<input class="myButton" type="submit" id="addBtn" value="댓글 등록">
				</td>
			</tr>
		</table>
		
		<div>
			<input type="hidden" name="communityBulletinBoardNo" value="<%=num1%>">
			<input type="hidden" name="communityBulletinBoardMessageNo" value="<%=num2%>">
		</div>
		</form>
		
</body>
</html>