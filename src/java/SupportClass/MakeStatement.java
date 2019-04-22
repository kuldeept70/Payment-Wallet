/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SupportClass;

import java.sql.*;

/**
 *
 * @author Kuldeep Raj Tiwari
 */
public class MakeStatement {
    public static void createStatementCredit(String uname,int amt,int bal,String date,String by,String Time){
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        try{
        if(stmt.executeUpdate("INSERT INTO TRANSACTION (UNAME,TRANS_DATE,CREDIT,FINAL_AMT,DETAIL,TRANS_TIME) VALUES('"+uname+"','"+date+"','"+Integer.toString(amt)+"','"+Integer.toString(bal)+"','"+by+"','"+Time+"' )")==0)
            System.out.print("No row affected");
        }catch(Exception e){System.out.println("hello "+e);}
        }
        catch(Exception e){ System.out.println(e);}
    }
    public static void createStatementDebit(String uname,int amt,int bal,String date,String by,String Time){
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        try{
        if(stmt.executeUpdate("INSERT INTO TRANSACTION (UNAME,TRANS_DATE,DEBIT,FINAL_AMT,DETAIL,TRANS_TIME) VALUES('"+uname+"','"+date+"','"+Integer.toString(amt)+"','"+Integer.toString(bal)+"','"+by+"','"+Time+"' )")==0)
            System.out.print("No row affected");
        }catch(Exception e){System.out.println("hello "+e);}
        }
        catch(Exception e){ System.out.println(e);}
    }
    public static void createStatementCredit_Cor(String uname,int amt,int bal,String date,String by,String Time,String sender){
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        try{
        if(stmt.executeUpdate("INSERT INTO TRANSACTION_COR (UNAME,TRANS_DATE,CREDIT,FINAL_AMT,DETAIL,TRANS_TIME,STATUS,SENDER_ACC) VALUES('"+uname+"','"+date+"','"+Integer.toString(amt)+"','"+Integer.toString(bal)+"','"+by+"','"+Time+"' ,"+0+",'"+sender+"')")==0)
            System.out.print("No row affected");
        }catch(Exception e){System.out.println("hello "+e);}
        }
        catch(Exception e){ System.out.println(e);}
    }
    public static void createStatementDebit_Cor(String uname,int amt,int bal,String date,String by,String Time){
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        try{
        if(stmt.executeUpdate("INSERT INTO TRANSACTION_COR (UNAME,TRANS_DATE,DEBIT,FINAL_AMT,DETAIL,TRANS_TIME,STATUS) VALUES('"+uname+"','"+date+"','"+Integer.toString(amt)+"','"+Integer.toString(bal)+"','"+by+"','"+Time+"' ,"+1+")")==0)
            System.out.print("No row affected");
        }catch(Exception e){System.out.println("hello "+e);}
        }
        catch(Exception e){ System.out.println(e);}
    }
}
