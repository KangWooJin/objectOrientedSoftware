<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="project.lectureEvaluation.FixedChoiceQuestionnaire"%>
<%@ page
	import="project.lectureEvaluation.FixedChoiceQuestionnaireControl"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.*"%>
<jsp:useBean id="fcq"
	class="project.lectureEvaluation.FixedChoiceQuestionnaire" />
	<jsp:useBean id="fcqc"
	class="project.lectureEvaluation.FixedChoiceQuestionnaireControl" />
<jsp:useBean id="memberControl" class="project.member.MemberControl" />
<jsp:useBean id="em" class="project.member.EmployeeData" />
<jsp:useBean id="nor" class="project.member.NormalMemberData" />
<jsp:useBean id="mem" class="project.member.MemberData" />
<jsp:setProperty name="fcq" property="*" />
<jsp:setProperty name="nor" property="*" />

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
function regist()
{
	<%FixedChoiceQuestionnaireControl control = new FixedChoiceQuestionnaireControl();%>
	<%control.insert(fcq);%>
}

function typeChange(){
	var t = document.form1.fixedChoiceQuestionTypeID.value;
	//var y=document.getElementById("fixedChoiceQuestionTypeID").options; 
	if(t == "주관식")
		{
			document.form1.fixedChoiceQuestionDivision.value = "-"
			document.form1.fixedChoiceQuestionnaireContent.value = "200자 이내로 입력해주세요.";
			//alert(y[1].text = "-");
		}
}

function gradeChange(){
	var t = document.form1.fixedChoiceQuestionTypeID.value;
	var s = document.form1.fixedChoiceQuestionDivision.value;
	
	
	if(s == "2단계" && t!="주관식")
	{
		document.form1.fixedChoiceQuestionnaireContent.value = '예/아니오';
	}
	else if(s == "3단계" && t!="주관식")
		{
			document.form1.fixedChoiceQuestionnaireContent.value = '만족/보통/불만족';
		}
	else if(s == "5단계" && t!="주관식"){
		document.form1.fixedChoiceQuestionnaireContent.value = '매우그렇다/그렇다/보통이다/그렇지않다/전혀그렇지않다';
	}
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
<%
session.setAttribute("evaluationQuestionNumber", null);
session.setAttribute("fixedChoiceQuestionnaireID", null);
%>
	<h6>교육센터 통합 운영관리 시스템 - 강의 평가 관리 - 답안 보기 등록</h6>

	<h3>답안 보기 등록</h3>
	<form name="form1" method="post"
		action="fixedChoiceQuestionnaireCreate.jsp">
		<table width="900" align="center">
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type = "hidden" name=fixedChoiceQuestionnaireID value=<%=fcqc.getCount()+1 %>></td>
			</tr>
			<tr>
				<td colspan=2>&nbsp; ▶ 답안 보기 등록</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th align=center>답안 유형</th>
				<th align=center>답안 단계</th>
				<th align=center>답안 내용</th>
				
			</tr>
			<tr align=center>
				<td><select id="type" name=fixedChoiceQuestionTypeID
					onChange=typeChange()>
						<option value=객관식 selected>객관식</option>
						<option value=주관식>주관식</option>
				</select></td>
				<td><select id="grade" name=fixedChoiceQuestionDivision
					onChange=gradeChange()>
						<option value=2단계>2단계</option>
						<option value=3단계 selected>3단계</option>
						<option value=5단계>5단계</option>
				</select></td>
				<td><input type=text name=fixedChoiceQuestionnaireContent
					 style="width: 370px" placeholder="'/'기준으로 구분 (ex.좋음/보통/싫음)"></td>
				
			</tr>
			<tr>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr align=center>
				<td colspan=3><input class="myButton" type="submit" value="등록"
					onclick="regist()"> &nbsp;<input class="myButton"
					type="reset" value=취소></td>

			</tr>
		</table>
	</form>
</body>
</html>