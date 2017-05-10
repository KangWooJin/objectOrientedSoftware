<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String memID = null;
%>
<%@ page import="project.lecture.LectureControl" %>
<%@ page import="project.lecture.LectureData"%>
<%@ page import="java.util.ArrayList" %>

<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기는 기본셋팅이라 건들지 말것 -->
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />

<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기에 추가할것 -->
<jsp:useBean id="lectureControl" class="project.lecture.LectureControl" />
<jsp:useBean id="lectureData" class="project.lecture.LectureData" />
<jsp:setProperty name="lectureData" property="*" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 홈페이지 제목 부분  -->
<title>수강료 납부</title>

<!-- 기본셋팅 값 건들지말것 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-theme.css" />
<link href="../css/innerStyle.css" type="text/css" rel="stylesheet" />
</head>
<SCRIPT type="text/javascript">

	
	function cancelBtn(){
		history.go(-1);
	}

</SCRIPT>


<%

	mem = (project.member.MemberData) session.getAttribute("member");
	Integer o = (Integer) session.getAttribute("login");
	Integer isLogin = -1 ;
	
	
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
	
	if(isLogin == 0){
		memID = nor.memberID;
	}
	else{
		memID = em.memberID;
	}
	
	LectureControl osc = new LectureControl();
	
	ArrayList<LectureData> ld = new ArrayList<LectureData>();
	


	ld = osc.showSignupInfo(memID);

	int[] tuitionList = new int[ld.size()];
	tuitionList = osc.selectProcessTuition(ld);
	
	int size = ld.size();
	
	for(int i = 0; i < size; i++){
		if(ld.get(i).memberID.equals("없음1")){
			%>
			<script>alert("로그인을 해야지 수강료 납부를 할 수 있습니다!")</script>
			
			<%
		}
	}
	%>

<body>
<header>
	<%
		
		mem = (project.member.MemberData) session.getAttribute("member");

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
	
	<h6>교육센터통합운영관리 - 수강관리  - 수강료 납부</h6>

	<h3>수강료 납부 현황</h3>
	
	<%int count = 1; %>
	
			<table align="center" border="0" cellpadding=15 cellspacing=15 id="table1">
			
				<tr height="30">
					<td width="200" align="center">번호</td>
					<td width="200" align="center">과정코드</td>
					<td width="200" align="center">과정명</td>
					<td width="200" align="center">수강료</td> 
					<td width="200" align="center">납부여부</td>
					<td width="200" align="center">납부선택</td>
				</tr>
				<% for(int i = 0; i < size; i++){%>
				<tr height="30">
					<td width="200" align="center"><%=i+1%></td>
					<td width="200" align="center"><%=ld.get(i).processCode%></td>
					<td width="200" align="center"><%=ld.get(i).processName%></td>
					<td width="200" align="center"><%=tuitionList[i]%></td>
					<%
						if(ld.get(i).processStep > 1){%>
							<td width="200" align="center">납부</td>	
						<%}
						else {%>
							<td width="200" align="center">미납</td>
						<%}%>
				
					</td>
					<form action="payTuition.jsp">
					<%
						if(ld.get(i).processStep == 1){%>
						<td width="200" align="center"><input class="myButton" type="submit" value="수강료납부""></td>		
					<%}%>
					
					<td><input style="display:none" type="text" name="processCode" value="<%=ld.get(i).processCode %>"></td>
					<td><input style="display:none" type="text" name="memberID" value="<%=ld.get(i).memberID%>"></td>
					<td><input style="display:none" type="text" name="processStep" value="<%=ld.get(i).processStep%>"></td>
					<td><input style="display:none" type="text" name="personnelCardNumber" value="<%=ld.get(i).personnelCardNumber%>"></td>
					<td><input style="display:none" type="text" name="processName" value="<%=ld.get(i).processName%>"></td>
					<td><input style="display:none" type="text" name="companyName" value="<%=ld.get(i).companyName %>"></td>	
					</form>
				</tr>
				<%} %>
				</table>	
			
		


</body>
</html>