/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SupportClass;

import kuldeep.*;
import Interface.UserDetails;
import java.util.*;
import java.sql.*;

/**
 *
 * @author Kuldeep Raj Tiwari
 */
public class ManagementImpl {
    public UserDetails getDetails(String uname,int type){
        //type=1(if account Customer type)and type=0(if Account is Corporate type)
        UserDetails u=new UserDetails();
        u.mno=null;
        u.uname=null;
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        if(type==1){
        ResultSet rs=stmt.executeQuery("Select * from USER_PRO where UNAME='"+uname+"'");
        while(rs.next()){
        u.mno=rs.getString(3);
        u.email=rs.getString(7);
        u.name=rs.getString(2);
        u.add=rs.getString(4);
        u.balance=Integer.parseInt(rs.getString(6));
        u.uname=rs.getString(1);
        return(u);
        }
        }
        else if(type==0){
        ResultSet rs=stmt.executeQuery("Select * from ORG_PRO where UNAME='"+uname+"'");
        while(rs.next()){
        u.name=rs.getString(2);
        u.balance=Integer.parseInt(rs.getString(4));
        u.add=rs.getString(3);
        u.mno=rs.getString(6);
        u.uname=rs.getString(1);
        return(u);
        }
        }
        }
        catch(Exception e){System.out.println(e);};
        return(u);
        
      }
      public UserDetails getDetails(String mno){
        //type=1(if account Customer type)and type=0(if Account is Corporate type)
        UserDetails u=new UserDetails();
        u.mno=null;
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery("Select * from USER_PRO where MOB_NO='"+mno+"'");
        while(rs.next()){
        u.mno=rs.getString(3);
        u.email=rs.getString(7);
        u.name=rs.getString(2);
        u.add=rs.getString(4);
        u.balance=Integer.parseInt(rs.getString(6));
        u.uname=rs.getString(1);
        return(u);
        }
        }
        catch(Exception e){System.out.println(e);};
        return(u);
        
      }
     public UserDetails OrgGetDetails(String uname){
        //type=1(if account Customer type)and type=0(if Account is Corporate type)
        UserDetails u=new UserDetails();
        u.uname=null;
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery("Select * from ORG_PRO where UNAME='"+uname+"'");
        while(rs.next()){
        u.uname=rs.getString(1);
        return(u);
        }
        }
        catch(Exception e){System.out.println(e);};
        return(u);
        
      }
    /*
    public int newRegistration(UserDetails u){
       int flag=0; 
       try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery("Select acc,flag from USERDETAIL where acc="+u.acc+" and mob="+u.mno);
        while(rs.next()){
            flag=1;
            if(Integer.parseInt(rs.getString(2))==0){
            System.out.println(" User acc found ");
            ResultSet res=stmt.executeQuery("Select * from USERLOGIN where username='"+u.uname+"'");
            while(res.next()){
                throw new ArithmeticException();
            }
            stmt.executeUpdate("Update USERDETAIL SET SECURITYQNS='"+u.sq+"',SECURITYANS='"+u.ans+"',USERNAME='"+u.uname+"',flag=1 where acc="+u.acc);
            stmt.executeUpdate("insert into USERLOGIN (USERNAME,PWD) VALUES ('"+u.uname+"','"+u.password+"')");
            return(1);
            }
            else
            {System.out.println("this acc already has username");return(-2);}
        }
       }
       catch(ArithmeticException e){System.out.println("User already exist");return(-1);}
       catch(Exception e){System.out.println("Registration "+e);};
       if(flag==1)
          return(0);
       else
           return(-3);
    }
    */
    public int openAccount(UserDetails u){
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        stmt.executeUpdate("Insert INTO USER_PRO(UNAME,NAME,MOB_NO,ADDRESS,DOB,EMAIL,BALANCE) Values('"+u.uid+"','"+u.name+"','"+u.mno+"','"+u.add+"','"+u.dob+"','"+u.email+"','"+u.balance+"')");
        stmt.executeUpdate("Insert INTO USER_AUTH(UNAME,PWD) Values('"+u.uid+"','"+u.password+"')");
        }catch(Exception e){System.out.println("openAccount error "+e);return 0;}
        return(1);
    }
    public int CopenAccount(UserDetails u){
        // in this program type is stored in dob exceptionaly.
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        stmt.executeUpdate("Insert INTO ORG_PRO(UNAME,NAME,MOB_NO,ADDRESS,TYPE,EMAIL,BALANCE) Values('"+u.uid+"','"+u.name+"','"+u.mno+"','"+u.add+"','"+u.dob+"','"+u.email+"','"+u.balance+"')");
        stmt.executeUpdate("Insert INTO USER_AUTH(UNAME,PWD) Values('"+u.uid+"','"+u.password+"')");
        }catch(Exception e){System.out.println("openAccount error "+e);return 0;}
        return(1);
    }
    /*
    public int withdraw(String mno,int amt,String date){
        int temp=Withdraw.withdraw(mno, amt, date);
        if((temp!=-1)&&(temp!=-2)){
          MakeStatement.createStatement(acc, amt, temp, date, "by bank withdraw");
          return(temp);
        }
        else
            return(temp);
    }
    public int deposit(int acc,int amt,String date){
        int temp=Deposit.deposit(acc, amt, date);
        if(temp!=-1&&temp!=-2){
            MakeStatement.createStatement(acc, amt, temp, date, "by bank deposit");
            return(temp);
        }
        else
            return(temp);
    }
    */
    public int moneyTransfer (UserDetails user,String r_mno,int amt,String date){
        if(user.mno.equals(r_mno)){
            return(-1);
        }
        UserDetails u=getDetails(r_mno);
        //return -2 for insufficient balance,-1 for error in Money Transfer,-3 if Receiver not found,else return balance;
        if(u.mno==null)
            return(-3);
        else{
            int temp=Withdraw.withdraw(user.mno,amt,date);
            if((temp!=-1)&&(temp!=-2)){
             int xtemp=Deposit.deposit(r_mno, amt, date);
             if(xtemp!=-1&&xtemp!=-2)
             {   MakeStatement.createStatementCredit(u.uname, amt, xtemp, date,"Transfer by User acc "+user.mno,TimeDate.getTime("a hh/mm/ss"));
                 MakeStatement.createStatementDebit(user.uname, amt,temp, date,"Transfer to acc"+r_mno,TimeDate.getTime("a hh/mm/ss"));
                 return(temp);
             }
             else
             { Deposit.deposit(user.mno,amt,date);
                return(-1);
             }
            }
            return(temp);
        }
    }
    public int TransferToOrg (UserDetails user,String runame,int amt,String date){
        UserDetails u=OrgGetDetails(runame);
        //return -2 for insufficient balance,-1 for error in Money Transfer,-3 if Receiver not found,else return balance;
        if(u.uname==null)
            return(-3);
        else{
            int temp=Withdraw.withdraw(user.mno,amt,date);
            if((temp!=-1)&&(temp!=-2)){
            int xtemp=OrgDeposit.deposit(runame, amt, date);
            if(xtemp!=-1&&xtemp!=-2)
             {   MakeStatement.createStatementCredit_Cor(u.uname, amt, xtemp, date,"Transfer by User acc "+user.mno,TimeDate.getTime("a hh/mm/ss"),user.mno);
                 MakeStatement.createStatementDebit(user.uname, amt,temp, date,"Transfer to Org_acc"+runame,TimeDate.getTime("a hh/mm/ss"));
                 return(temp);
             }
             else
             { Deposit.deposit(user.mno,amt,date);
                return(-1);
             }
            }
            return(temp);
        }
    }
    public int TransferToCust(UserDetails u,String Sender,int amt){
        UserDetails user=getDetails(Sender);
        //return -2 for insufficient balance,-1 for error in Money Transfer,-3 if Receiver not found,else return balance;
        if(user.uname==null)
            return(-3);
        else{
            int temp=OrgWithdraw.withdraw(u.uname,amt,TimeDate.getDate("yyyy/MM/dd"));
            if((temp!=-1)&&(temp!=-2)){
            int xtemp=Deposit.deposit(user.mno, amt,TimeDate.getDate("yyyy/MM/dd"));
            if(xtemp!=-1&&xtemp!=-2)
             {   MakeStatement.createStatementDebit_Cor(u.uname, amt,temp,TimeDate.getDate("yyyy/MM/dd"),"Refund done to user Account :"+Sender,TimeDate.getTime("a hh/mm/ss"));
                 MakeStatement.createStatementCredit(user.uname, amt,xtemp,TimeDate.getDate("yyyy/MM/dd"),"Refund by Org_acc"+u.uname,TimeDate.getTime("a hh/mm/ss"));
                 return(temp);
             }
             else
             { OrgDeposit.deposit(u.uname, amt,TimeDate.getDate("yyyy/MM/dd"));
                return(-1);
             }
            }
            return(temp);
        }
    }
    public int CorAcceptMoney(UserDetails u,String Date,String Time,String Sender){
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        stmt.executeQuery("Update Transaction_cor set status="+1+" where uname='"+u.uname+"' and Trans_date='"+Date+"'and Trans_time='"+Time+"' and Sender_Acc='"+Sender+"'");
        return(1);
        }
        catch(Exception e){System.out.println(e);};
        return(0);   
    }
