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
public class Login {
     public static String isValid(String username,String password,int type)
   {
       String  mix="";
       PreparedStatement ps =null;
       ResultSet rs = null;
       String query = "";
       if(type==1)
           query= ("Select * from emp_login where emp_user=? AND emp_pass=?");
       else if(type==2)
           query= ("Select * from mgr_login where mgr_user=? AND mgr_pass=?");
       else if(type==3)
           query= ("Select * from adm_login where adm_user=? AND adm_pass=?");
       else
           query= ("Select * from tdt_login where tdt_user=? AND tdt_pass=?");
       
       try{
           System.out.println("In this Login Model"+type);
           int id;
            Connection conn = DBConnect.connect();
       ps = conn.prepareStatement(query);
       ps.setString(1,username);
       ps.setString(2,password);
       rs= ps.executeQuery();
       if(rs.next())
       {
           if(type==1)
           {
           id = rs.getInt("emp_id");
           mix = String.valueOf(id);
           mix = mix+";"+rs.getString("emp_name");
           mix = mix + ";" + rs.getString("emp_email");
           System.out.println("true "+mix);
           }
           else if(type==3)
           {
           id = rs.getInt("adm_id");
           mix = String.valueOf(id);
           mix = mix+";"+rs.getString("adm_name");
           mix = mix + ";" + rs.getString("adm_email");
           System.out.println("true "+mix);
           }
           else if(type==2)
           {
           id = rs.getInt("mgr_id");
           mix = String.valueOf(id);
           mix = mix+";"+rs.getString("mgr_name");
           mix = mix + ";" + rs.getString("mgr_email");
           System.out.println("true "+mix);
           }
           else
           {
           id = rs.getInt("tdt_id");
           mix = String.valueOf(id);
           mix = mix+";"+rs.getString("tdt_name");
           mix = mix + ";" + rs.getString("tdt_email");
           System.out.println("true "+mix);
           }
       }
       else 
          mix=null;
       }catch(Exception e)
       {
           System.out.println(e);
       }
       return mix;
   }
    
}
