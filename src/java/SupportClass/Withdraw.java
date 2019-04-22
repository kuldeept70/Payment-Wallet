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
public class Withdraw {
    public static int withdraw(String mno,int amt,String date){
        //Return -2 for insufficient balance 0 if user not found with this mobile number -1 if error occured or Account not found otherwise return balance;
        int bal=-1;
        int flag=0;
        String email="";
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery("Select BALANCE,EMAIL from USER_PRO where MOB_NO='"+mno+"'");
        while(rs.next()){
        bal=Integer.parseInt(rs.getString(1));
        email=rs.getString(2);
        flag=1;
        }
        if(amt<=bal)
        { bal-=amt;
          stmt.executeUpdate("Update USER_PRO set BALANCE="+bal+" where MOB_NO='"+mno+"'");
          SendEmail.sendmail(email, "Your acc XXXX"+mno+" debited with amount INR "+amt+" Your balance is INR "+bal,"Transaction Alert");
        }
        else
            throw new ArithmeticException();
        }
        catch(ArithmeticException e){if(flag==1)return(-2);else return(-1);}
        catch(Exception e){System.out.println("err ; "+e);return(-1);}
        return(bal);
    }
    
}
