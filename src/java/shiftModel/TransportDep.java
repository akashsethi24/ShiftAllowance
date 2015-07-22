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
public class TransportDep {
     public static ResultSet selectRequested(int month,int offset,int limit)
    {
        PreparedStatement ps =null;
       ResultSet rs = null;
       String query = "select * from emp_shift where emp_cab='y' and emp_month=? order by emp_name limit ?,?";
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
           System.out.println("eroor in "+e);
       }
        return rs;
    }
     public static void main(String... s)
     {
         ResultSet rs = selectRequested(7,0,1);
     }
}
