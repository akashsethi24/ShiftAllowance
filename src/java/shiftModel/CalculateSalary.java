/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shiftModel;
import java.sql.Date;

/**
 *
 * @author Akach
 */
public class CalculateSalary {
    public static int calSalary(int days,int weekand,int night,boolean cab)
    {
        int salary;
        salary = days * 350;
        salary = salary + (weekand * 550);
        salary = salary + (night * 550);
        if(cab)
            salary=salary-(100*(days+night+weekand));
        return salary;
    }
    public static Date returndate(String work)
    {
        String[] datedata = new String[3];
        datedata = work.split("/");
        int m = Integer.parseInt(datedata[0].trim());
        int d = Integer.parseInt(datedata[1]);
        int y = Integer.parseInt(datedata[2].trim());
        Date returnit=new Date(d,m,y-1900);
        returnit.setDate(d);
        returnit.setMonth(m-1);
        returnit.setYear(y-1900);
        java.util.Date dd = new java.util.Date(y, m, d);
        System.out.println(d+" "+m+" "+y+" "+returnit+" "+dd.getDate());
        return returnit;
    }
}
