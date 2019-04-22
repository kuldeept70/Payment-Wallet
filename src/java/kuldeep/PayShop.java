/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kuldeep;

import SupportClass.TimeDate;
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
public class PayShop extends HttpServlet {

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
        if(sess.getAttribute("PageRequest")!=null&&sess.getAttribute("PageRequest").equals("3")){
            sess.removeAttribute("PageRequest");
            sess.removeAttribute("OTP");
            UserDetails u;
            ManagementImpl m=new ManagementImpl();
            u=(UserDetails)sess.getAttribute("uDetail");
            String runame=request.getParameter("Uname");
            int amount=Integer.parseInt(request.getParameter("Amount"));
            int transfer=m.TransferToOrg(u, runame, amount,TimeDate.getDate("yyyy/MM/dd"));
            if(transfer!=-1&&transfer!=-2&&transfer!=-3){
                sess.setAttribute("status","Money Transfer Successful. Your new Balance is: "+transfer);
                u.balance=transfer;
                sess.setAttribute("uDetail", u);
                response.sendRedirect("PayShopByUname.jsp");
            }
            else if(transfer==-2){
                sess.setAttribute("status","Insufficient Balance to Transfer.");
                response.sendRedirect("PayShopByUname.jsp");
            }
            else if(transfer==-3){
                sess.setAttribute("status","Receiver Account not found.");
                response.sendRedirect("PayShopByUname.jsp");
            }
            else if(transfer==-1){
                sess.setAttribute("status","Transaction Unsuccessful.");
                response.sendRedirect("PayShopByUname.jsp");
            }
        }
        else
        { response.sendRedirect("logout");
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