/*
    public int billPayment(int acc,int amt,String date){
        int temp=Withdraw.withdraw(acc,amt,date);
        if((temp!=-1)&&(temp!=-2)){
          MakeStatement.createStatement(acc, amt,temp, date,"bill paid ");
                 return(1);
        }
        else
            return(temp);
    }
*/
    public ArrayList<TransactionElement> getAccStatement(String Uname){
        ArrayList<TransactionElement> temp=new ArrayList<>();
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery("Select * from Transaction where UNAME='"+Uname+"' order by TRANS_DATE DESC,TRANS_TIME DESC");
        while(rs.next()){
            TransactionElement ele=new TransactionElement();
            ele.Date=rs.getString(2);
            ele.Time=rs.getString(6);
            if(rs.getString(3)!=null)
              ele.Credit=rs.getString(3);
            if(rs.getString(7)!=null)
              ele.Debit=rs.getString(7);
            ele.finalamt=rs.getString(4);
            ele.detail=rs.getString(5);
            temp.add(ele);
        }
        }catch(Exception e){ System.out.println("account statement Not printed "+e);}
        return(temp);
    }
    public ArrayList<TransactionElement> getAccStatement_Cor(String Uname){
        ArrayList<TransactionElement> temp=new ArrayList<>();
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery("Select * from Transaction_Cor where UNAME='"+Uname+"' order by TRANS_DATE DESC,TRANS_TIME DESC");
        while(rs.next()){
            TransactionElement ele=new TransactionElement();
            ele.Date=rs.getString(2);
            ele.Time=rs.getString(3);
            if(rs.getString(4)!=null)
              ele.Credit=rs.getString(4);
            if(rs.getString(5)!=null)
              ele.Debit=rs.getString(5);
            ele.finalamt=rs.getString(6);
            ele.detail=rs.getString(7);
            ele.senderacc=rs.getString(9);
            temp.add(ele);
        }
        }catch(Exception e){ System.out.println("account statement Not printed "+e);}
        return(temp);
    }
    public ArrayList<TransactionElement> getUnsettledStatement_Cor(String Uname){
        ArrayList<TransactionElement> temp=new ArrayList<>();
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery("Select * from Transaction_Cor where UNAME='"+Uname+"' AND status="+0+" order by TRANS_DATE DESC,TRANS_TIME DESC");
        while(rs.next()){
            TransactionElement ele=new TransactionElement();
            ele.Date=rs.getString(2);
            ele.Time=rs.getString(3);
            if(rs.getString(4)!=null)
              ele.Credit=rs.getString(4);
            if(rs.getString(5)!=null)
              ele.Debit=rs.getString(5);
            ele.finalamt=rs.getString(6);
            ele.detail=rs.getString(7);
            ele.senderacc=rs.getString(9);
            temp.add(ele);
        }
        }catch(Exception e){ System.out.println("account statement Not printed "+e);}
        return(temp);
    }
    public boolean login(String uname,String p){
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery("Select * from USER_AUTH where uname='"+uname+"' and pwd='"+p+"'");
        while(rs.next()){
           return(true);
        }
        }
        catch(Exception e)
        {System.out.println("error in login "+e);
        }
        return(false);
    }
    public int UserChangeMobile(String mno,String nmno){
        int result=-1;
        // return -1 if any error occured ,-2 if mobile number already exist,on successful change return 1; 
        if(!CheckMobile.UserCheck(nmno)){
            try{
            Connection conn=new Connect().getConnection();
            Statement stmt=conn.createStatement();
            stmt.executeUpdate("Update USER_PRO set MOB_NO='"+nmno+"' where MOB_NO='"+mno+"'");
            return(1);
            }
            catch(Exception e){
                System.out.println(" Error is: "+e);
                return(-1);
            }
        }
        else{
            return(-2);
        }
    }
    public int OrgChangeMobile(String mno,String nmno){
        int result=-1;
        // return -1 if any error occured ,-2 if mobile number already exist,on successful change return 1; 
        if(!CheckMobile.CUserCheck(nmno)){
            try{
            Connection conn=new Connect().getConnection();
            Statement stmt=conn.createStatement();
            stmt.executeUpdate("Update ORG_PRO set MOB_NO='"+nmno+"' where MOB_NO='"+mno+"'");
            return(1);
            }
            catch(Exception e){
                System.out.println(" Error is: "+e);
                return(-1);
            }
        }
        else{
            return(-2);
        }
    }
/*
    public int changePassword(int acc,String pwd,String sec_ans){
        String str="";
        try{
        Connection conn=new Connect().getConnection();
        Statement stmt=conn.createStatement();
        ResultSet res=stmt.executeQuery("Select username from USERDETAIL where acc="+acc+" and securityans='"+sec_ans+"'");
        while(res.next()){
          str=res.getString(1);
          stmt.execute("Update Userlogin SET pwd='"+pwd+"'where username='"+str+"'");
            return(1);
        }
        }catch(Exception e){System.out.println(" Error in change password "+e);}
        return(0);
    }
*/
    public String SendOtp(String mno){
        String otpgenerated="";
        otpgenerated=Integer.toString(OTP.getOTP());
        try{
        OTP.sendOTP(otpgenerated, mno);
        return(otpgenerated);
        }
        catch(Exception e){System.out.println("Error Occured: "+e+"   Otp sending failing.try to resolve OTP issue.");};
        return(otpgenerated);
    }
}
