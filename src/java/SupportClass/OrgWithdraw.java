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
public class OrgWithdraw {
    public static int withdraw(String uname,int amt,String date){
        int bal=0;
        int flag=0;
        String email="";
        String mno="";
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery("Select BALANCE,EMAIL,MOB_NO from ORG_PRO where UNAME='"+uname+"'");
        while(rs.next()){
        bal=Integer.parseInt(rs.getString(1));
        email=rs.getString(2);
        mno=rs.getString(3);
        flag=1;
        }
        if(amt<=bal)
        { bal-=amt;
          stmt.executeUpdate("Update ORG_PRO set BALANCE="+bal+" where UNAME='"+uname+"'");
          SendEmail.sendmail(email, "Your acc XXXX"+uname+" debited with amount INR "+amt+" Your balance is INR "+bal,"Transaction Alert");
        }
        else
            throw new ArithmeticException();
        }
        catch(ArithmeticException e){if(flag==1)return(-2);else return(-1);}
        catch(Exception e){System.out.println("err ; "+e);return(-1);}
        return(bal);
    }
}
