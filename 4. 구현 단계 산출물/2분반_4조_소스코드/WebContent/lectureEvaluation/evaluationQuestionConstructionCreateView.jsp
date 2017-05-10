<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="project.lectureEvaluation.*"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.*"%>
<jsp:useBean id="eqc"
	class="project.lectureEvaluation.EvaluationQuestionConstruction" />
<jsp:useBean id="fcq"
	class="project.lectureEvaluation.FixedChoiceQuestionnaire" />
<jsp:useBean id="fcqControl"
	class="project.lectureEvaluation.FixedChoiceQuestionnaireControl" />
<jsp:useBean id="leq"
	class="project.lectureEvaluation.LectureEvaluationQuestion" />
<jsp:useBean id="leqControl"
	class="project.lectureEvaluation.LectureEvaluationQuestionControl" />

<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />
<jsp:setProperty name="nor" property="*" />
<jsp:setProperty name="eqc" property="*" />
<jsp:setProperty name="fcq" property="*" />
<jsp:setProperty name="leq" property="*" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 평가 결과 조회</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-theme.css" />
<link href="../css/innerStyle.css" type="text/css" rel="stylesheet" />
<SCRIPT type="text/javascript" src="../js/function.js"></SCRIPT>

<script type="text/javascript">
	function deleteBtn() {
		location.href = "lectureEvaluationQuestionDeleteView.jsp";
	}
	function regist() {
		//LectureEvaluationQuestionControl leqc = LectureEvaluationQuestionControl.getInstance();
<%EvaluationQuestionConstructionControl control = new EvaluationQuestionConstructionControl();%>
	
<%control.insert(eqc);%>
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
	<h6>교육센터 통합 운영관리 시스템 - 강의 평가 관리 - 평가 질문 구성 등록</h6>

	<h3>평가 질문 구성 등록</h3>
	<form name=eqcform method="post"
		action="evaluationQuestionConstructionCreate.jsp">
		<table width="1570px" cellpadding="15" align=center>
			<tr>
			<tr>
				<td colspan=4><hr></td>
			</tr>
			<td colspan=2>
				<table width="950px" cellpadding=10
					id=LectureEvaluationQuestionReadTable>
					<tr>
						<td colspan=5>▷ 강의 평가 질문 목록</td>
					</tr>
					<tr>
						<td colspan=5>&nbsp;</td>
					</tr>
					<tr>
						<th>질문코드</th>
						<th>질문 항목</th>
						<th>질문 대상</th>
						<th>유효시작일자</th>
						<th>유효종료일자</th>
					</tr>
					<%
						ArrayList<project.lectureEvaluation.LectureEvaluationQuestion> arr = leqControl.select();

						for (int i = 0; i < arr.size(); ++i) {
					%>
					<tr>
						<td align=center><%=arr.get(i).evaluationQuestionNumber%></td>
						<td><a method="get" href="evaluationQuestionSelect.jsp?evaluationQuestionNumber=<%=arr.get(i).evaluationQuestionNumber%>">
                               <%= arr.get(i).evaluationQuestionContent %></a></td>
						
						<td align=center><%=arr.get(i).evaluandDivision%></td>
						<td align=center><%=arr.get(i).effectiveStartDate%></td>
						<td align=center><%=arr.get(i).effectiveFinishDate%></td>
					</tr>
					<%
						}
					%>


				</table>
			</td>
			<td colspan=2 valign="top">

				<table width="600px" cellpadding=10
					id=FixedChoiceQuestionnaireReadTable >
					<tr>
						<td colspan=5>▷ 답안 보기 목록</td>
					</tr>
					<tr>
						<td colspan=5>&nbsp;</td>
					</tr>
					<tr>
						<th align=center>답안 코드</th>
						<th>답안 유형</th>
						<th>답안 단계</th>
						<th>답안 내용</th>
					</tr>
					<%
						ArrayList<FixedChoiceQuestionnaire> arr1 = fcqControl.select();

						for (int i = 0; i < arr1.size(); ++i) {
					%>
					<tr>
						<td align=center><%=arr1.get(i).fixedChoiceQuestionnaireID%></td>
						
                        <td align=center><%=arr1.get(i).fixedChoiceQuestionTypeID%></td>
						<td align=center><%=arr1.get(i).fixedChoiceQuestionDivision%></td>
						<td><a method="get" href="fixedChoiceSelect.jsp?fixedChoiceQuestionnaireID=<%=arr1.get(i).fixedChoiceQuestionnaireID%>">
                               <%= arr1.get(i).fixedChoiceQuestionnaireContent %></a></td>
					</tr>
					<%
						}
					%>

				</table>
			</td>
			<tr>
				<td colspan=3><hr></td>
			</tr>
			<tr>
				<td colspan=3>▶ 평가 질문 구성 등록</td>
			</tr>
			<tr>
				
				<td colspan=2 align="right">
					<table>

						<tr>
							<td colspan=4>&nbsp;</td>
						</tr>
						<tr>
							<th>질문 코드</th>
							<th>답안 코드</th>
							<th>유효 시작 일자</th>
							<th>유효 종료 일자</th>
						</tr>
						<tr>
						<% String qNum = (String) session.getAttribute("evaluationQuestionNumber");
							if ( qNum == null )
							{
						%>
							<td><input type="text" name="evaluationQuestionNumber"></td>
						<%	}
							else
							{ %>
								<td><input type="text" name="evaluationQuestionNumber" value= <%= qNum %>></td>
							<%
							}
							
							String fNum = (String) session.getAttribute("fixedChoiceQuestionnaireID");
							if ( qNum == null )
							{
						%>
							<td><input type="text" name="fixedChoiceQuestionnaireID"></td>
						<%	}
							else
							{ %>
								<td><input type="text" name="fixedChoiceQuestionnaireID" value= <%= fNum %>></td>
							<%
							}
							%>
							<td><input type="text" name="effectiveStartDate"></td>
							<td><input type="text" name="effectiveFinishDate"></td>
						</tr>
						<tr>
							<td colspan=4>&nbsp;</td>
						</tr>
						<tr align=right>
							<td colspan=4><input class="myButton" type="submit"
								value="등록" onclick="regist()"> &nbsp;<input
								class="myButton" type="reset" value=취소></td>

						</tr>
					</table>
				</td>
				<td>&nbsp;</td>
			</tr>

		</table>
</body>
</html>