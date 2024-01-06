import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Delete extends HttpServlet{
public void service(HttpServletRequest req,HttpServletResponse res)
{
	String username=req.getParameter("username");
	String Password=req.getParameter("password");
	Connection c = null;
	try {
		Class.forName("org.postgresql.Driver");
	       c = DriverManager
	          .getConnection("jdbc:postgresql://localhost:5432/UB_DMQL_Project","postgres", "6989");
	       c.setAutoCommit(false);
	       System.out.println("Opened database successfully");
	       Statement stmt = c.createStatement();
	       PreparedStatement st=c.prepareStatement("Select contactid from ub_dmql_customers where emailid = ?");
	       st.setString(1,username);
	       ResultSet rs = st.executeQuery();
	       int contactId=0;
	       while(rs.next())
	       {
	    	   contactId=rs.getInt("contactid");
	       }
	       st=c.prepareStatement("DELETE FROM ub_dmql_customers WHERE emailid = ?");
	       st.setString(1,username);
	       st.executeUpdate();
	       c.commit();
	       st=c.prepareStatement("DELETE FROM ub_dmql_address_details WHERE contactid = ?");
	       st.setInt(1,contactId);
	       st.executeUpdate();
	       c.commit();
		    PrintWriter out = res.getWriter();
		    String val="Deleted successfully";
	           out.println("<!DOCTYPE html>");
	           out.println("<html>");
	           out.println("<head>");
	           out.println("<title>Servlet NewServlet</title>");            
	           out.println("</head>");
	           out.println("<body onLoad=\"showResult();\">");
	           out.println("<script>");
	           out.println("function showResult(){");
	           out.println("alert(\""+val+"\")");
	           out.println("}");
	           out.println("</script>");
	           out.println("</body>");
	           out.println("</html>");
	           RequestDispatcher ds = req.getRequestDispatcher("login.jsp");
			    try {
					ds.include(req, res);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
	}
	catch (Exception e) {
	       System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	       System.exit(0);
	    }
}
}
