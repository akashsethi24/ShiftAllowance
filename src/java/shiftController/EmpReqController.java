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
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.sql.Date;
import shiftModel.CalculateDays;
import shiftModel.CalculateSalary;
import shiftModel.InsertShift;
import java.util.Calendar;

/**
 *
 * @author Akach
 */
public class EmpReqController extends HttpServlet {

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
        String[] data = new String[9];
        String[] dates = new String[2];
        int day,night=0,week=0;
        boolean cab = true;
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            /* TODO output your page here. You may use following sample code. */
        try{
            System.out.println("Here");
            HttpSession sessionsa = request.getSession(false);
            data[0] = (String) sessionsa.getAttribute("id");
            data[1] = (String) sessionsa.getAttribute("name");
            data[2] = (String) sessionsa.getAttribute("email");
            data[3] = request.getParameter("shifts");
            String b = request.getParameter("reservation");
            System.out.println(b);
            data[5]  =request.getParameter("cab");
            if(data[5]==null)
                data[5]="n";
            data[6] = request.getParameter("weekend");
            if(data[6]==null)
                data[6]="n";
            data[4] = request.getParameter("des");
            Calendar now = Calendar.getInstance();
            data[7] = String.valueOf(now.get(Calendar.MONTH) + 1);
            dates = b.split("-");
            System.out.println(dates[0]);
            int count=0;
            
            String l = request.getParameter("leave");
           Date from = CalculateSalary.returndate(dates[0]);
           Date to = CalculateSalary.returndate(dates[1]);
           String leave = (String)sessionsa.getAttribute("date");
           System.out.println("leave  = "+leave);
          if(leave!=null)
          {
              count=leave.length()-leave.replaceAll(",", "").length();
              
          }
          
           if(data[6].matches("y"))
           {
               
            week = CalculateDays.calWeek(from, to);
                    }
                    else
                    {
                        System.out.println("in false week");
                        week=0;
                    }
          if(data[5].matches("n"))
                    {
                   cab=false;
                                        System.out.println("in cab");

                    }
                    else
                    {
                                            System.out.println("in false cab");

                       cab = true;
                    }
          if(data[3].matches("night"))
                    {
                                            System.out.println("in night");

                        night = CalculateDays.calDays(from, to,count);
                        day=0;
                    }
                    else
                    {
                        System.out.println("in false night");
                    day = CalculateDays.calDays(from, to,count);
                    System.out.println("in week");
                    }
           System.out.println("Day = "+day+"Week = "+week+"Night = "+night);
                      int salary = CalculateSalary.calSalary(day, week, night, cab);
                      System.out.println("Slary = "+salary);
                      data[8]=String.valueOf(salary);
            int ie = InsertShift.insertData(data, from, to,leave);
            System.out.println("i = "+ie);
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
            response.sendRedirect("emp_home.jsp");
        
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
