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
public class CustMob extends HttpServlet {

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
        if(sess.getAttribute("PageRequest")!=null&&sess.getAttribute("PageRequest").equals("6")){
            sess.removeAttribute("PageRequest");
            sess.removeAttribute("OTP");
            UserDetails u;
            ManagementImpl m=new ManagementImpl();
            u=(UserDetails)sess.getAttribute("uDetail");
            int result=m.UserChangeMobile(u.mno,request.getParameter("Mobile"));
            if(result==1){
            sess.setAttribute("status"," Mobile Number Changed Successfully.");
            u.mno=request.getParameter("Mobile");
            sess.setAttribute("uDetail", u);
            response.sendRedirect("CustChangeMob.jsp");
            }
            else if(result==-2){
            sess.setAttribute("status"," Mobile Number Already associated with an Account.");
            response.sendRedirect("CustChangeMob.jsp");
            }
            else{
            sess.setAttribute("status"," Mobile Number Change Unsuccessful");
            response.sendRedirect("CustChangeMob.jsp");
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
