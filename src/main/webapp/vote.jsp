<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="css/style.css">
<script type="text/javascript">
	function checkValue(){
		if(!document.data.v_jumin.value) {
			alert("주민번호가 입력되지 않았습니다.");
			data.v_jumin.focus();
			return false;
		}
		else if(!document.data.v_name.value) {
			alert("성명이 입력되지 않았습니다.");
			data.n_name.focus();
			return false;
		}
		else if (!document.data.m_no.value) {
			alert("후보번호를 입력하세요.");
			data.m_no.focus();
			return false;
		} 
		else if (!document.data.v_time.value) {
			alert("투표시간을 입력하세요.");
			data.v_time.focus();
			return false;
		} 
		else if (!document.data.v_area.value) {
			alert("투표장소 입력하세요.");
			data.v_area.focus();
			return false;
		}  
		else if (!document.data.v_confirm.value) {
			alert("유권자확인을 입력하세요.");
			data.v_confirm.focus();
			return false;
		}
		alert("투표하기 정보가 정삭적으로 등록되었습니다!");
		return true;
	}
	
	function refe() {
		return location.href='vote.jsp';
	}
</script>
</head>
<body>
<header>
	<jsp:include page = "layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page = "layout/nav.jsp"></jsp:include>
</nav>
<section class = "section">
	<h2>투표하기</h2>
	<form action="vote_p.jsp" name="data" method="post" onsubmit="return checkValue()">
		<table border="1" style="margin-left: auto; margin-right: auto; width : 640px; height : 250px; border-collapse : collapse;">
			<tr>
				<th>주민번호</th>
				<td style="padding : 0 12px;"><input type="text" name = "v_jumin"></input> 예 : 8906153154726</td>
			</tr>
			<tr>
				<th>성명</th>
				<td style="padding : 0 12px;"><input type="text" name = "v_name"></input></td>
			</tr>
			<tr>
				<th>후보번호</th>
				<td style="padding : 0 12px;">
					<select name="m_no">
					<option value="1">[1] 김후보</option>
					<option value="2">[2] 이후보</option>
					<option value="3">[3] 박후보</option>
					<option value="4">[4] 조후보</option>
					<option value="5">[5] 최후보</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<th>투표시간</th>
				<td style="padding : 0 12px;"><input type="text" name = "v_time"></input></td>
			</tr>
			<tr>
				<th>투표장소</th>
				<td style="padding : 0 12px;"><input type="text" name = "v_area"></input></td>
			</tr>
			<tr>
				<th>유권자 확인</th>
				<td style="padding : 0 12px;">
				<input type="radio" name="v_confirm" value="Y"></input>확인
				<input type="radio" name="v_confirm" value="N"></input>미확인
				</td>
			</tr>
			<tr>
				<td colspan = "2" style = "text-align : center;">
					<input type="submit" value="투표하기"></input>
					<input type="button" value="다시쓰기" onclick="refe()"></input>
				</td>
			</tr>
		</table>
	</form>
</section>
<footer>
	<jsp:include page = "layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>