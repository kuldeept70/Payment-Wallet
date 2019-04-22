/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SupportClass;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.Timer;

/**
 *
 * @author Kuldeep Raj Tiwari
 */
public class TimeDate {
    public static void setDateTime(javax.swing.JLabel Dateshow,javax.swing.JLabel Timeshow){
        Date d=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
        Dateshow.setText(sdf.format(d));
        new Timer(0,new ActionListener(){ 
           
           public void actionPerformed(ActionEvent e){
             Date d=new Date();
             SimpleDateFormat sdf=new SimpleDateFormat("hh: mm: ss");
             Timeshow.setText(sdf.format(d));  
           }
        }).start();
    }
    public static void setDateTime(javax.swing.JTextField datetext,String format){
        Date d=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat(format);
        datetext.setText(sdf.format(d));
    }
    public static String getDate(String format){
        Date d=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat(format);
        return(sdf.format(d));
    }
    public static String getTime(String format){
        Date d=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat(format);
        return(sdf.format(d));
    }
    public static boolean checkdate(String date){
        Date d=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
        if(date.equals(sdf.format(d)))
            return true;
        else
            return false;
    }
}
