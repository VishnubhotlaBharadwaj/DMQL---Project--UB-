import java.io.IOException;
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
public class Insert extends HttpServlet{
public void service(HttpServletRequest req,HttpServletResponse res)
{
	String name=req.getParameter("Name");
	String phone=req.getParameter("phone");
	String p_address=req.getParameter("p_address");
	String s_address=req.getParameter("s_address");
	String State=req.getParameter("State");
	String City=req.getParameter("City");
	String Country=req.getParameter("Country");
	int PostalCode=Integer.parseInt(req.getParameter("PostalCode"));
	String email=req.getParameter("email");
	String psw=req.getParameter("psw");
	String psw1=req.getParameter("psw-repeat");
	Connection c = null;
	Statement stmt = null;
    try {
       Class.forName("org.postgresql.Driver");
       c = DriverManager
          .getConnection("jdbc:postgresql://localhost:5432/UB_DMQL_Project","postgres", "6989");
       c.setAutoCommit(false);
       System.out.println("Opened database successfully");

       PreparedStatement st = c.prepareStatement("INSERT INTO ub_dmql_address_details (address1, address2, city, state, country,postalcode) VALUES (?,?,?,?,?,?)");
       st.setString(1, p_address);
       st.setString(2, s_address);
       st.setString(3, City);
       st.setString(4, State);
       st.setString(5, Country);
       st.setInt(6, PostalCode);
       st.executeUpdate();
       st.close();
       stmt = c.createStatement();
       ResultSet rs = stmt.executeQuery( "select contactid from ub_dmql_address_details order by contactid desc limit 1;" );
       int ContactId=0;
       while ( rs.next())
       {
    	   ContactId=rs.getInt("contactid");
       }
       st = c.prepareStatement("INSERT INTO ub_dmql_customers (customername, contactid, emailid, phonenumber) VALUES (?,?,?,?)");
       st.setString(1, name);
	st.setInt(2, ContactId);
       st.setString(3, email);
       st.setString(4, phone);
       st.executeUpdate();
       st.close();
       c.commit();
       c.close();
    } catch (Exception e) {
       System.err.println( e.getClass().getName()+": "+ e.getMessage() );
       System.exit(0);
    }
    System.out.println("Record inserted successfully");
    RequestDispatcher ds = req.getRequestDispatcher("login.jsp");
    try {
		ds.include(req, res);
	} catch (ServletException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}
