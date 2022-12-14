import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * The type Mentor finder.
 */
public class MentorFinder {

  private String userName;

  private String password;

  private final String serverName = "localhost";

  private final int portNumber = 3306;

  private final String dbName = "mentorfinder";

  private Scanner sc;


  /**
   * Instantiates a new Mentor finder.
   *
   * @param userName the user name
   * @param password the password
   */
  public MentorFinder(String userName, String password) {
    this.userName = userName;
    this.password = password;
    this.sc = new Scanner(System.in);
  }

  /**
   * Gets connection.
   *
   * @return the connection
   * @throws SQLException the sql exception
   */
  public Connection getConnection() throws SQLException {

    // define URL of db server for db named myqsl on local host with port no. 3306
    String url = "jdbc:mysql://" + this.serverName + ":" +
            this.portNumber + "/" + this.dbName +
            "?characterEncoding=UTF-8&useSSL=false";

    // get connection to db for a user named root w a xxxx password
    Connection con = DriverManager.getConnection(url, this.userName, password);

    System.out.println("WELCOME TO MENTORSHIP PORTAL!");
    return con;
  }

  /**
   * Show current mentees.
   *
   * @param con    the con
   * @param mentor the mentor
   * @throws SQLException the sql exception
   */
  public void show_current_mentees(Connection con, String mentor) throws SQLException {

    // select statement for showing
    Statement stmt = null;
    ResultSet rs = null;

    System.out.println("CURRENT MENTEES:");

    // Retrieve list of mentees under the mentor
    try {
      String sql = "CALL show_current_mentees(\"" + mentor + "\");";
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

  /**
   * Change status declined.
   *
   * @param con        the con
   * @param request_id the request id
   * @param mentor     the mentor
   * @throws SQLException the sql exception
   */
  public void change_status_declined(Connection con, int request_id, String mentor) throws SQLException {
    // select statement for showing
    Statement stmt = null;

    // Retrieve list of mentees under the mentor
    try {

      String sql = "CALL change_status_declined("
              + request_id + ", \'" + mentor + "\');";
      stmt = con.createStatement();
      int update = stmt.executeUpdate(sql);
      if (update == 0) {
        System.out.println("This request cannot be approved!");
      } else {
        System.out.println("Request ID " + request_id + " DECLINED! ");
      }

    } catch (SQLException SQLe) {
      System.out.println(SQLe.getMessage());
    }

    stmt.close();

  }

  /**
   * Change status approved.
   *
   * @param con        the con
   * @param request_id the request id
   * @param mentor     the mentor
   * @throws SQLException the sql exception
   */
  public void change_status_approved(Connection con, int request_id, String mentor) throws SQLException {
    // select statement for showing
    Statement stmt = null;

    // Retrieve list of mentees under the mentor
    try {

      String sql = "CALL change_status_approved("
              + request_id + ", \'" + mentor + "\');";
      //System.out.println(sql);
      stmt = con.createStatement();
      int update = stmt.executeUpdate(sql);
      //System.out.println(update);
      if (update == 1) {
        System.out.println("Request ID " + request_id + " APPROVED! ");
      }
      if (update == 0) {
        System.out.println("This request cannot be approved!");
      }

    } catch (SQLException SQLe) {
      // System.out.println("here");
      System.out.println(SQLe.getMessage());

    }
    stmt.close();

  }


  /**
   * Delete req from pending.
   *
   * @param con        the con
   * @param request_id the request id
   * @param mentor     the mentor
   * @throws SQLException the sql exception
   */
  public void delete_req_from_pending(Connection con, int request_id, String mentor) throws SQLException {
    // select statement for showing
    Statement stmt = null;

    // Retrieve list of mentees under the mentor
    try {

      String sql = "CALL delete_req_from_pending( "
              + request_id + ", \'" + mentor + "\');";
      stmt = con.createStatement();
      int delete = stmt.executeUpdate(sql);

    } catch (SQLException SQLe) {
      //System.out.println("b");
      System.out.println(SQLe.getMessage());

    }

    stmt.close();

  }


  /**
   * Check reqs int.
   *
   * @param con    the con
   * @param mentor the mentor
   * @return the int
   * @throws SQLException the sql exception
   */
  public int check_reqs(Connection con, String mentor) throws SQLException {
    // select statement for showing
    Statement stmt = null;
    ResultSet rs = null;
    int flag = -9999;

    // Retrieve list of mentees under the mentor
    try {
      // MAKE A NEW TABLE FOR PENDING REQUESTS??? GIVE request ID
      String sql = "CALL show_requests( \'" + mentor + "\');";
      stmt = con.createStatement();
      rs = stmt.executeQuery(sql);
      //System.out.println(rs.next());

      while (rs.next()) {
        flag = 1;
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
    if (flag == -9999) {
      return -1;
    }
    return 1;
  }

  /**
   * Show requests.
   *
   * @param con    the con
   * @param mentor the mentor
   * @throws SQLException the sql exception
   */
  public void show_requests(Connection con, String mentor) throws SQLException {
    System.out.println("\nCURRENT REQUESTS:");
    int reqs_present = check_reqs(con, mentor); //prints the requests available
    if (reqs_present == 1) {

    boolean quit = false;
      while (!quit) {
        // give option to accept or decline

        System.out.println("\nType ACCEPT to begin accepting" +
                "\nType DECLINE to begin declining" +
                "\nType BACK to stop.");
        String choice = sc.nextLine();

        //check to see if user would like to go back to the loop
        if (choice.equalsIgnoreCase("BACK")) {
          break;
        }
        else if (choice.equalsIgnoreCase("ACCEPT")) {
          System.out.println("Please type the request ID that you would like to approve. Type BACK to go back.");
          while(true) {

            String approve = sc.nextLine();
            if(approve.equalsIgnoreCase("back")) {
              System.out.println("\nCURRENT REQUESTS");
              reqs_present = check_reqs(con, mentor);
              break;
            }
            int approve_reqs = Integer.parseInt(approve);


            // make change in the status table to approved ->
            change_status_approved(con, approve_reqs, mentor);


            reqs_present = check_reqs(con, mentor);

            if (reqs_present == -1) {
              quit = true;
              break;
            }
            System.out.println("Would you like to accept another request?" +
                    "Enter the ID or type BACK to go back");


          }
        }
        else if (choice.equalsIgnoreCase("DECLINE")) {
          System.out.println("Please type the request ID that you would like to decline. " +
                  "Type BACK to go back.");
          while(true) {
            String decline = sc.nextLine();
            if(decline.equalsIgnoreCase("back")) {
              System.out.println("\nCURRENT REQUESTS");
              reqs_present = check_reqs(con, mentor);
              break;
            }
            int decline_reqs = Integer.parseInt(decline);

            // make change in the status table to approved ->
            change_status_declined(con, decline_reqs, mentor);

            reqs_present = check_reqs(con, mentor);
            if (reqs_present == -1) {
              quit = true;
              break;
            }
            System.out.println("Would you like to accept another request?" +
                    " Enter the ID or type BACK to go back");




          }
        }
        else {
          System.out.println("Sorry, that is not a valid choice. " +
                  "Please enter a valid choice.");
          break;
        }

      }
    }
    if (reqs_present == -1) {
      System.out.println("Request box is empty.");
    }
  }


  /**
   * Mentor is registered boolean.
   *
   * @param conn   the conn
   * @param userID the user id
   * @return the boolean
   * @throws SQLException the sql exception
   */
  public boolean mentor_is_registered(Connection conn, String userID) throws SQLException {
    String command = "CALL mentor_is_registered(\'" + userID + "\');";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    return rs.next();

  }


  /**
   * User mentor.
   *
   * @param con the con
   * @throws SQLException the sql exception
   */
  public void user_mentor(Connection con) throws SQLException {

    //Scanner sc = new Scanner(System.in);
    System.out.println("Welcome to the Mentorship Portal! " +
            "\nPlease enter your userID ");
    String mentor = sc.nextLine();

    // check if mentor is not registered
    boolean registered = mentor_is_registered(con, mentor);

    if (!registered) {
      System.out.println("Looks like you are not a registered user!");
      return;
    }

      //infinite while loop to keep options appearing unless quits
    while(true){
      System.out.println("\nSelect the wanted search from the given list of options below- ");
      System.out.println("A : Show current mentees. \nB : Show mentorship requests \nC: Logout ");

      boolean invalid_input = true;
      String option = sc.nextLine();

      while (!option.equalsIgnoreCase("a") && !option.equalsIgnoreCase("b")
              && !option.equalsIgnoreCase("c")) {
        System.out.println("Invalid input! Enter again." +
                "\nA : Show current mentees. \nB : Show mentorship requests \nC: Logout ");
        option = sc.nextLine();
      }

      if (option.equalsIgnoreCase("A")) {
        this.show_current_mentees(con, mentor);
      } else if (option.equalsIgnoreCase("B")) {
        this.show_requests(con, mentor);
      } else if (option.equalsIgnoreCase("C")) {
        System.out.println("Are you sure you would like to log out? Enter YES or NO");
        String confirm = sc.nextLine();
        if (confirm.equalsIgnoreCase("YES")) {
          break;
        }
      }
    }
  }

  /**
   * Print countries integer.
   *
   * @param conn the conn
   * @return the integer
   * @throws SQLException the sql exception
   */
  public Integer printCountries(Connection conn) throws SQLException {
    List<String> country_ids = new ArrayList<>();
    String command = "CALL printCountries();";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    System.out.println("Countries:");

    while (rs.next()) {
      String out = String.format("%d %s",
              rs.getInt(1),
              rs.getString(2));

      String[] words = out.split(" ");
      // add the country to list of available mentors
      country_ids.add(words[0]);

      System.out.println(out);
    }

    System.out.println("Which country would you like to select? Type the id number.");
    // Scanner sc = new Scanner(System.in);
    String option = sc.nextLine();

    while (!country_ids.contains(option)) {
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "\nWhich country would you like to select? Type the id number.");
      option = sc.nextLine();
    }


    return Integer.valueOf(option);

  }

  /**
   * Print organizations integer.
   *
   * @param conn the conn
   * @return the integer
   * @throws SQLException the sql exception
   */
  public Integer printOrganizations(Connection conn) throws SQLException {
    List<String> organization_ids = new ArrayList<>();
    String command = "CALL printOrganizations(); ";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    System.out.println("Organizations:");

    while (rs.next()) {
      String out = String.format("%d %s",
              rs.getInt(1),
              rs.getString(2));
      String[] words = out.split(" ");

      // add the organization to list of available mentors
      organization_ids.add(words[0]);
      System.out.println(out);
    }

    System.out.println("Which country would you like to select? Type the id number.");
    //Scanner sc = new Scanner(System.in);
    String option = sc.nextLine();

    while (!organization_ids.contains(option)) {
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "\nWhich organization would you like to select? Type the id number.");
      option = sc.nextLine();
    }
    return Integer.valueOf(option);
  }

  /**
   * Print ethnicities integer.
   *
   * @param conn the conn
   * @return the integer
   * @throws SQLException the sql exception
   */
  public Integer printEthnicities(Connection conn) throws SQLException {
    List<String> ethnicity_ids = new ArrayList<>();
    String command = "CALL printEthnicities(); ";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    System.out.println("Ethnicities:");

    while (rs.next()) {
      String out = String.format("%d %s",
              rs.getInt(1),
              rs.getString(2));
      String[] words = out.split(" ");

      // add the ethnicity to list of available mentors
      ethnicity_ids.add(words[0]);

      System.out.println(out);
    }
    System.out.println("Which ethnicity would you like to select? Type the id number.");
    //Scanner sc = new Scanner(System.in);
    String option = sc.nextLine();

    while (!ethnicity_ids.contains(option)) {
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "\nWhich organization would you like to select? Type the id number.");
      option = sc.nextLine();
    }

    return Integer.valueOf(option);
  }

  /**
   * Print fields integer.
   *
   * @param conn the conn
   * @return the integer
   * @throws SQLException the sql exception
   */
  public Integer printFields(Connection conn) throws SQLException {
    List<String> field_ids = new ArrayList<>();
    String command = "CALL printFields();";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    System.out.println("Ethnicities:");

    while (rs.next()) {
      String out = String.format("%d %s",
              rs.getInt(1),
              rs.getString(2));
      String[] words = out.split(" ");

      // add the field to list of available mentors
      field_ids.add(words[0]);
      System.out.println(out);
    }
    System.out.println("Which field would you like to select? Type the id number.");
    //Scanner sc = new Scanner(System.in);
    String option = sc.nextLine();

    while (!field_ids.contains(option)) {
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "\nWhich organization would you like to select? Type the id number.");
      option = sc.nextLine();
    }

    return Integer.valueOf(option);

  }

