package nic.sd.utility;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

public class Util {

	public static String generateCaptchaTextMethod1() {

		Random rdm = new Random();
		int rl = rdm.nextInt(); // Random numbers are generated.
		String hash1 = Integer.toHexString(rl); // Random numbers are converted
												// to Hexa Decimal.

		return hash1;

	}

	public static String generateCaptchaTextMethod2(int captchaLength) {

		// String saltChars =
		// "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		String saltChars = "ABCDEFGHJKLMNPQRSTUVWXYZ123456789";

		StringBuffer captchaStrBuffer = new StringBuffer();
		java.util.Random rnd = new java.util.Random();

		// build a random captchaLength chars salt
		while (captchaStrBuffer.length() < captchaLength) {
			int index = (int) (rnd.nextFloat() * saltChars.length());
			captchaStrBuffer.append(saltChars.substring(index, index + 1));
		}

		return captchaStrBuffer.toString();

	}

	public static String encodeString(String str) {
		// TODO Auto-generated method stub
		Util st = new Util();

		try {
			// System.out.println("inside try util class");
			str = URLEncoder.encode(str, "UTF-8");

		} catch (UnsupportedEncodingException ignored) {
			// System.out.println("error message:::::"+ignored.getMessage());
		}
		return str;
	}

	

}