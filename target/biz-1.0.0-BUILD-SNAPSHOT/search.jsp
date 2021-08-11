<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>search</title>
<link rel="stylesheet" href="css/style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>
</head>

<body>
	<form action="list.do" method="post">
		<div class="container">
			<br />
			<div class="row style1">
				<div class="col-md-5">
					기간 <input type="date"> ~ <input type="date">
				</div>
				<div class="col-md-3">
					신청구분 <select name="applClas">
						<option value="11">11</option>
					</select>
				</div>
				<div class="col-md-3">
					주민번호 <input type="text" name="ssn">
				</div>
				<div class="col-md-1">
					<button type="submit">조회</button>
				</div>
			</div>
			<div>
				<br />
				<div>
					<table>
						<tr>
							<td>접수일자</td>
							<td>접수 일련번호</td>
							<td>주민번호</td>
							<td>성명(한글)</td>
							<td>성명(영문)</td>
							<td>신청구분</td>
							<td>브랜드</td>
							<td>핸드폰번호</td>
							<td>불능 구분</td>
							<td>불능 사유명</td>
						</tr>
						<c:forEach items="${formList }" var="form">
							<tr>
								<td>${form.rcvD }</td>
								<td>${form.rcvSeqNo }</td>
								<td>${form.ssn }</td>
								<td>${form.hgNm }</td>
								<td>${form.engNm }</td>
								<td>${form.applClas }</td>
								<td>${form.brd }</td>
								<td>${form.hdpNo }</td>
								<td>${form.impsbClas }</td>
								<td>test</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</form>
</body>

</html>