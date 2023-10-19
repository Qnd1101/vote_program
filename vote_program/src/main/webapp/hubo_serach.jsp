<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "DB.DBConnect" %>
<%@ page import = "java.sql.*" %>
<%
    String sql="select M_NO, M_NAME, P_NAME, "+
    "case when P_SCHOOL = '1' then '고졸' when P_SCHOOL = '2' then '학사' when P_SCHOOL = '3' then '석사' else '박사' end as P_SCHOOL, "+
    "M_JUMIN, M_CITY, P_TEL1, P_TEL2, P_TEL3 "+
    "from TBL_MEMBER_202005 left join TBL_PARTY_202005 using (P_CODE)";

    Connection conn = DBConnect.getConnection();
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
    

    String phone = null;
    %>
    
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
	<jsp:include page = "layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page = "layout/nav.jsp"></jsp:include>
</nav>
<section class = "section">
	<h2>후보조회</h2>
	<table border = "1" style="margin-left: auto; margin-right: auto; text-align : center; width : 640px;">
		<tr>
			<th>후보번호</th>
			<th>성명</th>
			<th>소속정당</th>
			<th>학력</th>
			<th>주민번호</th>
			<th>지역구</th>
			<th>대표전화</th>
		</tr>
		<%while(rs.next()) { %>
		<%
		String str1 = rs.getString("P_TEL1");
		String str2 = rs.getString("P_TEL2");
		String str3 = rs.getString("P_TEL3");
		phone = str1.replace(" ", "") + "-" + str2 + "-" + str3;
		%>
		
		<tr>
			<td><%=rs.getString("M_NO") %></td>
			<td><%=rs.getString("M_NAME") %></td>
			<td><%=rs.getString("P_NAME") %></td>
			<td><%=rs.getString("P_SCHOOL") %></td>
			<%
			    String jumin = rs.getString("M_JUMIN").substring(0,6)  + "-" +rs.getString("M_JUMIN").substring(6) ;
			%>
			<td><%=jumin%></td>
			<td><%=rs.getString("M_CITY") %></td>
			<td><%=phone %></td>
		</tr>
		<% } %>
	</table>
</section>
<footer>
	<jsp:include page = "layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>