/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kuldeep;
import SupportClass.ManagementImpl;
import SupportClass.TransactionElement;
import java.net.*;
import java.io.*;
import java.util.ArrayList;
import javax.net.ssl.HttpsURLConnection;
/**
 *
 * @author Kuldeep Raj Tiwari
 */
public class test {
    private final String USER_AGENT = "Mozilla/5.0";
        public static void sendOTP(String OTP,String mno) throws Exception {
            final String POST_PARAMS ="sender_id=FSTSMS&language=english&route=qt&numbers="+mno+"&message=7876&variables={#CC#}|{#AA#}&variables_values="+mno+"|"+OTP;
            System.out.println(POST_PARAMS);
            URL obj = new URL("https://www.fast2sms.com/dev/bulk");
            HttpURLConnection postConnection = (HttpURLConnection) obj.openConnection();
            postConnection.setRequestMethod("POST");
            postConnection.setRequestProperty("authorization", "3oDv6MhfpEl54r8kNgRJHWIab2XydquPFBQOKCVnULmxs71ATjFYqxoSjbz9lHCiNnMk72t4V3aWU6gm");
            postConnection.setRequestProperty("cache-control", "no-cache");
            postConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            postConnection.setDoOutput(true);
            OutputStream os = postConnection.getOutputStream();
            os.write(POST_PARAMS.getBytes());
            os.flush();
            os.close();
            int responseCode = postConnection.getResponseCode();
            System.out.println("POST Response Code :  " + responseCode);
            System.out.println("POST Response Message : " + postConnection.getResponseMessage());
        }
	public static void main(String args[]) throws Exception{
            //test.sendOTP("3421","9450353438");
            ManagementImpl m=new ManagementImpl();
            ArrayList<TransactionElement> test=m.getUnsettledStatement_Cor("kuldeep");
            int i;
            TransactionElement e;
            for(i=0;i<test.size();i++){
                e=test.get(i);
                System.out.println(e.Date+"\t"+e.Time+"\t"+e.Credit+"\t"+e.Debit+"\t"+e.finalamt+"\t"+e.detail);
            }
        }
    
}
