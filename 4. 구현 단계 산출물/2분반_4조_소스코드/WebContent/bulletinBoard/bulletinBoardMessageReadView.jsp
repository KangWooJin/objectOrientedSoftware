<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.*"%>
<%@ page import="project.bulletinBoard.*"%>
<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기는 기본셋팅이라 건들지 말것 -->
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />
<jsp:useBean id="bulletinBoardMessageControl" class="project.bulletinBoard.BulletinBoardMessageControl" />
<jsp:useBean id="bulletinBoardMessageData" class="project.bulletinBoard.BulletinBoardMessageData" />

<jsp:useBean id="bulletinBoardData"
   class="project.bulletinBoard.BulletinBoardData" />


<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기에 추가할것 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 홈페이지 제목 부분  -->

<title>게시글 조회</title>




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
   location.href="bulletinBoardReadView.jsp";
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
   <h6>교육센터 통합 운영관리 시스템 - 게시글 관리 - 게시글 조회</h6>

   <!-- 여기는 자신의 기능을 적을것-->
   <h3>게시글 조회</h3>

   <!-- 여기서부터 jsp화면 출력하는 부분 건들지 말것  header에서 부터 드래그해서 복사할것-->

   <fieldset>
      <legend> 게시글 조회 </legend>

      <table width="555" align="center">
         <tr>
            <th width="50">번호</th>
            <th width="50">유형</th>
            <th width="300">제목</th>
            <th width="50">작성자</th>
            <th>작성일</th>
         </tr>
         
         <%
         session.setAttribute("bbmd", null);
         String bulletinBoardNum = (String)session.getAttribute("bbd");
         
         String search = request.getParameter("query");
         String kindOfbulletinBoard = request.getParameter("kindOfSearch");
         ArrayList<BulletinBoardMessageData> arr1 = new ArrayList<BulletinBoardMessageData>();
         
         if(search == null || search == "") {
            arr1 = bulletinBoardMessageControl.selectBulletinBoardMessage();
         }
         else {
            System.out.println("SELECT * FROM bulletinboardmessage WHERE " + kindOfbulletinBoard + " LIKE '%" + search + "%'");
            arr1 = bulletinBoardMessageControl.searchBulletinBoardMessage("SELECT * FROM bulletinboardmessage WHERE " + kindOfbulletinBoard + " LIKE '%" + search + "%'");
         }
      
         
         
         int num = -1;
         
         if (bulletinBoardNum == null)
            num = Integer.parseInt(request.getParameter("bulletinBoardNum"));
         else
            num = Integer.parseInt(bulletinBoardNum);
         
         for (int i = 0; i < arr1.size(); ++i) {
            if(num != arr1.get(i).bulletinBoardNum)
               continue;
            
            int y = arr1.get(i).createDate / 10000;
            int m = (arr1.get(i).createDate % 10000) / 100;
            int d = (arr1.get(i).createDate % 10000) % 100;
            
            String date = String.valueOf(y) + ". " + String.valueOf(m) + ". " + String.valueOf(d);
            
         %>
         
         <tr align="center">
            <td><%= arr1.get(i).bulletinBoardMessageNum %></td>
            <td><%= arr1.get(i).bulletinBoardMessageType %></td>
            <td align="center"><a method="get" href="bulletinBoardMessageDetailReadView.jsp?bulletinBoardNum=<%=arr1.get(i).bulletinBoardNum%>&bulletinBoardMessageNum=<%=arr1.get(i).bulletinBoardMessageNum%>"><%=arr1.get(i).bulletinBoardMessage%></a></td>
            <td><%= arr1.get(i).name %></td>
            <td><%= date %></td>
            <%
               }
            %>
         </tr>
         <tr>
            <td>&nbsp;</td>
         </tr>
         <tr>
            <form action="bulletinBoardMessageReadView.jsp">
               <td colspan=3 align="right">
                  <SELECT name="kindOfSearch">
                     <OPTION selected value="bulletinBoardMessage">제목</OPTION>
                     <OPTION value="name">작성자</OPTION>
                     <OPTION value="bulletinBoardMessageNum">번호</OPTION>
                  </SELECT>
               </td>
               <td><input type="hidden" value=<%=num%> name=bulletinBoardNum><input type="text" name="query"></td>
               <td align="left"><input class="myButton" type="submit" value="검색"></td>
            </form>
         </tr>
         <tr>
            <td colspan=3 align="left">
               <input class="myButton" type="button" onclick="backBtn()" value="게시판 목록">
            </td>
            <td colspan=2 align="right">
               <form action="bulletinBoardMessageCreateView.jsp">
                  <input class="myButton" type="submit" value="게시글 등록">
                  <input type="hidden" name="bulletinBoardNum" value="<%=num%>">
               </form>
            </td>
         </tr>
      </table>
   </fieldset>
</body>
</html>