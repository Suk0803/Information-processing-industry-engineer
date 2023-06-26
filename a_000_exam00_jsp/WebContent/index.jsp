<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>header</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css?ver1.3">
</head>

<body>
	<header>
		<jsp:include page="Layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="Layout/nav.jsp"></jsp:include>
	</nav>
	<!--  
	<section>
		<jsp:include page="Layout/section.jsp"></jsp:include>
	</section> 
	-->
	<main class="section">
		<h2>쇼핑몰 회원관리 프로그램</h2>
		<p>
			쇼핑몰회원관리 프로그램이다.<br>
			프로그램 작성 순서<br>
			1. 회훤정보 테이블을 생성한다.<br>
			2. 매출정보 테이블을 생성한다.<br>
			3. 회원정보, 매출정보 테이블에서 제시된 문제지의 참조데이터를 추가 생성한다.<br>
			4. 회훤정보 입력 화면프로그램을 작성한다.<br>
			5. 회원정보 조회 프로그램을 작성한다.<br>
			6. 회원매출정보 조회 프로그램을 작성한다.<br>
		</p>
	</main>
	<footer>
		<jsp:include page="Layout/footer.jsp"></jsp:include>	
	</footer>
</body>
</html>