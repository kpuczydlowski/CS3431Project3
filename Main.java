import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {
    static Connection connection;

    public static void viewPatientTable(String patientSSN) {

        java.sql.Statement stmt = null;
        String query =  "Select SSN, FName, LName, Address, TelNum " +
                "From Patient P " +
                "Where P.SSN = " + patientSSN;
        try {
            stmt = connection.createStatement();
            java.sql.ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                String SSN = rs.getString("SSN");
                String FName = rs.getString("FName");
                String LName = rs.getString("LName");
                String Address = rs.getString("Address");
                String TelNum = rs.getString("TelNum");

                System.out.println("Patient SSN: " + SSN);
                System.out.println("Patient First Name: " + FName);
                System.out.println("Patient Last Name: " + LName);
                System.out.println("Patient Address: " + Address);
                System.out.println("Patient Telephone Number: " + TelNum);
                System.out.println();

            }
        } catch (SQLException e ) {
            System.out.println(e);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    System.out.println(e);
                }
            }
        }
    }

    public static void viewDoctorTable(Integer doctorID) {

        java.sql.Statement stmt = null;
        String query =  "Select ID, FirstName, LastName, gender, Speciality " +
                "From Doctor D " +
                "Where D.ID = " + doctorID;
        try {
            stmt = connection.createStatement();
            java.sql.ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Integer ID = rs.getInt("ID");
                String FirstName = rs.getString("FirstName");
                String LastName = rs.getString("LastName");
                String gender = rs.getString("gender");
                String Speciality = rs.getString("Speciality");

                System.out.println("Doctor ID: " + ID);
                System.out.println("Doctor First Name: " + FirstName);
                System.out.println("Doctor Last Name: " + LastName);
                System.out.println("Doctor Gender: " + gender);
                System.out.println("Doctor Speciality: " + Speciality);
                System.out.println();

            }
        } catch (SQLException e ) {
            System.out.println(e);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    System.out.println(e);
                }
            }
        }
    }

    public static void viewAdmissionTable(Integer admissionNum) {

        java.sql.Statement stmt = null;
        String query =  "Select Num, AdmissionDate, LeaveDate, TotalPayment " +
                "From Admission A " +
                "Where A.Num = " + admissionNum;

        String query2 =  "Select roomNum, startDate, endDate " +
                "From StayIn S " +
                "Where S.AdmissionNum = " + admissionNum;

        String query3 =  "Select doctorID " +
                "From Examine E " +
                "Where E.AdmissionNum = " + admissionNum;

        try {
            stmt = connection.createStatement();
            java.sql.ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Integer Num = rs.getInt("Num");
                String AdmissionDate = rs.getString("AdmissionDate");
                String LeaveDate = rs.getString("LeaveDate");
                Integer TotalPayment = rs.getInt("TotalPayment");

                System.out.println("Admission Num: " + Num);
                System.out.println("Admission Date: " + AdmissionDate);
                System.out.println("Leave Date: " + LeaveDate);
                System.out.println("Total Payment: " + TotalPayment);
                System.out.println();

            }
            System.out.println("Rooms:");
            java.sql.ResultSet rs2 = stmt.executeQuery(query2);
            while (rs2.next()) {
                Integer roomNum = rs2.getInt("roomNum");
                String startDate = rs2.getString("startDate");
                String endDate = rs2.getString("endDate");
                System.out.println("\tRoomNum: " + roomNum + " startDate: " + startDate + " endDate: " + endDate );
            }

            System.out.println("Doctors:");
            java.sql.ResultSet rs3 = stmt.executeQuery(query3);
            while (rs3.next()) {
                Integer doctorID = rs3.getInt("doctorID");
                System.out.println("\tDoctorID: " + doctorID );


            }

        } catch (SQLException e ) {
            System.out.println(e);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    System.out.println(e);
                }
            }
        }
    }

    public static void setAdmissionTable(Integer admissionNum, Integer payment) {

        java.sql.Statement stmt = null;
        String query =  "Update Admission " +
                "Set TotalPayment = " + payment + " " +
                "Where Num = " + admissionNum;

        try {
            stmt = connection.createStatement();
            java.sql.ResultSet rs = stmt.executeQuery(query);

        } catch (SQLException e ) {
            System.out.println(e);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    System.out.println(e);
                }
            }
        }
    }


    public static void main(String[] args) {

        if (args.length < 2) {
            System.out.println("Usage: java Connector [username] [password] [(optional) value]");
            System.out.println("Value can be:");
            return;
        } else if (args.length == 2) {
            System.out.println("1 -> Report	Patients	Basic	Information");
            System.out.println("2 -> Report	Doctors	Basic	Information");
            System.out.println("3 -> Report	Admissions	Information");
            System.out.println("4 -> Update	Admissions	Payment");
            return;
        }

        System.out.println("-------- Oracle JDBC Connection Testing ------");
        System.out.println("-------- Step 1: Registering Oracle Driver ------");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            System.out.println("Where is your Oracle JDBC Driver? Did you follow the execution steps. ");
            System.out.println("");
            System.out.println("*****Open the file and read the comments in the beginning of the file****");
            System.out.println("");
            e.printStackTrace();
            System.exit(1);
        }

        System.out.println("Oracle JDBC Driver Registered Successfully !");

        try {
            connection = DriverManager.getConnection(
                    "jdbc:oracle:thin:@oracle.wpi.edu:1521:orcl",
                    args[0],
                    args[1]);

        } catch (SQLException e) {
            System.out.println("Connection Failed! Check output console");
            e.printStackTrace();
            return;
        }

        System.out.println("Connection Successful !");

        System.out.println();

        if (args[2].equals("1")){
            String input   =  System.console().readLine("Enter Patient SSN: ");
            viewPatientTable(input);
        }

        if (args[2].equals("2")){
            String input   =  System.console().readLine("Enter Doctor ID: ");
            viewDoctorTable(Integer.parseInt(input));
        }

        if (args[2].equals("3")){
            String input   =  System.console().readLine("Enter Admission Num: ");
            viewAdmissionTable(Integer.parseInt(input));
        }

        if (args[2].equals("4")){
            String input   =  System.console().readLine("Enter Admission Num: ");
            String input2   =  System.console().readLine("Enter New Amount: ");
            setAdmissionTable(Integer.parseInt(input), Integer.parseInt(input2));
        }


    }
}
