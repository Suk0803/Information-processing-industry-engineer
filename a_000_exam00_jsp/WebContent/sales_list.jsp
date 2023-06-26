<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="Layout/DB_connect.jsp" %>
<%
	String sql = "SELECT"
			  +" m.custno scustno, m.custname scustname,"
			  +" DECODE(m.grade, 'A', 'VIP', 'B', '일반', 'C', '직원', m.grade) grade,"
			  +" SUM(n.price) salse"
			  +" FROM member_tbl_02 m, money_tbl_02 n"
			  +" WHERE m.custno = n.custno"
			  +" GROUP BY m.custno, m.custname, m.grade"
			  +" ORDER BY salse desc";
			
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
%>
<!DOCTYPE html>  
<html>
<head>
	<meta charset="UTF-8">
	<title>header</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css?ver1.2.1">
</head>

<body>
	<header>
		<jsp:include page="./Layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="./Layout/nav.jsp"></jsp:include>
	</nav>
	
	<main id="section">
		<h3 class="title">회원매출조회</h3>
		<div class="scroll">
			<table class="table_line">
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>고객등급</th>
					<th>매출</th>
				</tr>
				<%
				while (rs.next()){
				%>
				<tr align="center">			
					<td><%= rs.getString("scustno") %></td>				
					<td><%= rs.getString("scustname") %></td>				
					<td><%= rs.getString("grade") %></td>				
					<td><%= rs.getString("salse") %></td>				
				</tr>
				<%		
				}
				%>
			</table>
		</div>
	</main>
	<footer>
		<jsp:include page="./Layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>   