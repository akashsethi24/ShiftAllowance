/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shiftModel;

import database.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Akach
 */
public class Admin {
     public static ResultSet selectRequested(int offset,int limit)
    {
        PreparedStatement ps =null;
       ResultSet rs = null;
       String query = "select * from emp_shift where emp_approvflag='t' and emp_salaryflag='n' order by emp_name limit ?,?";
       try {
       Connection conn = DBConnect.connect();
        ps = conn.prepareStatement(query);
        ps.setInt(1, offset);
        ps.setInt(2, limit);
        rs= ps.executeQuery();
       }
       catch(Exception e)
       {
           System.out.println(e);
       }
        return rs;
    }
     
     public static ResultSet selectAllMonth(int offset,int limit,int month)
    {
        PreparedStatement ps =null;
       ResultSet rs = null;
       String query = "select * from emp_shift where emp_month=? order by emp_name limit ?,?";
       try {
       Connection conn = DBConnect.connect();
        ps = conn.prepareStatement(query);
        ps.setInt(1, month);
        ps.setInt(2, offset);
        ps.setInt(3, limit);
        rs= ps.executeQuery();
       }
       catch(Exception e)
       {
           System.out.println(e);
       }
        return rs;
    }
     
     public static int approveData(int sid)
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
     public static int disapproveData(int sid)
    {
        int updated=0;
        try{
             Connection conn = DBConnect.connect();
        PreparedStatement ps=null;
        String query = "update emp_shift set emp_approvflag='n' where emp_sur=?";
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
