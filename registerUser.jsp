<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.vo.EmployeeVO" %>
<%@ page import="kr.employee.dao.EmployeeDAO" %>
<%
	// 전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");
	// 자바빈 생성
	EmployeeVO vo = new EmployeeVO();
	// 전송된 데이터를 자바빈에 저장
	vo.setId(request.getParameter("id"));
	vo.setName(request.getParameter("name"));
	vo.setPasswd(request.getParameter("passwd"));
	vo.setSalary(Integer.parseInt(request.getParameter("salary")));
	vo.setJob(request.getParameter("job"));
	
	// MemberDAO 객체 생성
	EmployeeDAO dao = EmployeeDAO.getInstance();
	dao.insertMember(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
	<div class="page_main">
		<h1>회원가입 완료</h1>
		<div class="result-display">
			<div class="align-center">
				회원가입 성공<br>
				<button onclick="location.href='main.jsp'">홈으로</button>
			</div>
		</div>
	</div>
</body>
</html>