/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shiftModel;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.Calendar;

/**
 *
 * @author Akach
 */
public class CalculateDays {
    public static int calDays(Date from, Date to,int leave)
    {
        Calendar cal = Calendar.getInstance();
        cal.setTime(from);
        Date inc=from;
        String dayOfWeek;
        int count=0,sub=0,day=0;
        while(!inc.equals(to))
        {
            dayOfWeek = new SimpleDateFormat("EEEE", Locale.ENGLISH).format(inc);
            ++count;
            if((dayOfWeek.matches("Saturday"))||(dayOfWeek.matches("Sunday")))
            {
               ++sub;
            }
            System.out.println("Count" +count+" "+dayOfWeek);
            cal.add(Calendar.DATE, 1);
            inc = cal.getTime();
        }
        System.out.println(count+" "+sub+" "+leave);
        day = (++count)-(sub);
        day = day-leave;
        return day;
    }
    public static int calDaysww(Date from,Date to,int leave)
    {
        Calendar cal = Calendar.getInstance();
        cal.setTime(from);
        Date inc=from;
        int count=0,day=0;
        while((inc.compareTo(to)<=0))
        {
            count++;
            cal.add(Calendar.DATE, 1);
            inc = cal.getTime();
        }
        System.out.println(day+" "+" "+leave);
        day = count-leave;
        return day;
    }
    public static int calWeek(Date from, Date to)
    {
        Calendar cal = Calendar.getInstance();
        cal.setTime(from);
        Date inc=from;
        String dayOfWeek;
        int count=0,sub=0,day=0;
        while((inc.compareTo(to)<=0))
        {
            dayOfWeek = new SimpleDateFormat("EEEE", Locale.ENGLISH).format(inc);
            if((dayOfWeek.matches("Saturday"))||(dayOfWeek.matches("Sunday")))
            {
                sub++;
            }
            cal.add(Calendar.DATE, 1);
            inc = cal.getTime();
        }
        System.out.println(day+" "+sub+" ");
        day = sub;
        return day;
    }
}
