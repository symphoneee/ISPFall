

<%@page import="java.sql.*"%>  
<%
	
	String nid = request.getParameter("id");
	String nmiles = request.getParameter("miles");
	String nyear = request.getParameter("year");
	String nstate = request.getParameter("state");
	String naction = request.getParameter("action");
	String nstatement = request.getParameter("statement");
	
	
	// If any of numerical values are blank, set them to zero
    if (nid == "") id = 0;
    if (nmiles == "") miles = 0.0;
    if (nyear == "") year = 0;
    if (nstate == "") state = 0;



// Declare needed variables
Connection con;
DatabaseMetaData md;
String qs;
Statement stmt;
ResultSet rs;
out.println("\n <br>");

// Load DiverManager
Class.forName("com.mysql.jdbc.Driver").newInstance();
//Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
out.println("Connecting ...\n <br>");

try {

// Open Database connection
con = DriverManager.getConnection("jdbc:mysql://db1.cs.uakron.edu:3306/ISP_ath3","ath3","Ahthut8t");
// con = DriverManager.getConnection("jdbc:microsoft:sqlserver://130.101.10.2:1433;databasename=xiaodb","xiaostudent","cs575");
out.println("Connection established.\n <br>");

stmt = con.createStatement(); // SQL statement object  

//Create tables
qs="DROP TABLE IF EXISTS Corvettes;";
stmt.executeUpdate(qs);
qs="create table Corvettes(id integer, bstyle varchar(32), miles float, year integer(4), state integer(4), primary key (id));";
stmt.executeUpdate(qs);
	out.println("Table created.\n <br>");

//Insert data
qs="insert into Corvettes (id,bstyle,miles,year,state) values (1,'coupe',18.0,1997,4)";
stmt.executeUpdate(qs);
qs="insert into Corvettes (id,bstyle,miles,year,state) values (2, 'hatchback', 58.0, 1996, 7)";
stmt.executeUpdate(qs);
qs="insert into Corvettes (id,bstyle,miles,year,state) values (3, 'convertible', 13.5, 2001, 1)";
stmt.executeUpdate(qs);
qs="insert into Corvettes (id,bstyle,miles,year,state) values (4, 'hatchback', 19.0, 1995, 2)";
stmt.executeUpdate(qs);
qs="insert into Corvettes (id,bstyle,miles,year,state) values (5, 'hatchback', 25.0, 1991, 5)";
stmt.executeUpdate(qs);
qs="insert into Corvettes (id,bstyle,miles,year,state) values (6, 'hardtop', 15.0, 2000, 2)";
stmt.executeUpdate(qs);
qs="insert into Corvettes (id,bstyle,miles,year,state) values (7, 'coupe', 55.0, 1979, 10)";
stmt.executeUpdate(qs);
qs="insert into Corvettes (id,bstyle,miles,year,state) values (8, 'convertible', 17.0, 1999, 5)";
stmt.executeUpdate(qs);
qs="insert into Corvettes (id,bstyle,miles,year,state) values (9, 'hardtop', 17.0, 2000, 5)";
stmt.executeUpdate(qs);
qs="insert into Corvettes (id,bstyle,miles,year,state) values (10, 'hatchback', 50.0, 1995, 7)";
stmt.executeUpdate(qs);
out.println("Data inserted.\n <br>");


//Query the data
qs="select * from Corvettes";
rs=stmt.executeQuery(qs);

//Show results
out.println("Records in the table: \n <br>");
out.println("id\t style\t miles\t year\n <br>");
while(rs.next())
{
out.println(rs.getString("id")+"\t"+rs.getString("bstyle")+"\t"+rs.getString("miles")+"\t"+rs.getString("year")+"\t"+rs.getString("state"));
out.println("<br>");
}
rs.close();

/*
//Get meta data
md = con.getMetaData();
// print information about the driver:
//out.println("\nDriver name:" + md.getDriverName() + "\n<br>Driver version: " + md.getDriverVersion() +"\n<br>");
ResultSet trs=md.getTables(null,null,null,null);
String tableName;
while(trs.next())
{
    tableName = trs.getString("TABLE_NAME");
    System.out.println("Table: " + tableName);
    //print all attributes
    ResultSet crs = md.getColumns(null,null,tableName,null);
    while(crs.next()) out.println(crs.getString("COLUMN_NAME") + ", ");
    //crs.close();
}
//trs.close();
*/

//Clean up
out.println("Closing the session ...\n <br>");
//Drope the tables
qs="drop table Corvettes";
stmt.executeUpdate(qs);
stmt.close();
con.close();
out.println("Session closed.\n <br>");
}

catch (Exception e) {
out.println(e.toString());  // Error message to display
}

%>

 

