package nic.sd.utility;

import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.sun.mail.iap.Response;

public class ConvertToDate 
{
	public static Date getDate(String date)
	{
		Date dt=null;
		try
		{
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			dt = formatter.parse(date); 
		}
		catch(Exception e){}
		return dt;
	}
	public static Date convertUserToJavaDate(String date)
	{
		Date dt=null;
		try
		{
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			dt = formatter.parse(date); 
		}
		catch(Exception e){}
		return dt;
	}
	public static String getDate()
	{
		String cdate="";
		try
		{
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			cdate = dateFormat.format(date);
			
		}
		catch(Exception e)
		{
			
		}
		return cdate;
	}
	public static Date getnewDate(String date)
	{
		//System.out.println("inside getnewDate():::::"+date);
		Date dt=null;
		 
		try
		{
			SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		
			dt = formatter.parse(date); 
			//System.out.println("Date Change:::::"+dt);
			
		}
		catch(Exception e){}
		return dt;
	}
	
	public static Date convertUserToDate(String date)
	{
		Date dt=null;
		try
		{
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			dt = formatter.parse(date); 
		}
		catch(Exception e){}
		return dt;
	}
	public static Date convertUserToDateTime(String date)
	{
		Date dt=null;
		try
		{
			
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			dt = formatter.parse(date); 
		}
		catch(Exception e){}
		return dt;
	}
	
	public static String convertTo24Hour(String Time) {
	    DateFormat f1 = new SimpleDateFormat("hh:mm a"); //11:00 pm
	    Date d = null;
	    try {
	        d = f1.parse(Time);
	    } catch (ParseException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    DateFormat f2 = new SimpleDateFormat("HH:mm");
	    String x = f2.format(d); // "23:00"

	    return x;
	}
	
}
