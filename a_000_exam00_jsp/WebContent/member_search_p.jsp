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

	// rs.next();
	// int num = rs.getInt(1);
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
		<h3 class="title">홈쇼핑 회원정보 조회</h3>
		<form name="data" action="member_search.jsp" method="post"
			onsubmit="return checkValue()">
			<table class="table_line">
			
			<%
				if(rs.next()) {
			%>
				<tr>
					<th>회원번호</th>
					<td><%= rs.getString("custno")%></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><%= rs.getString("custname")%></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><%= rs.getString("phone")%></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><%= rs.getString("address")%></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><%= rs.getString("joindate")%></td>
				</tr>
				<tr>
					<th>고객등급 A-VIP B-일반 C-직원</th>
					<td><%= rs.getString("grade")%></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><%= rs.getString("city")%></td>
				</tr>
				
				<%
					} else {
				%>
				
				<tr>
					<td colspan="2" align="center">
					<%= request.getParameter("custno") %>로 등록된 회원을 찾을수 없습니다.</td>
				</tr>
				
				<%
					}
				%>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="취소후 다시조회">
						<input type="button" value="회원목록조회/수정"
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
