<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>form</title>
<link rel="stylesheet" href="css/style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="js/script.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function() {
		$("#applD").datepicker(
				{
					dateFormat : 'yymmdd' //Input Display Format 변경
					,
					showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
					,
					showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
					,
					changeYear : true //콤보박스에서 년 선택 가능
					,
					changeMonth : true //콤보박스에서 월 선택 가능                
					,
					showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
					,
					yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
					,
					monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
							'9', '10', '11', '12' ] //달력의 월 부분 텍스트
					,
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
					,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
					,
					dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
							'토요일' ] //달력의 요일 부분 Tooltip 텍스트
					,
					maxDate : "0" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
				});
	});

	$(function() {
		$("#rcvD").datepicker(
				{
					dateFormat : 'yymmdd' //Input Display Format 변경
					,
					showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
					,
					showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
					,
					changeYear : true //콤보박스에서 년 선택 가능
					,
					changeMonth : true //콤보박스에서 월 선택 가능                
					,
					showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
					,
					yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
					,
					monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
							'9', '10', '11', '12' ] //달력의 월 부분 텍스트
					,
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
					,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
					,
					dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
							'토요일' ] //달력의 요일 부분 Tooltip 텍스트
					,
					maxDate : "0" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
				});
	});

	function vali() {

		var scrtNo = $("#scrtNo").val();
		if (/(\w)\1\1\1/.test(scrtNo) || isContinuedValue(scrtNo)) {
			alert("비밀번호에 4자 이상의 연속 또는 반복 문자 및 숫자를 사용하실 수 없습니다.");
			return false;
		}

		if ($("#ssn").val() == "") {
			alert("주민번호를 입력해주세요.");
			return false;
		}

		if ($("#applD").val() == "") {
			alert("신청일자를 입력해주세요.");
			return false;
		}

		if ($("#hgNm").val() == "") {
			alert("한글 성명을 입력해주세요.");
			return false;
		}

		if ($("#engNm").val() == "") {
			alert("영문 성명을 입력해주세요.");
			return false;
		}

		if ($("#birthD").val() == "") {
			alert("생년월일을 입력해주세요.");
			return false;
		}

		if ($("#stlAct").val() == "") {
			alert("결제계좌를 입력해주세요.");
			return false;
		}

		if ($("#billadrZip").val() == "") {
			alert("우편번호를 입력해주세요.");
			return false;
		}

		if ($("#billadrAdr1").val() == "") {
			alert("기본주소를 입력해주세요.");
			return false;
		}

		if ($("#billadrAdr2").val() == "") {
			alert("상세주소를 입력해주세요.");
			return false;
		}

		if ($("#emailAdr").val() == "") {
			alert("이메일을 입력해주세요.");
			return false;
		}

		if ($("#hdpNo").val() == "") {
			alert("핸드폰 번호를 입력해주세요.");
			return false;
		}

		if (scrtNo == "") {
			alert("비밀번호를 입력해주세요.");
			return false;
		}

		if (scrtNo.length > 10) {
			alert("비밀번호는 10자리 이내로 입력하세요.");
			return false;
		}

		if (scrtNo.indexOf($("#birthD").val()) > -1) {
			alert("생년월일과 같게 입력하실 수 없습니다.");
			return false;
		}

		if (scrtNo.indexOf(($("#hdpNo").val()).substring(3, 6)) > -1) {
			alert("휴대폰 번호와 같게 입력하실 수 없습니다.");
			return false;
		}

		if (scrtNo.indexOf(($("#hdpNo").val()).substring(7, 10)) > -1) {
			alert("휴대폰 번호와 같게 입력하실 수 없습니다.");
			return false;
		}

		//-------------------------주민번호 & 나이 유효성 체크 Start----------------------------------
		var ssn = $("[name=ssn]").val();

		var nByear, nTyear;
		var today;

		today = new Date();
		nTyear = today.getFullYear();

		if (parseInt(ssn.substring(6, 7), 10) < 3) {
			nByear = 1900 + parseInt(ssn.substring(0, 2), 10);
		} else {
			nByear = 2000 + parseInt(ssn.substring(0, 2), 10);
		}
		nAge = nTyear - nByear;
		alert('만' + nAge + '세 입니다. ' + '신청 가능한 나이입니다.');

		if (nAge < 19) {
			alert('만 19세 이상만 신청이 가능합니다');
			return false;
		}
		//-------------------------주민번호 & 나이 유효성 체크 End------------------------------

		//-------------------------접수일자 & 신청일자 유효성 체크 Start-------------------------
		var rcv_d = $("[name=rcvD]").val();
		var appl_d = $("[name=applD]").val();

		if (rcv_d < appl_d) {
			alert('신청일자가 접수일자보다 뒤에 있을수 없습니다.\n 다시 확인해주세요');
			return false
		}
		//-------------------------접수일자 & 신청일자 유효성 체크 End---------------------------

		alert("신청되었습니다.");

	}

	function isContinuedValue(value) {
		console.log("value = " + value);
		var intCnt1 = 0;
		var intCnt2 = 0;
		var temp0 = "";
		var temp1 = "";
		var temp2 = "";
		var temp3 = "";

		for (var i = 0; i < value.length - 3; i++) {
			console.log("=========================");
			temp0 = value.charAt(i);
			temp1 = value.charAt(i + 1);
			temp2 = value.charAt(i + 2);
			temp3 = value.charAt(i + 3);

			console.log(temp0)
			console.log(temp1)
			console.log(temp2)
			console.log(temp3)

			if (temp0.charCodeAt(0) - temp1.charCodeAt(0) == 1
					&& temp1.charCodeAt(0) - temp2.charCodeAt(0) == 1
					&& temp2.charCodeAt(0) - temp3.charCodeAt(0) == 1) {
				intCnt1 = intCnt1 + 1;
			}

			if (temp0.charCodeAt(0) - temp1.charCodeAt(0) == -1
					&& temp1.charCodeAt(0) - temp2.charCodeAt(0) == -1
					&& temp2.charCodeAt(0) - temp3.charCodeAt(0) == -1) {
				intCnt2 = intCnt2 + 1;
			}
			console.log("=========================");
		}

		console.log(intCnt1 > 0 || intCnt2 > 0);
		return (intCnt1 > 0 || intCnt2 > 0);
	}

