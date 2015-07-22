/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;
import java.sql.*;
/**
 *
 * @author Akach
 */
public class DBConnect {
    public static Connection connect()
    {
        String url="jdbc:mysql://localhost/shift-avs";
        String username="root";
        String password="akash";
        Connection con =null;
       
        try{
           
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, username, password);
        
        System.out.println("Connected...");
    }catch(Exception e){
        System.out.println(e);
    }
        return con;
}
}