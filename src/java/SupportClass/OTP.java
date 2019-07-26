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
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;
public class OTP {
    private final String USER_AGENT = "Mozilla/5.0";
    public static void sendOTP(String OTP,String mno) throws Exception {
            final String POST_PARAMS ="sender_id=FSTSMS&language=english&route=qt&numbers="+mno+"&message=7876&variables={#CC#}|{#AA#}&variables_values="+mno+"|"+OTP;
            //System.out.println(POST_PARAMS);
            URL obj = new URL("https://www.fast2sms.com/dev/bulk");
            HttpURLConnection postConnection = (HttpURLConnection) obj.openConnection();
            postConnection.setRequestMethod("POST");
            postConnection.setRequestProperty("authorization", "Your Own Key");
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
    public static int getOTP(){
        Random r=new Random();
        int otp=r.nextInt((9999-1000)+1)+1000;
        return(otp);
    } 
    
}
