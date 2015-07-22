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
/**
 *
 * @author Akach
 */
public class InsertShift {
    public static int insertData(String data[], Date from,Date to,String leave)
    {
        int inserted=0;
        try{
            System.out.println("From "+from+"to "+to);
        Connection conn = DBConnect.connect();
        PreparedStatement ps=null;
        Calendar cal = Calendar.getInstance();
        cal.setTime(from);
        String query = "insert into emp_shift (emp_id,emp_name,emp_email,emp_shiftfrom,emp_shiftto,emp_shifts,emp_des,emp_cab,emp_approvflag,emp_weekflag,emp_salaryflag,emp_month,emp_leave,emp_salary) values(?,?,?,?,?,?,?,?,'n',?,'n',?,?,?)";
        ps = conn.prepareStatement(query);
        ps.setInt(1,Integer.parseInt(data[0]));
        ps.setString(2, data[1]);
        ps.setString(3, data[2]);
        ps.setDate(4,from);
        ps.setDate(5,to);
        ps.setString(6,data[3]);
        ps.setString(7, data[4]);
        ps.setString(8, data[5]);
        ps.setString(9,data[6]);
        ps.setInt(10,Integer.parseInt(data[7]));
        ps.setString(11, leave);
        ps.setInt(12, Integer.parseInt(data[8]));
        inserted = ps.executeUpdate();
        System.out.println("yes");
        
        }
        catch(Exception e){
        System.out.println(e);
        }
        return inserted;
    }
    
}
