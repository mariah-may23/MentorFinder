import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class MentorFinder {

  private String userName;

  private String password;

  private final String serverName = "localhost";

  private final int portNumber = 3306;

  private final String dbName = "mentorfinder";

  private Scanner sc;


  public MentorFinder(String userName, String password) {
    this.userName = userName;
    this.password = password;
    this.sc = new Scanner(System.in);
  }

  public Connection getConnection() throws SQLException {

    // define URL of db server for db named myqsl on local host with port no. 3306
    String url = "jdbc:mysql://" + this.serverName + ":" +
            this.portNumber + "/" + this.dbName +
            "?characterEncoding=UTF-8&useSSL=false";

    // get connection to db for a user named root w a xxxx password
    Connection con = DriverManager.getConnection(url, this.userName, password);

    System.out.println("Connected!");
    return con;
  }

  public void show_current_mentees(Connection con, String mentor) throws SQLException {

    // select statement for showing
    Statement stmt = null;
    ResultSet rs = null;

    // Retrieve list of mentees under the mentor
    try {
      String sql = "SELECT * FROM mentorship WHERE mentor_id = \'" +
              mentor + "\' ;";
      stmt = con.createStatement();
      rs = stmt.executeQuery(sql);
      while (rs.next()) {
        String print = String.format("%-20s %-20s %-20s %-20s ",
                rs.getString(2),
                rs.getInt(3),
                rs.getDate(4),
                rs.getDate(5));
        System.out.println(print);
      }

    } catch (SQLException SQLe) {
      System.out.println(SQLe.getMessage());
    }

    stmt.close();
    rs.close();

  }

  public void change_status_declined(Connection con, int request_id) throws SQLException {
    // select statement for showing
    Statement stmt = null;

    // Retrieve list of mentees under the mentor
    try {

      String sql = "UPDATE request_status SET status = \"DECLINED\" WHERE request_id = "
              + request_id + ";";
      stmt = con.createStatement();
      int update = stmt.executeUpdate(sql);

    } catch (SQLException SQLe) {
      System.out.println(SQLe.getMessage());
    }

    stmt.close();

  }

  public void change_status_approved(Connection con, int request_id) throws SQLException {
    // select statement for showing
    Statement stmt = null;


    // Retrieve list of mentees under the mentor
    try {

      String sql = "UPDATE request_status SET status = \"APPROVED\" WHERE request_id = "
              + request_id + ";";
      stmt = con.createStatement();
      int update = stmt.executeUpdate(sql);

    } catch (SQLException SQLe) {
      System.out.println(SQLe.getMessage());
    }

    stmt.close();

  }


  public void delete_req_from_pending(Connection con, int request_id) throws SQLException {
    // select statement for showing
    Statement stmt = null;


    // Retrieve list of mentees under the mentor
    try {

      String sql = "DELETE FROM pending_requests WHERE request_id = "
              + request_id + ";";
      stmt = con.createStatement();
      int delete = stmt.executeUpdate(sql);

    } catch (SQLException SQLe) {
      System.out.println(SQLe.getMessage());
    }

    stmt.close();

  }


  public void show_requests(Connection con, String mentor) throws SQLException {

    // select statement for showing
    Statement stmt = null;
    ResultSet rs = null;

    // Retrieve list of mentees under the mentor
    try {
      // MAKE A NEW TABLE FOR PENDING REQUESTS??? GIVE request ID
      String sql = "SELECT * FROM pending_requests WHERE mentor_id = \'" + mentor + "\';";
      stmt = con.createStatement();
      rs = stmt.executeQuery(sql);
      while (rs.next()) {
        String print = String.format("%-20s  %-20s %-20s",
                rs.getString(1),

                rs.getString(3),
                rs.getString(4));

        System.out.println(print);
      }

    } catch (SQLException SQLe) {
      System.out.println(SQLe.getMessage());
    }

    stmt.close();
    rs.close();

    // give option to accept or decline
    System.out.println("Please type the request IDs you want to accept." +
            "\nType -1 to stop.");

    int approve_reqs = sc.nextInt();
    while (approve_reqs != -1) {

      // make change in the status table to approved ->
      change_status_approved(con, approve_reqs);
      System.out.println("Request ID " + approve_reqs + " APPROVED!");
      delete_req_from_pending(con, approve_reqs);

      approve_reqs = sc.nextInt();
    }

    System.out.println("Please type the request IDs you want to accept." +
            "\nType -1 to stop.");

    int decline_reqs = sc.nextInt();
    while (decline_reqs != -1) {

      System.out.println("Request ID" + decline_reqs + "DECLINED!");
      // make change in the status table to DECLINED ->
      change_status_declined(con, decline_reqs);
      delete_req_from_pending(con, approve_reqs);

      decline_reqs = sc.nextInt();
    }

  }

  public void user_mentor(Connection con) throws SQLException {

    Scanner sc = new Scanner(System.in);
    System.out.println("Welcome to the Mentorship Portal! " +
            "\nPlease enter your userID ");
    String mentor = sc.nextLine();
    System.out.println("Select the wanted search from the given list of options below- ");
    System.out.println("A : Show current mentees. \nB : Show mentorship requests \nQ: Quit ");

    boolean invalid_input = true;
    String option = sc.nextLine();

    while (!option.equalsIgnoreCase("a") && !option.equalsIgnoreCase("b")
            && !option.equalsIgnoreCase("q")) {
      System.out.println("Invlaid input! Enter again." +
              "\nA : Show current mentees. \nB : Show mentorship requests \nQ: Quit ");
      option = sc.nextLine();
    }


    if (option.equalsIgnoreCase("A")) {
      this.show_current_mentees(con, mentor);
    } else if (option.equalsIgnoreCase("B")) {
      this.show_requests(con, mentor);
    } else if (option.equalsIgnoreCase("Q")) {
      // quit
    }




  }

  public Integer printCountries(Connection conn) throws SQLException {
    List<String> country_ids = new ArrayList<>();
    String command = "SELECT country.* FROM country INNER JOIN mentors ON country.country_id = mentors.country_id";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    System.out.println("Countries:");

    while (rs.next()) {
      String out = String.format("%d %s",
              rs.getInt(1),
              rs.getString(2));
      country_ids.add(String.valueOf(out.charAt(0)));
      System.out.println(out);
    }


    System.out.println("Which country would you like to select? Type the id number.");
    Scanner sc = new Scanner(System.in);
    String option = sc.nextLine();

    while ( !country_ids.contains( option)){
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "\nWhich country would you like to select? Type the id number.");
      option = sc.nextLine();
    }


      return Integer.valueOf(option);



  }
  public Integer printOrganizations(Connection conn) throws SQLException {
    List<String> organization_ids = new ArrayList<>();
    String command = "Select organization.* FROM organization INNER JOIN mentors ON organization.current_organization_id = mentors.current_organization_id";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    System.out.println("Organizations:");

    while (rs.next()) {
      String out = String.format("%d %s",
              rs.getInt(1),
              rs.getString(2));
      organization_ids.add(String.valueOf(out.charAt(0)));
      System.out.println(out);
    }

    System.out.println("Which country would you like to select? Type the id number.");
    Scanner sc = new Scanner(System.in);
    String option = sc.nextLine();

    while (!organization_ids.contains( option) ){
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "\nWhich organization would you like to select? Type the id number.");
      option = sc.nextLine();
    }


      return Integer.valueOf(option);


  }
  public Integer printEthnicities(Connection conn) throws SQLException {
    List<String> ethnicity_ids = new ArrayList<>();
    String command = "Select ethnicity.* FROM ethnicity INNER JOIN mentors ON ethnicity.ethnicity_id = mentors.ethnicity_id";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    System.out.println("Ethniticies:");

    while (rs.next()) {
      String out = String.format("%d %s",
              rs.getInt(1),
              rs.getString(2));
      ethnicity_ids.add(String.valueOf(out.charAt(0)));
      System.out.println(out);
    }
    System.out.println("Which ethnicity would you like to select? Type the id number.");
    Scanner sc = new Scanner(System.in);
    String option = sc.nextLine();

    while (!ethnicity_ids.contains( option) ){
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "\nWhich organization would you like to select? Type the id number.");
      option = sc.nextLine();
    }


    return Integer.valueOf(option);

  }

  public Integer printFields(Connection conn) throws SQLException {
    List<String> field_ids = new ArrayList<>();
    String command = "Select stem_field.* FROM stem_field INNER JOIN mentors ON stem_field.field_id = mentors.field_id";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    System.out.println("Ethniticies:");

    while (rs.next()) {
      String out = String.format("%d %s",
              rs.getInt(1),
              rs.getString(2));
      field_ids.add(String.valueOf(out.charAt(0)));
      System.out.println(out);
    }
    System.out.println("Which field would you like to select? Type the id number.");
    Scanner sc = new Scanner(System.in);
    String option = sc.nextLine();

    while (!field_ids.contains( option) ){
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "\nWhich organization would you like to select? Type the id number.");
      option = sc.nextLine();
    }


    return Integer.valueOf(option);

  }
  public Integer printDegrees(Connection conn) throws SQLException {
    List<String> degree_ids = new ArrayList<>();
    String command = "Select degree.* FROM degree INNER JOIN mentors ON degree.degree_id = mentors.degree_id";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    System.out.println("Degrees:");

    while (rs.next()) {
      String out = String.format("%-10d %-10s %-10s",
              rs.getInt(1),
              rs.getString(2),
              rs.getString(3));
      degree_ids.add(String.valueOf(out.charAt(0)));
      System.out.println(out);
    }
    System.out.println("Which degree would you like to select? Type the id number.");
    Scanner sc = new Scanner(System.in);
    String option = sc.nextLine();

    while (!degree_ids.contains( option) ){
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "\nWhich organization would you like to select? Type the id number.");
      option = sc.nextLine();
    }


    return Integer.valueOf(option);

  }

  public String country_mentors(Connection conn, Integer countryID) throws SQLException {
    List<String> country_mentors_ids = new ArrayList<>();
    String command = "Select * FROM mentors where country_id = " + countryID;
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);

    while (rs.next()) {
      String out = String.format("%-20s %-20s %-20s %-20d %-20d %-20s %-20d %-20d %-20d %-20s %-20s",
              rs.getString(1),
              rs.getString(2),
              rs.getString(3),
              rs.getInt(4),
              rs.getInt(5),
              rs.getString(6),
              rs.getInt(7),
              rs.getInt(8),
              rs.getInt(9),
              rs.getString(10),
              rs.getString(11)

      );
      String [] words = out.split(" ");

      // add the mentor to list of available mentors
      country_mentors_ids.add(words[0]);

      System.out.println(out);
    }
    System.out.println("Which mentor would you like to message? Please enter their userID.");
    Scanner sc = new Scanner(System.in);
    String mentor= sc.nextLine();

    while (!country_mentors_ids.contains(mentor)) {
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "Which mentor would you like to select? Please type their userID,");
      mentor = sc.nextLine();
    }
    return mentor;
  }



  public String organization_mentors(Connection conn, Integer currentOrganizationID) throws SQLException {
    List<String> org_mentors_ids = new ArrayList<>();
    String command = "Select * FROM mentors where current_organization_id = " + currentOrganizationID;
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);

    while (rs.next()) {
      String out = String.format("%-20s %-20s %-20s %-20d %-20d %-20s %-20d %-20d %-20d %-20s %-20s",
              rs.getString(1),
              rs.getString(2),
              rs.getString(3),
              rs.getInt(4),
              rs.getInt(5),
              rs.getString(6),
              rs.getInt(7),
              rs.getInt(8),
              rs.getInt(9),
              rs.getString(10),
              rs.getString(11)
      );
      String [] words = out.split(" ");

      // add the mentor to list of available mentors
      org_mentors_ids.add(words[0]);
      System.out.println(out);
    }
    System.out.println("Which mentor would you like to message? Please enter their userID.");
    Scanner sc = new Scanner(System.in);
    String mentor= sc.nextLine();

    while (!org_mentors_ids.contains(mentor)) {
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "Which mentor would you like to select? Please type their userID,");
      mentor = sc.nextLine();
    }
    return mentor;
  }


  public String ethnicity_mentors(Connection conn, Integer ethnicityID) throws SQLException {
    List<String> ethnicity_mentors_ids = new ArrayList<>();
    String command = "Select * FROM mentors where ethnicity_id = " + ethnicityID;
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);

    while (rs.next()) {
      String out = String.format("%-20s %-20s %-20s %-20d %-20d %-20s %-20d %-20d %-20d %-20s %-20s",
              rs.getString(1),
              rs.getString(2),
              rs.getString(3),
              rs.getInt(4),
              rs.getInt(5),
              rs.getString(6),
              rs.getInt(7),
              rs.getInt(8),
              rs.getInt(9),
              rs.getString(10),
              rs.getString(11)
      );
      String [] words = out.split(" ");

      // add the mentor to list of available mentors
      ethnicity_mentors_ids.add(words[0]);
      System.out.println(out);
    }
    System.out.println("Which mentor would you like to message? Please enter their userID.");
    Scanner sc = new Scanner(System.in);
    String mentor= sc.nextLine();

    while (!ethnicity_mentors_ids.contains(mentor)) {
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "Which mentor would you like to select? Please type their userID,");
      mentor = sc.nextLine();
    }
    return mentor;
  }



  public String field_mentors(Connection conn, Integer fieldID) throws SQLException {
    List<String> field_mentors_ids = new ArrayList<>();
    String command = "Select * FROM mentors where field_id = " + fieldID;
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);

    while (rs.next()) {
      String out = String.format("%-20s %-20s %-20s %-20d %-20d %-20s %-20d %-20d %-20d %-20s %-20s",
              rs.getString(1),
              rs.getString(2),
              rs.getString(3),
              rs.getInt(4),
              rs.getInt(5),
              rs.getString(6),
              rs.getInt(7),
              rs.getInt(8),
              rs.getInt(9),
              rs.getString(10),
              rs.getString(11)
      );
      String [] words = out.split(" ");

      // add the mentor to list of available mentors
      field_mentors_ids.add(words[0]);
      System.out.println(out);
    }
    System.out.println("Which mentor would you like to message? Please enter their userID.");
    Scanner sc = new Scanner(System.in);
    String mentor= sc.nextLine();

    while (!field_mentors_ids.contains(mentor)) {
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "Which mentor would you like to select? Please type their userID,");
      mentor = sc.nextLine();
    }
    return mentor;
  }

  public String degree_mentors(Connection conn, Integer degreeID) throws SQLException {
    List<String> degree_mentors_ids = new ArrayList<>();
    String command = "Select * FROM mentors where degree_id = " + degreeID;
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);

    while (rs.next()) {
      String out = String.format("%-20s %-20s %-20s %-20d %-20d %-20s %-20d %-20d %-20d %-20s %-20s",
              rs.getString(1),
              rs.getString(2),
              rs.getString(3),
              rs.getInt(4),
              rs.getInt(5),
              rs.getString(6),
              rs.getInt(7),
              rs.getInt(8),
              rs.getInt(9),
              rs.getString(10),
              rs.getString(11)
      );
      String [] words = out.split(" ");

      // add the mentor to list of available mentors
      degree_mentors_ids.add(words[0]);
      System.out.println(out);
    }
    System.out.println("Which mentor would you like to message? Please enter their userID.");
    Scanner sc = new Scanner(System.in);
    String mentor= sc.nextLine();

    while (!degree_mentors_ids.contains(mentor)) {
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "Which mentor would you like to select? Please type their userID,");
      mentor = sc.nextLine();
    }
    return mentor;
  }

  public boolean is_registered(Connection conn, String userID) throws SQLException {
    String command = "Select * FROM mentee where user_id = '" + userID + "'" ;
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    return rs.next();

  }

  public Integer find_country_id(Connection conn, String country) throws SQLException {
    String command = "Select country_id FROM country where name = '" + country + "'" ;
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    rs.next();
   int country_id = rs.getInt(1);

    return country_id;

  }

  public Integer find_field_id(Connection conn, String field) throws SQLException {
    String command = "Select field_id FROM stem_field where field_name = '" + field + "'" ;
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    rs.next();
    int field_id = rs.getInt(1);

    return field_id;


  }

  public void register_mentee(Connection conn, String userID) throws SQLException {
    Scanner sc = new Scanner(System.in);
    System.out.println("Please enter your first name");
    String firstName = sc.nextLine();

    System.out.println("Please enter your last name");
    String lastName = sc.nextLine();

    System.out.println("Please enter your age");
    String age_string = sc.nextLine();
    int age =Integer.parseInt(age_string);

    System.out.println("Please enter your country");
    String country_string = sc.nextLine();
    int country = find_country_id(conn, country_string);

    System.out.println("Please enter your email");
    String email = sc.nextLine();

    System.out.println("Please enter your linkedin");
    String linkedin = sc.nextLine();

    System.out.println("Please enter your field");
    String field_string = sc.nextLine();
    int field = find_field_id(conn,field_string);

    String command = "INSERT INTO mentee (user_id, first_name, last_name, age, country_id, email, linkedIn, field_id) \n" +
            "VALUES ( ?,?,?,?,?,?,?,?)" ;

    PreparedStatement st = conn.prepareStatement(command);
    st.setString(1,userID);
    st.setString(2,firstName);
    st.setString(3,lastName);
    st.setInt(4, age);
    st.setInt(5,country);
    st.setString(6,email);
    st.setString(7,linkedin);
    st.setInt(8,field);

    int add = st.executeUpdate();

    System.out.println("Great! You are now registered.");

  }

  public Integer find_request_id(Connection conn, String mentor, String mentee) throws SQLException {
    String command = "Select request_id FROM request_status where mentor_id = '" + mentor + "' and mentee_id = '" + mentee + "'" ;
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    rs.next();

    return rs.getInt(1);

  }

  public void message_mentor(Connection conn, String mentorID, String menteeID){
    Scanner sc = new Scanner(System.in);
    System.out.println("What would you like to message this mentor?");
    String messsage = sc.nextLine();

    try {
      String command = "INSERT INTO request_status(mentor_id, mentee_id) \n" +
              "VALUES(?,?)" ;

      PreparedStatement st = conn.prepareStatement(command);
      st.setString(1,mentorID);
      st.setString(2,menteeID);

      int add = st.executeUpdate();
      int request_id = this.find_request_id(conn, mentorID, menteeID);

      String command2 = "INSERT INTO pending_requests(request_id,mentor_id, mentee_id, message_to_mentor) \n" +
              "VALUES(?,?,?,?)" ;

      PreparedStatement st2 = conn.prepareStatement(command2);
      st2.setInt(1,request_id);
      st2.setString(2,mentorID);
      st2.setString(3,menteeID);
      st2.setString(4,messsage);

      int add2 = st2.executeUpdate();

    } catch (SQLException SQLe) {
      System.out.println(SQLe.getMessage());
    }
    System.out.println("Message was sent!");


  }

  public void search_mentors(Connection con, String mentee) throws SQLException {
    System.out.println("Select the wanted search from the given list of options below. Search by: ");
    System.out.println("A : Country \nB : Organization \nC: Ethnicity \nD: Field \nE: Degree \nQ: Quit");

    String option = sc.nextLine();

    // check to make sure they chose a valid answer
    while (!option.equalsIgnoreCase("a") && !option.equalsIgnoreCase("b")
            && !option.equalsIgnoreCase("c") && !option.equalsIgnoreCase("d")
            && !option.equalsIgnoreCase("e") && !option.equalsIgnoreCase("f")
            && !option.equalsIgnoreCase("q")) {
      System.out.println("Invalid input! Enter again." +
              "\nA : Country \nB : Organization \nC: Ethnicity \nD: Field \nE: Degree \nQ: Quit");
      option = sc.nextLine();
    }


    // options
    String mentor = null;
    if (option.equalsIgnoreCase("A")) {
      int id = this.printCountries(con);
      mentor = this.country_mentors(con, id);
    } else if (option.equalsIgnoreCase("B")) {
      int id = this.printOrganizations(con);
      mentor = this.organization_mentors(con,id);
    } else if (option.equalsIgnoreCase("C")) {
      int id = this.printEthnicities(con);
      mentor = this.ethnicity_mentors(con,id);
    } else if (option.equalsIgnoreCase("D")) {
      int id = this.printFields(con);
      mentor = this.field_mentors(con, id);
    } else if (option.equalsIgnoreCase("E")) {
      int id = this.printDegrees(con);
      mentor = this.degree_mentors(con,id);
    } else if (option.equalsIgnoreCase("Q")) {
      return;
    }

    //check to see if there is a mentor they would like to message from the list
    this.message_mentor(con, mentor, mentee);
  }

  public void check_requests(Connection conn, String mentee) throws SQLException {
    String command = "Select * FROM request_status where mentee_id = '" + mentee +"'";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);

    System.out.println("These are your requests:");

    while (rs.next()) {
      String out = String.format("%-20d %-20s %-20s",
              rs.getInt(1),
              rs.getString(2),

              rs.getString(4)
      );

      System.out.println(out);
    }
  }



  public void user_mentee(Connection con) throws SQLException {
    Scanner sc = new Scanner(System.in);
    System.out.println("Welcome to the Mentee Portal! " +
            "\nPlease enter your userID ");
    String mentee = sc.nextLine();

    //check if the mentee is already registered
    boolean registered = is_registered(con, mentee);

    //if not registered, ask them to make account and add them to table
    if (!registered) {
      System.out.println("Looks like you aren't a registered user! We'll register you now.");
      register_mentee(con, mentee);
    }

    //Allow user to apply filters
    while (true) {
      System.out.println("What would you like to do? \nA: Search for mentors \nB: Check requests status \nC: Logout");
      String choice = sc.nextLine();

      //search for mentors
      if (choice.equalsIgnoreCase("A")) {
        this.search_mentors(con,mentee);
      }
      // check history of requests
      else if (choice.equalsIgnoreCase("B")) {
        this.check_requests(con,mentee);
      }
      //leave
      else if (choice.equalsIgnoreCase("C")) {
        System.out.println("Are you sure you would like to log out? Enter YES or NO");
        String confirm = sc.nextLine();
        if (confirm.equalsIgnoreCase("YES")){
          break;
        }
      }
      else {
        System.out.println("Please enter a valid choice");
      }

    }
    System.out.println("You have successfully logged out.");
    con.close();
  }

  public static void main(String[] args) throws SQLException {

    // Question 1
    // Create a Scanner object for inputs
    Scanner sc = new Scanner(System.in);

    // Prompt user for MySQL username
    System.out.println("Enter MySQL username ");
    String userName = sc.nextLine();
    // Prompt user for password
    System.out.println("Enter password ");
    String password = sc.nextLine();

    // check username and password
    System.out.println("Username is: " + userName);
    System.out.println("Password is: " + password);

    // Question 2
    // Establish connection to sharkDB database using username and password
    MentorFinder obj = new MentorFinder(userName, password);
    Connection con = obj.getConnection();

    // mentors or mentee?
    System.out.println("Are you a mentor or mentee? ");
    System.out.println("A : MENTOR \nB : MENTEE ");
    System.out.println("Type the letter that best represents you. ");

    String user = sc.nextLine();

    // if mentor
    if (user.equalsIgnoreCase("A")) {
      obj.user_mentor(con);
    } else {
      obj.user_mentee(con);


    }

    // close connection
    con.close();

  }
}