
package Lab5;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Scanner;
import Lab5.Read;
public class Connect {
     /**
     * Connect to a sample database
     * @throws Exception 
     */
	//Method to connect to sqlite database
	public static Connection connect() throws Exception {
		Connection con = null;   
        try {       
    	    Class.forName("org.sqlite.JDBC");
    	    con = DriverManager.getConnection("jdbc:sqlite:C:/db/ProgramFinder.db");
    	    if(con == null)
    	        throw new Exception("Connection to the database is null", null);
    	    con.setAutoCommit(false);
    	} 
    	catch (Exception e){
    	    System.err.println("Problem Encountered!");
    	    e.printStackTrace();
    	    throw e;
    	}
        System.out.println("Opened database successfully.\n");
		return con;
	}
	//Method which displays the options in the menu
	public static void menu() {
		System.out.println("\n>to see the Online and Universities options available for"
				+ " the program mentioned by an Applicant of your choice, type 1");
		System.out.println(">to see the number of Online options available for"
				+ " the program mentioned by an Applicant of your choice, type 2");
		System.out.println(">to see the number of Universities offering"
				+ " the program mentioned by an Applicant of your choice, type 3");
		System.out.println(">to see Universities offering the mentioned program in"
				+ " the same countries as an Applicant's of your choice, type 4");
		System.out.println(">to see the contact information for the universities for"
				+ " the program mentioned by an Applicant of your choice, type 5");
		System.out.println(">to see the program fee for"
				+ " the program mentioned by an Applicant of your choice, type 6");
		System.out.println(">to see the time duration for"
				+ " the program mentioned by an Applicant of your choice, type 7");
		System.out.println(">to see the books available for"
				+ " the program mentioned by an Applicant of your choice, type 8");
		System.out.println(">to see the Scholarships and their"
				+ " eligibility criteria offered by McGill University, type 9");
		System.out.println(">to see the number of other applicants interested"
				+ "  in the program mentioned by an Applicant of your choice, type 10");
		System.out.println(">to insert a new Applicant, type 11");
		System.out.println(">to exit, type e");
	}
	
    public static void main(String[] args) throws Exception {
    	Connection con=connect();
		//Taking and Storing the input from the user
    	System.out.println(">>>Welcome to the program finder database application:");
    	menu();
    	//Taking the input form the user
		Scanner input = new Scanner(System.in);
		String queryNo = input.nextLine();
		//It will call the menu and read function until the user hits exit option
		while(!queryNo.equalsIgnoreCase("e")) {
			//New class Read which interacts with the database to read data
			Read rd = new Read(con,input,queryNo);
			//Calling readData function in Read class which uses sql query to retrieve data from the database
			rd.readData();
			menu();
			queryNo = input.nextLine();
		}
		con.close();
    } 
}
	
    