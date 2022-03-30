<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("joinID");
	String pw = request.getParameter("joinPW");
	String nickname = request.getParameter("nickname");
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "hr";
		String db_pw = "hr";
		
		Connection conn = DriverManager.getConnection(db_url, db_id, db_pw);
		if(conn != null){
			System.out.println("Connect Success...");
		} else {
			System.out.println("Connect Fail...");
		}
		
		String sql = "insert into member values(?, ?, ?)";
				
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, id);
		psmt.setString(2, pw);
		psmt.setString(3, nickname);
		
		int cnt = psmt.executeUpdate();
		
		if(cnt > 0){
			System.out.println("Sign in Success..");
			response.sendRedirect("./JoinSuccess.jsp?nickname=" + URLEncoder.encode(nickname, "UTF-8"));
		} else {
			System.out.println("Sign in Fail...");
			response.sendRedirect("./JoinFalse.jsp");
		}
	} catch(Exception e){
		e.printStackTrace();
	}
	
%>
</body>
</html>