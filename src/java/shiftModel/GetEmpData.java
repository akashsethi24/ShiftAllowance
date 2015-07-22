/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shiftModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import database.DBConnect;
/**
 *
 * @author Akach
 */
public class GetEmpData {
    public static int getData(String email)
    {
       PreparedStatement ps =null;
       ResultSet rs = null;
       int id=0;
       String query = "select emp_sur from emp_shift where emp_email=? and emp_approvflag='n'";
       try{
       Connection conn = DBConnect.connect();
       ps = conn.prepareStatement(query);
       ps.setString(1,email);
       rs= ps.executeQuery();
       if(rs.next())
        {
           id = rs.getInt("emp_sur");
        }
       }
       catch(Exception e)
       {
           System.out.println(e);
       }
       return id;
    }
    public static void main(String... s)
    {
        String email = "akash@gmail.com";
        int a = getData(email);
        
        System.out.println(a);
    }
    public static ResultSet empData(int sid)
    {
        ResultSet rs = null;
        PreparedStatement ps =null;
       String query = "select * from emp_shift where emp_sur=?";
       try{
       Connection conn = DBConnect.connect();
       ps = conn.prepareStatement(query);
       ps.setInt(1,sid);
       rs= ps.executeQuery();
        }
        catch(Exception e){}
        return rs;
    }
    
}
