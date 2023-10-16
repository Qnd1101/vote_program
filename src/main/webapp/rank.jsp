<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "DB.DBConnect" %>
<%@ page import = "java.sql.*" %>
<%
	String sql = "select me.m_no as 후보번호, me.m_name as 성명, count(vo.m_no) as 총투표건수 "
			+ "from tbl_vote_202005 vo, tbl_member_202005 me "
			+ "where me.m_no = vo.m_no and v_confirm in('Y') "
			+ "group by me.m_no, me.m_name "
			+ "order by 총투표건수 desc";
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="css/style.css">
</head>
<body>
<header>
	<jsp:include page = "layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page = "layout/nav.jsp"></jsp:include>
</nav>
<section class = "section">
	<h2>후보자등수</h2>
	<table border = "1" style="margin-left: auto; margin-right: auto; text-align : center; width : 640px;">
		<tr>
			<th>후보번호</th>
			<th>성명</th>
			<th>총투표건수</th>
		</tr>
		<% while(rs.next()) { %>
		<tr>
			<td><%= rs.getString("후보번호") %></td>
			<td><%= rs.getString("성명") %></td>
			<td><%= rs.getString("총투표건수") %></td>
		</tr>
		<% } %>
	</table>
</section>
<footer>
	<jsp:include page = "layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>