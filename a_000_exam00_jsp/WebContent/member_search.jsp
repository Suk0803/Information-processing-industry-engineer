<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="Layout/DB_connect.jsp"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" type="text/css" href="./css/style.css?ver1.2.1">
<script type="text/javascript">
	function checkValue() {
		var cv = document.data;

		if (!cv.custno.value) {
			alert("회원 번호를 입력해주세요.")
			cv.custno.focus();
			return false;
		}
		if (isNaN(cv.custno.value)) {
			alert("숫자만 입력해주세요.")
			cv.custno.focus();
			return false;
		}
	}
</script>
</head>

<body>
	<header>
		<jsp:include page="./Layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="./Layout/nav.jsp"></jsp:include>
	</nav>

	<main id="section">
		<h3 class="title">회원조회</h3>
		<form name="data" action="member_search_p.jsp" method="post"
			onsubmit="return checkValue()">
			<table class="table_line">
				<tr>
					<th>회원번호입력</th>
					<td><input type="number" name="custno" size="10" autofocus="autofocus"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="조회">
						<input type="reset" value="취소"w>
						<input type="button" value="회원목록조회/수정" onclick="location.href='member_list.jsp'"></td>
				</tr>
			</table>
		</form>
	</main>
	<footer>
		<jsp:include page="./Layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>
