<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="Layout/DB_connect.jsp" %>
<%
	String sql = "select custno, custname, phone, address, "
			+"to_char(joindate, 'yyyy-mm-dd') joindate, "
			+"decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원', '누락') grade, "
			+"city from member_tbl_02";
			
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
%>
<!DOCTYPE html>  
<html>
<head>
	<meta charset="UTF-8">
	<title>header</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css?ver1.2.1">
	<script type="text/javascript">
		function checkDel(custno){
			
			msg="정말로 삭제하시겠습니까? 되돌릴수 없습니다";
			if(confirm(msg)!=0){
				location.href = "delete.jsp?custno="+custno;
				alert("정상적으로 삭제 되었습니다.");   
			} else{
				alert("취소되었습니다.");
				return;
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
		<h3 class="title">회원목록조회/수정</h3>
		<div class="scroll">
			<table class="table_line">
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>거주지역</th>
					<th>수정 및 삭제</th>
				</tr>
				<%
				while (rs.next()){
				%>
				<tr align="center">
					<td><a href="update.jsp?custno=<%= rs.getString("custno") %>" style="color:blue"><%= rs.getString("custno") %></a></td>				
					<td><%= rs.getString("custname") %></td>				
					<td><%= rs.getString("phone") %></td>				
					<td><%= rs.getString("address") %></td>				
					<td><%= rs.getString("joindate") %></td>				
					<td><%= rs.getString("grade") %></td>				
					<td><%= rs.getString("city") %></td>
					<td>
						<input type="button" value="수정" onclick="document.location.href='update.jsp?custno=<%= rs.getString("custno") %>'">
						<input type="button" value="삭제" onclick="checkDel(<%= rs.getString("custno") %>);">
						<input type="button" value="조회">
					</td>		
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