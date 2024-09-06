package nic.sd.utility;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateTime {

	public static String getCurrentYearShort()
	{
		DateFormat df = new SimpleDateFormat("yy"); // Just the year, with 2 digits
		String formattedYear = df.format(Calendar.getInstance().getTime());
		return formattedYear;
	}
	
	/**
	 * Format yy-yy
	 * Fin year  march -Feb 
	 * 
	 * @return String yy-yy (eg: 16-17)
	 */
	
	
	public static Date dateChange(String date){			
		java.sql.Date sqldate=null;	 
		
        try{
            
	        String dd=date.substring(0, 2);
	        String mm=date.substring(3, 5);
	        String yyyy=date.substring(6, date.length());
	        //System.out.println(mm+"  "+dd+"  "+yyyy+"  "+date);
	        String sdate=yyyy+"-"+mm+"-"+dd;
	        //System.out.println("Afteer conversion "+sdate);
            
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDate = formatter.parse(sdate);
            sqldate = new java.sql.Date(utilDate.getTime());
            //System.out.println("date:" + sdate);
            //System.out.println("sqlDate:" + sqldate);
         
        }catch (Exception e) {
                  //System.out.println(e.toString());
                  e.printStackTrace();
        }     
                     
         return sqldate;

    }
	
	public static String currentFinancialYear()
	{
		String yr = getCurrentYearShort();
		System.out.println("yr::::"+yr);
		int year = Integer.parseInt(yr);
		System.out.println("year::::"+year);
		
		String finYear = "";
		
		//before march (jan=0)
		if(Calendar.MONTH<2) 
		{
			System.out.println("inside iff::::");
			int year0 = year-1;
			System.out.println("year0::::"+year0);
			finYear = year0+"-"+year;
			System.out.println("finYear::::"+finYear);
		}
		else
		{
			System.out.println("inside else::::"+year);
			int year1 = year+1;
			System.out.println("year1::::"+year1);
			finYear = year+"-"+year1;
			System.out.println("finYear::::"+finYear);
		}
		
		
		return finYear;
	}
	
	
	public static String getFinyear(){
		String financialyear="";
		Calendar calender=Calendar.getInstance();
		int mm=calender.get(Calendar.MONTH)+1;
		int YY=calender.get(Calendar.YEAR);
	 
		YY=YY%100;
		if(mm<=3){
			financialyear=(YY-1)+"-"+YY;
		}else if(mm>3){
			financialyear=YY+"-"+(YY+1);
		}
		return financialyear;
	}
    
    public static String getUserDate(String date) throws ParseException
	{
           SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
           Date d=sdf1.parse(date);
            
           SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
           return sdf.format(d);
	}
    public static String getUserDateTime(String date) 
   	{
    	try{
    		if(date!=null && !"".equals(date))
    		{
    			  SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	          Date d=sdf1.parse(date);
    	           
    	          SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
    	          date = sdf.format(d);
    		}
    	}
    	catch(Exception e){
    		
    	}
         
          
          return  date;
   	}

	public static String SystemTimestamp() 
	{
			Date cuurentdate = new Date();
		 String sdf=new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(cuurentdate);
		 
		// TODO Auto-generated method stub
		return sdf;
	}

	public static String changeSqlDate(String date)  throws Exception {
		 
	String sdate=null;
   try {
       
       String yyyy=date.substring(0, 4);
       String mm=date.substring(5, 7);
       String dd=date.substring(8, date.length());
     //  //System.out.println(dd+"  "+mm+"  "+yyyy+"  "+date);
       sdate=dd+"/"+mm+"/"+yyyy;
      // //System.out.println("Afteer conversion "+sdate);
          
   }catch (Exception e) {
         //System.out.println(e.toString());
         e.printStackTrace();
   }     
                
   return sdate;
}
	
	public static String getfillerdate(String startdate){
		String output="";
		 try{
			 //System.out.println("output"+ output);
			 
	         SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
             Calendar c = Calendar.getInstance();
java.util.Date utilDate = sdf.parse(startdate);
//System.out.println("utilDate:::::::::::::"+ utilDate);

java.sql.Date sqldate = new java.sql.Date(utilDate.getTime());
//System.out.println("sqldate::::::::"+ sqldate);

//Date date =  new java.sql.Date((sdf.parse("12/06/2017")).getTime());
             //java.sql.Date sqldate=stringToDate("12/06/2017");
             c. setTime(sqldate);
             
         
//c.setTime(new Date()); // Now use today date.
             c.add(Calendar.DATE, 29); // Adding 5 days
      output = sdf.format(c.getTime());
      //System.out.println("output:::::::::::"+ output);
		
	     }
	     catch(Exception e){
	     }
		return output;
	}
	
	public static String getfillerdate1(String startdate){
		String output="";
		 try{
			 
			 
	         SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	         Calendar c = Calendar.getInstance();
	java.util.Date utilDate = sdf.parse(startdate);
	java.sql.Date sqldate = new java.sql.Date(utilDate.getTime());
	//Date date =  new java.sql.Date((sdf.parse("12/06/2017")).getTime());
	         //java.sql.Date sqldate=stringToDate("12/06/2017");
	         c. setTime(sqldate);
	//c.setTime(new Date()); // Now use today date.
	         c.add(Calendar.DATE, 1); // Adding 5 days
	  output = sdf.format(c.getTime());
	  //System.out.println(output);
		
	     }
	     catch(Exception e){
	     }
		return output;
	}
}
