


import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/IssueServlet")
public class IssueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public IssueServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		int student_id = Integer.parseInt(request.getParameter("stu_id"));
		int book_id = Integer.parseInt(request.getParameter("bk_id"));
		String issue_date = request.getParameter("issu_d");


		Connection con = null;
 		String url = "jdbc:mysql://localhost:3306/Library"; //MySQL URL and followed by the database name
 		String username = "universityDB0029"; //MySQL username
 		String password = ""; //MySQL password
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
 		System.out.println("Printing connection object "+con);

		//Prepared Statement to add student data
		PreparedStatement st = con .prepareStatement("insert into issue values(?, ?,?, NULL)");
 		st.setInt(1,student_id);
		st.setInt(2,book_id);
		st.setString(3,issue_date);
		int result=st.executeUpdate();

		//Checks if insert is successful.If yes,then redirects to Result.jsp page 
		if(result>0)
		{
			
			RequestDispatcher rd = request.getRequestDispatcher("IssueResult.jsp");
			rd.forward(request, response);
		}

		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

	
	}


}



