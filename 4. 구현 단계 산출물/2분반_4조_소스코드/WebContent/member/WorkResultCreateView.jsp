<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="project.member.EmployeeData"%>
<%@ page import="project.workresult.*"%>
<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기는 기본셋팅이라 건들지 말것 -->
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />

<!-- 엔티티 클래스 및 컨트롤 추가 하는곳 여기에 추가할것 -->

<jsp:useBean id="workControl"
	class="project.workresult.WorkResultControl" />
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 홈페이지 제목 부분  -->

<title>직원회원가입</title>




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
	</nav> </header>
	<!--  여기까지 화면의 목록!!!!!! -->


	<!-- 여기는 자신의 관리와 기능을 적을것 -->
	<h6>교육센터 통합 운영관리 시스템 - 업무평가관리 - 업무평가 등록</h6>

	<!-- 여기는 자신의 기능을 적을것-->
	<h3>업무 평가 등록 (업무평가)</h3>

	<!-- 여기서부터 jsp화면 출력하는 부분 건들지 말것  header에서 부터 드래그해서 복사할것-->

	<%
	
	ArrayList<EmployeeData> arr = (ArrayList<EmployeeData>) session.getAttribute("eArr");
						
	%>

	<div align="center">
		<form action="WorkResultCreateMemberFind.jsp">
			<div>
				<fieldset>
					<legend>직원정보조회</legend>
					<table width=600px>
						<tr>
							<th>직원이름</th>
							<td><input type="text" name=name></td>
							<th>핸드폰 번호</th>
							<td><input type="text" name=phoneNo></td>
							<td><input type="submit" class="myButton" id=nameCheck
								value="조회"></td>
						</tr>
					</table>

				</fieldset>
			</div>
		</form>

		<form action="WorkResultCreate.jsp">

			<div align=center>
				<fieldset>
					<legend>회원정보</legend>
					<table width=600px>
						<tr>
							<th>평가 일자</th>

							<td>
								<%
						            SimpleDateFormat t = new SimpleDateFormat("yyyyMMdd");
						            Calendar c1 = Calendar.getInstance();
						            String today = t.format(c1.getTime());
						            out.println(today);
								%>
							</td>
							<th>입사 일자</th>
							<%
								if ( arr != null )
								{
									%>
									<td><%= arr.get(0).joinedDate %></td>
									<%
								}
								else
								{
									%><td></td><%
								}
							%>
							
						</tr>
						<tr>
							<th>성명</th>
							<%
								if ( arr != null )
								{
									ArrayList<WorkResult> workArr = workControl.selectWorkResult(arr.get(0).memberID);
									%>
									<td><a method="get" href="WorkResultDetailReadView.jsp?memberID=<%=arr.get(0).memberID%>">
			                      <%= arr.get(0).name %></a></td>
									<%
								}
								else
								{
									%><td></td><%
								}
							%>
							<th>소속/직급</th>
							<%
								if ( arr != null )
								{
									%>
									<td><%=arr.get(0).centerDepartmentName %> / <%= arr.get(0).positionName %></td>
									<%
								}
								else
								{
									%><td></td><%
								}
							%>
							
						</tr>
					</table>
					*평가 : 탁월(5점), 우수(4점), 보통(3점), 부족(2점), 문제(1점)
				</fieldset>

				<fieldset>
					<legend>업무평가</legend>
					<table>
						<tr>
							<th>항목</th>
							<th>평가 항목</th>
							<th>평가</th>
						</tr>

						<tr>
							<th rowspan=8>업무 수행능력</th>
							<td>직무와 관련된 지식을 충분히 숙지하고 있다.</td>
							<td><input type="text" name=workResult1></td>
						</tr>

						<tr>

							<td>업무를 완수하려는 잭임감이 강하다.</td>
							<td><input type="text" name=workResult2></td>
						</tr>

						<tr>

							<td>주어진 시간 내 계획성 있게 업무를 수행한다.</td>
							<td><input type="text" name=workResult3></td>
						</tr>

						<tr>

							<td>업무 수행에 따른 기록 정리 등 마무리가 완벽하다.</td>
							<td><input type="text" name=workResult4></td>
						</tr>

						<tr>

							<td>문제 발생 시 우선순위, 긴급함을 식별하여 대응한다.</td>
							<td><input type="text" name=workResult5></td>
						</tr>

						<tr>

							<td>업무와 관련하여 알게 된 정보를 신속, 정확히 보고한다.</td>
							<td><input type="text" name=workResult6></td>
						</tr>

						<tr>

							<td>업무에 대한 연구개발 및 개선 제안에 적극적이다.</td>
							<td><input type="text" name=workResult7></td>
						</tr>

						<tr>

							<td>수행되어진 업무를 질적, 양적으로 feed-back한다.</td>
							<td><input type="text" name=workResult8></td>
						</tr>

						<tr>
							<th rowspan=6>업무자세 및 인간관계</th>
							<td>업무의 목표달성을 위해 성실하게 일한다.</td>
							<td><input type="text" name=workResult9></td>
						</tr>

						<tr>

							<td>근태 사항이 양호하다.</td>
							<td><input type="text" name=workResult10></td>
						</tr>

						<tr>

							<td>부서의 업무에 적극적으로 참여한다.</td>
							<td><input type="text" name=workResult11></td>
						</tr>

						<tr>

							<td>부서 내/외 직원들과 협력관계를 유지하려고 노력한다.</td>
							<td><input type="text" name=workResult12></td>
						</tr>

						<tr>

							<td>정해진 규율 및 방침을 정확히 이해하고 이에 성실히 따른다.</td>
							<td><input type="text" name=workResult13></td>
						</tr>

						<tr>

							<td>동료들과 원만하고 성실한 인간관계를 유지한다.</td>
							<td><input type="text" name=workResult14></td>
						</tr>
						<tr >
							<th>
								업무평가결과
							</th>
							<td align="center" colspan=2>
							<textarea cols="60" rows="10" name="workData">
							
							</textarea>
							</td>
						</tr>
						<tr align=center>
							<td colspan=3>
							<input type="submit" class="myButton" id="addBtn" value="등록">
							<input type="button" class="myButton" id="cancleBtn"
							onclick="cancleBtn()" value="취소">
							</td>
						</tr>
					</table>
				</fieldset>
			</div>
		</form>
	</div>
</body>
</html>