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
import javax.servlet.http.HttpSession;
import java.sql.ResultSet;
import shiftModel.Admin;
/**
 *
 * @author Akach
 */
public class Adm_ApproveController extends HttpServlet {

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
        ResultSet rs = null;
        
        try
        {
            int rowcount = 0;
            rs = Admin.selectRequested(0, 10);
            if (rs.last()) {
                rowcount = rs.getRow();
                rs.beforeFirst(); 
                            }
            int[] all=new int[rowcount];
            int i=0,sid=0,j=0;
            
            while(rs.next())
            {
                all[i]=rs.getInt("emp_sur");
                ++i;
            }
            String approve[] = request.getParameterValues("abc");
            for(i=0;i<all.length;i++)
            {
                if(approve[j].matches(String.valueOf(all[i])))
                {
                    Admin.approveData(all[i]);
                    ++j;
                }
                else
                {
                    Admin.disapproveData(all[i]);
                }
            }
            System.out.println("Done ");
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        response.sendRedirect("adm_approve.jsp");
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
