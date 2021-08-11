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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function postCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("billadrAdr2").value = extraAddr;

				} else {
					document.getElementById("billadrAdr2").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('billadrZip').value = data.zonecode;
				document.getElementById("billadrAdr1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				/* document.getElementById("sample6_detailAddress").focus(); */
			}
		}).open();
	}

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

	function isContinuedValue(value) {
		console.log("value = " + value);
		var intCnt1 = 0;
		var intCnt2 = 0;
		var temp0 = "";
		var temp1 = "";
		var temp2 = "";
		var temp3 = "";

		for (var i = 0; i < value.length - 3; i++) {
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
		}

		console.log(intCnt1 > 0 || intCnt2 > 0);

		return (intCnt1 > 0 || intCnt2 > 0);
	}

	function eventKeyup(str) {
		if (str != '') {
			if (str.substring(6) == '1' || str.substring(6) == '2') {
				$("#birthD").val("19" + str.substring(0, 6)); // jQuery 이용
				//document.all.afterAmt.value = str;    // jsp name 이용
				//document.getElementById("afterAmt").value = str;   // jsp id 이용
			}

			if (str.substring(6) == '3' || str.substring(6) == '4') {
				$("#birthD").val("20" + str.substring(0, 6)); // jQuery 이용
				//document.all.afterAmt.value = str;    // jsp name 이용
				//document.getElementById("afterAmt").value = str;   // jsp id 이용
			}
		}
	}

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

		$.ajax({
			url : 'ssnChk.do',
			type : 'post',
			dataType : 'json',
			async : false,
			data : {
				'ssn' : $('#ssn').val(),
				'applD' : $('#applD').val(),
				'applClas' : $('#applClas').val()
			},
			success : function(data) {
				if (data == 1) {
					alert("신청하신 내역이 이미 있어 신청이 불가능합니다.");
					return false;
					console.log(data)
				}
			},
			error : function(e) {
				console.log($('#ssn').val())
			}
		});

		$.ajax({
			url : 'brdChk.do',
			type : 'post',
			dataType : 'json',
			async : false,
			data : {
				'ssn' : $('#ssn').val(),
				'brd' : $('#brd').val(),
			},
			success : function(data) {
				if (data == 1) {
					alert("2개 이상의 동일한 브랜드를 가질 수 없습니다.");
					return false;

				}
			},
			error : function(e) {
				console.log(data)
			}
		});
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
						oninput="this.value = this.value.replace(/([^0-9])/ig, '').replace(/(\..*)\./g, '$1');" />
				</div>
				<div class="col-md-3">
					접수일자 <input type="number" id="rcvD" name="rcvD" readonly="readonly">
				</div>
				<div class="col-md-3">
					접수 일련번호 <input type="number" id="rcvSeqNo" name="rcvSeqNo"
						readonly="readonly" style="background-color: #e2e2e2;">
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
						readonly="readonly">

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
						oninput="this.value = this.value.replace(/([^가-힣ㄱ-ㅎㅏ-ㅣ])/ig, '').replace(/(\..*)\./g, '$1');" />
				</div>
				<div class="col-md-3">
					성명(영문) <input type="text" id="engNm" name="engNm"
						oninput="this.value = this.value.replace(/[^A-Za-z\s]/ig, '').replace(/(\..*)\./g, '$1');" />
				</div>
				<div class="col-md-3">
					생년월일 <input type="number" id="birthD" name="birthD"
						readonly="readonly" style="background-color: #e2e2e2;">
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
						oninput="this.value = this.value.replace(/([^0-9])/ig, '').replace(/(\..*)\./g, '$1');" />
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
						readonly="readonly"> <input type="button"
						onclick="postCode()" value="우편번호 찾기"> <input type="text"
						id="billadrAdr1" name="billadrAdr1" readonly="readonly"> <input
						type="text" id="billadrAdr2" name="billadrAdr2">
				</div>
				<div class="col-md-3"></div>
			</div>
			<br />
			<div class="row style1">
				<div class="col-md-3">
					이메일 <input type="text" id="emailAdr" name="emailAdr">
				</div>
				<div class="col-md-3">
					핸드폰 번호 <input type="text" id="hdpNo" name="hdpNo" maxlength="11"
						oninput="this.value = this.value.replace(/([^0-9])/ig, '').replace(/(\..*)\./g, '$1');" />
				</div>
				<div class="col-md-3">
					비밀번호 <input type="password" id="scrtNo" name="scrtNo">
				</div>
				<div class="col-md-3"></div>
			</div>
			<br />
			<div class="row style1">
				<div class="col-md-3">
					불능구분 <input type="text" id="impsbClas" name="impsbClas"
						readonly="readonly" style="background-color: #e2e2e2;">
				</div>
				<div class="col-md-3">
					불능 사유명 <input type="text" readonly="readonly"
						style="background-color: #e2e2e2;">
				</div>
				<div class="col-md-6"></div>
			</div>
			<br />
			<div class="row style1">
				<div class="col-md-9"></div>
				<div class="col-md-2">
					<button id="formSubmit" type="submit">등록</button>
					<button>수정</button>
					<button type="reset">초기화</button>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
	</form>
</body>

</html>