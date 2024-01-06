import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
public class Ordersearch extends HttpServlet {
public void service(HttpServletRequest req,HttpServletResponse res)
{
    String search=req.getParameter("q");
	Connection c = null;
	try {
	       Class.forName("org.postgresql.Driver");
	       c = DriverManager
	          .getConnection("jdbc:postgresql://localhost:5432/UB_DMQL_Project","postgres", "6989");
	       c.setAutoCommit(false);
	       System.out.println("Opened database successfully");
	       Statement stmt = c.createStatement();
	       String QUERY="Select * from ub_dmql_product where productname like '%"+search+"%'" ;
	         ResultSet rs = stmt.executeQuery(QUERY);		  
	         res.setContentType("text/html");
	            PrintWriter out = res.getWriter();
	            out.println("<html><body>");
	            out.println("<h3>Mobile Phone Details</h3>");
	            out.println("<table border=1><tr>" + "<td><b>productid</b></td>" + "<td><b>productname</b></td>"
	                    + "<td><b>descreption</b></td>" + "<td><b>price</b></td>"
	                    + "<td><b>image</b></td></tr>");
	         while(rs.next()){
	            //Display values
	            int productid=rs.getInt("productid");
	            String productname=rs.getString("productname");
	            String description=rs.getString("description");
	            Float price=rs.getFloat("price");
	            String image=rs.getString("image");
	            out.println("<tr>" + "<td>" + productid + "</td>" + "<td>" + productname + "</td>" + "<td>" + description + "</td>"
                        + "<td>" + price + "</td>" + "<td>" +"<image src="+image+"height=50 width=50 >" + "</td></tr>");
	         }
	         out.println("</table></body></html>");
	         out.println("<<form id=\"form\" action=\"searchOrder\"> \r\n"
		         		+ "  <input type=\"search products with product names\" id=\"query\" name=\"q\" placeholder=\"Search...\">\r\n"
		         		+ "  <button>Search</button>\r\n"
		         		+ "</form>");
	         rs.close();
	            stmt.close();
	            out.close();
	}
	catch (Exception e) {
	       System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	       System.exit(0);
	    }
}
}
