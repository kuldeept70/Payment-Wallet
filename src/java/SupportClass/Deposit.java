/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SupportClass;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.net.*;

/**
 *
 * @author Kuldeep Raj Tiwari
 */
public class Deposit {
    public static int deposit(String mno,int amt,String date){
        int bal=-2;
        String email="";
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery("Select Balance,email from USER_PRO where MOB_NO='"+mno+"'");
        while(rs.next()){
        bal=Integer.parseInt(rs.getString(1));
        email=rs.getString(2);
        bal+=amt;
        }
        stmt.executeUpdate("Update USER_PRO set BALANCE="+bal+" where MOB_NO='"+mno+"'");
        SendEmail.sendmail(email,"Your acc XXXX"+mno+"Credited with INR "+amt+" new balance is INR "+bal,"Transaction Alert");
        }
        catch(Exception e){System.out.println("testing "+e);return(-1);}
        return(bal);
    }
    
}
