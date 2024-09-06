package nic.sd.utility;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class hash 
{
	/* public static String gethash(String input) throws NoSuchAlgorithmException, UnsupportedEncodingException
	        {
	    	  char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

	            MessageDigest md = MessageDigest.getInstance("SHA512");
	            md.reset();
	            byte[] buffer = input.getBytes("UTF-8");
	            md.update(buffer);
	            byte[] digest = md.digest();

	            String hexStr = "";
	            for (int i = 0; i < digest.length; i++) {
	                hexStr +=  Integer.toString( ( digest[i] & 0xff ) + 0x100, 16).substring( 1 );
	            }
	            return hexStr;
	        }*/
	

	
	
	 /* public static String gethash(String input)
	   {
	        byte[] source;
	        try {
	            //Get byte according by specified coding.
	            source = input.getBytes("UTF-8");
	        } catch (UnsupportedEncodingException e) {
	            source = input.getBytes();
	        }
	        String result = null;
	        
	        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7',
	                '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
	        char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

	String byteArray2Hex(byte[] bytes) {
	    StringBuffer sb = new StringBuffer(bytes.length * 2);
	    for(final byte b : bytes) {
	        Object[] hex;
			sb.append(hex[(b & 0xF0) >> 4]);
	        sb.append(hex[b & 0x0F]);
	    }
	    return sb.toString();
	}

	String getStringFromSHA512(String stringToEncrypt) throws NoSuchAlgorithmException {
	    MessageDigest messageDigest = MessageDigest.getInstance("SHA-512");
	    messageDigest.update(stringToEncrypt.getBytes());
	    return byteArray2Hex(messageDigest.digest());
	}
	*/
	    
	

	
	
	/*public static String gethash(String s) throws NoSuchAlgorithmException {
		    byte[] hash = null;
		    try {
		        MessageDigest md = MessageDigest.getInstance("SHA-512");
		        hash = md.digest(s.getBytes());

		    } catch (NoSuchAlgorithmException e) { e.printStackTrace(); }
		    StringBuilder sb = new StringBuilder();
		    for (int i = 0; i < hash.length; ++i) {
		        String hex = Integer.toHexString(hash[i]);
		        if (hex.length() == 1) {
		            sb.append(0);
		            sb.append(hex.charAt(hex.length() - 1));
		        } else {
		            sb.append(hex.substring(hex.length() - 2));
		        }
		    }
		    return sb.toString();
		}
	*/
	
	
	
	/*public static String sha256(String base) 
	{
	    try{
	        MessageDigest digest = MessageDigest.getInstance("SHA-256");
	        byte[] hash = digest.digest(base.getBytes("UTF-8"));
	        StringBuffer hexString = new StringBuffer();

	        for (int i = 0; i < hash.length; i++) {
	            String hex = Integer.toHexString(0xff & hash[i]);
	            if(hex.length() == 1) hexString.append('0');
	            hexString.append(hex);
	        }

	        return hexString.toString();
	    } catch(Exception ex){
	       throw new RuntimeException(ex);
	    }
	*/
	
	

		/* public static String getSha256(String value) {
		    try{
		        MessageDigest md = MessageDigest.getInstance("SHA-256");
		        md.update(value.getBytes());
		        return bytesToHex(md.digest());
		    } catch(Exception ex){
		        throw new RuntimeException(ex);
		    }
		 }
		 private static String bytesToHex(byte[] bytes) {
		    StringBuffer result = new StringBuffer();
		    for (byte b : bytes) result.append(Integer.toString((b & 0xff) + 0x100, 16).substring(1));
		    return result.toString();
		 }*/
	
	
	
	
    public static String gethash(String input)
    {
        byte[] source;
        try {
            //Get byte according by specified coding.
            source = input.getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
            source = input.getBytes();
        }
        String result = null;
        /*char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7',
                '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};*/
        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7',
                '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(source);
            //The result should be one 128 integer
            byte temp[] = md.digest();
            char str[] = new char[32 * 2];
            int k = 0;
            for (int i = 0; i < 32; i++) {
                byte byte0 = temp[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            result = new String(str);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


}