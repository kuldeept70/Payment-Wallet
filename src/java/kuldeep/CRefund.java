/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kuldeep;

import Interface.UserDetails;
import SupportClass.ManagementImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kuldeep Raj Tiwari
 */
public class CRefund extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sess=request.getSession();
        if(sess.getAttribute("cDetail")!=null){
            UserDetails u=(UserDetails)sess.getAttribute("cDetail");
            String sender=request.getParameter("sender");
            String time=request.getParameter("time");
            String date=request.getParameter("date");
            int amt=Integer.parseInt(request.getParameter("amt"));
            ManagementImpl m=new ManagementImpl();
            int res=m.CorAcceptMoney(u, date, time, sender);
            if(res==1){
               int transfer=m.TransferToCust(u, sender,amt);
               if(transfer!=-1&&transfer!=-2&&transfer!=-3){
                   sess.setAttribute("status","Refund Successful. Your new Balance is: "+transfer);
                   u.balance=transfer;
                   sess.setAttribute("cDetail", u);
                   response.sendRedirect("CRefund.jsp");
               }
               else if(transfer==-2){
                sess.setAttribute("status","Insufficient Balance to Refund.");
                response.sendRedirect("CRefund.jsp");
               }
               else if(transfer==-3){
                    sess.setAttribute("status","Receiver have Changed His Mobile Number.Please try to refund Manually.");
                    response.sendRedirect("CRefund.jsp");
               }
               else if(transfer==-1){
                    sess.setAttribute("status","Refund Unsuccessful.");
                    response.sendRedirect("CRefund.jsp");
                }
            }
            else{
                sess.setAttribute("status","Refund Failed");
                response.sendRedirect("CRefund.jsp");
            }
        }
        else
        { 
            response.sendRedirect("CorLogin.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
