/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SupportClass;

/**
 *
 * @author Kuldeep Raj Tiwari
 */
import kuldeep.*;
import java.sql.*;
public class Connect {
     Connection conn=null;
     Connection getConnection(){
     try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/PDBORCL","jnupay","654321");
        }
     catch(Exception e){ System.out.println("Error is: "+e); }
     return conn;
     }
 }

