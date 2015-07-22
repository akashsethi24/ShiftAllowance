/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shiftModel;
import database.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;
import java.util.Locale;
import java.util.Calendar;
import java.sql.ResultSet;
/**
 *
 * @author Akach
 */
public class UpdateShift {
    public static int updateData(String data[],Date from, Date to,int sid,String leave)
    {
        int updated=0;
        try{
        Connection conn = DBConnect.connect();
        PreparedStatement ps=null;
        Calendar cal = Calendar.getInstance();
        cal.setTime(from);
        String query = "update emp_shift set emp_shiftfrom=?,emp_shiftto=?,emp_shifts=?,emp_des=?, emp_salary=?, emp_leave=?,emp_weekflag=?,emp_month=? where emp_sur=?";
         ps = conn.prepareStatement(query);
         ps.setDate(1,from);
        ps.setDate(2,to);
        ps.setString(3,data[0]);
        
        ps.setString(4, data[1]);
        ps.setInt(5,Integer.parseInt(data[2]));
        ps.setString(6, leave);
        ps.setString(7, data[3]);
        ps.setInt(8,Integer.parseInt(data[4]));
        ps.setInt(9, sid);
        updated= ps.executeUpdate();
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return updated;
    }
    
    
}
