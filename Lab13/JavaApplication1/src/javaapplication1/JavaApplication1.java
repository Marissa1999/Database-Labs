package javaapplication1;
import java.sql.*;

/**
 * Practice SQL Using Java
 * @author Marissa Gonçalves
 */

public class JavaApplication1 
{


   public static void main(String[] args) throws ClassNotFoundException, SQLException
   {
         //Method which allows to connect to Oracle database
         connecttoOracle("scott","tiger");
   }

   
   /*  Method for creating tables */

   public static void connecttoOracle(String username, String password)
   {
      Connection c = null;

      try
      {
          
         System.out.println(" --> DRIVER LOADING ...  * ");
         System.out.println(" -------------------------------------- \n");
          
         Class.forName("oracle.jdbc.driver.OracleDriver");
               String url = "jdbc:oracle:thin:@ localhost:1521:xe";
               c = DriverManager.getConnection(url, username, password);

         c.setAutoCommit(true);

         Statement s = c.createStatement();

         createFaculty(c,s);
         c.commit();
         c.setAutoCommit(true);
         c.close();
         
      }
      
      
      catch(Exception e)
      {
          
         try
         {
            c.rollback();
         }
         
         catch(Exception ee)
         {System.out.println("Error !" );}
         System.out.println("Error - Database Management for creating tables() : " + e);
         
      }

   }

   
   
   private static void createFaculty(Connection c, Statement s) throws Exception
   {
       
      try
      {
          
           String query;
          
          
           System.out.println(" ******** DROP FACULTY TABLE ******** ");
           query = "DROP TABLE faculty1 ";
           s.executeUpdate(query);
          
          
          
          System.out.println(" --> STEP 1: CREATION OF FACULTY1 TABLE ");
          System.out.println(" -------------------------------------- \n");
          
          
          query = "CREATE TABLE faculty1 ";
          query = query + "(f_id NUMBER(5), f_last VARCHAR2(30), f_first VARCHAR2(30), " +
                   "CONSTRAINT faculty1_f_id_pk PRIMARY KEY (f_id))";
          s.executeUpdate(query);
          
          
          System.out.println(" --> STEP 2: INSERTING OF RECORDS INTO FACULTY TABLE ");
          System.out.println(" --------------------------------------------------- ");
          
          
          System.out.println(" **** 1 - Robertson - Myra");
          query = "INSERT INTO faculty1 ";
          query = query + "(f_id, f_last, f_first)";
          query = query + "VALUES";
          query = query + "(1, 'Robertson', 'Myra')";
          s.executeUpdate(query);
          
          
          System.out.println(" **** 2 - Smith - Neal");
          query = "INSERT INTO faculty1 ";
          query = query + "(f_id, f_last, f_first )";
          query = query + "VALUES";
          query = query + "(2, 'Smith', 'Neal')";
          s.executeUpdate(query);
          
          
          System.out.println(" **** 3 - Arlec - Lisa");
          query = "INSERT INTO faculty1 ";
          query = query + "(f_id, f_last, f_first )";
          query = query + "VALUES";
          query = query + "(3, 'Arlec', 'Lisa')";
          s.executeUpdate(query);
          
          
          System.out.println(" **** 4 - Fillipo - Paul");
          query = "INSERT INTO faculty1 ";
          query = query + "(f_id, f_last, f_first )";
          query = query + "VALUES";
          query = query + "(4, 'Fillipo', 'Paul')";
          s.executeUpdate(query);
          
          
          System.out.println(" **** 5 - Denver - Paul");
          query = "INSERT INTO faculty1 ";
          query = query + "(f_id, f_last, f_first )";
          query = query + "VALUES";
          query = query + "(5, 'Denver', 'Paul')";
          s.executeUpdate(query);
          
          
          System.out.println(" **** 6 - Gonçalves - Marissa");
          query = "INSERT INTO faculty1 ";
          query = query + "(f_id, f_last, f_first )";
          query = query + "VALUES";
          query = query + "(6, 'Gonçalves', 'Marissa')";
          s.executeUpdate(query);
         
          
          System.out.println("");
          System.out.println("");
          
 
      }
      
      catch(Exception e)
      {    
         System.out.println("Gets an Error When trying to create a table during a session \n"
         + e.toString());        
      }
      
   }
   
}

