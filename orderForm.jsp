<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 구매</title>
<script type="text/javascript">
	window.onload = function() {
		let myForm = document.getElementById("myForm");
		myForm.onsubmit = function() {
			// 이름
			let name = document.getElementById("name");
			if (name.value.trim() == ''){
				alert('이름 입력 필수');
				name.value = '';
				name.focus();
				return false;
			}
			
			// 배송희망일
			let order_date = document.getElementById("order_date");
			if (order_date.value.trim() == ''){
				alert('배송희망일 입력 필수');
				order_date.focus();
				return false;
			}
				
			// 상품
			let products = document.getElementsByName("item");
			
			let check = false;
			for(let i = 0; i < products.length; i++){
				if (products[i].checked){
					check = true;
				}
			}
			if (!check){
				alert('상품 하나 이상 선택');
				return false;
			}
		};
	};
</script>
</head>
<body>
<%--
이름, 배송희망일 필수 입력, 상품은 하나 이상 선택
 --%>
	<form action="s08_order.jsp" method="post" id="myForm">
		이름 <input type="text" name="name" id="name"><br>
		배송희망일 <input type="date" name="order_date" id="order_date"><br>
		상품 (30만원 미만 배송비 5천원 추가):
			<input type="checkbox" name="item" value="가방">가방(20만원)
			<input type="checkbox" name="item" value="신발">신발(10만원)
			<input type="checkbox" name="item" value="옷">옷(5만원)
			<input type="checkbox" name="item" value="식사권">식사권(15만원)
			<input type="submit" value="전송">
	</form>
</body>
</html>