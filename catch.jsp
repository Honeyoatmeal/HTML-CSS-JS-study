<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catch tag</title>
</head>
<body>
<c:catch var="ex">
	name 파라미터의 값 = <%= request.getParameter("name") %><br>
	<% if (request.getParameter("name").equals("test")){ %>
		${param.name}은 test입니다.
	<%} %>
</c:catch>
<p><%-- 두 줄 띄우기 --%>
<%-- 예외가 발생하면 예외 객체가 생성되고 예외 객체가 있으면 true --%>
<c:if test="${ex != null}">
	예외가 발생했습니다.<br>
	${ex}
</c:if>
</body>
</html>