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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		/* $('#detail').on('click', function() {
			detail(); */
		});
    function postCode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
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
    
		$('.formSubmit').on('click', function() {
		    var applD = $( "#applD" ).val();

		    if (applD != "") {
		    	applD.replace(/\-/g,'');
		    	
		    	return applD;
		    }
		});
		
		
	});
	
	

	function detail() {
		$.ajax({
			url : 'detail.do',
			type : 'post',
			dataType : 'json',
			data : {
				'ssn' : $('#ssn').val()
			/* ,
							'rcvD' : $('#rcvD').val(),
							'rcvSeqNo' : $('#rcvSeqNo').val() */
			},
			success : function(data) {
				$('#applD').text(data['form'].applD);
				console.log(data['form'].applD);

			},
			error : function(e) {
				console.log(e);
			}
		});
	}
	
	function vali() {
		var pw = $("#scrtNo").val();
		var postNo = /^\d{3}-\d{3}$/;
		var phone2 = /^\d{4}$/;
		var phone3 = /^\d{4}$/;
		if (pw.length < 6 || pw.length > 12) {
			alert("비밀번호는 6~12자리 이내로 입력하세요.");
			return false;
		}

		if(!phone3.test($("input[id='phone3']").val())) {
			alert("휴대폰 번호는 4자리 입력해주세요.");
			return false;
		}
		
	}

	function fn_idChk() {
		$.ajax({
			url: 'idChk.do',
			type: 'post',
			dataType : 'json',
			data : {'userId' : $('#userId').val()},
			success : function(data) {
				if(data == 1) {
					alert("중복된 아이디입니다.");
				} else if (data == 0) {
					$('#idChk').attr("value", "Y");
					alert("사용 가능한 아이디입니다.");
				}
			}
		});
		
		// .getclass().getname()
		 $(function() {
		${"#applD"}.datepicker({
			  dateFormat: 'yymmdd'
			  ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
              ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
              ,changeYear: true //콤보박스에서 년 선택 가능
              ,changeMonth: true //콤보박스에서 월 선택 가능                
              ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
              ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
              ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
              ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
              ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
              ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
              ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
              ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
              ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
              ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
              ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
			});
		  });
		
		function test() {
			alert("코딩 허접");
		}
</script>


</head>

<body>
	<form action="write.do" name="write" method="post">
		<input type="hidden" name="custNo" value="0001">
		<div class="container">
			<br />
			<div class="row style1">
				<div class="col-md-3">
					주민번호 <input type="text" id="ssn" name="ssn">
				</div>
				<div class="col-md-3">
					접수일자 <input type="date" id="rcvD" name="rcvD" readonly="readonly">
				</div>
				<div class="col-md-3">
					접수 일련번호 <input type="text" id="rcvSeqNo" name="rcvSeqNo"
						readonly="readonly">
				</div>
				<div class="col-md-2">
					<input id="detail" type="button" value="조회">
				</div>
				<div class="col-md-1"></div>
			</div>
			<br /> <br />
			<div class="row style1">
				<div class="col-md-3">
					신청일자 <input type="text" id="applD" name="applD">

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
					성명(한글) <input type="text" id="hgNm" name="hgNm">
				</div>
				<div class="col-md-3">
					성명(영문) <input type="text" id="engNm" name="engNm">
				</div>
				<div class="col-md-3">
					생년월일 <input type="text" id="birthD" name="birthD">
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
					결제계좌 <input type="text" id="stlAct" name="stlAct">
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
					우편번호 <input type="text" id="billadrZip" name="billadrZip">
					<input type="button" onclick="postCode()" value="우편번호 찾기">
					<input type="text" id="billadrAdr1" name="billadrAdr1"> <input
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
					핸드폰 번호 <input type="text" id="hdpNo" name="hdpNo">
				</div>
				<div class="col-md-3">
					비밀번호 <input type="password" id="scrtNo" name="scrtNo">
				</div>
				<div class="col-md-3"></div>
			</div>
			<br />
			<div class="row style1">
				<div class="col-md-3">
					불능구분 <input type="text" id="impsbClas" name="impsbClas">
				</div>
				<div class="col-md-3">
					불능 사유명 <input type="text">
				</div>
				<div class="col-md-6"></div>
			</div>
			<br />
			<div class="row style1">
				<div class="col-md-9"></div>
				<div class="col-md-2">
					<button id="formSubmit" type="submit" onclick="test();">등록</button>
					<button>수정</button>
					<button type="reset">초기화</button>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
	</form>
</body>

</html>