  /**
   * Print degrees integer.
   *
   * @param conn the conn
   * @return the integer
   * @throws SQLException the sql exception
   */
  public Integer printDegrees(Connection conn) throws SQLException {
    List<String> degree_ids = new ArrayList<>();
    String command = "CALL printDegrees();";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    System.out.println("Degrees:");

    while (rs.next()) {
      String out = String.format("%-10d %-10s %-10s",
              rs.getInt(1),
              rs.getString(2),
              rs.getString(3));
      String[] words = out.split(" ");

      // add the degree to list of available mentors
      degree_ids.add(words[0]);
      System.out.println(out);
    }
    System.out.println("Which degree would you like to select? Type the id number.");
    //Scanner sc = new Scanner(System.in);
    String option = sc.nextLine();

    while (!degree_ids.contains(option)) {
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "\nWhich organization would you like to select? Type the id number.");
      option = sc.nextLine();
    }
    return Integer.valueOf(option);
  }

  /**
   * Find country name string.
   *
   * @param conn       the conn
   * @param country_id the country id
   * @return the string
   * @throws SQLException the sql exception
   */
  public String find_country_name(Connection conn, int country_id) throws SQLException {

    String command = "CALL find_country_name( " + country_id + ");";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    rs.next();
    String name = rs.getString(1);
    return name;
  }

  /**
   * Find ethnicity name string.
   *
   * @param conn         the conn
   * @param ethnicity_id the ethnicity id
   * @return the string
   * @throws SQLException the sql exception
   */
  public String find_ethnicity_name(Connection conn, int ethnicity_id) throws SQLException {
    String command = "CALL find_ethnicity_name( " + ethnicity_id + ");";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    rs.next();
    String name = rs.getString(1);
    return name;
  }

  /**
   * Find degree name string.
   *
   * @param conn      the conn
   * @param degree_id the degree id
   * @return the string
   * @throws SQLException the sql exception
   */
  public String find_degree_name(Connection conn, int degree_id) throws SQLException {
    String command = "CALL find_degree_name( " + degree_id + ");";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    rs.next();
    String name = rs.getString(1);
    return name;
  }

  /**
   * Find field name string.
   *
   * @param conn     the conn
   * @param field_id the field id
   * @return the string
   * @throws SQLException the sql exception
   */
  public String find_field_name(Connection conn, int field_id) throws SQLException {
    String command = "CALL find_field_name( " + field_id + ");";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    rs.next();
    String name = rs.getString(1);
    return name;
  }

  /**
   * Find org name string.
   *
   * @param conn   the conn
   * @param org_id the org id
   * @return the string
   * @throws SQLException the sql exception
   */
  public String find_org_name(Connection conn, int org_id) throws SQLException {
    String command = "CALL find_org_name( " + org_id + ");";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    rs.next();
    String name = rs.getString(1);
    return name;
  }

  /**
   * Country mentors string.
   *
   * @param conn      the conn
   * @param countryID the country id
   * @return the string
   * @throws SQLException the sql exception
   */
  public String country_mentors(Connection conn, Integer countryID) throws SQLException {
    List<String> country_mentors_ids = new ArrayList<>();
    String command = "CALL country_mentors( " + countryID + ");";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);

    //System.out.println("here");
    while (rs.next()) {
      int get_country = rs.getInt(4);
      String country = find_country_name(conn, get_country);

      int get_ethnicity = rs.getInt(5);
      String ethnicity = find_ethnicity_name(conn, get_ethnicity);

      int get_degree = rs.getInt(7);
      String degree = find_degree_name(conn, get_degree);

      int get_field = rs.getInt(8);
      String field = find_field_name(conn, get_field);

      int get_org = rs.getInt(9);
      String org = find_org_name(conn, get_org);
      //System.out.println(org);

      String out = String.format("%-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s",
              rs.getString(1),
              rs.getString(2),
              rs.getString(3),
              country,//
              ethnicity,//
              rs.getString(6),
              degree,//
              field,//
              org,//
              rs.getString(10)
              // rs.getString(11)

      );
      String[] words = out.split(" ");

      // add the mentor to list of available mentors
      country_mentors_ids.add(words[0]);

      System.out.println(out);
    }
    System.out.println("Which mentor would you like to message? Please enter their userID.");
    //Scanner sc = new Scanner(System.in);
    String mentor = sc.nextLine();

    while (!country_mentors_ids.contains(mentor)) {
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "Which mentor would you like to select? Please type their userID,");
      mentor = sc.nextLine();
    }
    return mentor;
  }


  /**
   * Organization mentors string.
   *
   * @param conn                  the conn
   * @param currentOrganizationID the current organization id
   * @return the string
   * @throws SQLException the sql exception
   */
  public String organization_mentors(Connection conn, Integer currentOrganizationID) throws SQLException {
    List<String> org_mentors_ids = new ArrayList<>();
    String command = "CALL organization_mentors(" + currentOrganizationID + ");";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);

    while (rs.next()) {
      int get_country = rs.getInt(4);
      String country = find_country_name(conn, get_country);

      int get_ethnicity = rs.getInt(5);
      String ethnicity = find_ethnicity_name(conn, get_ethnicity);

      int get_degree = rs.getInt(7);
      String degree = find_degree_name(conn, get_degree);

      int get_field = rs.getInt(8);
      String field = find_field_name(conn, get_field);

      int get_org = rs.getInt(9);
      String org = find_org_name(conn, get_org);


      String out = String.format("%-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s",
              rs.getString(1),
              rs.getString(2),
              rs.getString(3),
              country,//
              ethnicity,//
              rs.getString(6),
              degree,//
              field,//
              org,//
              rs.getString(10)
              // rs.getString(11)
      );
      String[] words = out.split(" ");

      // add the mentor to list of available mentors
      org_mentors_ids.add(words[0]);
      System.out.println(out);
    }


    System.out.println("Which mentor would you like to message? Please enter their userID.");
    //Scanner sc = new Scanner(System.in);
    String mentor = sc.nextLine();

    while (!org_mentors_ids.contains(mentor)) {
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "Which mentor would you like to select? Please type their userID,");
      mentor = sc.nextLine();
    }
    return mentor;
  }


  /**
   * Ethnicity mentors string.
   *
   * @param conn        the conn
   * @param ethnicityID the ethnicity id
   * @return the string
   * @throws SQLException the sql exception
   */
  public String ethnicity_mentors(Connection conn, Integer ethnicityID) throws SQLException {
    List<String> ethnicity_mentors_ids = new ArrayList<>();
    String command = "CALL ethnicity_mentors(" + ethnicityID + ");";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);

    while (rs.next()) {
      int get_country = rs.getInt(4);
      String country = find_country_name(conn, get_country);

      int get_ethnicity = rs.getInt(5);
      String ethnicity = find_ethnicity_name(conn, get_ethnicity);

      int get_degree = rs.getInt(7);
      String degree = find_degree_name(conn, get_degree);

      int get_field = rs.getInt(8);
      String field = find_field_name(conn, get_field);

      int get_org = rs.getInt(9);
      String org = find_org_name(conn, get_org);
      //System.out.println(org);

      String out = String.format("%-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s",
              rs.getString(1),
              rs.getString(2),
              rs.getString(3),
              country,//
              ethnicity,//
              rs.getString(6),
              degree,//
              field,//
              org,//
              rs.getString(10)
              // rs.getString(11)
      );
      String[] words = out.split(" ");

      // add the mentor to list of available mentors
      ethnicity_mentors_ids.add(words[0]);
      System.out.println(out);
    }
    System.out.println("Which mentor would you like to message? Please enter their userID.");
    Scanner sc = new Scanner(System.in);
    String mentor = sc.nextLine();

    while (!ethnicity_mentors_ids.contains(mentor)) {
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "Which mentor would you like to select? Please type their userID,");
      mentor = sc.nextLine();
    }
    return mentor;
  }


  /**
   * Field mentors string.
   *
   * @param conn    the conn
   * @param fieldID the field id
   * @return the string
   * @throws SQLException the sql exception
   */
  public String field_mentors(Connection conn, Integer fieldID) throws SQLException {
    List<String> field_mentors_ids = new ArrayList<>();
    String command = "CALL field_mentors(" + fieldID + ");";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);

    while (rs.next()) {
      int get_country = rs.getInt(4);
      String country = find_country_name(conn, get_country);

      int get_ethnicity = rs.getInt(5);
      String ethnicity = find_ethnicity_name(conn, get_ethnicity);

      int get_degree = rs.getInt(7);
      String degree = find_degree_name(conn, get_degree);

      int get_field = rs.getInt(8);
      String field = find_field_name(conn, get_field);

      int get_org = rs.getInt(9);
      String org = find_org_name(conn, get_org);
      //System.out.println(org);

      String out = String.format("%-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s",
              rs.getString(1),
              rs.getString(2),
              rs.getString(3),
              country,//
              ethnicity,//
              rs.getString(6),
              degree,//
              field,//
              org,//
              rs.getString(10)
              // rs.getString(11)
      );
      String[] words = out.split(" ");

      // add the mentor to list of available mentors
      field_mentors_ids.add(words[0]);
      System.out.println(out);
    }
    System.out.println("Which mentor would you like to message? Please enter their userID.");
    //Scanner sc = new Scanner(System.in);
    String mentor = sc.nextLine();

    while (!field_mentors_ids.contains(mentor)) {
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "Which mentor would you like to select? Please type their userID,");
      mentor = sc.nextLine();
    }
    return mentor;
  }

  /**
   * Degree mentors string.
   *
   * @param conn     the conn
   * @param degreeID the degree id
   * @return the string
   * @throws SQLException the sql exception
   */
  public String degree_mentors(Connection conn, Integer degreeID) throws SQLException {
    List<String> degree_mentors_ids = new ArrayList<>();
    String command = "CALL degree_mentors(" + degreeID + ");";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);

    while (rs.next()) {
      int get_country = rs.getInt(4);
      String country = find_country_name(conn, get_country);

      int get_ethnicity = rs.getInt(5);
      String ethnicity = find_ethnicity_name(conn, get_ethnicity);

      int get_degree = rs.getInt(7);
      String degree = find_degree_name(conn, get_degree);

      int get_field = rs.getInt(8);
      String field = find_field_name(conn, get_field);

      int get_org = rs.getInt(9);
      String org = find_org_name(conn, get_org);
      //System.out.println(org);

      String out = String.format("%-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s %-20s",
              rs.getString(1),
              rs.getString(2),
              rs.getString(3),
              country,//
              ethnicity,//
              rs.getString(6),
              degree,//
              field,//
              org,//
              rs.getString(10)
              // rs.getString(11)
      );
      String[] words = out.split(" ");

      // add the mentor to list of available mentors
      degree_mentors_ids.add(words[0]);
      System.out.println(out);
    }
    System.out.println("Which mentor would you like to message? Please enter their userID.");
    // Scanner sc = new Scanner(System.in);
    String mentor = sc.nextLine();

    while (!degree_mentors_ids.contains(mentor)) {
      System.out.println("Sorry, that is not a valid choice. Please enter a valid answer" +
              "Which mentor would you like to select? Please type their userID,");
      mentor = sc.nextLine();
    }
    return mentor;
  }

  /**
   * Is registered boolean.
   *
   * @param conn   the conn
   * @param userID the user id
   * @return the boolean
   * @throws SQLException the sql exception
   */
  public boolean is_registered(Connection conn, String userID) throws SQLException {
    String command = "CALL is_registered(\'" + userID + "\');";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    return rs.next();

  }

  /**
   * Find country id integer.
   *
   * @param conn    the conn
   * @param country the country
   * @return the integer
   * @throws SQLException the sql exception
   */
  public Integer find_country_id(Connection conn, String country) throws SQLException {
    String command = "CALL find_country_id(\'" + country + "\');";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    rs.next();
    int country_id = rs.getInt(1);

    return country_id;

  }

  /**
   * Find field id integer.
   *
   * @param conn  the conn
   * @param field the field
   * @return the integer
   * @throws SQLException the sql exception
   */
  public Integer find_field_id(Connection conn, String field) throws SQLException {
    String command = "CALL find_field_id(\'" + field + "\');";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    rs.next();
    int field_id = rs.getInt(1);

    return field_id;


  }

  /**
   * Register mentee.
   *
   * @param conn   the conn
   * @param userID the user id
   * @throws SQLException the sql exception
   */
  public void register_mentee(Connection conn, String userID) throws SQLException {
    //Scanner sc = new Scanner(System.in);
    System.out.println("Please enter your first name");
    String firstName = sc.nextLine();

    System.out.println("Please enter your last name");
    String lastName = sc.nextLine();

    System.out.println("Please enter your age");
    String age_string = sc.nextLine();
    int age = Integer.parseInt(age_string);

    System.out.println("Please enter your country");
    String country_string = sc.nextLine();
    int country = find_country_id(conn, country_string);

    System.out.println("Please enter your email");
    String email = sc.nextLine();

    System.out.println("Please enter your linkedin");
    String linkedin = sc.nextLine();

    System.out.println("Please enter your field");
    String field_string = sc.nextLine();
    int field = find_field_id(conn, field_string);

    String command = "INSERT INTO mentee (user_id, first_name, last_name, age, country_id, email, linkedIn, field_id) \n" +
            "VALUES ( ?,?,?,?,?,?,?,?)";

    PreparedStatement st = conn.prepareStatement(command);
    st.setString(1, userID);
    st.setString(2, firstName);
    st.setString(3, lastName);
    st.setInt(4, age);
    st.setInt(5, country);
    st.setString(6, email);
    st.setString(7, linkedin);
    st.setInt(8, field);

    int add = st.executeUpdate();

    System.out.println("Great! You are now registered.");

  }

  /**
   * Find request id integer.
   *
   * @param conn   the conn
   * @param mentor the mentor
   * @param mentee the mentee
   * @return the integer
   * @throws SQLException the sql exception
   */
  public Integer find_request_id(Connection conn, String mentor, String mentee) throws SQLException {
    String command = "CALL find_request_id( \'" + mentor + "\', \'" + mentee + "\');";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(command);
    rs.next();

    return rs.getInt(1);

  }

  /**
   * Message mentor.
   *
   * @param conn     the conn
   * @param mentorID the mentor id
   * @param menteeID the mentee id
   */
  public void message_mentor(Connection conn, String mentorID, String menteeID) {
    // Scanner sc = new Scanner(System.in);
    System.out.println("What would you like to message this mentor?");
    String message = sc.nextLine();

    try {
      String command = "INSERT INTO request_status(mentor_id, mentee_id) \n" +
              "VALUES(?,?)";

      PreparedStatement st = conn.prepareStatement(command);
      st.setString(1, mentorID);
      st.setString(2, menteeID);

      int add = st.executeUpdate();
      int request_id = this.find_request_id(conn, mentorID, menteeID);

      String command2 = "INSERT INTO pending_requests(request_id,mentor_id, mentee_id, message_to_mentor) \n" +
              "VALUES(?,?,?,?)";

      PreparedStatement st2 = conn.prepareStatement(command2);
      st2.setInt(1, request_id);
      st2.setString(2, mentorID);
      st2.setString(3, menteeID);
      st2.setString(4, message);

      int add2 = st2.executeUpdate();

    } catch (SQLException SQLe) {
      System.out.println(SQLe.getMessage());
    }
    System.out.println("Message was sent!");

  }

  /**
   * Search mentors.
   *
   * @param con    the con
   * @param mentee the mentee
   * @throws SQLException the sql exception
   */
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
      mentor = this.organization_mentors(con, id);
    } else if (option.equalsIgnoreCase("C")) {
      int id = this.printEthnicities(con);
      mentor = this.ethnicity_mentors(con, id);
    } else if (option.equalsIgnoreCase("D")) {
      int id = this.printFields(con);
      mentor = this.field_mentors(con, id);
    } else if (option.equalsIgnoreCase("E")) {
      int id = this.printDegrees(con);
      mentor = this.degree_mentors(con, id);
    } else if (option.equalsIgnoreCase("Q")) {
      return;
    }

    //check to see if there is a mentor they would like to message from the list
    this.message_mentor(con, mentor, mentee);
  }

  /**
   * Check requests.
   *
   * @param conn   the conn
   * @param mentee the mentee
   * @throws SQLException the sql exception
   */
  public void check_requests(Connection conn, String mentee) throws SQLException {
    String command = "CALL check_requests(\'" + mentee + "\');";
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


  /**
   * User mentee.
   *
   * @param con the con
   * @throws SQLException the sql exception
   */
// MENTEE INTERFACE
  public void user_mentee(Connection con) throws SQLException {
    //Scanner sc = new Scanner(System.in);
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
        this.search_mentors(con, mentee);
      }
      // check history of requests
      else if (choice.equalsIgnoreCase("B")) {
        this.check_requests(con, mentee);
      }
      //leave
      else if (choice.equalsIgnoreCase("C")) {
        System.out.println("Are you sure you would like to log out? Enter YES or NO");
        String confirm = sc.nextLine();
        if (confirm.equalsIgnoreCase("YES")) {
          break;
        }
      } else {
        System.out.println("Please enter a valid choice");
      }

    }
  }

  /**
   * The entry point of application.
   *
   * @param args the input arguments
   * @throws SQLException          the sql exception
   * @throws FileNotFoundException the file not found exception
   */
  public static void main(String[] args) throws SQLException, FileNotFoundException {
    // Read server_connect.txt which contains username and password of the local database
    String curDir = System.getProperty("user.dir");
    String file_name = curDir + "//server_connect.txt";
    //System.out.println(file_name);
    File file = new File(file_name);
    // Create a Scanner object for inputs
    Scanner scanFile = new Scanner(file);
    String userName = scanFile.nextLine();
    String password = scanFile.nextLine();

    // check username and password
    userName = userName.split(" ")[1];
    password = password.split(" ")[1];
    //System.out.println("Username is: " + userName);
    // System.out.println("Password is: " + password);

    Scanner sc = new Scanner(System.in);
    // Establish connection to mentorfinder database using username and password
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
    }
    // if mentee
    else if (user.equalsIgnoreCase("B")) {
      obj.user_mentee(con);
    }
    // invalid case
    else {
      System.out.println("Invalid Option!");
    }

    // close connection
    con.close();
    System.out.println("You have successfully logged out.");

  }
}