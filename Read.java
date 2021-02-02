package Lab5;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Scanner;

public class Read {

	public Connection c;
	public Scanner input;
	public String queryNo;
	public Read(Connection con,Scanner input,String queryNo) {
		this.c=con;
		this.input=input;
		this.queryNo=queryNo;
	}
	public void readData() throws Exception {
    	
    	try {
            Statement s = null;
    		PreparedStatement ps1 = null;
			PreparedStatement ps2 = null;
			String sql1 = null;
			String sql2 = null;
			String ApplicantId = null;
			//if-else blocks for each of the option available in the menu
    		if (queryNo.equals("1")) {
    			
    			System.out.println("Enter the Applicant Id(between 1 to 10): ");
    			ApplicantId = input.nextLine();
    			sql1 = "SELECT Name FROM Universities, UniversitiesPrograms\r\n" + 
    					"WHERE UniversitiesPrograms.UniversityId=Universities.Id\r\n" + 
    					"AND UniversitiesPrograms.ProgramId IN\r\n" + 
    					"(\r\n" + 
    					"SELECT ProgramId FROM ApplicantsPrograms WHERE ApplicantId=?\r\n" + 
    					");";
    			sql2 = "SELECT Name FROM OnlinePlatforms, OnlinePrograms\r\n" + 
    					"WHERE OnlinePrograms.OnlineId=OnlinePlatforms.Id\r\n" + 
    					"AND OnlinePrograms.ProgramId IN\r\n" + 
    					"(\r\n" + 
    					"SELECT ProgramId FROM ApplicantsPrograms WHERE ApplicantId=?\r\n" + 
    					");";
    			ps1 = c.prepareStatement(sql1);
    			ps2 = c.prepareStatement(sql2);
    			ps1.setString(1, ApplicantId);
    			ps2.setString(1, ApplicantId);
    			ResultSet rs1 = ps1.executeQuery();
    			ResultSet rs2 = ps2.executeQuery();
    			while (rs1.next()) {

    			    String UniversityName = rs1.getString("Name");
    			    System.out.println(String.format("The University name offering program for Applicant Id %s : %s", ApplicantId,UniversityName));
    			}
    			while (rs2.next()) {
    			String OnlinePlatformName = rs2.getString("Name");
    			System.out.println(String.format("The Online Platform name offering program for Applicant Id %s : %s", 
			    		ApplicantId,OnlinePlatformName));
    			}
    			
    			ps1.close();
    			ps2.close();
    			rs1.close();
    			rs2.close();
    		}
    		else if (queryNo.equals("2")) {
				
    			System.out.println("Enter the Applicant Id(between 1 to 10): ");
    			ApplicantId = input.nextLine();
    			sql1 = "SELECT count(*) AS Total FROM OnlinePlatforms, OnlinePrograms\r\n" + 
    					"WHERE OnlinePrograms.OnlineId=OnlinePlatforms.Id\r\n" + 
    					"AND OnlinePrograms.ProgramId IN (\r\n" + 
    					"SELECT ProgramId FROM ApplicantsPrograms WHERE ApplicantId=?\r\n" + 
    					");";
    			ps1 = c.prepareStatement(sql1);
    			ps1.setString(1, ApplicantId);
    			ResultSet rs1 = ps1.executeQuery();
    			while (rs1.next()) {

    			    String Count = rs1.getString("Total");
    			    System.out.println(String.format("The number of Online options available for" + 
    			    		" the program mentioned by an Applicant Id %s : %s", ApplicantId,Count));
    			}
    			ps1.close();
    			rs1.close();
			}
    		else if (queryNo.equals("3")) {
    			
    			System.out.println("Enter the Applicant Id(between 1 to 10): ");
    			ApplicantId = input.nextLine();
    			sql1 = "SELECT count(*) AS Total FROM Universities, UniversitiesPrograms\r\n" + 
    					"WHERE UniversitiesPrograms.UniversityId=Universities.Id\r\n" + 
    					"AND UniversitiesPrograms.ProgramId IN\r\n" + 
    					"(\r\n" + 
    					"SELECT ProgramId FROM ApplicantsPrograms WHERE ApplicantId=?\r\n" + 
    					");";
    			ps1 = c.prepareStatement(sql1);
    			ps1.setString(1, ApplicantId);
    			ResultSet rs1 = ps1.executeQuery();
    			while (rs1.next()) {

    			    String Count = rs1.getString("Total");
    			    System.out.println(String.format("The number of Universities offering" + 
    			    		" the program mentioned by an Applicant Id %s : %s", ApplicantId,Count));
    			}
    			ps1.close();
    			rs1.close();
			}
    		else if (queryNo.equals("4")) {
    			System.out.println("Enter the Applicant Id(between 1 to 10): ");
    			ApplicantId = input.nextLine();
    			sql1 = "SELECT Name FROM Universities, UniversitiesPrograms\r\n" + 
    					"WHERE UniversitiesPrograms.UniversityId=Universities.Id\r\n" + 
    					"AND UniversitiesPrograms.ProgramId IN\r\n" + 
    					"(\r\n" + 
    					"SELECT ProgramId FROM ApplicantsPrograms WHERE ApplicantId=?\r\n" + 
    					")\r\n" + 
    					"AND Universities.Country IN\r\n" + 
    					"(\r\n" + 
    					"SELECT Country FROM Applicants WHERE Id=?\r\n" + 
    					");";
    			ps1 = c.prepareStatement(sql1);
    			ps1.setString(1, ApplicantId);
    			ps1.setString(2, ApplicantId);
    			ResultSet rs1 = ps1.executeQuery();
    			while (rs1.next()) {

    			    String UniversityName = rs1.getString("Name");
    			    System.out.println(String.format("The University name offering the mentioned "
    			    		+ "program in the same countries as %s Applicant's: %s", ApplicantId
    			    		,UniversityName));
    			}
    			ps1.close();
    			rs1.close();
			}
    		else if (queryNo.equals("5")) {
    			System.out.println("Enter the Applicant Id(between 1 to 10): ");
    			ApplicantId = input.nextLine();
    			sql1 = "SELECT Name,PhoneNo FROM Universities, UniversitiesPrograms\r\n" + 
    					"WHERE UniversitiesPrograms.UniversityId=Universities.Id\r\n" + 
    					"AND UniversitiesPrograms.ProgramId IN\r\n" + 
    					"(\r\n" + 
    					"SELECT ProgramId FROM ApplicantsPrograms WHERE ApplicantId=?\r\n" + 
    					");";
    			ps1 = c.prepareStatement(sql1);
    			ps1.setString(1, ApplicantId);
    			ResultSet rs1 = ps1.executeQuery();
    			while (rs1.next()) {

    			    String UniversityName = rs1.getString("Name");
    			    String UniversityContact = rs1.getString("PhoneNo");
    			    System.out.println(String.format("The %s contact information for the program "
    			    		+ "mentioned by the Applicant %s : %s",
    			    		UniversityName,ApplicantId,UniversityContact));	
    			}
    			ps1.close();
    			rs1.close();
			}
    		else if (queryNo.equals("6")) {
    			System.out.println("Enter the Applicant Id(between 1 to 10): ");
    			ApplicantId = input.nextLine();
    			sql1 = "SELECT ProgramName,Fee FROM Programs\r\n" + 
    					"WHERE Id IN\r\n" + 
    					"(\r\n" + 
    					"SELECT ProgramId FROM ApplicantsPrograms WHERE ApplicantId=?\r\n" + 
    					");";
    			ps1 = c.prepareStatement(sql1);
    			ps1.setString(1, ApplicantId);
    			ResultSet rs1 = ps1.executeQuery();
    			while (rs1.next()) {

    			    String ProgramName = rs1.getString("ProgramName");
    			    String ProgramFee = rs1.getString("Fee");
    			    System.out.println(String.format("The %s program fee for the program mentioned"
    			    		+ "by the Applicant %s : %s CAD",
    			    		ProgramName,ApplicantId,ProgramFee));	
    			}
    			ps1.close();
    			rs1.close();
			}
    		else if (queryNo.equals("7")) {
    			System.out.println("Enter the Applicant Id(between 1 to 10): ");
    			ApplicantId = input.nextLine();
    			sql1 = "SELECT ProgramName,ProgramDuration FROM Programs\r\n" + 
    					"WHERE Id IN\r\n" + 
    					"(SELECT ProgramId FROM ApplicantsPrograms WHERE ApplicantId=?);";
    			ps1 = c.prepareStatement(sql1);
    			ps1.setString(1, ApplicantId);
    			ResultSet rs1 = ps1.executeQuery();
    			while (rs1.next()) {

    			    String ProgramName = rs1.getString("ProgramName");
    			    String ProgramDuration = rs1.getString("ProgramDuration");
    			    System.out.println(String.format("The %s program's duration: %s of the program"
    			    		+ " mentioned by the Applicant %s",ProgramName,
    			    		ProgramDuration,ApplicantId));
    			}
    			ps1.close();
    			rs1.close();
			}
    		else if (queryNo.equals("8")) {
    			System.out.println("Enter the Applicant Id(between 1 to 10): ");
    			ApplicantId = input.nextLine();
    			sql1 = "SELECT Title FROM Books,ProgramsBooks\r\n" + 
    					"WHERE Books.Id=ProgramsBooks.BookId\r\n" + 
    					"AND ProgramsBooks.ProgramId IN\r\n" + 
    					"(SELECT ProgramId FROM ApplicantsPrograms WHERE ApplicantId=?);";
    			ps1 = c.prepareStatement(sql1);
    			ps1.setString(1, ApplicantId);
    			ResultSet rs1 = ps1.executeQuery();
    			while (rs1.next()) {

    			    String BookTitle = rs1.getString("Title");
    			    System.out.println(String.format("The book name for the program mentioned"
    			    		+ " by an Applicant Id %s : %s",
    			    		ApplicantId,BookTitle));	
    			}
    			ps1.close();
    			rs1.close();
			}
    		else if (queryNo.equals("9")) {
    			sql1 = "SELECT Title,EligibilityCriteria FROM Scholarships, UniversitiesScholarships\r\n" + 
    					"WHERE Scholarships.Id=UniversitiesScholarships.ScholarshipId\r\n" + 
    					"AND UniversitiesScholarships.UniversityId IN\r\n" + 
    					"(SELECT Id FROM Universities WHERE Name='McGill University');";
    			s = c.createStatement();
    			ResultSet rs1 = s.executeQuery(sql1);
    			while (rs1.next()) {

    			    String ScholarshipName = rs1.getString("Title");
    			    String EligibilityCriteria = rs1.getString("EligibilityCriteria");
    			    System.out.println(String.format("The %s's eligibility criteria: %s",
    			    		ScholarshipName,EligibilityCriteria));	
    			}
    			s.close();
    			rs1.close();
			}
    		else if (queryNo.equals("10")) {
    			System.out.println("Enter the Applicant Id(between 1 to 10): ");
    			ApplicantId = input.nextLine();
    			sql1 = "SELECT count(*) AS Total FROM Applicants\r\n" + 
    					"WHERE InterestedProgram IN\r\n" + 
    					"(SELECT InterestedProgram FROM Applicants WHERE Id=?);";
    			ps1 = c.prepareStatement(sql1);
    			ps1.setString(1, ApplicantId);
    			ResultSet rs1 = ps1.executeQuery();
    			while (rs1.next()) {

    			    String Count = rs1.getString("Total");
    			    System.out.println(String.format("The number of other applicants interested in"
    			    		+ " the program mentioned by Applicant %s: %s",
    			    		ApplicantId,Count));	
    			}
    			ps1.close();
    			rs1.close();
			}
    		else if(queryNo.equals("11")) {
    			System.out.println("Enter the Applicant's Name: ");
    			String Name = input.nextLine();
    			System.out.println("Enter the Applicant's Email: ");
    			String Email = input.nextLine();
    			System.out.println("Enter the program in which Applicant is interested in: ");
    			String Program = input.nextLine();
    			System.out.println("Enter the Street Name where the Applicant resides: ");
    			String StreetName = input.nextLine();
    			System.out.println("Enter the name of the City where the Applicant lives: ");
    			String City = input.nextLine();
    			System.out.println("Enter the name of the Country where the Applicant lives: ");
    			String Country = input.nextLine();
    			sql1 = "INSERT INTO Applicants(Name,Email,InterestedProgram,StreetName,City,Country)"
    					+ " VALUES(?,?,?,?,?,?);";
    			ps1 = c.prepareStatement(sql1);
    			ps1.setString(1, Name);
    			ps1.setString(2, Email);
    			ps1.setString(3, Program);
    			ps1.setString(4, StreetName);
    			ps1.setString(5, City);
    			ps1.setString(6, Country);
    			ps1.executeUpdate();
    			c.commit();
    			System.out.println("Record Inserted successfuly");
    			System.out.println("To check if the record is successfuly inserted, type yes");
    			String reply = input.nextLine();
    			if(reply.equalsIgnoreCase("yes")) {
    				sql2 = "SELECT * FROM Applicants WHERE Email=?;";
    				ps2 = c.prepareStatement(sql2);
    				ps2.setString(1, Email);
    				ResultSet rs1 = ps2.executeQuery();
    				ResultSetMetaData rsmd = rs1.getMetaData();
    				int colCount = rsmd.getColumnCount();
    				for (int i = 1; i <= colCount; i++) {
    			        String columnValue = rs1.getString(i);
    			        System.out.print(rsmd.getColumnName(i)+" : "+columnValue+"\n");
    			    }
    			}
    			ps1.close();
    			ps2.close();
    		}
    	}
    	catch (Exception e){
    	    System.err.println("Problem Encountered!");
    	    e.printStackTrace();
    	    throw e;
    	} 
    	//System.out.println("Read data successfully.");
    }
}
