<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%@ page import="kr.employee.vo.EmployeeVO" %>
<%
	Integer user_num = (Integer)session.getAttribute("user_num");
	if (user_num == null){ // 로그인 되지 않은 경우
		response.sendRedirect("loginForm.jsp");
	} else{ // 로그인 된 경우
		// 전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		// 자바빈 생성과 전송된 데이터 저장
		EmployeeVO member = new EmployeeVO();
		// 세션에 user_num이 저장되어 있어 hidden 처리가 필요 없음
		member.setNum(user_num);
		member.setName(request.getParameter("name"));
		member.setPasswd(request.getParameter("passwd"));
		member.setSalary(Integer.parseInt(request.getParameter("salary")));
		member.setJob(request.getParameter("job"));
		
		EmployeeDAO dao = EmployeeDAO.getInstance();
		dao.updateMember(member);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 완료</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
<div class="page_main">
	<h1>회원정보 수정 완료</h1>
	<div class="result-display">
		회원정보 수정 완료<br>
		<button onclick="location.href='myPage.jsp'">MyPage</button>
	</div>
</div>
</body>
</html>
<%
	}
%>