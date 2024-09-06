package nic.sd.utility;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Random;
 
public class UtkalUtil {
 
	
	//static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	static final String AB = "ABCDEFGHKLMNPQRSTUVWXYZ23456789";
	//static SecureRandom rnd = new SecureRandom();
	static Random rnd = new Random();

	public static String randomString( int len ){
	   StringBuilder sb = new StringBuilder( len );
	   for( int i = 0; i < len; i++ ) 
	      sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
	   return sb.toString();
	}
	
	public static String toUpper(String str)
	{
		if(str!=null && !"".equals(str))
			str = str.toUpperCase();
		
		return str;
	}
	
	public static boolean isBlank(String str)
	{
		boolean flag=false;
		
		if(str==null || "".equals(str.trim()))
			flag = true;
		
		return flag;
	}
	
	public static String trim(String str)
	{
		if(str==null)
			str="";
		else
			str = str.trim();
		return str;
	}
	
	public static int getInt(String str)
	{
		int no=0;
		if(str==null)
			str="0";
		else
			str = str.trim();
		try{
			no = Integer.parseInt(str);
		}
		catch(Exception e){}
		return no;
	}
	public static double getDouble(String str)
	{
		double no=0;
		if(str==null)
			str="0";
		else
			str = str.trim();
		try{
			no = Double.parseDouble(str);
		}
		catch(Exception e){}
		return no;
	}
	
	public static String encodeString(String str)    {
				

		try {
			str = URLEncoder.encode(str, "UTF-8");
		} catch (UnsupportedEncodingException ignored) {
		    // Can be safely ignored because UTF-8 is always supported
		}
		
		return str;
 
	}
 
	
public static String generateCaptchaTextMethod1()    {
 
        Random rdm=new Random();
        int rl=rdm.nextInt(); // Random numbers are generated.
        String hash1 = Integer.toHexString(rl); // Random numbers are converted to Hexa Decimal.
 
        return hash1;
 
}
 
public static String generateCaptchaTextMethod2(int captchaLength)   {
 
     //String saltChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
     String saltChars = "ABCDEFGHJKLMNPQRSTUVWXYZ123456789";
     
     StringBuffer captchaStrBuffer = new StringBuffer();
            java.util.Random rnd = new java.util.Random();
 
            // build a random captchaLength chars salt
            while (captchaStrBuffer.length() < captchaLength)
            {
                int index = (int) (rnd.nextFloat() * saltChars.length());
                captchaStrBuffer.append(saltChars.substring(index, index+1));
            }
 
        return captchaStrBuffer.toString();
 
}


 
}