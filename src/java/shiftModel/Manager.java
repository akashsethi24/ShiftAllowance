/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shiftModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import database.DBConnect;
/**
 *
 * @author Akach
 */
public class Manager {
    public static ResultSet selectRequested(int offset,int limit)
    {
        PreparedStatement ps =null;
       ResultSet rs = null;
       String query = "select * from emp_shift where emp_approvflag='n' order by emp_name limit ?,?";
       try {
       Connection conn = DBConnect.connect();
        ps = conn.prepareStatement(query);
        ps.setInt(1, offset);
        ps.setInt(2,limit);
        rs= ps.executeQuery();
       }
       catch(Exception e)
       {
           System.out.println(e);
              System.out.println("notnow");
       }
        return rs;
    }
    public static ResultSet selectAllmonth(int offset,int limit,int month)
    {
        PreparedStatement ps =null;
       ResultSet rs = null;
       String query = "select * from emp_shift where emp_month=? order by emp_name limit ?,?";
       try {
       Connection conn = DBConnect.connect();
        ps = conn.prepareStatement(query);
        ps.setInt(1, month);
        ps.setInt(2, offset);
        ps.setInt(3,limit);
        rs= ps.executeQuery();
       }
       catch(Exception e)
       {
           System.out.println(e);
              System.out.println("notnow");
       }
        return rs;
    }
    
      public static ResultSet selectSalary()
    {
        PreparedStatement ps =null;
       ResultSet rs = null;
       String query = "select * from emp_shift where emp_salaryflag='m' order by emp_name limit 20";
       try {
       Connection conn = DBConnect.connect();
        ps = conn.prepareStatement(query);
        rs= ps.executeQuery();
       }
       catch(Exception e)
       {
           System.out.println(e);
              System.out.println("notnow");
       }
        return rs;
    }
    public static int approveData(int sid)
    {
        int updated=0;
        try{
            java.sql.Date timeNow = new java.sql.Date(java.util.Calendar.getInstance().getTimeInMillis());
             Connection conn = DBConnect.connect();
        PreparedStatement ps=null;
        String query = "update emp_shift set emp_approvflag='t',emp_approvedate=? where emp_sur=?";
         ps = conn.prepareStatement(query);
   
         ps.setDate(1, timeNow);
               
         ps.setInt(2, sid);
         updated=ps.executeUpdate();
        }
            catch(Exception e)
            {
                System.out.println(e);
            }
        return updated;
    }
    public static int disapproveData(int sid)
    {
        int updated=0;
        try{
             Connection conn = DBConnect.connect();
        PreparedStatement ps=null;
        String query = "update emp_shift set emp_approvflag='f' where emp_sur=?";
         ps = conn.prepareStatement(query);
         ps.setInt(1, sid);
         updated=ps.executeUpdate();
        }
            catch(Exception e)
            {
                System.out.println(e);
            }
        return updated;
    }
   
    public static int salaryDisapproval(int sid)
    {
        int updated=0;
        try{
            Connection conn = DBConnect.connect();
        PreparedStatement ps=null;
        String query = "update emp_shift set emp_salaryflag='n' where emp_sur=?";
         ps = conn.prepareStatement(query);
         ps.setInt(1, sid);
         updated=ps.executeUpdate();
        }
            catch(Exception e)
            {
                System.out.println(e);
            }
        return updated;
    }
    public static int salaryApproval(int sid)
    {
        int updated=0;
        try{
            Connection conn = DBConnect.connect();
        PreparedStatement ps=null;
        String query = "update emp_shift set emp_salaryflag='y' where emp_sur=?";
         ps = conn.prepareStatement(query);
         ps.setInt(1, sid);
         updated=ps.executeUpdate();
        }
            catch(Exception e)
            {
                System.out.println(e);
            }
        return updated;
    }
}
