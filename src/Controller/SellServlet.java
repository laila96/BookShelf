package Controller;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class SellServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		   String name = req.getParameter("name");
		   String author = req.getParameter("author");
		   String description = req.getParameter("description");
		   String prix = req.getParameter("prix");
		   
		
		   
		   try {
			   
				Class.forName("com.mysql.jdbc.Driver");
				Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/jeegeti","root","");
			    PreparedStatement pr =  (PreparedStatement) cnx.prepareStatement(
						"insert into sell (idSell,id,name,author, description,prix) values (default,default,?,?,?,?)"
						);
				
				   pr.setString(1,name);
				   pr.setString(2,author );
				   pr.setString(3, description);
				   pr.setString(4,prix );
				   
				   pr.executeUpdate();
				   pr.close();
					   
				   resp.sendRedirect("listSell.jsp");   
				   
				   
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		
		
	}
	
	
}