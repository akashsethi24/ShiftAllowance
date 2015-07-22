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
import shiftModel.Login;
/**
 *
 * @author Akach
 */
public class LoginController extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public String mix;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter outs = response.getWriter();
               try{
            /* TODO output your page here. You may use following sample code. */
          String username = request.getParameter("user");
          String password= request.getParameter("pass");
          String types = request.getParameter("select");
          String email,empdata[]=null;
          int type=5;
          if(types.matches("Employee"))
          type=1;
          else if (types.matches("Manager"))
              type=2;
          else if (types.matches("Admin"))
              type=3;
          else
              type=4;
          System.out.println("Working............ "+type);
            mix = Login.isValid(username, password,type);
            System.out.println(mix);
          if(mix!=null)
          {
              
              
              empdata = mix.split(";");
              System.out.println("b is true"+empdata[2]);
              HttpSession session=request.getSession();
              session.setAttribute("email", empdata[2]);
              session.setAttribute("name", empdata[1]);
              session.setAttribute("id", empdata[0]);
              if(type==1)
              response.sendRedirect("emp_home.jsp");
              else if(type==2)
                  response.sendRedirect("mgr_home.jsp");
              else if(type==4)
                  response.sendRedirect("transport_cab.jsp");
              else
                  response.sendRedirect("adm_view.jsp");
          }
          else
          {
              System.out.println("b is False");
              response.sendRedirect("index.jsp");
          }
        }catch(Exception e){System.out.println(e);}
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
