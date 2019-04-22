/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SupportClass;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Kuldeep Raj Tiwari
 */
public class OrgDeposit {
    public static int deposit(String uname,int amt,String date){
        int bal=-2;
        String email="";
        String mno="";
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery("Select Balance,email,MOB_NO from ORG_PRO where UNAME='"+uname+"'");
        while(rs.next()){
        bal=Integer.parseInt(rs.getString(1));
        email=rs.getString(2);
        mno=rs.getString(3);
        bal+=amt;
        }
        stmt.executeUpdate("Update ORG_PRO set BALANCE="+bal+" where UNAME='"+uname+"'");
        SendEmail.sendmail(email,"Your acc XXXX"+uname+"Credited with INR "+amt+" new balance is INR "+bal,"Transaction Alert");
        }
        catch(Exception e){System.out.println("testing "+e);return(-1);}
        return(bal);
    }
    
}
