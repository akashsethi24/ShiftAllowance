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
import java.sql.ResultSet;
import shiftModel.GetEmpData;
import shiftModel.UpdateShift;
/**
 *
 * @author Akach
 */
public class EmpFinController extends HttpServlet {

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
        String[] data = new String[5];
        String[] dates = new String[2];
         int day,night=0,week=0;
        boolean cab = true;
        System.out.println("while ma");
         HttpSession sessionsa = request.getSession(false);
         String email = (String) sessionsa.getAttribute("email");
        try{
            int sid = GetEmpData.getData(email);
            ResultSet rs = GetEmpData.empData(sid);
            if(rs.next())
            {
                System.out.println("while ma");
            data[0] = request.getParameter("shifts");
            String b = request.getParameter("reservation");
            System.out.println(b);
            dates = b.split("-");
             Date from = CalculateSalary.returndate(dates[0]);
           Date to = CalculateSalary.returndate(dates[1]);
            data[3] = request.getParameter("weekend");
            if(data[3]==null)
                data[3]="n";
            data[1] = request.getParameter("des");
            Calendar now = Calendar.getInstance();
            data[4] = String.valueOf(now.get(Calendar.MONTH) + 1);
            String[] ss =new String[10];
           String leave = (String)sessionsa.getAttribute("date");
           int count=0;
           count=leave.length()-leave.replaceAll(",", "").length();
          if(leave!=null);
          count++;
          System.out.println(count+"had hai code ji");
           sessionsa.setAttribute("date", null);
          
           if(rs.getString("emp_cab").matches("n"))
                    {
                   cab=false;
                                        System.out.println("in cab");

                    }
                    else
                    {
                                            System.out.println("in false cab");

                       cab = true;
                    }
           if(data[3].matches("y"))
           {
               
            week = CalculateDays.calWeek(rs.getDate("emp_shiftfrom"), rs.getDate("emp_shiftto"));
                    }
                    else
                    {
                        System.out.println("in false week");
                        week=0;
                    }
           if(data[0].matches("night"))
                    {
                                            System.out.println("in night");

                        night = CalculateDays.calDays(rs.getDate("emp_shiftfrom"), rs.getDate("emp_shiftto"),count);
                        day=0;
                    }
                    else
                    {
                        System.out.println("in false night");
                    day = CalculateDays.calDays(rs.getDate("emp_shiftfrom"), rs.getDate("emp_shiftto"),count);
                    System.out.println("in week");
                    }
           System.out.println("Day = "+day+"Week = "+week+"Night = "+night);
                      int salary = CalculateSalary.calSalary(day, week, night, cab);
                      System.out.println("Slary = "+salary);
                      data[2]=String.valueOf(salary);
                      int k = UpdateShift.updateData(data, from, to, sid, leave);
                      System.out.println("hhahaha"+k);
            }
    
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        response.sendRedirect("emp_end.jsp");
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
