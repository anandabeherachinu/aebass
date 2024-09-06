package nic.sd.utility;

import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
 

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;


public class AES {/*

	
	 private static SecretKeySpec secretKey;
	    private static byte[] key;
	 
	    public static void setKey(String myKey) 
	    {
	        MessageDigest sha = null;
	        try {
	            key = myKey.getBytes("UTF-8");
	            sha = MessageDigest.getInstance("SHA-1");
	            key = sha.digest(key);
	            key = Arrays.copyOf(key, 16); 
	            secretKey = new SecretKeySpec(key, "AES");
	        } 
	        catch (NoSuchAlgorithmException e) {
	            e.printStackTrace();
	        } 
	        catch (UnsupportedEncodingException e) {
	            e.printStackTrace();
	        }
	    }
	 
	    public static String encrypt(String strToEncrypt, String secret) 
	    {
	        try
	        {
	            setKey(secret);
	            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
	            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
	            return Base64.getEncoder().encodeToString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
	        } 
	        catch (Exception e) 
	        {
	            //System.out.println("Error while encrypting: " + e.toString());
	        }
	        return null;
	    }
	 
	    public static String decrypt(String strToDecrypt, String secret) 
	    {
	        try
	        {
	            setKey(secret);
	            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
	            cipher.init(Cipher.DECRYPT_MODE, secretKey);
	            return new String(cipher.doFinal(Base64.getDecoder().decode(strToDecrypt)));
	        } 
	        catch (Exception e) 
	        {
	            //System.out.println("Error while decrypting: " + e.toString());
	        }
	        return null;
	    }
	
*/
	



	
		public static final String decrypt(final String encrypted,final Key key, final IvParameterSpec iv) throws InvalidKeyException,
		NoSuchAlgorithmException, NoSuchPaddingException,
		IllegalBlockSizeException, BadPaddingException, IOException, InvalidAlgorithmParameterException {

		      Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		      cipher.init(Cipher.DECRYPT_MODE, key,iv);
		      byte[] raw = Base64.decodeBase64(encrypted);
		      byte[] stringBytes = cipher.doFinal(raw);
		      String clearText = new String(stringBytes, "UTF8");
		      return clearText;
		}

		public static byte[] hexStringToByteArray(String s) {

		    int len = s.length();
		    byte[] data = new byte[len / 2];

		    for (int i = 0; i < len; i += 2) {
		        data[i / 2] = (byte) ((Character.digit(s.charAt(i), 16) << 4)
		                + Character.digit(s.charAt(i+1), 16));
		    }
		    return data;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*private static final String ALGO = "AES"; // Default uses ECB PKCS5Padding

	public static String encrypt(String Data, String secret) throws Exception {
	Key key = generateKey(secret);
	Cipher c = Cipher.getInstance(ALGO);
	c.init(Cipher.ENCRYPT_MODE, key);
	byte[] encVal = c.doFinal(Data.getBytes());
	String encryptedValue = Base64.getEncoder().encodeToString(encVal);
	return encryptedValue;
	}

	public static String decrypt(String strToDecrypt, String secret) {
	try {
	Key key = generateKey(secret);
	Cipher cipher = Cipher.getInstance(ALGO);
	cipher.init(Cipher.DECRYPT_MODE, key);
	return new String(cipher.doFinal(Base64.getDecoder().decode(strToDecrypt)));
	} catch (Exception e) {
	
	}
	return null;
	}

	private static Key generateKey(String secret) throws Exception {
	byte[] decoded = Base64.getDecoder().decode(secret.getBytes());
	Key key = new SecretKeySpec(decoded, ALGO);
	return key;
	}

	public static String decodeKey(String str) {
	byte[] decoded = Base64.getDecoder().decode(str.getBytes());
	return new String(decoded);
	}

	public static String encodeKey(String str) {
	byte[] encoded = Base64.getEncoder().encode(str.getBytes());
	return new String(encoded);
	}

	public static void main(String a[]) throws Exception {
	
	* Secret Key must be in the form of 16 byte like,
	*
	* private static final byte[] secretKey = new byte[] { ‘m’, ‘u’, ‘s’, ‘t’, ‘b’,
	* ‘e’, ‘1’, ‘6’, ‘b’, ‘y’, ‘t’,’e’, ‘s’, ‘k’, ‘e’, ‘y’};
	*
	* below is the direct 16byte string we can use
	
	String secretKey = "mustbe16byteske";
	String encodedBase64Key = encodeKey(secretKey);
	//System.out.println("encodedBase64Key::::::"+encodedBase64Key); // This need to be share between client and server

	// To check actual key from encoded base 64 secretKey
	// String toDecodeBase64Key = decodeKey(encodedBase64Key);
	// //System.out.println(“toDecodeBase64Key = “+toDecodeBase64Key);

	String toEncrypt = "Please encrypt this message!";
	

	// AES Encryption based on above secretKey
	String encrStr = AES.encrypt(toEncrypt, encodedBase64Key);
	//System.out.println("encrStr of str = " + encrStr);

	// AES Decryption based on above secretKey
	String decrStr = AES.decrypt(encrStr, encodedBase64Key);
	//System.out.println("Decryption of str = " + decrStr);
	}*/
	

