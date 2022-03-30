<%@ page import = "java.sql.*" %>
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
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw]");
		
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
			
			String sql = "select nickname form member where id = ? and pw = ?";
					
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			int cnt = psmt.executeUpdate();
			
			if(cnt > 0){
				System.out.println("Login Success..");
				
			} else {
				System.out.println("Login Fail...");
				
			}
		} catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>