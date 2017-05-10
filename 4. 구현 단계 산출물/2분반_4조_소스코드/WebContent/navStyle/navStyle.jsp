<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
	<table width="100%">
		<tr align="center">
			
			<td>
				<li><a href="../main/mainView.jsp"><i class="fa fa-folder"></i><font color="black" size="4" >HOME</font></a></li>
			</td>
			<td>
				<li class="dropdown"><a href="#" id="dropdownCategoryMenu"
					data-toggle="dropdown"><i class="fa fa-folder-open"></i><font
						color="black" size="4">운영과목 </font><i class="caret"></i></a>
					<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownCategoryMenu">
						<li><a href="../operateSubject/operateSubjectCreateView.jsp"><i class="fa fa-folder"></i>운영과목등록</a></li>
						<li><a href="../operateSubject/operateSubjectReadView.jsp"><i class="fa fa-folder"></i>운영과목조회</a></li>
					</ul></li>
			</td>

			<td>
				<li class="dropdown"><a href="#" id="dropdownCategoryMenu"
					data-toggle="dropdown"><i class="fa fa-folder-open"></i><font
						color="black" size="4">개설과정</font> <i class="caret"></i></a>
					<ul class="dropdown-menu" role="menu"
						aria-labelledby="dropdownCategoryMenu">
						<li><a href="../establishProcess/establishProcessCreateView.jsp"><i class="fa fa-folder"></i>개설과정등록</a></li>
						<li><a href="../establishProcess/establishProcessReadView.jsp"><i class="fa fa-folder"></i>개설과정조회</a></li>
					</ul></li>

			</td>

			<td>
				<li class="dropdown"><a href="#" id="dropdownCategoryMenu"
					data-toggle="dropdown"><i class="fa fa-folder-open"></i><font
						color="black" size="4">수강</font> <i class="caret"></i></a>
					<ul class="dropdown-menu" role="menu"
						aria-labelledby="dropdownCategoryMenu">
						<li><a href="../lecture/signupView.jsp"><i class="fa fa-folder"></i> 수강신청</a></li>
						<li><a href="../lecture/lectureReadView.jsp"><i class="fa fa-folder"></i>수강조회</a></li>
						<li><a href="../lecture/payTuitionView.jsp"><i class="fa fa-folder"></i>수강료납부</a></li>
					</ul></li>

			</td>
			<td>
				<li class="dropdown"><a href="#" id="dropdownCategoryMenu"
					data-toggle="dropdown"><i class="fa fa-folder-open"></i><font
						color="black" size="4">출결</font> <i class="caret"></i></a>
					<ul class="dropdown-menu" role="menu"
						aria-labelledby="dropdownCategoryMenu">
						<li><a href="../attandanceRecord/attandanceRecordProcessView.jsp"><i class="fa fa-folder"></i>출결등록</a></li>
						<li><a href="../attandanceRecord/attandanceRecordReadView.jsp"><i class="fa fa-folder"></i>출결조회</a></li>
					</ul></li>

			</td>
			<td>
				<li class="dropdown"><a href="#" id="dropdownCategoryMenu"
					data-toggle="dropdown"><i class="fa fa-folder-open"></i><font
						color="black" size="4">업무평가</font> <i class="caret"></i></a>
					<ul class="dropdown-menu" role="menu"
						aria-labelledby="dropdownCategoryMenu">
						<li><a href="../member/WorkResultCreateView.jsp"><i class="fa fa-folder"></i>업무평가등록</a></li>
						<li><a href="../member/WorkResultReadView.jsp"><i class="fa fa-folder"></i>업무평가조회</a></li>
					</ul></li>

			</td>
			<td>
            <li class="dropdown"><a href="#" id="dropdownCategoryMenu"
               data-toggle="dropdown"><i class="fa fa-folder-open"></i><font
                  color="black" size="4">강의평가</font> <i class="caret"></i></a>
               <ul class="dropdown-menu" role="menu"
                  aria-labelledby="dropdownCategoryMenu">
                  <li><a href="../lectureEvaluation/lectureEvaluationQuestionCreateView.jsp"><i class="fa fa-folder"></i>강의 평가 질문 등록</a></li>
                  <li><a href="../lectureEvaluation/lectureEvaluationQuestionReadView.jsp"><i class="fa fa-folder"></i>강의 평가 질문 조회</a></li>
                  <li><a href="../lectureEvaluation/fixedChoiceQuestionnaireCreateView.jsp"><i class="fa fa-folder"></i>답안 보기 등록</a></li>
                  <li><a href="../lectureEvaluation/fixedChoiceQuestionnaireReadView.jsp"><i class="fa fa-folder"></i>답안 보기 조회</a></li>
                  <li><a href="../lectureEvaluation/evaluationQuestionConstructionCreateView.jsp"><i class="fa fa-folder"></i>평가 질문 구성 등록</a></li>
                  <li><a href="../lectureEvaluation/evaluationQuestionConstructionReadView.jsp"><i class="fa fa-folder"></i>평가 질문 구성 조회</a></li>
                  <li><a href="../main/mainView.jsp"><i class="fa fa-folder"></i>강의평가결과 등록</a></li>
                  <li><a href="../main/mainView.jsp"><i class="fa fa-folder"></i>강의평가결과 조회</a></li>
               </ul></li>

         </td>

			<td>
            <li class="dropdown"><a href="#" id="dropdownCategoryMenu"
               data-toggle="dropdown"><i class="fa fa-folder-open"></i><font
                  color="black" size="4">센터</font><i class="caret"></i></a>
               <ul class="dropdown-menu" role="menu"
                  aria-labelledby="dropdownCategoryMenu">
                  <li><a href="../center/centerReadView.jsp"><i class="fa fa-folder"></i>센터조회</a></li>
               </ul></li>
       	    </td>

			<td>
				<li class="dropdown"><a href="#" id="dropdownCategoryMenu"
					data-toggle="dropdown"><i class="fa fa-folder-open"></i><font
						color="black" size="4">수료증 </font><i class="caret"></i></a>
					<ul class="dropdown-menu" role="menu"
						aria-labelledby="dropdownCategoryMenu">
						<li><a href="../certifycateIssue/certifycateIssueListView.jsp"><i class="fa fa-folder"></i>수료증발급</a></li>
						<li><a href="../certifycateIssue/certifycateIssueReadList.jsp"><i class="fa fa-folder"></i>수료증발급정보조회</a></li>
					</ul></li>

			</td>

			<td>
				<li class="dropdown"><a href="#" id="dropdownCategoryMenu"
					data-toggle="dropdown"><i class="fa fa-folder-open"></i><font
						color="black" size="4">게시판 </font><i class="caret"></i></a>
					<ul class="dropdown-menu" role="menu"
						aria-labelledby="dropdownCategoryMenu">
						<li><a href="../bulletinBoard/bulletinBoardCreateView.jsp"><i class="fa fa-folder"></i>게시판등록</a></li>
						<li><a href="../bulletinBoard/bulletinBoardReadView.jsp"><i class="fa fa-folder"></i>게시판조회</a></li>
					</ul></li>

			</td>

			<td>
				<li class="dropdown"><a href="#" id="dropdownCategoryMenu"
					data-toggle="dropdown"><i class="fa fa-folder-open"></i><font
						color="black" size="4">모임방 </font><i class="caret"></i></a>
					<ul class="dropdown-menu" role="menu"
						aria-labelledby="dropdownCategoryMenu">
						<li><a href="../community/CommunityCreateView.jsp"><i class="fa fa-folder"></i>모임방등록</a></li>
						<li><a href="../community/CommunityReadView.jsp"><i class="fa fa-folder"></i>모임방조회</a></li>
					</ul></li>

			</td>
		</tr>
		
	</table>
</body>
</html>