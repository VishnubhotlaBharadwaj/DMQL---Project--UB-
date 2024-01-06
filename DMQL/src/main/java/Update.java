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
public class Update extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res)
	{
		String name=req.getParameter("Name");
		String phone=req.getParameter("phone");
		String p_address=req.getParameter("p_address");
		String s_address=req.getParameter("s_address");
		String State=req.getParameter("State");
		String City=req.getParameter("City");
		String Country=req.getParameter("Country");
		String pc=req.getParameter("PostalCode");
		String email=req.getParameter("email");
		String psw=req.getParameter("psw");
		String psw1=req.getParameter("psw-repeat");
		String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="";
		
		Connection c = null;
		try {
		       Class.forName("org.postgresql.Driver");
		       c = DriverManager
		          .getConnection("jdbc:postgresql://localhost:5432/UB_DMQL_Project","postgres", "6989");
		       c.setAutoCommit(false);
		       System.out.println("Opened database successfully");
		       Statement stmt = null,stmt1;
		       PreparedStatement st;
		       if(phone!=null && phone!="")
				{
		    	   st = c.prepareStatement("Update ub_dmql_customers SET phonenumber = ? WHERE customername = ?");
		    	   st.setString(1,phone);
		    	   st.setString(2,name);
		    	   st.executeUpdate();
		    	   c.commit();
				}
				if(email!=null && email!="")
				{
					st = c.prepareStatement("Update ub_dmql_customers SET emailid = ? WHERE customername = ?");
			    	   st.setString(1,email);
			    	   st.setString(2,name);
			    	   st.executeUpdate();
			    	   c.commit();
				}
				st = c.prepareStatement( "select contactid from ub_dmql_customers where customername= ?" );
				st.setString(1, name);
				int contactId=0;
				ResultSet rs=st.executeQuery();
				while(rs.next())
				{
					contactId=rs.getInt("contactid");
				}
				if(p_address!=null && p_address!="")
				{
					st = c.prepareStatement("Update ub_dmql_address_details SET address1 = ? WHERE contactid = ?");
			    	   st.setString(1,p_address);
			    	   st.setInt(2,contactId);
			    	   st.executeUpdate();
			    	   c.commit();
				}
				if(s_address!=null && s_address!="")
				{
					st = c.prepareStatement("Update ub_dmql_address_details SET address2 = ? WHERE contactid = ?");
			    	   st.setString(1,s_address);
			    	   st.setInt(2,contactId);
			    	   st.executeUpdate();
			    	   c.commit();
				}
				if(City!=null && City!="")
				{
					st = c.prepareStatement("Update ub_dmql_address_details SET city = ? WHERE contactid = ?");
			    	   st.setString(1,City);
			    	   st.setInt(2,contactId);
			    	   st.executeUpdate();
			    	   c.commit();
				}
				if(State!=null && State!="")
				{
					st = c.prepareStatement("Update ub_dmql_address_details SET state = ? WHERE contactid = ?");
			    	   st.setString(1,State);
			    	   st.setInt(2,contactId);
			    	   st.executeUpdate();
			    	   c.commit();
				}
				if(pc!=null && pc!="")
				{
					int PostalCode=Integer.parseInt(pc);
					st = c.prepareStatement("Update ub_dmql_address_details SET postalcode = ? WHERE contactid = ?");
			    	   st.setInt(1,PostalCode);
			    	   st.setInt(2,contactId);
			    	   st.executeUpdate();
			    	   c.commit();
				}
				if(Country!=null && Country!="")
				{
					st = c.prepareStatement("Update ub_dmql_address_details SET country = ? WHERE contactid = ?");
			    	   st.setString(1,Country);
			    	   st.setInt(2,contactId);
			    	   st.executeUpdate();
			    	   c.commit();
				}
				RequestDispatcher ds = req.getRequestDispatcher("loggedin.jsp");
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