</script>
</head>

<body>
	<form action="write.do" name="write" method="post"
		onsubmit="return vali();">
		<div class="container">
			<br />
			<div class="row">
				<div class="col-md-12">
					<a href="index.jsp">Index</a> <a href="search.do">Search</a>
				</div>
			</div>
			<br />
			<div class="row style1">
				<div class="col-md-3">
					주민번호 <input type="text" id="ssn" name="ssn"
						onkeyup="eventKeyup(this.value)" maxlength="13"
						oninput="this.value = this.value.replace(/([^0-9])/ig, '').replace(/(\..*)\./g, '$1');"
						value="${formDetail.ssn}">
				</div>
				<div class="col-md-3">
					접수일자 <input type="text" id="rcvD" name="rcvD" readonly="readonly" value="${formDetail.rcvD}">
				</div>
				<div class="col-md-3">
					접수 일련번호 <input type="text" id="rcvSeqNo" name="rcvSeqNo"
						readonly="readonly" style="background-color: #e2e2e2;" value="${fn:trim(formDetail.rcvSeqNo) }">
				</div>
				<div class="col-md-2">
					<input id="detail" type="button" value="조회">
				</div>
				<div class="col-md-1"></div>
			</div>
			<br /> <br />
			<div class="row style1">
				<div class="col-md-3">
					신청일자 <input type="number" id="applD" name="applD"
						readonly="readonly" value="${formDetail.applD }">

				</div>
				<div class="col-md-3">
					신청구분 <select id="applClas" name="applClas">
						<c:forEach items="${applClasList }" var="applClas">
							<option value="${fn:trim(applClas.code) }">${applClas.codeNm }</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-3">
					브랜드 <select id="brd" name="brd">
						<c:forEach items="${brdList }" var="brd">
							<option value="${fn:trim(brd.code) }">${brd.codeNm }</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-3"></div>
			</div>

			<br />
			<div class="row style1">
				<div class="col-md-3">
					성명(한글) <input type="text" id="hgNm" name="hgNm"
						oninput="this.value = this.value.replace(/([^가-힣ㄱ-ㅎㅏ-ㅣ])/ig, '').replace(/(\..*)\./g, '$1');"
						value="${fn:trim(formDetail.hgNm) }"/>
				</div>
				<div class="col-md-3">
					성명(영문) <input type="text" id="engNm" name="engNm"
						oninput="this.value = this.value.replace(/[^A-Za-z\s]/ig, '').replace(/(\..*)\./g, '$1');"
						value="${fn:trim(formDetail.engNm) }" />
				</div>
				<div class="col-md-3">
					생년월일 <input type="number" id="birthD" name="birthD"
						readonly="readonly" style="background-color: #e2e2e2;"
						value="${fn:trim(formDetail.birthD) }" >
				</div>
				<div class="col-md-3"></div>
			</div>
			<br />
			<div class="row style1">
				<div class="col-md-3">
					결제일자 <select id="stlDd" name="stlDd">
						<c:forEach items="${stlDdList }" var="stlDd">
							<option value="${fn:trim(stlDd.code) }">${stlDd.codeNm }</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-3">
					결제방법 <select id="stlMtd" name="stlMtd">
						<c:forEach items="${stlMtdList }" var="stlMtd">
							<option value="${fn:trim(stlMtd.code) }">${stlMtd.codeNm }</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-3">
					결제은행 <select id="bnkCd" name="bnkCd">
						<c:forEach items="${bnkCdList }" var="bnkCd">
							<option value="${fn:trim(bnkCd.code) }">${bnkCd.codeNm }</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-3"></div>
			</div>
			<br />

			<div class="row style1">
				<div class="col-md-3">
					결제계좌 <input type="text" id="stlAct" name="stlAct"
						oninput="this.value = this.value.replace(/([^0-9])/ig, '').replace(/(\..*)\./g, '$1');"
						value="${fn:trim(formDetail.stlAct) }" />
				</div>
				<div class="col-md-3"></div>
				<div class="col-md-3"></div>
				<div class="col-md-3"></div>
			</div>
			<br />
			<div class="row style1">
				<div class="col-md-3">
					청구서 발송방법 <select id="stmtSndMtd" name="stmtSndMtd">
						<c:forEach items="${stmtSndMtdList }" var="stmtSndMtd">
							<option value="${fn:trim(stmtSndMtd.code) }">${stmtSndMtd.codeNm }</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-6">
					우편번호 <input type="number" id="billadrZip" name="billadrZip"
						readonly="readonly" value="${fn:trim(formDetail.billadrZip) }" > <input type="button"
						onclick="postCode()" value="우편번호 찾기"> <input type="text"
						id="billadrAdr1" name="billadrAdr1" readonly="readonly" value="${fn:trim(formDetail.billadrAdr1) }"> <input
						type="text" id="billadrAdr2" name="billadrAdr2" value="${fn:trim(formDetail.billadrAdr2) }">
				</div>
				<div class="col-md-3"></div>
			</div>
			<br />
			<div class="row style1">
				<div class="col-md-3">
					이메일 <input type="text" id="emailAdr" name="emailAdr" value="${fn:trim(formDetail.emailAdr) }">
				</div>
				<div class="col-md-3">
					핸드폰 번호 <input type="text" id="hdpNo" name="hdpNo" maxlength="11"
						oninput="this.value = this.value.replace(/([^0-9])/ig, '').replace(/(\..*)\./g, '$1');"
						value="${fn:trim(formDetail.hdpNo) }" />
				</div>
				<div class="col-md-3">
					비밀번호 <input type="password" id="scrtNo" name="scrtNo" value="${fn:trim(formDetail.scrtNo) }">
				</div>
				<div class="col-md-3"></div>
			</div>
			<br />
			<div class="row style1">
				<div class="col-md-3">
					불능구분 <input type="text" id="impsbClas" name="impsbClas"
						readonly="readonly" style="background-color: #e2e2e2;" value="${fn:trim(formDetail.impsbClas) }">
				</div>
				<div class="col-md-3">
					불능 사유명 <input type="text" name="impsbCd" readonly="readonly"
						style="background-color: #e2e2e2;" value="${fn:trim(formDetail.impsbCd) }">
				</div>
				<div class="col-md-6"></div>
			</div>
			<br />
			<div class="row style1">
				<div class="col-md-9"></div>
				<div class="col-md-2">
					<button id="formSubmit" type="submit">등록</button>
					<button id="formEdit" type="submit">수정</button>
					<button type="reset">초기화</button>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
	</form>
</body>

</html>