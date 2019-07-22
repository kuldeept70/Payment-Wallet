/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SupportClass;

import SupportClass.Connect;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Kuldeep Raj Tiwari
 */
public class CheckMobile {
    public static boolean UserCheck(String mno){
        // return true if mobile number already exist,or any error occured otherwise return false if mobile number does not exist;
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery("Select * from USER_PRO where MOB_NO='"+mno+"'");
        while(rs.next()){
           return(true);
        }
        }
        catch(Exception e){System.out.println("erro is : "+e);return(true);}
        return(false);
    }
    public static boolean CUserCheck(String mno){
        // return true if mobile number already exist,or any error occured otherwise return false if mobile number does not exist;
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery("Select * from ORG_PRO where MOB_NO='"+mno+"'");
        while(rs.next()){
           return(true);
        }
        }
        catch(Exception e){System.out.println("erro is : "+e);return(true);}
        return(false);
    }
    public static boolean CheckUserName(String uname){
        // Return true if UserName already exist,or any error occured otherwise return false if username doesnot already exist in database; 
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery("Select * from USER_AUTH where UNAME='"+uname+"'");
        while(rs.next()){
           return(true);
        }
        }
        catch(Exception e){System.out.println("erro is : "+e);return(true);}
        return(false);
    }
}
