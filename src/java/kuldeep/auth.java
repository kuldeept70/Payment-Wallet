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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kuldeep Raj Tiwari
 */
public class auth extends HttpServlet {

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
        PrintWriter out=response.getWriter();
        String uname=request.getParameter("uname");
        String p=request.getParameter("pwd");
        HttpSession sess=request.getSession();
        int attempt=0;
    if(sess.getAttribute("uDetail")==null&&sess.getAttribute("cDetail")==null){
        if(sess.getAttribute("attempt")!=null){
            attempt=(int)sess.getAttribute("attempt");
            attempt+=1;
            sess.setAttribute("attempt",attempt);
        }
        else{
           sess.setAttribute("attempt", 1);
        }
        sess.setMaxInactiveInterval(180);
        UserDetails user;
        ManagementImpl m=new ManagementImpl();
        if(attempt<=3){
            if(m.login(uname, p)){
                user=m.getDetails(uname, 1);
                sess.removeAttribute("attempt");
                sess.removeAttribute("loginStatus");
                if(user.uname!=null){
                sess.setAttribute("uDetail",user);
                response.sendRedirect("CustomerWelcome.jsp");
                }
                else{
                sess.setAttribute("status","Sorry You donot have Customer Account,Please Login With Corporate Account.");
                response.sendRedirect("CustomerWelcome.jsp");
                }
            }
            else
            {   
                if(attempt==3){
                    sess.setAttribute("locked","1");
                }
                sess.setAttribute("loginStatus","0");
                response.sendRedirect("CustomerLogin.jsp");
            }
        }
        else
        {
            response.sendRedirect("CustomerLogin.jsp");
        }
    }
    else{
        if(sess.getAttribute("uDetail")!=null){
        RequestDispatcher rd=request.getRequestDispatcher("logout");
        rd.forward(request, response);}
        else if(sess.getAttribute("cDetail")!=null){
        RequestDispatcher rd=request.getRequestDispatcher("CLogout");
        rd.forward(request, response);}
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
