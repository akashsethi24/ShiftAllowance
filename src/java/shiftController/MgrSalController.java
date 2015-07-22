/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shiftController;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import shiftModel.Manager;
import java.sql.ResultSet;
/**
 *
 * @author Akach
 */
public class MgrSalController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try{
            int i=0,j=0,k=0;
            String sid;
            ResultSet rs = Manager.selectSalary();
            String approve[] = request.getParameterValues("abc");
            while(rs.next())
            {
                sid= String.valueOf(rs.getInt("emp_sur"));
                if(i<approve.length)
                {
                if(sid.matches(approve[i]))
                {
                    Manager.salaryApproval(rs.getInt("emp_sur"));
                    i++;
                }
                else
                {
                    Manager.salaryDisapproval(rs.getInt("emp_sur"));
                }
                }
                else
                {
                    Manager.salaryDisapproval(rs.getInt("emp_sur"));
                }
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        response.sendRedirect("mgr_salary.jsp");
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
