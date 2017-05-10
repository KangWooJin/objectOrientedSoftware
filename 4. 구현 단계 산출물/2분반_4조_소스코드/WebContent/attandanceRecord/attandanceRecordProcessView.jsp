<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

%>

<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기는 기본셋팅이라 건들지 말것 -->
   <jsp:useBean id="memberControl" class="project.member.MemberControl" />
   <jsp:useBean id="em" class="project.member.EmployeeData" />
   <jsp:useBean id="nor" class="project.member.NormalMemberData" />
   <jsp:useBean id="mem" class="project.member.MemberData"/>
   <jsp:useBean id="arData" class="project.attandanceRecord.AttandanceRecordData"/>
   <jsp:useBean id="arControl" class="project.attandanceRecord.AttandanceRecordControl"/>
   <%@ page import="java.util.*"%>
   <%@ page import="project.attandanceRecord.AttandanceRecordControl"%>
   <%@ page import="project.attandanceRecord.AttandanceRecordData"%>
   <%@ page import="project.establishProcess.EstablishProcessData"%>

<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기에 추가할것 -->
<jsp:useBean id="establishProcessControl" class="project.establishProcess.EstablishProcessControl" />
<jsp:useBean id="establishProcessData" class="project.establishProcess.EstablishProcessData" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 홈페이지 제목 부분  -->
<title>개설과정등록</title>

<!-- 기본셋팅 값 건들지말것 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-theme.css" />
<link href="../css/innerStyle.css" type="text/css" rel="stylesheet" />



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
<h6 class=subTitle> 교육센터 통합 운영관리 시스템 - 출결대장 관리 - 출결대장 등록</h6>

<h3 class=mainTitle>출결대장 등록 </h3>
	
	<!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 -->
	<!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 -->
	<!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 --><!-- 제목 -->
	

   <fieldset>
 

      <table width="555" align="center">
         <tr>
            <th>개설과정코드</th>
            <th>개설과정명</th>
         </tr>
         <%
 

            em = (project.member.EmployeeData)session.getAttribute("member");
         System.out.println("멤버 :  " + em.memberID);

         	AttandanceRecordControl arc= new AttandanceRecordControl();

            ArrayList<EstablishProcessData> arr1 = arc.selectProcess(em.memberID);


            for (int i = 0; i < arr1.size(); ++i) {
            	if(arc.checkInsert(arr1.get(i).processCode)== 0)
            	{
            	String x = arr1.get(i).processCode;
            	String y = arr1.get(i).processName;
            	String z = arr1.get(i).subjectCode;


         %>
         
         <tr align="center">
            <td><%=x %> </td>
            <td><a method="get" href="attandanceRecordCreateView.jsp?processCode=<%=x%>&subjectCode=<%=z%>"><%=y%></a></td>
            <%
            	} }
            %>
         </tr>
         <tr>
            <td colspan=5>&nbsp;</td>
         </tr>

      </table>
   </fieldset>
	
</div>



</body>
</html>