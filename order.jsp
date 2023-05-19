<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%
	// 전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");

	// 가격 정보
	HashMap<String, Integer> map = new HashMap<String, Integer>();
	map.put("가방", 200000);
	map.put("신발", 100000);
	map.put("옷", 50000);
	map.put("식사권", 150000);
	
	// 배송비
	int ship = 5000;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
</head>
<body>
<%--
구매 금액이 30만원 미만이면 배송비 5천원 추가
 --%>
	<h3>주문 내역</h3>
	이름: <%= request.getParameter("name") %><br>
	배송희망일: <%= request.getParameter("order_date") %><br>
	구입 내용:
		<%
			String[] items = request.getParameterValues("item");
			int sum = 0;
			if (items != null){
				for(int i = 0; i < items.length; i++){
					sum += map.get(items[i]);
					if (i > 0) out.print(",");
		%>
					<%= items[i] %>
		<% 
				} // end of for
				
				// 배송비 체크
				if (sum < 300000) sum += ship;
				else ship = 0;
		%>
			<br>
			배송비: <%= String.format("%,d원", ship) %><br>
			총 구매 비용(배송비 포함): <%= String.format("%,d원", sum) %>
		<%
			}
		%>
</body>
</html>