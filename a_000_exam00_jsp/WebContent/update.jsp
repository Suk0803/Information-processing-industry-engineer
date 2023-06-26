<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="Layout/DB_connect.jsp"%>
<%
String sql = "select custno, custname, phone, address,"
		+" to_char(joindate, 'yyyy-mm-dd') joindate, grade, city" 
		+" from member_tbl_02"
		+" where custno = " + request.getParameter("custno");

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	//int num = rs.getInt(1);
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

		if (!cv.custname.value) {
			alert("회원 성명을 입력해주세요.")
			cv.custname.focus();
			return false;
		}
		if (!cv.phone.value) {
			alert("회원 전화를 입력해주세요.")
			cv.phone.focus();
			return false;
		}
		if (!cv.address.value) {
			alert("회원주소를 입력해주세요.")
			cv.address.focus();
			return false;
		}
		if (!cv.joindate.value) {
			alert("가입일자를 입력해주세요.")
			cv.joindate.focus();
			return false;
		}
		if (!cv.grade.value) {
			alert("고객 등급을 입력해주세요.")
			cv.grade.focus();
			return false;
		}
		if (!cv.city.value) {
			alert("도시코드를 입력해주세요.")
			cv.city.focus();
			return false;
		}

		alert("회원정보가 수정되었습니다.")
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
		<h3 class="title">홈쇼핑 회원정보 수정</h3>
		<form name="data" action="update_p.jsp" method="post"
			onsubmit="return checkValue()">
			<table class="table_line">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value="<%= rs.getString("custno")%>" readonly
						size="10"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" value="<%= rs.getString("custname")%>" size="10"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" value="<%= rs.getString("phone")%>" size="15"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" value="<%= rs.getString("address")%>" size="25" ></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value="<%= rs.getString("joindate")%>" size="10" ></td>
				</tr>
				<tr>
					<th>고객등급 A-VIP B-일반 C-직원</th>
					<td><input type="text" name="grade" value="<%= rs.getString("grade")%>" size="10" ></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" value="<%= rs.getString("city")%>" size="10" ></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정">
						<input type="button" value="조회"
						onclick="location.href='member_list.jsp'"></td>
				</tr>
			</table>
		</form>
	</main>
	<footer>
		<jsp:include page="./Layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>
