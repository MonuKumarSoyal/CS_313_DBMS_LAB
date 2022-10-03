package jdbc_demo;

import java.sql.*;
import java.util.Scanner;
public class Driver {

	public static void main(String[] args) {
		try {
			//Get connection
			Connection myConn=DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","");
			Statement myS=myConn.createStatement();
			//Query
			ResultSet result_Set_1 = myS.executeQuery("SELECT * FROM student");			//Display
			while(result_Set_1.next()) {
				System.out.println(result_Set_1.getString("ID")+"  "+result_Set_1.getString("name"));
			}
			
			Statement statement_2= myConn.createStatement();
			Driver driver_2 = new Driver();
			driver_2.listDepartments(statement_2);
			
			PreparedStatement statement_3 = myConn.prepareStatement("select distinct room_number from classroom natural join section where capacity > 30 and not semester "
					+ "in ('Autumn') and not year in (2022) and building = ?");
			Driver driver_3 = new Driver();
			driver_3.listDepartments(statement_3);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void listDepartments(Statement statement_2)
	{
		try{
			 ResultSet result_Set_2 = statement_2.executeQuery("with student_dept(Department,Student_Count) as (select dept_name,count(ID) from student group by dept_name)"
			 		+ "select Department,Student_Count,Instructor_Count "
			 		+ "from student_dept natural join (select dept_name as Department,count(ID) as Instructor_Count from instructor group by dept_name) as instructor_dept "
			 		+ "order by Department asc");
		  System.out.println("Department"+"        "+"Student_Count"+"        "+"Instructor_Count");		 
		  while(result_Set_2.next()) 
			{
				System.out.println(result_Set_2.getString("Department")+"                "+result_Set_2.getString("Student_Count") +"                      "+result_Set_2.getString("Instructor_Count"));
			}
		  
		  }
		
		catch(Exception e)
		  {
			  e.printStackTrace();
		  }

	}
	
	
	public void listDepartments(PreparedStatement statement_3)
	{
		try
		{
			Scanner scan = new Scanner(System.in);
			System.out.println("Enter a building:");
            String build = scan.nextLine();
            statement_3.setString(1, build);
            ResultSet resultSet = statement_3.executeQuery();
            System.out.println("room_number");
            while(resultSet.next()) 
			{
				System.out.println(resultSet.getString("room_number"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}

}
