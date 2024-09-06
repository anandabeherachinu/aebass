package nic.sd.controller;

import org.json.JSONObject;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.net.UnknownHostException;
import java.nio.file.Files;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.imageio.ImageIO;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.validation.Valid;
import javax.xml.parsers.ParserConfigurationException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpRequest;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.fasterxml.jackson.databind.JsonNode;
import com.itextpdf.text.Image;
import com.sun.org.apache.xerces.internal.parsers.DOMParser;

import nic.sd.dao.LoginDao;
import nic.sd.model.LoginModel;
import nic.sd.model.reportmodel;
import nic.sd.utility.AES;
import nic.sd.utility.ConnectionDB;
import nic.sd.utility.hash;
import sun.net.www.http.HttpClient;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import nic.sd.utility.AES;
import nic.sd.utility.ConvertToDate;
import nic.sd.utility.DateTime;
import java.security.Key;
import javax.crypto.spec.IvParameterSpec;
import org.apache.tomcat.util.codec.binary.Base64;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.regex.Matcher;
import java.util.regex.Pattern;









@Controller
public class LoginController {
	
	@Autowired
	LoginDao ldao;
	ConnectionDB con =new ConnectionDB();
	//String userID=null;
	@RequestMapping(value="/index.html",method = RequestMethod.GET)
	public String homePage(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) throws Exception 
	
	{ 		//System.out.println("GET");

		/*System.out.println("enter into get home page");
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date x = new Date();
		//System.out.println(dateFormat.format(x));
		String attendate = (dateFormat.format(x));
		//System.out.println("attendate" + attendate);
		
		List<LoginModel> studentcount = ldao.getCountTheStudentCollegeWisePresent(attendate);
		  model.addAttribute("studentcount", studentcount);
		  //System.out.println("studentcount"+studentcount);
			//System.out.println("avdmDeviceInfo lg "+lg.getStudentName());
			
			List<LoginModel> studentcountabsent = ldao.getCountTheStudentCollegeWiseabsent(attendate);
			  model.addAttribute("studentcountabsent", studentcountabsent);
			  System.out.println("studentcountabsent"+studentcountabsent);
			  
			  
			  List<LoginModel> studentcountA = ldao.getCountTheStudentCollegeWiseAbsentPresent(attendate);
			  model.addAttribute("studentcountA", studentcountA);
			  System.out.println("studentcountA"+studentcountA);
				System.out.println("avdmDeviceInfo lg "+lg.getStudentName());
				
				List<LoginModel> studentcountabsentA = ldao.getCountTheStudentCollegeWiseAbsentAbsent(attendate);
				  model.addAttribute("studentcountabsentA", studentcountabsentA);
				  System.out.println("studentcountabsentA"+studentcountabsentA);
				  
			  List<LoginModel> totalstudentcountpresent = ldao.getTotalCountTheStudentPresent(attendate);
			  model.addAttribute("totalstudentcountpresent", totalstudentcountpresent);
			  System.out.println("totalstudentcountpresent"+totalstudentcountpresent);
 
			  List<LoginModel> totalstudentcountPercentage = ldao.getTotalCountTheStudentPercentage(attendate);
				model.addAttribute("totalstudentcountPercentage", totalstudentcountPercentage);
				System.out.println("totalstudentcountPercentage"+totalstudentcountPercentage);
				

			  List<LoginModel> totalstudentcountabsent = ldao.getTotalCountTheStudentabsent(attendate);
			  model.addAttribute("totalstudentcountabsent", totalstudentcountabsent);
			  System.out.println("totalstudentcountabsent"+totalstudentcountabsent);
*/
		System.out.println("enter into get home page1");
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date x = new Date();
		System.out.println(dateFormat.format(x));
		final String attendate = (dateFormat.format(x));
		System.out.println("attendate2" + attendate);
		
		 ExecutorService executorService = Executors.newFixedThreadPool(7);

	        try {
	            // Define tasks
	    		System.out.println("1111");

	            Callable<List<LoginModel>> presentCountTask = new Callable<List<LoginModel>>() {
	                @Override
	                public List<LoginModel> call() {
	                    return ldao.getCountTheStudentCollegeWisePresent(attendate);
	                }
	            };
	    		System.out.println("2222");

	            Callable<List<LoginModel>> absentCountTask = new Callable<List<LoginModel>>() {
	                @Override
	                public List<LoginModel> call() {
	                    return ldao.getCountTheStudentCollegeWiseabsent(attendate);
	                }
	            };
	    		System.out.println("3333");

	            Callable<List<LoginModel>> studentCountATask = new Callable<List<LoginModel>>() {
	                @Override
	                public List<LoginModel> call() {
	                    return ldao.getCountTheStudentCollegeWiseAbsentPresent(attendate);
	                }
	            };
	    		System.out.println("4444");

	            Callable<List<LoginModel>> studentCountAbsentATask = new Callable<List<LoginModel>>() {
	                @Override
	                public List<LoginModel> call() {
	                    return ldao.getCountTheStudentCollegeWiseAbsentAbsent(attendate);
	                }
	            };
	    		System.out.println("5555");

	            Callable<List<LoginModel>> totalStudentCountPresentTask = new Callable<List<LoginModel>>() {
	                @Override
	                public List<LoginModel> call() {
	                    return ldao.getTotalCountTheStudentPresent(attendate);
	                }
	            };
	    		System.out.println("6666");

	            Callable<List<LoginModel>> totalStudentCountPercentageTask = new Callable<List<LoginModel>>() {
	                @Override
	                public List<LoginModel> call() {
	                    return ldao.getTotalCountTheStudentPercentage(attendate);
	                }
	            };
	    		System.out.println("7777");

	            Callable<List<LoginModel>> totalStudentCountAbsentTask = new Callable<List<LoginModel>>() {
	                @Override
	                public List<LoginModel> call() {
	                    return ldao.getTotalCountTheStudentabsent(attendate);
	                }
	            };

	            // Submit tasks
	    		System.out.println("8888");

	            Future<List<LoginModel>> presentCountFuture = executorService.submit(presentCountTask);
	    		System.out.println("9999");

	            Future<List<LoginModel>> absentCountFuture = executorService.submit(absentCountTask);
	    		System.out.println("101010");

	            Future<List<LoginModel>> studentCountAFuture = executorService.submit(studentCountATask);
	    		System.out.println("111111");

	            Future<List<LoginModel>> studentCountAbsentAFuture = executorService.submit(studentCountAbsentATask);
	    		System.out.println("121212");

	            Future<List<LoginModel>> totalStudentCountPresentFuture = executorService.submit(totalStudentCountPresentTask);
	    		System.out.println("131313");

	            Future<List<LoginModel>> totalStudentCountPercentageFuture = executorService.submit(totalStudentCountPercentageTask);
	    		System.out.println("141414");

	            Future<List<LoginModel>> totalStudentCountAbsentFuture = executorService.submit(totalStudentCountAbsentTask);
	    		System.out.println("151515");


	            // Wait for all tasks to complete
	    		System.out.println("161616");

	            List<LoginModel> presentCount = presentCountFuture.get();
	            List<LoginModel> absentCount = absentCountFuture.get();
	            List<LoginModel> studentCountA = studentCountAFuture.get();
	            List<LoginModel> studentCountAbsentA = studentCountAbsentAFuture.get();
	            List<LoginModel> totalStudentCountPresent = totalStudentCountPresentFuture.get();
	            List<LoginModel> totalStudentCountPercentage = totalStudentCountPercentageFuture.get();
	            List<LoginModel> totalStudentCountAbsent = totalStudentCountAbsentFuture.get();

	            // Add results to model
	    		System.out.println("171717");

	            model.addAttribute("studentcount", presentCount);
	            model.addAttribute("studentcountabsent", absentCount);
	            model.addAttribute("studentcountA", studentCountA);
	            model.addAttribute("studentcountabsentA", studentCountAbsentA);
	            model.addAttribute("totalstudentcountpresent", totalStudentCountPresent);
	            model.addAttribute("totalstudentcountPercentage", totalStudentCountPercentage);
	            model.addAttribute("totalstudentcountabsent", totalStudentCountAbsent);
	    		System.out.println("181818");

	        } catch (InterruptedException | ExecutionException e) {
	            e.printStackTrace();
	            throw e; // or handle the exception appropriately
	        } finally {
	            // Always shut down the executor service to release resources
	            executorService.shutdown();
	        }
		return "index";
	}
	@RequestMapping(value="/dashboard.html",method = RequestMethod.GET)
	public String dash(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session,String randomvalue) 
	
	{ 		//System.out.println("GET");
		
		
		if((String)session.getAttribute("admin_loginid")==null)
		{
		return"index";
		}
		
		
		String loginid =(String)session.getAttribute("admin_loginid");
		//System.out.println("::loginid::admin-login:::get::::::::"+loginid);
		
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
			Date x = new Date();
			System.out.println(dateFormat.format(x));
			String attendate = (dateFormat.format(x));
			//System.out.println("attendate" + attendate);
		
	//COUNT STUDENT	
	LoginModel student = ldao.getAllStudent();
	model.addAttribute("student", student);
	//System.out.println("student" + student);
	
	//COUNT STUDENT	 COLLEGE WISE
	LoginModel studentcollege = ldao.getcollegewiseStudent(loginid);
	model.addAttribute("studentcollege", studentcollege);
	//System.out.println("studentcollege" + studentcollege);
	
	//COUNT COLLEGE	
	LoginModel college = ldao.getAllCollege();
	model.addAttribute("college", college);
	//System.out.println("college" + college);
	
	//count Student present and datewise
	// List<LoginModel> totalstudentcountpresent = ldao.getTotalCountTheStudentPresent(attendate);
	LoginModel totalstudentcountpresentDa = ldao.getTotalCountTheStudentPresentd(attendate);

	  model.addAttribute("totalstudentcountpresentDa", totalstudentcountpresentDa);
	  //System.out.println("totalstudentcountpresentDa"+totalstudentcountpresentDa);
	//count Student present and datewise
	  LoginModel totalstudentcountpresentcollegewise = ldao.getTotalCountTheStudentPresentcollegewise(loginid,attendate);

	  model.addAttribute("totalstudentcountpresentcollegewise", totalstudentcountpresentcollegewise);
	 // System.out.println("totalstudentcountpresentcollegewise"+totalstudentcountpresentcollegewise);
	
		return "login/dashboard";

			
		
	}
	
	
	@RequestMapping(value="/login.html",method = RequestMethod.GET)
	public String loginHomepag( @ModelAttribute("cb") LoginModel lg,BindingResult result,Model model,HttpServletRequest request,HttpSession session,String randomvalue)
	//public ModelAndView loginHomepag(@Valid @ModelAttribute("cb") LoginModel lg,BindingResult result,Model model,HttpServletRequest request,HttpSession session,@RequestParam("udata") String randomvalue)throws Exception 

	{ 		//System.out.println("GET");
		
		System.out.println("GET");
System.out.println("lg"+lg);			
			
			if((String)session.getAttribute("admin_loginid")==null)
			{
			return"index";
			}
			String loginid =(String)session.getAttribute("admin_loginid");
			//System.out.println("::loginid::admin-login:::get::::::::"+loginid);
			String role = (String) session.getAttribute("role_id"); 
			//System.out.println("::role::admin-login::::get:::::::"+role);
			if(role.equals("3"))
			{
				
				System.out.println("eNTER INTO ROLE 3");

				DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
				Date x = new Date();
				System.out.println(dateFormat.format(x));
				String attendate = (dateFormat.format(x));
				
				//COUNT STUDENT	
				LoginModel student = ldao.getAllStudent();
				model.addAttribute("student", student);
				//System.out.println("student" + student);
				
				//COUNT STUDENT	 COLLEGE WISE
				LoginModel studentcollege = ldao.getcollegewiseStudent(loginid);
				model.addAttribute("studentcollege", studentcollege);
				//System.out.println("studentcollege" + studentcollege);
				
				//COUNT COLLEGE	
				LoginModel college = ldao.getAllCollege();
				model.addAttribute("college", college);
				//System.out.println("college" + college);
				
				//count Student present and datewise
				// List<LoginModel> totalstudentcountpresent = ldao.getTotalCountTheStudentPresent(attendate);
				LoginModel totalstudentcountpresentDa = ldao.getTotalCountTheStudentPresentd(attendate);

				  model.addAttribute("totalstudentcountpresentDa", totalstudentcountpresentDa);
				  //System.out.println("totalstudentcountpresentDa"+totalstudentcountpresentDa);
				//count Student present and datewise
				  LoginModel totalstudentcountpresentcollegewise = ldao.getTotalCountTheStudentPresentcollegewise(loginid,attendate);

				  model.addAttribute("totalstudentcountpresentcollegewise", totalstudentcountpresentcollegewise);
				 // System.out.println("totalstudentcountpresentcollegewise"+totalstudentcountpresentcollegewise);
			}
			if(role.equals("1"))	
			{
				System.out.println("eNTER INTO ROLE 1");
				DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
				Date x = new Date();
				System.out.println(dateFormat.format(x));
				String attendate = (dateFormat.format(x));
				//COUNT STUDENT	
				LoginModel student = ldao.getAllStudent();
				model.addAttribute("student", student);
				//System.out.println("student" + student);
				
				//COUNT STUDENT	 COLLEGE WISE
				LoginModel studentcollege = ldao.getcollegewiseStudent(loginid);
				model.addAttribute("studentcollege", studentcollege);
				//System.out.println("studentcollege" + studentcollege);
				
				//COUNT COLLEGE	
				LoginModel college = ldao.getAllCollege();
				model.addAttribute("college", college);
				//System.out.println("college" + college);
				
				//count Student present and datewise
				// List<LoginModel> totalstudentcountpresent = ldao.getTotalCountTheStudentPresent(attendate);
				LoginModel totalstudentcountpresentDa = ldao.getTotalCountTheStudentPresentd(attendate);

				  model.addAttribute("totalstudentcountpresentDa", totalstudentcountpresentDa);
				  System.out.println("totalstudentcountpresentDa"+totalstudentcountpresentDa);
				//count Student present and datewise
				  LoginModel totalstudentcountpresentcollegewise = ldao.getTotalCountTheStudentPresentcollegewise(loginid,attendate);

				  model.addAttribute("totalstudentcountpresentcollegewise", totalstudentcountpresentcollegewise);
				 // System.out.println("totalstudentcountpresentcollegewise"+totalstudentcountpresentcollegewise);
			}
			return "login/dashboard";

				
			
		
	
}


	@RequestMapping(value="/login.html",method = RequestMethod.POST)
	public ModelAndView loginHomepage(@Valid @ModelAttribute("cb") LoginModel lg,BindingResult result,Model model,HttpServletRequest request,HttpSession session,@RequestParam("udata") String randomvalue)throws Exception 
	
	{ 		System.out.println("POST");
System.out.println("lg"+lg);
		//System.out.println("enter into the login");
		session.setAttribute("admin_loginid",lg.getLoginid());
		String loginid =(String)session.getAttribute("admin_loginid");
		//System.out.println("::loginid::admin-login:::get::::::::"+loginid);
		
		


			
			/* userID = lg.getLoginid();
			System.out.println("userID:::::::::::::"+userID);*/
			//System.out.println("lg.getLoginid():::::::::::::"+lg.getLoginid());
			String password=lg.getPassword();
			//System.out.println("password"+password);


			String userName = ldao.getUserName(loginid);
			String userId=ldao.getuserid(loginid);
			//System.out.println(loginid+"loginid");
			//System.out.println(userId+"userId");

			//System.out.println("userName:::::controller:login:::::::::::post:::::::"+userName);
			
			  if(userName==null || userName.equals("") && userId != (loginid))
			  {

			  return  new ModelAndView("index","adminerrormessage","invalid username and password");
			  }
		
/*				String roleID = ldao.getRoleidd(userID);
*/
			String ipaddr = null;
			InetAddress addr;

			try {
				addr = InetAddress.getLocalHost();
				ipaddr = addr.getHostAddress();

			}

			catch (UnknownHostException e) {
				e.printStackTrace();
			}

			session.setAttribute("role_id", ldao.getRoleidd(loginid));
			String roleid =(String)session.getAttribute("role_id");
			//System.out.println("::loginid::role_id:::get::::::::"+roleid);

			session = request.getSession(true);
			String idsession = session.getId();
			 //System.out.println("ID:::::1::::::"+idsession);

			String logintime = null;

			String logID = lg.getLoginid();

			//System.out.println("controllerrr:logID::::"+logID);

			if (result.hasErrors()) {

				//System.out.println("inside if:::::::::::::::");
				return new ModelAndView("index");

			}

			else {
				if (lg.getLoginid()==null || lg.getLoginid().equals(""))
				{
					lg.setCaptcha("");
				return  new ModelAndView("index","message","User Id is required");
				}
				if (lg.getPassword()==null ||lg.getPassword().equals(""))
				{
					lg.setCaptcha("");
				return  new ModelAndView("index","message","Password is required");
				}  

				String captcha=(String)session.getAttribute("CAPTCHA");
System.out.println(captcha+"captcha");

				if(captcha==null || (captcha!=null && !captcha.equals(lg.getCaptcha())))
				{
				lg.setCaptcha("");
				return  new ModelAndView("index","adminerrormessage","Captcha does not match");
				}
				String salt = (String) session.getAttribute("salt");
				lg.setSalt(randomvalue);

				 lg.setSalt(salt); 

				int status = ldao.checkLoginAdmin(lg);
				//System.out.println("status"+status);
				//System.out.println("salt"+salt);

				String roleID = ldao.getRoleidd(loginid);


				if (roleID.equals("1"))

				{


				}

			
				String message = "";
				if (!session.isNew()) {
					session.invalidate();
					session = request.getSession(true);
					System.out.println("ID:::::2::::::"+idsession);
				}
				//System.out.println("status"+status);
				if(status==0){
					return  new ModelAndView("index","adminerrormessage","invalid username and password");

				}
				if (status == 1) {
					//System.out.println("if in the status"+status);

					roleID = ldao.getRoleidd(loginid);

					

					session.setAttribute("userID", lg.getLoginid());
					session.setAttribute("userName",userName); 
					session.setAttribute("ipaddr", ipaddr);
					session.setAttribute("idsession", idsession);
					
					
					 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
						Date x = new Date();
						System.out.println(dateFormat.format(x));
						String attendate = (dateFormat.format(x));
						//System.out.println("attendate" + attendate);
					
				//COUNT STUDENT	
				LoginModel student = ldao.getAllStudent();
				model.addAttribute("student", student);
				//System.out.println("student" + student);
				
				//COUNT STUDENT	 COLLEGE WISE
				LoginModel studentcollege = ldao.getcollegewiseStudent(loginid);
				model.addAttribute("studentcollege", studentcollege);
				//System.out.println("studentcollege" + studentcollege);
				
				//COUNT COLLEGE	
				LoginModel college = ldao.getAllCollege();
				model.addAttribute("college", college);
				//System.out.println("college" + college);
				
				//count Student present and datewise
				// List<LoginModel> totalstudentcountpresent = ldao.getTotalCountTheStudentPresent(attendate);
				LoginModel totalstudentcountpresentDa = ldao.getTotalCountTheStudentPresentd(attendate);

				  model.addAttribute("totalstudentcountpresentDa", totalstudentcountpresentDa);
				 // System.out.println("totalstudentcountpresentDa"+totalstudentcountpresentDa);
				//count Student present and datewise
				  LoginModel totalstudentcountpresentcollegewise = ldao.getTotalCountTheStudentPresentcollegewise(loginid,attendate);

				  model.addAttribute("totalstudentcountpresentcollegewise", totalstudentcountpresentcollegewise);
				 // System.out.println("totalstudentcountpresentcollegewise"+totalstudentcountpresentcollegewise);

					logintime = ldao.logintime();

					// int ii =
					// adao.updatelogintime(userID,ipaddr,idsession,logintime);

					//userID = lg.getLoginid();

					

					int changedPasswordStatus = ldao.getPasswordChangedStatus(lg.getLoginid());
					
					String ipFromHeader = request.getHeader("X-FORWARDED-FOR");
					
					//System.out.println("ipFromHeader "+ipFromHeader);
					String ip = request.getHeader("X-Forwarded-For");      
					  if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
					      ip = request.getHeader("Proxy-Client-IP");      
					      //System.out.println("ip 1 "+ip);
					  }      
					  if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
					      ip = request.getHeader("WL-Proxy-Client-IP");
					      //System.out.println("ip 2 "+ip);
					     
					  }      
					  if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
					      ip = request.getRemoteAddr();
					      //System.out.println("ip 3 "+ip);
					  }
					  if (ip.contains(",")) {
					  String iparr[] = ip.split(",");
					  ip = iparr[0];
					  }
String Action="Login Page";
String Status="Login Success";

						int auditlog = ldao.getauditlogs(loginid,ip,attendate,Action,Status);

//System.out.println("auditlog"+auditlog);
				

					session = request.getSession(true);

					message = "Welcome...";
					session.setAttribute("admin_loginid", lg.getLoginid());
					session.setAttribute("user", userName);
					session.setAttribute("role_id", lg.getRoleId());
					session.setAttribute("userID", lg.getLoginid());
					session.setAttribute("roleId", lg.getRoleId());
					
					return new ModelAndView("login/dashboard", "message", message);

					

				} else if (status == 2) {
					//System.out.println("status=2 else part"+status);
					
					return new ModelAndView("index", "adminerrormessage", "Your account has been blocked for 20 mins. "
							+ "Please contact your Administrator to unblock your Account.");
				} else {
					
					//System.out.println("else part invalid");
					message = "Invalid User Id/Password";
					return new ModelAndView("index", "adminerrormessage", message);
				}
				
			}
			

		}
	
	
	@RequestMapping(value = "/view-all-student-list.html", method = RequestMethod.GET)
	public String viewallliststudent(@ModelAttribute("b") LoginModel b, Model m,
			HttpSession session,HttpServletRequest request)
	{
		
		
		System.out.println("ENTER INTO VIEW");
		List<LoginModel> listOfStudent = ldao.getAllstudentList();
		m.addAttribute("listOfStudent", listOfStudent);
		//System.out.println("listOfStudent"+listOfStudent);
		

		return "login/view-all-student-list";
		
	}
	@RequestMapping(value = "/view-present-student-list-current.html", method = RequestMethod.GET)
	public String viewPresentStudent(@ModelAttribute("b") LoginModel b, Model m,
			HttpSession session,HttpServletRequest request)
	{
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date x = new Date();
		System.out.println(dateFormat.format(x));
		String attendate = (dateFormat.format(x));
		
		//System.out.println("ENTER INTO VIEW");
		List<LoginModel> listOfStudent = ldao.getAllPresentstudentList(attendate);
		m.addAttribute("listOfStudent", listOfStudent);
		//System.out.println("listOfStudent"+listOfStudent);
		

		return "login/view-present-student-list-current";
		
	}
	
	
	/*
	@RequestMapping(value = "/view-all-college-list.html", method = RequestMethod.GET)
	public String viewalllistcollege(@ModelAttribute("b") LoginModel b, Model m,
			HttpSession session,HttpServletRequest request)
	{
		
		
		System.out.println("ENTER INTO VIEW");
		List<LoginModel> listOfCollege = ldao.getAllCollegeList();
		m.addAttribute("listOfCollege", listOfCollege);
		System.out.println("listOfCollege"+listOfCollege);


		return "login/view-all-college-list";
		
	}
	@RequestMapping(value = "/collegewise-student-list.html", method = RequestMethod.GET)
	public String collegewise(@ModelAttribute("b") LoginModel b, Model m,
			HttpSession session,HttpServletRequest request)
	{
		
		session.setAttribute("admin_loginid",b.getLoginid());
		String loginid =(String)session.getAttribute("admin_loginid");
		System.out.println("::loginid::admin-login:::get::::::::"+loginid);
		
		
		System.out.println("ENTER INTO VIEW");
		List<LoginModel> collegewisestudent = ldao.getCollegeWisesStudentList(loginid);
		m.addAttribute("collegewisestudent", collegewisestudent);
		System.out.println("collegewisestudent"+collegewisestudent);
		

		return "login/collegewise-student-list";
		
	}
	

	@RequestMapping(value = "/view-present-student-list-current-college-wise.html", method = RequestMethod.GET)
	public String viewPresentStudentCollegeWise(@ModelAttribute("b") LoginModel b, Model m,
			HttpSession session,HttpServletRequest request)
	{
		
		String loginid =(String)session.getAttribute("admin_loginid");
		System.out.println("::loginid::admin-login:::get::::::::"+loginid);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date x = new Date();
		System.out.println(dateFormat.format(x));
		String attendate = (dateFormat.format(x));
		
		System.out.println("ENTER INTO VIEW");
		List<LoginModel> listOfStudentCollwise = ldao.getAllPresentstudentListCollegeWise(loginid,attendate);
		m.addAttribute("listOfStudentCollwise", listOfStudentCollwise);
		System.out.println("listOfStudentCollwise"+listOfStudentCollwise);
		

		return "login/view-present-student-list-current-college-wise";
		
	}*/
	
/*	@RequestMapping(value = "/authenticate-aadhaar.html", method = RequestMethod.GET)
	public String knowyoureligibility(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {

		return "authenticate-aadhaar";
	}*/
/*	@RequestMapping(value = "/authenticate-aadhaar-demo.html", method = RequestMethod.GET)
	public String knowyoureligibilitye(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		

		return "authenticate-aadhaar-demo";
	}*/
/*	@RequestMapping(value = "/check-roll-wise.html", method = RequestMethod.GET)
	public String checkRollWise(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		

		return "login/check-roll-wise";
	}*/
/*	@RequestMapping(value = "/finger-authenticate.html", method = RequestMethod.GET)
	public String fingerAuthenticate(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		
		System.out.println("avdmDeviceInfo lg "+lg.getTxtData());
		System.out.println("txtDataRd lg "+lg.getTxtDataRd());

		return "check-roll-wise";
	}*/
/*	@RequestMapping(value = "/check-roll-wise.html", method = RequestMethod.POST)
	public String checkRollWisee(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) throws JSONException, IOException, ParserConfigurationException, SAXException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException, SQLException {
		//,String rdInfo
	
		System.out.println("avdmDeviceInfo lg "+lg.getTxtData());
		System.out.println("txtDataRd lg "+lg.getTxtDataRd());
		System.out.println("txtDataRd lg "+lg.getRollId());
		//System.out.println(lg.getTxtData().indexOf("planet"));
		String in_time=lg.getString("in_time");

		String rdInfo=lg.getTxtData();

		
		
		String pidBlockData=lg.getTxtDataRd();
		String regNo=lg.getRollId();
		System.out.println("rdInfo"+rdInfo);
		System.out.println("pidBlockData"+pidBlockData);

		
		String aadhar=ldao.getAadhar(regNo);
		System.out.println("aadhar lg "+aadhar);
		System.out.println("aadhar"+aadhar);
		
		


		JSONObject  jo=new JSONObject (rdInfo);
		String device_id=jo.getString("value");
		System.out.println("device_id"+device_id);

		
		

		
		String aadharResponse = ldao.callUIDI(rdInfo,pidBlockData,aadhar);
		System.out.println("aadharResponse "+aadharResponse);
		
		
		String abc = cdao.checkFingerValid(rdInfo,pidBlockData,cand_id);
		System.out.println("abc "+abc);
		
		InputSource is = new InputSource(new StringReader(aadharResponse));
	    DOMParser dp = new DOMParser();
	    dp.parse(is);
	    Document doc = dp.getDocument();
	    NodeList nl = doc.getElementsByTagName("AuthRes");
	   // System.out.println("nl "+nl);
	    Node n = nl.item(0);
	   // System.out.println("n "+n);
	    NamedNodeMap nnm = n.getAttributes();
	    String ret = nnm.getNamedItem("ret").getFirstChild().getTextContent();
	    
	    try{
	    
	    String err = nnm.getNamedItem("err").getFirstChild().getTextContent();
	    }catch (Exception e) {
		}
	    String txn = nnm.getNamedItem("txn").getFirstChild().getTextContent();  
	    
	    System.out.println("ret "+ret);
	    
	    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date in_time = new Date();
		System.out.println(dateFormat.format(in_time));
		
	    JSONObject res = new JSONObject();
	    if(ret=="y" || ret.equals("y"))
	    {
	    	System.out.println("inside ret if "+ret);
	    	
	    	
	  
				
				String data=ldao.candAttendanceMainRD(regNo,in_time);
			
	    }
    	System.out.println("RETURN JSP");

		return "finger-authenticate";
	}*/
/*	@RequestMapping(value = "http://localhost:24711/", method = RequestMethod.POST)
	public String getData(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
	public String getData(@ModelAttribute("cb") @PathVariable(value="txtData")String data,LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session){
		
System.out.println(data);
		return String.valueOf(data);
	}*/
	
/*	@RequestMapping(value = "/check-student-data.html", method = RequestMethod.GET)
	public String checkStudentData(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {

		return "check-student-data";
	}*/
	
/*	@RequestMapping(value = "/check-student-data.html", method = RequestMethod.POST)
	public String checkStudentDataa(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {

		return "check-student-data";
	}*/
/*	@RequestMapping(value ="/student-details.html", method = RequestMethod.GET)
	public String studentDataView(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {

		return "student-details";
	}*/
/*	@RequestMapping(value = "/attendance.html", method = RequestMethod.GET)
	public String attendance(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		

		return "login/attendance";
	}*/
/*	@RequestMapping(value = "/attendance.html", method = RequestMethod.POST)
	public String attendanceE(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session,RedirectAttributes redirectAttributes) throws JSONException, IOException, ParserConfigurationException, SAXException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException, SQLException {
		//,String rdInfo
		String path="";
		System.out.println("avdmDeviceInfo lg "+lg.getTxtData());
		System.out.println("txtDataRd lg "+lg.getTxtDataRd());
		System.out.println("txtDataRd lg "+lg.getRollId());
		//System.out.println(lg.getTxtData().indexOf("planet"));
		String in_time=lg.getString("in_time");

		String rdInfo=lg.getTxtData();

		
		
		String pidBlockData=lg.getTxtDataRd();
		String regNo=lg.getRollId();
		System.out.println("rdInfo"+rdInfo);
		System.out.println("pidBlockData"+pidBlockData);

		
		String aadhar=ldao.getAadhar(regNo);
		System.out.println("aadhar lg "+aadhar);
		System.out.println("aadhar"+aadhar);
		
		


		JSONObject  jo=new JSONObject (rdInfo);
		String device_id=jo.getString("value");
		System.out.println("device_id"+device_id);

		
		

		
		String aadharResponse = ldao.callUIDI(rdInfo,pidBlockData,aadhar);
		System.out.println("aadharResponse "+aadharResponse);
		
		
		String abc = cdao.checkFingerValid(rdInfo,pidBlockData,cand_id);
		System.out.println("abc "+abc);
		
		InputSource is = new InputSource(new StringReader(aadharResponse));
	    DOMParser dp = new DOMParser();
	    dp.parse(is);
	    Document doc = dp.getDocument();
	    NodeList nl = doc.getElementsByTagName("AuthRes");
	   // System.out.println("nl "+nl);
	    Node n = nl.item(0);
	   // System.out.println("n "+n);
	    NamedNodeMap nnm = n.getAttributes();
	    String ret = nnm.getNamedItem("ret").getFirstChild().getTextContent();
	    
	    try{
	    
	    String err = nnm.getNamedItem("err").getFirstChild().getTextContent();
	    }catch (Exception e) {
		}
	    String txn = nnm.getNamedItem("txn").getFirstChild().getTextContent();  
	    
	    System.out.println("ret "+ret);
	    
	    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date in_time = new Date();
		System.out.println(dateFormat.format(in_time));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		String Itime = formatter.format(in_time);
		
	    JSONObject res = new JSONObject();
	    if(ret=="y" || ret.equals("y"))
	    {
	    	System.out.println("inside ret if "+ret);
	    	
	    	
	  
	    	
				String data=ldao.candAttendanceMainRD(regNo,in_time);
				System.out.println("RETURN JSP");
				
				List<LoginModel>viewData=ldao.successdata(regNo,Itime);
				model.addAttribute("viewData",viewData);

			System.out.println("viewDatacontroller" + viewData);

		    	//return "login/finger-authenticate";
		    	//return "true";
		    redirectAttributes.addFlashAttribute("MSGS", "Sucessfully.");

			//path = "login/success"; 
			path =  "login/attendance"; 
				//return  "redirect:/demo.html";
			System.out.println("RETURN JSP4");

				return  path;

	    }
	    else{
	    	System.out.println("else");
	    	redirectAttributes.addFlashAttribute("MSGW", "Unsucessfully.");
			path =  "redirect:attendance.html"; 
			
			return path;
	    }
    	
 
		}*/
/*	@RequestMapping(value = "/demo.html", method = RequestMethod.GET)
	public String att(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		System.out.println("inside demo");
	
		return "demo";
		}*/
	/*@RequestMapping(value = "/ananda.html", method = RequestMethod.GET)
	public String attr(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		System.out.println("inside demo");
	
		return "login/ananda";
		}*/
/*	@RequestMapping(value = "/demo.html", method = RequestMethod.POST)
	public String attendance(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session,RedirectAttributes redirectAttributes) throws JSONException, IOException, ParserConfigurationException, SAXException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException, SQLException {
		//,String rdInfo
		String path="";
		System.out.println("avdmDeviceInfo lg "+lg.getTxtData());
		System.out.println("txtDataRd lg "+lg.getTxtDataRd());
		System.out.println("txtDataRd lg "+lg.getRollId());
		//System.out.println(lg.getTxtData().indexOf("planet"));
		String in_time=lg.getString("in_time");

		String rdInfo=lg.getTxtData();

		
		
		String pidBlockData=lg.getTxtDataRd();
		String regNo=lg.getRollId();
		System.out.println("rdInfo"+rdInfo);
		System.out.println("pidBlockData"+pidBlockData);

		
		String aadhar=ldao.getAadhar(regNo);
		System.out.println("aadhar lg "+aadhar);
		System.out.println("aadhar"+aadhar);
		
		


		JSONObject  jo=new JSONObject (rdInfo);
		String device_id=jo.getString("value");
		System.out.println("device_id"+device_id);

		
		

		
		String aadharResponse = ldao.callUIDI(rdInfo,pidBlockData,aadhar);
		System.out.println("aadharResponse "+aadharResponse);
		
		
		String abc = cdao.checkFingerValid(rdInfo,pidBlockData,cand_id);
		System.out.println("abc "+abc);
		
		InputSource is = new InputSource(new StringReader(aadharResponse));
	    DOMParser dp = new DOMParser();
	    dp.parse(is);
	    Document doc = dp.getDocument();
	    NodeList nl = doc.getElementsByTagName("AuthRes");
	   // System.out.println("nl "+nl);
	    Node n = nl.item(0);
	   // System.out.println("n "+n);
	    NamedNodeMap nnm = n.getAttributes();
	    String ret = nnm.getNamedItem("ret").getFirstChild().getTextContent();
	    
	    try{
	    
	    String err = nnm.getNamedItem("err").getFirstChild().getTextContent();
	    }catch (Exception e) {
		}
	    String txn = nnm.getNamedItem("txn").getFirstChild().getTextContent();  
	    
	    System.out.println("ret "+ret);
	    
	    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date in_time = new Date();
		System.out.println(dateFormat.format(in_time));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		String Itime = formatter.format(in_time);
		
	    JSONObject res = new JSONObject();
	    if(ret=="y" || ret.equals("y"))
	    {
	    	System.out.println("inside ret if "+ret);
	    	
	    	
	  
	    	
				String data=ldao.candAttendanceMainRD(regNo,in_time);
				System.out.println("RETURN JSP");
				
				List<LoginModel>viewData=ldao.successdata(regNo,Itime);
				model.addAttribute("viewData",viewData);

			System.out.println("viewDatacontroller" + viewData);

		    	//return "login/finger-authenticate";
		    	//return "true";
		    //redirectAttributes.addFlashAttribute("MSGS", "Sucessfully.");

			//path = "login/success"; 
			path =  "login/demo"; 
				//return  "redirect:/demo.html";
		    redirectAttributes.addFlashAttribute("MSGS", "Sucessfully.");
			System.out.println("RETURN JSP4");

				return  path;
		    return null;

	    }
	    else{
	    	System.out.println("else");
	    	redirectAttributes.addFlashAttribute("MSGW", "Unsucessfully.");
			path =  "redirect:demo.html"; 
			
			return null;
	    }
    	
 
		}*/
/*	@RequestMapping(value = "/check.html", method = RequestMethod.GET)
	public String check(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {

		return "check";
	}*/
	@RequestMapping(value = "/attendance-report.html", method = RequestMethod.GET)
	public String report(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		/*List<LoginModel> institute = ldao.getAllInstituteList();
		  model.addAttribute("institute", institute);
		  System.out.println("institute"+institute);*/
		List<LoginModel> listOfCollege = ldao.getAllCollegeList();
		model.addAttribute("listOfCollege", listOfCollege);
		//System.out.println("listOfCollege"+listOfCollege);
		
			//System.out.println("avdmDeviceInfo lg "+lg.getInstituteCode());

		  List<LoginModel> semestar = ldao.getSemesterList();
		  model.addAttribute("semestar", semestar);
		  //System.out.println("semestar"+semestar);
			//System.out.println("avdmDeviceInfo lg "+lg.getSemestar());

		return "login/attendance-report";
	}
	@RequestMapping(value = "/attendance-report.html", method = RequestMethod.POST)
	public String reportT(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		
		String loginid =(String)session.getAttribute("admin_loginid");
		//System.out.println("::loginid::admin-login:::get::::::::"+loginid);
		
		/*List<LoginModel> institute = ldao.getAllInstituteList();
		  model.addAttribute("institute", institute);
		  System.out.println("institute"+institute);*/
		List<LoginModel> listOfCollege = ldao.getAllCollegeList();
		model.addAttribute("listOfCollege", listOfCollege);
		//System.out.println("listOfCollege"+listOfCollege);
		 
			//System.out.println("avdmDeviceInfo lg "+lg.getInstituteCode());
			String selectedInstitute=lg.getInstituteCode();

		  
		  List<LoginModel> semestar = ldao.getSemesterList();
		  model.addAttribute("semestar", semestar);
		 // System.out.println("semestar"+semestar);
			//System.out.println("avdmDeviceInfo lg "+lg.getSemestar());
			String selectedSemester=lg.getSemestar();


		  List<LoginModel>viewData=ldao.viewData(selectedInstitute,selectedSemester);
			model.addAttribute("viewData",viewData);
		return "login/attendance-report";
	}
	@RequestMapping(value = "/attendance-report-semester.html", method = RequestMethod.GET)
	public String reportSemester(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		String loginid =(String)session.getAttribute("admin_loginid");
		//System.out.println("::loginid::admin-login:::get::::::::"+loginid);
		
		/*List<LoginModel> institute = ldao.getAllInstituteList();
		  model.addAttribute("institute", institute);
		  System.out.println("institute"+institute);*/
		List<LoginModel> listOfCollege = ldao.getAllCollegeList();
		model.addAttribute("listOfCollege", listOfCollege);
		//System.out.println("listOfCollege"+listOfCollege);
		
			System.out.println("avdmDeviceInfo lg "+lg.getInstituteCode());

		  List<LoginModel> semestar = ldao.getSemesterList();
		  model.addAttribute("semestar", semestar);
		 // System.out.println("semestar"+semestar);
			//System.out.println("avdmDeviceInfo lg "+lg.getSemestar());
			
			  List<LoginModel> month = ldao.getMonthList();
			  model.addAttribute("month", month);
			 // System.out.println("month"+month);


		return "login/attendance-report-semester";
	}
	@RequestMapping(value = "/attendance-report-semester.html", method = RequestMethod.POST)
	public String reportSeme(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		String loginid =(String)session.getAttribute("admin_loginid");
		System.out.println("::loginid::admin-login:::get::::::::"+loginid);
		
		/*List<LoginModel> institute = ldao.getAllInstituteList();
		  model.addAttribute("institute", institute);
		  System.out.println("institute"+institute);*/
		  List<LoginModel> listOfCollege = ldao.getAllCollegeList();
			model.addAttribute("listOfCollege", listOfCollege);
			//System.out.println("listOfCollege"+listOfCollege);
		 
			//System.out.println("avdmDeviceInfo lg "+lg.getInstituteCode());
			String selectedInstitute=lg.getInstituteCode();

		  
		  List<LoginModel> semestar = ldao.getSemesterList();
		  model.addAttribute("semestar", semestar);
		 // System.out.println("semestar"+semestar);
			//System.out.println("avdmDeviceInfo lg "+lg.getSemestar());
			String selectedSemester=lg.getSemestar();
			 model.addAttribute("selectedSemester", selectedSemester);
			
			  List<LoginModel> month = ldao.getMonthList();
			  model.addAttribute("month", month);
			//  System.out.println("month"+month);
			//  System.out.println("avdmDeviceInfo lg "+lg.getMonth());
				String selectedMonth=lg.getMonth();
				 model.addAttribute("selectedMonth", selectedMonth);


		  List<LoginModel>viewData=ldao.viewDataSemesterwise(selectedInstitute,selectedSemester,selectedMonth);
			model.addAttribute("viewData",viewData);
				 List<LoginModel> candview =ldao.getCandidateHostelAtten(selectedInstitute,selectedSemester,selectedMonth);
				 model.addAttribute("candview", candview);
				// System.out.println("candview"+candview);
				
			
		return "login/attendance-report-semester";
	}
	
	
	@RequestMapping(value = "/attendance-report-semester-collegewise.html", method = RequestMethod.GET)
	public String reportSemestercoll(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		String loginid =(String)session.getAttribute("admin_loginid");
		//System.out.println("::loginid::admin-login:::get::::::::"+loginid);
		
		List<LoginModel> instituteName = ldao.getInstituteList(loginid);
		  model.addAttribute("instituteName", instituteName);
		 // System.out.println("instituteName"+instituteName);
	
		  List<LoginModel> semestar = ldao.getSemesterList();
		  model.addAttribute("semestar", semestar);
		 // System.out.println("semestar"+semestar);
			//System.out.println("avdmDeviceInfo lg "+lg.getSemestar());
			
			  List<LoginModel> month = ldao.getMonthList();
			  model.addAttribute("month", month);
			//  System.out.println("month"+month);


		return "login/attendance-report-semester-collegewise";
	}
	
	@RequestMapping(value = "/attendance-report-semester-collegewise.html", method = RequestMethod.POST)
	public String reportSemea(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {

		String loginid =(String)session.getAttribute("admin_loginid");
		System.out.println("::loginid::admin-login:::get::::::::"+loginid);
		
		List<LoginModel> instituteName = ldao.getInstituteList(loginid);
		  model.addAttribute("instituteName", instituteName);
		 // System.out.println("instituteName"+instituteName);
			/*String selectedInstitute=lg.getInstituteCode();
			System.out.println("selectedInstitute"+selectedInstitute);*/
			 LoginModel firstLoginModel = instituteName.get(0); // Get the first LoginModel object
			    String instituteCode = firstLoginModel.getInstituteCode();
			  //  System.out.println("instituteCode"+instituteCode);

		  List<LoginModel> semestar = ldao.getSemesterList();
		  model.addAttribute("semestar", semestar);
		//  System.out.println("semestar"+semestar);
		//	System.out.println("avdmDeviceInfo lg "+lg.getSemestar());
			String selectedSemester=lg.getSemestar();
			  model.addAttribute("selectedSemester", selectedSemester);
			
			  List<LoginModel> month = ldao.getMonthList();
			  model.addAttribute("month", month);
			//  System.out.println("month"+month);
			//  System.out.println("avdmDeviceInfo lg "+lg.getMonth());
				String selectedMonth=lg.getMonth();
				  model.addAttribute("selectedMonth", selectedMonth);


		  /*List<LoginModel>viewData=ldao.viewDataSemesterwise(selectedInstitute,selectedSemester,selectedMonth);
			model.addAttribute("viewData",viewData);*/
				 List<LoginModel> candview =ldao.getCandidateHostelAttend(instituteCode,selectedSemester,selectedMonth);
				 model.addAttribute("candview", candview);
				// System.out.println("candview"+candview);
				
			
		return "login/attendance-report-semester-collegewise";
	}
	
	@RequestMapping(value = "/attendance-report-branch-collegewise.html", method = RequestMethod.GET)
	public String reportBranchaa(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		
		

		String loginid =(String)session.getAttribute("admin_loginid");
		System.out.println("::loginid::admin-login:::get::::::::"+loginid);
		
		List<LoginModel> institute = ldao.getAllInstituteList();
		  model.addAttribute("institute", institute);
		 // System.out.println("institute"+institute);
			//System.out.println("avdmDeviceInfo lg "+lg.getInstituteCode());

		  List<LoginModel> semestar = ldao.getSemesterList();
		  model.addAttribute("semestar", semestar);
		  //System.out.println("semestar"+semestar);
			//System.out.println("avdmDeviceInfo lg "+lg.getSemestar());
			
			  List<LoginModel> branch = ldao.getBranchList();
			  model.addAttribute("branch", branch);
			 // System.out.println("branch"+branch);
			//	System.out.println("avdmDeviceInfo lg "+lg.getCourseName());
			
			  List<LoginModel> month = ldao.getMonthList();
			  model.addAttribute("month", month);
			//  System.out.println("month"+month);


		return "login/attendance-report-branch-collegewise";
	}
	
	@RequestMapping(value = "/attendance-report-branch-collegewise.html", method = RequestMethod.POST)
	public String reportBrancha(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		
		/*System.out.println("semestar1"+semestar1);
		System.out.println("month1"+month1);*/
		
		String loginid =(String)session.getAttribute("admin_loginid");
		System.out.println("::loginid::admin-login:::get::::::::"+loginid);
		
		
		List<LoginModel> institute = ldao.getAllInstituteListt(loginid);
		  model.addAttribute("institute", institute);
		 // System.out.println("institute"+institute);
		  LoginModel firstLoginModel = institute.get(0); // Get the first LoginModel object
		    String instituteCode = firstLoginModel.getInstituteCode();
		   // System.out.println("instituteCode"+instituteCode);
		 
			

		  
		  List<LoginModel> semestar = ldao.getSemesterList();
		  model.addAttribute("semestar", semestar);
		//  System.out.println("semestar"+semestar);
		//	System.out.println("avdmDeviceInfo lg "+lg.getSemestar());
			String selectedSemester=lg.getSemestar();
			  model.addAttribute("selectedSemester", selectedSemester);

			List<LoginModel> branch = ldao.getBranchList();
			  model.addAttribute("branch", branch);
			//  System.out.println("branch"+branch);
			//	System.out.println("avdmDeviceInfo lg "+lg.getCourseName());
				String course=lg.getCourseName();
				  model.addAttribute("course", course);

			  List<LoginModel> month = ldao.getMonthList();
			  model.addAttribute("month", month);
			 // System.out.println("month"+month);
			//  System.out.println("avdmDeviceInfo lg "+lg.getMonth());
				String selectedMonth=lg.getMonth();
				  model.addAttribute("selectedMonth", selectedMonth);

				 List<LoginModel> studentview =ldao.getCandidatebranch(instituteCode,selectedSemester,selectedMonth,course);
				 model.addAttribute("studentview", studentview);
				// System.out.println("studentview"+studentview);
				
			
		return "login/attendance-report-branch-collegewise";
	}
	@RequestMapping(value = "/attendance-report-branch.html", method = RequestMethod.GET)
	public String reportBranch(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		/*List<LoginModel> institute = ldao.getAllInstituteList();
		  model.addAttribute("institute", institute);
		  System.out.println("institute"+institute);*/
		
		List<LoginModel> listOfCollege = ldao.getAllCollegeList();
		model.addAttribute("listOfCollege", listOfCollege);
		//System.out.println("listOfCollege"+listOfCollege);
		//	System.out.println("avdmDeviceInfo lg "+lg.getInstituteCode());

		  List<LoginModel> semestar = ldao.getSemesterList();
		  model.addAttribute("semestar", semestar);
		 // System.out.println("semestar"+semestar);
		//	System.out.println("avdmDeviceInfo lg "+lg.getSemestar());
			
			  List<LoginModel> branch = ldao.getBranchList();
			  model.addAttribute("branch", branch);
			//  System.out.println("branch"+branch);
			//	System.out.println("avdmDeviceInfo lg "+lg.getCourseName());
			
			  List<LoginModel> month = ldao.getMonthList();
			  model.addAttribute("month", month);
			//  System.out.println("month"+month);


		return "login/attendance-report-branch";
	}
	@RequestMapping(value = "/attendance-report-branch.html", method = RequestMethod.POST)
	public String reportbranch(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		/*List<LoginModel> institute = ldao.getAllInstituteList();
		  model.addAttribute("institute", institute);
		  System.out.println("institute"+institute);*/
		List<LoginModel> listOfCollege = ldao.getAllCollegeList();
		model.addAttribute("listOfCollege", listOfCollege);
		//System.out.println("listOfCollege"+listOfCollege);
		 
		//	System.out.println("avdmDeviceInfo lg "+lg.getInstituteCode());
			String selectedInstitute=lg.getInstituteCode();

		  
		  List<LoginModel> semestar = ldao.getSemesterList();
		  model.addAttribute("semestar", semestar);
		//  System.out.println("semestar"+semestar);
		//	System.out.println("avdmDeviceInfo lg "+lg.getSemestar());
			String selectedSemester=lg.getSemestar();
			  model.addAttribute("selectedSemester", selectedSemester);

			List<LoginModel> branch = ldao.getBranchList();
			  model.addAttribute("branch", branch);
			 // System.out.println("branch"+branch);
			//	System.out.println("avdmDeviceInfo lg "+lg.getCourseName());
				String course=lg.getCourseName();
				  model.addAttribute("course", course);

			  List<LoginModel> month = ldao.getMonthList();
			  model.addAttribute("month", month);
			 // System.out.println("month"+month);
			//  System.out.println("avdmDeviceInfo lg "+lg.getMonth());
				String selectedMonth=lg.getMonth();
				  model.addAttribute("selectedMonth", selectedMonth);

		  List<LoginModel>viewData=ldao.viewDataSemesterwise(selectedInstitute,selectedSemester,selectedMonth);
			model.addAttribute("viewData",viewData);
				 List<LoginModel> studentview =ldao.getCandidateHostel(selectedInstitute,selectedSemester,selectedMonth,course);
				 model.addAttribute("studentview", studentview);
				// System.out.println("studentview"+studentview);
				
			
		return "login/attendance-report-branch";
	}
	
	
	@RequestMapping(value = "/attendance-report-branch-ITI-Admin.html", method = RequestMethod.GET)
	public String reportBranchiti(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		
		
		List<LoginModel> listOfCollege = ldao.getAllCollegeListiti();
		model.addAttribute("listOfCollege", listOfCollege);
		//System.out.println("listOfCollege"+listOfCollege);
		//	System.out.println("avdmDeviceInfo lg "+lg.getInstituteCode());

	


		return "login/attendance-report-branch-ITI-Admin";
	}
	@RequestMapping(value = "/attendance-report-branch-ITI-Admin.html", method = RequestMethod.POST)
	public String reportbranchiti(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		
		List<LoginModel> listOfCollege = ldao.getAllCollegeListiti();
		model.addAttribute("listOfCollege", listOfCollege);
		//System.out.println("listOfCollege"+listOfCollege);
		//	System.out.println("avdmDeviceInfo lg "+lg.getInstituteCode());
	
		
		 
			//System.out.println("avdmDeviceInfo lg "+lg.getInstituteCode());
			String selectedInstitute=lg.getInstituteCode();
			  model.addAttribute("selectedInstitute", selectedInstitute);

		  
	

		
			//	System.out.println("avdmDeviceInfo lg "+lg.getCourseName());
				String selectedcourse=lg.getCourseName();
				  model.addAttribute("selectedcourse", selectedcourse);

			
			//  System.out.println("avdmDeviceInfo lg "+lg.getMonth());
				String selectedMonth=lg.getMonth();
				  model.addAttribute("selectedMonth", selectedMonth);

		 // List<LoginModel>viewData=ldao.viewDatacoursewiseadminITI(selectedInstitute,selectedcourse,selectedMonth);
		  List<LoginModel>viewData=ldao.getCandidatebranchITI(selectedInstitute,selectedcourse,selectedMonth);

		  model.addAttribute("viewData",viewData);
				 
				
			
		return "login/attendance-report-branch-ITI-Admin";
	}
	
	
/*	@RequestMapping(value = "/getRDdata.html", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<LoginModel> getRDdata(@RequestBody String data)
	{
		System.out.println("getPIAId.html::id:::");
		System.out.println("data.html::id:::"+data);
		List<LoginModel> trainerList =  ldao.getPIAId(txtDataRd);
		
		System.out.println("getPIAId.html::id:::"+trainerList.get(0).getPiaId());
		System.out.println("getPIAId.html::name:::"+trainerList.get(0).getPiaName());
		
		return null;
	} */
	
	//old mapping
	
/*	@ResponseBody
	@RequestMapping(value = "/getRDdata.html", method = RequestMethod.POST, consumes = "application/json")
	public String saveObj(Model model, @RequestBody String rddata,RedirectAttributes redirectAttributes) throws JSONException, IOException, ParserConfigurationException, SAXException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException, SQLException {
		System.out.println("Enter into get rd data");
		System.out.println("x"+rddata);

		String [] x=rddata.split("&",3);
		System.out.println(x.length);
		for(String a:x)
			System.out.println(a);
		String rdData = x[0];
        String regNo = x[1];
        String deviceInfo = x[2];
        System.out.println("firstValue "+rdData);
        System.out.println("secondValue "+regNo);
        System.out.println("thirdValue "+deviceInfo);

	
		System.out.println("xxxx "+x.toString());
		String referenceNo=ldao.getreferenceNo(regNo);

		System.out.println("referenceNo"+referenceNo);
		BufferedWriter bufferedWriter = null;
		//URL url = new URL("http://117.239.112.230/AadhaarVaultEncryption/rest/getAadhaarFromRef"); // preproduction PUBLIC
		URL url = new URL("http://10.150.9.68/AadhaarVaultEncryption/rest/getAadhaarFromRef");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setDoOutput(true);
		// String adhaar="317712894608";
		
		String jsonInputString = "{\n \"schemeId\":\""+ 3 +"\",\"referenceKey\":\"" + referenceNo +"\"}";

		 System.out.println("jsonInputString "+jsonInputString);
		DataOutputStream out = new DataOutputStream(conn.getOutputStream());
		System.out.println("out "+out);
		out.write(jsonInputString.getBytes());
		out.close();

		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String path="";
		String output;
		output = br.readLine();
		System.out.println("output  " + output);
		JSONObject jo = new JSONObject(output);
		System.out.println("jo  " + jo);
		JSONObject re=jo.getJSONObject("aadhaarDetails");
		//System.out.println("data"+data);
		
		String aadhar  = re.getString("aadhaarNo");

		//String aadhar=ldao.getAadhar(regNo);
		System.out.println("aadhar lg "+aadhar);
		System.out.println("aadhar"+aadhar);
		String aadharResponse = ldao.callUIDIA(deviceInfo,rdData,aadhar);
		System.out.println("aadharResponse "+aadharResponse);
		
		
		String abc = cdao.checkFingerValid(rdInfo,pidBlockData,cand_id);
		System.out.println("abc "+abc);
		
		InputSource is = new InputSource(new StringReader(aadharResponse));
	    DOMParser dp = new DOMParser();
	    dp.parse(is);
	    Document doc = dp.getDocument();
	    NodeList nl = doc.getElementsByTagName("AuthRes");
	   // System.out.println("nl "+nl);
	    Node n = nl.item(0);
	   // System.out.println("n "+n);
	    NamedNodeMap nnm = n.getAttributes();
	    String ret = nnm.getNamedItem("ret").getFirstChild().getTextContent();
	    
	    try{
	    
	    String err = nnm.getNamedItem("err").getFirstChild().getTextContent();
	    }catch (Exception e) {
		}
	    String txn = nnm.getNamedItem("txn").getFirstChild().getTextContent();  
	    
	    System.out.println("ret "+ret);
	    String ret1=ret;
	    System.out.println("ret1"+ret1);
	    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    //DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		Date in_time = new Date();
		System.out.println(dateFormat.format(in_time));
		
	    DateFormat dateFormatt = new SimpleDateFormat("dd/MM/yyyy");
		String date=(dateFormatt.format(in_time));
System.out.println("date"+date);
		
	    JSONObject res = new JSONObject();
	    if(ret=="y" || ret.equals("y"))
	    {
	    	System.out.println("inside ret if "+ret);
	    	final String USER_AGENT = "Mozilla/5.0";
			final String GET_URL = "https://sctevtexams.in/api/get-student-details-updated?registrationNumber=" + regNo + "";
			SSLContext ssl_ctx = SSLContext.getInstance("TLS");
			TrustManager[] trust_mgr = get_trust_mgr();
			try {
				ssl_ctx.init(null, // key manager
						trust_mgr, // trust manager
						new SecureRandom());
			} catch (KeyManagementException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // random number generator
			HttpsURLConnection.setDefaultSSLSocketFactory(ssl_ctx.getSocketFactory());

			System.out.println("inside verification get");
			URL urlForGetRequest = new URL(GET_URL);
			System.out.println("urlForGetRequest " + urlForGetRequest);
			String readLine = null;
			HttpURLConnection conection = (HttpURLConnection) urlForGetRequest.openConnection();
			conection.setRequestMethod("GET");
			conection.setRequestProperty("userId", "a1bcdef");
			
			System.out.println("conection " + conection);
		 int responseCode = conection.getResponseCode();
			System.out.println("responseCode " + responseCode);
			if (responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader in = new BufferedReader(new InputStreamReader(conection.getInputStream()));
				StringBuffer response = new StringBuffer();
				while ((readLine = in.readLine()) != null) {
					response.append(readLine);
				}
				in.close();
				// print result
				System.out.println("response" + response);
				System.out.println("JSON String Result " + response.toString());

				// GetAndPost.POSTRequest(response.toString());
				String result = response.toString();
				System.out.println(result);
				JSONObject d = new JSONObject(result);
				System.out.println(d.toString());

				System.out.println("d " + d);
			
			
				 // FOR VIEW THE DATA
				JSONObject data = d.getJSONObject("data");

				String studentName = data.getString("studentName");
				model.addAttribute("studentName", studentName);
				System.out.println("studentName" + studentName);

				String registrationNumber = data.getString("registrationNumber");
				model.addAttribute("registrationNumber", registrationNumber);
				System.out.println("registrationNumber" + registrationNumber);

				String fatherName = data.getString("fatherName");
				model.addAttribute("fatherName", fatherName);
				System.out.println("fatherName" + fatherName);

				String motherName = data.optString("motherName");
				model.addAttribute("motherName", motherName);
				System.out.println("motherName" + motherName);

				String dob = data.getString("dob");
				model.addAttribute("dob", dob);
				System.out.println("dob" + dob);
	    	
				String semester = data.getString("semester");
				model.addAttribute("semester", semester);
				System.out.println("semester" + semester);
				
				String data1=ldao.candAttendanceMainRD(regNo,in_time);
			System.out.println("VIEW DATA OF INSERTED FINGER PUNCH "+data1);
			 redirectAttributes.addFlashAttribute("MSGS", "Sucessfully.");
			 String view=ldao.sucessview(regNo);
			 model.addAttribute("view", view);
			System.out.println("view" + view);
			 List<LoginModel>view=ldao.sucessview(regNo,in_time);
				model.addAttribute("view",view);
				System.out.println("view"+view);
				jo.put("rollId",view.get);
			 LoginModel viewDetails = ldao.viewDeptBatchDetails(regNo,in_time);//bean type select query
			 String timein=viewDetails.getInTime();
			 String timeout=viewDetails.getOutTime();
			 System.out.println("timein"+timein);
			 System.out.println("timeout"+timeout);
			
			System.out.println("viewDetails" + viewDetails);
			jo.put("rollId", viewDetails.getRollId());
			jo.put("studentName", viewDetails.getStudentName());
			jo.put("inTime", viewDetails.getInTime());

			jo.put("outTime", viewDetails.getOutTime());
			jo.put("attendDate", viewDetails.getAttendDate());
			jo.put("photo", viewDetails.getPhoto());

			jo.put("ret", ret);
			jo.put("date", date);



//return jo.toString();
				return jo.toString();
		} else {
			System.out.println("RETURN JSP");
			System.out.println("when ret n");
			jo.put("ret", ret);

			System.out.println("jo"+jo.toString());

			//return jo.toString();
			return jo.toString();
			}
		}
		return jo.toString();
	
	}*/
	
	@ResponseBody
	@RequestMapping(value = "/getRDdata.html", method = RequestMethod.POST, consumes = "application/json")
	public String saveObj(Model model, @RequestBody String rddata,RedirectAttributes redirectAttributes) throws JSONException, IOException, ParserConfigurationException, SAXException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException, SQLException {
		System.out.println("Enter into get rd data");
		System.out.println("x"+rddata);

		String [] x=rddata.split("&",3);
		System.out.println(x.length);
		for(String a:x)
			System.out.println(a);
		String rdData = x[0];
        String regNo = x[1];
        String deviceInfo = x[2];
        System.out.println("firstValue "+rdData);
        System.out.println("secondValue "+regNo);
        System.out.println("thirdValue "+deviceInfo);

	
		System.out.println("xxxx "+x.toString());
		String referenceNo=ldao.getreferenceNo(regNo);

		System.out.println("referenceNo"+referenceNo);
		BufferedWriter bufferedWriter = null;
		//URL url = new URL("https://adv.odisha.gov.in/AadhaarVaultEncryption/rest/getAadhaarFromRef"); // local
		URL url = new URL("http://10.150.9.68/AadhaarVaultEncryption/rest/getAadhaarFromRef");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setDoOutput(true);
		// String adhaar="317712894608";
		
		String jsonInputString = "{\n \"schemeId\":\""+ 3 +"\",\"referenceKey\":\"" + referenceNo +"\"}";

		 System.out.println("jsonInputString "+jsonInputString);
		DataOutputStream out = new DataOutputStream(conn.getOutputStream());
		System.out.println("out "+out);
		out.write(jsonInputString.getBytes());
		out.close();

		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String path="";
		String output;
		output = br.readLine();
		System.out.println("output  " + output);
		JSONObject jo = new JSONObject(output);
		System.out.println("jo  " + jo);
		JSONObject re=jo.getJSONObject("aadhaarDetails");
		//System.out.println("data"+data);
		
		String aadhar  = re.getString("aadhaarNo");

		//String aadhar=ldao.getAadhar(regNo);
		System.out.println("aadhar lg "+aadhar);
		System.out.println("aadhar"+aadhar);
		String aadharResponse = ldao.callUIDIA(deviceInfo,rdData,aadhar);
		System.out.println("aadharResponse "+aadharResponse);
		
		
		/*String abc = cdao.checkFingerValid(rdInfo,pidBlockData,cand_id);
		System.out.println("abc "+abc);*/
		
		InputSource is = new InputSource(new StringReader(aadharResponse));
	    DOMParser dp = new DOMParser();
	    dp.parse(is);
	    Document doc = dp.getDocument();
	    NodeList nl = doc.getElementsByTagName("AuthRes");
	   // System.out.println("nl "+nl);
	    Node n = nl.item(0);
	   // System.out.println("n "+n);
	    NamedNodeMap nnm = n.getAttributes();
	    String ret = nnm.getNamedItem("ret").getFirstChild().getTextContent();
	    
	    try{
	    
	    String err = nnm.getNamedItem("err").getFirstChild().getTextContent();
	    }catch (Exception e) {
		}
	    String txn = nnm.getNamedItem("txn").getFirstChild().getTextContent();  
	    
	    System.out.println("ret "+ret);
	    String ret1=ret;
	    System.out.println("ret1"+ret1);
	    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    //DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		Date in_time = new Date();
		System.out.println(dateFormat.format(in_time));
		
	    DateFormat dateFormatt = new SimpleDateFormat("dd/MM/yyyy");
		String date=(dateFormatt.format(in_time));
System.out.println("date"+date);
		
	    JSONObject res = new JSONObject();
	    if(ret=="y" || ret.equals("y"))
	    {
	    	String collegetype=ldao.getcollegeType(regNo);
	    	
	    	
	    	if(collegetype.equals("G"))
			{
	    		System.out.println("collegetype G");

	    		
	    		System.out.println("inside ret if "+ret);
		    	final String USER_AGENT = "Mozilla/5.0";
				final String GET_URL = "https://sctevtexams.in/api/get-student-details-updated?registrationNumber=" + regNo + "";
				SSLContext ssl_ctx = SSLContext.getInstance("TLS");
				TrustManager[] trust_mgr = get_trust_mgr();
				try {
					ssl_ctx.init(null, // key manager
							trust_mgr, // trust manager
							new SecureRandom());
				} catch (KeyManagementException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} // random number generator
				HttpsURLConnection.setDefaultSSLSocketFactory(ssl_ctx.getSocketFactory());

				System.out.println("inside verification get");
				URL urlForGetRequest = new URL(GET_URL);
				System.out.println("urlForGetRequest " + urlForGetRequest);
				String readLine = null;
				HttpURLConnection conection = (HttpURLConnection) urlForGetRequest.openConnection();
				conection.setRequestMethod("GET");
				conection.setRequestProperty("userId", "a1bcdef");
				
				System.out.println("conection " + conection);
			 int responseCode = conection.getResponseCode();
				System.out.println("responseCode " + responseCode);
				if (responseCode == HttpURLConnection.HTTP_OK) {
					BufferedReader in = new BufferedReader(new InputStreamReader(conection.getInputStream()));
					StringBuffer response = new StringBuffer();
					while ((readLine = in.readLine()) != null) {
						response.append(readLine);
					}
					in.close();
					// print result
					System.out.println("response" + response);
					System.out.println("JSON String Result " + response.toString());

					// GetAndPost.POSTRequest(response.toString());
					String result = response.toString();
					System.out.println(result);
					JSONObject d = new JSONObject(result);
					System.out.println(d.toString());

					System.out.println("d " + d);
				
				
					 // FOR VIEW THE DATA
					JSONObject data = d.getJSONObject("data");
					System.out.println("data" + data);
					
					String studentName = data.getString("studentName");
					model.addAttribute("studentName", studentName);
					System.out.println("studentName" + studentName);

					String registrationNumber = data.getString("registrationNumber");
					model.addAttribute("registrationNumber", registrationNumber);
					System.out.println("registrationNumber" + registrationNumber);

					String fatherName = data.getString("fatherName");
					model.addAttribute("fatherName", fatherName);
					System.out.println("fatherName" + fatherName);

					String motherName = data.optString("motherName");
					model.addAttribute("motherName", motherName);
					System.out.println("motherName" + motherName);

					String dob = data.getString("dob");
					model.addAttribute("dob", dob);
					System.out.println("dob" + dob);
		    	
					String semester = data.getString("semester");
					model.addAttribute("semester", semester);
					System.out.println("semester" + semester);
					
					String instituteCode = data.getString("instituteCode");
					model.addAttribute("instituteCode", instituteCode);
					System.out.println("instituteCode" + instituteCode);
					
					String courseName = data.getString("courseName");
					model.addAttribute("courseName", courseName);
					System.out.println("courseName" + courseName);	
					String data1=ldao.candAttendanceMainRD(regNo,in_time,instituteCode,semester,courseName);
					System.out.println("VIEW DATA OF INSERTED FINGER PUNCH "+data1);
					 redirectAttributes.addFlashAttribute("MSGS", "Sucessfully.");
					/* String view=ldao.sucessview(regNo);
					 model.addAttribute("view", view);
					System.out.println("view" + view);*/
					 /*List<LoginModel>view=ldao.sucessview(regNo,in_time);
						model.addAttribute("view",view);
						System.out.println("view"+view);
						jo.put("rollId",view.get);*/
					 LoginModel viewDetails = ldao.viewDeptBatchDetails(regNo,in_time);//bean type select query
					 String timein=viewDetails.getInTime();
					 String timeout=viewDetails.getOutTime();
					 System.out.println("timein"+timein);
					 System.out.println("timeout"+timeout);
					
					System.out.println("viewDetails" + viewDetails);
					jo.put("rollId", viewDetails.getRollId());
					jo.put("studentName", viewDetails.getStudentName());
					jo.put("inTime", viewDetails.getInTime());

					jo.put("outTime", viewDetails.getOutTime());
					jo.put("attendDate", viewDetails.getAttendDate());
					jo.put("photo", viewDetails.getPhoto());

					jo.put("ret", ret);
					jo.put("date", date);



		//return jo.toString();
						return jo.toString();
				} else {
					System.out.println("RETURN JSP");
					System.out.println("when ret n");
					jo.put("ret", ret);

					System.out.println("jo"+jo.toString());

					//return jo.toString();
					return jo.toString();
					}

			}
	    	else{
	    		
	    		System.out.println("collegetype I");

				String data1=ldao.candAttendanceMainRD(regNo,in_time);
			System.out.println("VIEW DATA OF INSERTED FINGER PUNCH "+data1);
			 redirectAttributes.addFlashAttribute("MSGS", "Sucessfully.");
			/* String view=ldao.sucessview(regNo);
			 model.addAttribute("view", view);
			System.out.println("view" + view);*/
			 /*List<LoginModel>view=ldao.sucessview(regNo,in_time);
				model.addAttribute("view",view);
				System.out.println("view"+view);
				jo.put("rollId",view.get);*/
			 LoginModel viewDetails = ldao.viewDeptBatchDetails(regNo,in_time);//bean type select query
			 String timein=viewDetails.getInTime();
			 String timeout=viewDetails.getOutTime();
			 System.out.println("timein"+timein);
			 System.out.println("timeout"+timeout);
			
			System.out.println("viewDetails" + viewDetails);
			jo.put("rollId", viewDetails.getRollId());
			jo.put("studentName", viewDetails.getStudentName());
			jo.put("inTime", viewDetails.getInTime());

			jo.put("outTime", viewDetails.getOutTime());
			jo.put("attendDate", viewDetails.getAttendDate());
			jo.put("photo", viewDetails.getPhoto());

			jo.put("ret", ret);
			jo.put("date", date);



//return jo.toString();
				return jo.toString();
		} 
	    	
	    	}

		return jo.toString();
	
	}
	
	/*@RequestMapping(value = "/viewSuccess.html", method = RequestMethod.GET)
	public String attd(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		System.out.println("inside view success get then redirect");
	
		return "login/viewSuccess";
		}*/
	

	@RequestMapping(value = "/verification.html", method = RequestMethod.GET)
	public String view(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
System.out.println("SDFGHHJ");
		return "common-admin/verification";
	}

	@RequestMapping(value = "/verification.html", method = RequestMethod.POST)//after login in the institute login then enter the reg no for checking the data is present or not our database. if pesent then procecide for finger else add the data through sctvt api
	public ModelAndView verifi(@ModelAttribute("cb") LoginModel lg, Model model, HttpServletRequest request,
			HttpSession session) throws IOException, JSONException, KeyManagementException, NoSuchAlgorithmException {
		String apiData;
		
		String loginid =(String)session.getAttribute("admin_loginid");

		System.out.println("enter into post");
		String regNo = lg.getRollId();
		System.out.println("regNo" + regNo);//THROUGH FIELD
		
		String checkRegNo = null;
		String instituteNameIti =null;
		String regnoITI = null;
		String checkRegNoIti =null;
		String userID1 = loginid;
		System.out.println("userID1" + userID1);
		
		//session.setAttribute("userID", lg.getLoginid());
		try {
			checkRegNo = ldao.checkRegNo(regNo);
			System.out.println("checkRegNo" + checkRegNo);
		} catch (Exception e) {
		}
		
		try {
		 regnoITI=ldao.checkRegNoIti(regNo);
		 System.out.println("regnoITI" + regnoITI);
		 List<LoginModel> regnoITIstudent=ldao.checkRegNoItistudent(regnoITI);
		 System.out.println("regnoITIstudent" + regnoITIstudent);
			model.addAttribute("regnoITIstudent", regnoITIstudent);

		 for (LoginModel student : regnoITIstudent) {
	            System.out.println("Institute Name: " + student.getMisItiCode());
	           instituteNameIti=student.getMisItiCode();
	            System.out.println("instituteNameItiCODE"+instituteNameIti);
		 }

	} catch (Exception e) {
	}
		try{
			checkRegNoIti = ldao.checkRegNoItiregisterornot(regnoITI);
			System.out.println("checkRegNoIti" + checkRegNoIti);
		} catch (Exception e) {
		}
		if (checkRegNo == null && regnoITI == null ) {
try{
			final String USER_AGENT = "Mozilla/5.0";
			final String GET_URL = "https://sctevtexams.in/api/get-student-details?registrationNumber=" + regNo + "";
									//https://sctevtexams.in/api/get-student-details?registrationNumber=F22121001031
			SSLContext ssl_ctx = SSLContext.getInstance("TLS");
			TrustManager[] trust_mgr = get_trust_mgr();
			ssl_ctx.init(null, // key manager
					trust_mgr, // trust manager
					new SecureRandom()); // random number generator
			HttpsURLConnection.setDefaultSSLSocketFactory(ssl_ctx.getSocketFactory());

			System.out.println("inside verification get");
			URL urlForGetRequest = new URL(GET_URL);
			System.out.println("urlForGetRequest " + urlForGetRequest);
			String readLine = null;
			HttpURLConnection conection = (HttpURLConnection) urlForGetRequest.openConnection();
			conection.setRequestMethod("GET");
			conection.setRequestProperty("userId", "a1bcdef");
			// socket.setSoTimeout(30000);
			// conection.set(1000);
			System.out.println("conection " + conection);
		 int responseCode = conection.getResponseCode();
			System.out.println("responseCode " + responseCode);
			if (responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader in = new BufferedReader(new InputStreamReader(conection.getInputStream()));
				StringBuffer response = new StringBuffer();
				while ((readLine = in.readLine()) != null) {
					response.append(readLine);
				}
				in.close();
				// print result
				System.out.println("response" + response);
				System.out.println("JSON String Result " + response.toString());

				// GetAndPost.POSTRequest(response.toString());
				String result = response.toString();
				System.out.println(result);
				JSONObject re = new JSONObject(result);
				System.out.println(re.toString());

				System.out.println("re " + re);
			
			
				 // FOR VIEW THE DATA
				JSONObject data = re.getJSONObject("data");

				String studentName = data.getString("studentName");
				model.addAttribute("studentName", studentName);
				System.out.println("studentName" + studentName);

				String registrationNumber = data.getString("registrationNumber");
				model.addAttribute("registrationNumber", registrationNumber);
				System.out.println("registrationNumber" + registrationNumber);

				String fatherName = data.getString("fatherName");
				model.addAttribute("fatherName", fatherName);
				System.out.println("fatherName" + fatherName);

				String motherName = data.optString("motherName");
				model.addAttribute("motherName", motherName);
				System.out.println("motherName" + motherName);

				String dob = data.getString("dob");
				model.addAttribute("dob", dob);
				System.out.println("dob" + dob);
				 SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			        SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
					System.out.println("dob1" + dob);

			        try {
						System.out.println("dob2" + dob);
  
			            // Parse the input string into a Date object
			            Date date = inputFormat.parse(dob);
			            
			            // Format the Date object into the desired output format
			            String outputDate = outputFormat.format(date);
			            model.addAttribute("outputDate", outputDate);
			            System.out.println("Original Date: " + dob);
			            System.out.println("Converted Date: " + outputDate);
			        } catch (ParseException e) {
			        	
			            e.printStackTrace();
			        }

				String semester = data.getString("semester");
				model.addAttribute("semester", semester);
				System.out.println("semester" + semester);

				String gender = re.getJSONObject("data").getString("gender");
				model.addAttribute("gender", gender);
				System.out.println("gender" + gender);

				String emailId = re.getJSONObject("data").optString("emailId");//IF THE VALUE COME NULL
				System.out.println("emailId" + emailId);

				model.addAttribute("emailId", emailId);

				System.out.println("emailId" + emailId);

				String mobileNumber = re.getJSONObject("data").getString("mobileNumber");
				model.addAttribute("mobileNumber", mobileNumber);

				System.out.println("mobileNumber" + mobileNumber);

				String instituteCode = re.getJSONObject("data").getString("instituteCode");
				model.addAttribute("instituteCode", instituteCode);

				System.out.println("instituteCode" + instituteCode);

				String instituteName = re.getJSONObject("data").getString("instituteName");
				model.addAttribute("instituteName", instituteName);
				System.out.println("instituteName" + instituteName);

				String academicYear = re.getJSONObject("data").getString("academicYear");
				model.addAttribute("academicYear", academicYear);
				System.out.println("academicYear" + academicYear);
				
				String courseName = re.getJSONObject("data").getString("courseName");
				model.addAttribute("courseName", courseName);
				System.out.println("courseName" + courseName);
				
				String studentPhoto = data.getString("studentPhoto");
				model.addAttribute("studentPhoto", studentPhoto);
				System.out.println("studentPhoto" + studentPhoto);
				if ((instituteCode .equals(userID1)) ||(userID1 .equals (instituteCode))) {    //s1.equals(s2)
					System.out.println("IF");
					//return "login/popupview";
					return  new ModelAndView("login/popupview");
				}	
			

				else{
					System.out.println("eNTER INTO ELSE INSIDE THE TRY BLOCK");
					return  new ModelAndView("redirect:verification.html","message","Redg No incorrect or Redg No not belongs to this Institute..  ");

				}
    
			}		

    }

catch (Exception e) {
    // Handle connection refused error
    System.err.println("Error: Connection Refused. Could not connect to the API.");
    e.printStackTrace();
}
System.out.println("eNTER INTO ELSE OUTSIDE THE TRY BLOCK");

return  new ModelAndView("common-admin/verification","message","Redg No incorrect or Redg No not belongs to this Institute..  ");



    }
		else if(regnoITI != null && checkRegNo ==null){
			System.out.println("regnoITI != null");
			System.out.println("instituteNameIti"+instituteNameIti);
			System.out.println("userID1"+userID1);
		
			
			if ((instituteNameIti .equals(userID1)) ||(userID1 .equals (instituteNameIti))) {  //s1.equals(s2)
				System.out.println("IF");
				return  new ModelAndView("login/iti_student_details_view");
			}	
		

			else{
				System.out.println("eNTER INTO ELSE INSIDE THE TRY BLOCK");
				return  new ModelAndView("redirect:verification.html","message","Redg No incorrect or Redg No not belongs to this Institute..  ");

			}

		}
		else {//correct
			System.out.println("direct finger");
			System.out.println("regNo" + regNo);
			String userID2 = loginid;
			System.out.println("userID1" + userID1);
			
			String checkRegNoInstitute = ldao.checkInstituteAndStudent(regNo);
			System.out.println("checkRegNoInstitute" + checkRegNoInstitute);

			if ((checkRegNoInstitute .equals(userID2)) ||(userID2 .equals (checkRegNoInstitute))) {    //s1.equals(s2)
			System.out.println("IF");
				//return "common-admin/register";
			return  new ModelAndView("common-admin/register");


			} else {
				System.out.println("ELSE");

				//return "redirect:verification.html" ;
				//return  new ModelAndView("redirect:verification.html","message","Redg No incorrect or Redg No not belongs to this Institute..  ");
				return  new ModelAndView("common-admin/verification","message","Redg No incorrect or Redg No not belongs to this Institute..  ");
			}
		}//correct

	}



	private TrustManager[] get_trust_mgr() {
		TrustManager[] certs = new TrustManager[] { new X509TrustManager() {
		public X509Certificate[] getAcceptedIssuers() {
		return null;
		}

		public void checkClientTrusted(X509Certificate[] certs, String t) {
		}

		public void checkServerTrusted(X509Certificate[] certs, String t) {
		}
		} };
		return certs;
		}


	@RequestMapping(value = "/collegedetails.html", method = RequestMethod.GET)//out side api for  admin for calling  the college details through api
	public ModelAndView collegeDetails(@ModelAttribute("cb") LoginModel lg, Model model, HttpServletRequest request,
			HttpSession session) throws IOException, JSONException, KeyManagementException, NoSuchAlgorithmException {
		try{	
		final String USER_AGENT = "Mozilla/5.0";
		final String GET_URL = "https://sctevtexams.in/api/get-college-details?instituteCode";
		SSLContext ssl_ctx = SSLContext.getInstance("TLS");
		TrustManager[] trust_mgr = get_trust_mgr();
		ssl_ctx.init(null, // key manager
				trust_mgr, // trust manager
				new SecureRandom()); // random number generator
		HttpsURLConnection.setDefaultSSLSocketFactory(ssl_ctx.getSocketFactory());

		System.out.println("inside verification get");
		URL urlForGetRequest = new URL(GET_URL);
		System.out.println("urlForGetRequest " + urlForGetRequest);
		String readLine = null;
		HttpURLConnection conection = (HttpURLConnection) urlForGetRequest.openConnection();
		conection.setRequestMethod("GET");
		conection.setRequestProperty("userId", "a1bcdef");
		// socket.setSoTimeout(30000);
		// conection.set(1000);
		System.out.println("conection " + conection);
		int responseCode = conection.getResponseCode();
		System.out.println("responseCode " + responseCode);
		if (responseCode == HttpURLConnection.HTTP_OK) {
			BufferedReader in = new BufferedReader(new InputStreamReader(conection.getInputStream()));
			StringBuffer response = new StringBuffer();
			while ((readLine = in.readLine()) != null) {
				response.append(readLine);
			}
			in.close();
			// print result
			System.out.println("response" + response);
			
			String result = response.toString();
			System.out.println("result"+result);
			JSONObject re = new JSONObject(result);
			System.out.println(re.toString());

			System.out.println("re " + re);
			
			
	        JSONArray dataArray = re.getJSONArray("data");
System.out.println("dataArray"+dataArray);
int arrayLength = dataArray.length();
System.out.println("arrayLength"+arrayLength);


for (int i = 0; i <arrayLength; i++) {
	
    //System.out.println("Element at index " + i + ": " + dataArray.get(i));
     JSONObject allCollege= (JSONObject) dataArray.get(i);
    //System.out.println("allCollege"+allCollege);
     
    String instituteCode=allCollege.getString("instituteCode");
    System.out.println("instituteCode"+instituteCode);
    String instituteType=allCollege.getString("instituteType");
    System.out.println("instituteType"+instituteType);
    
    String instituteName=allCollege.getString("instituteName");
    System.out.println("instituteName"+instituteName);
    try{
    String principalName=allCollege.getString("principalName");
     System.out.println("principalName"+principalName);
     
     int insertCollegeDetails = ldao.insertCollegeDetails(instituteCode,principalName,instituteType,instituteName);
     }
   
    catch (JSONException e) {
    }	
   
	

}
		
   	
}
	
			
		}	
	
		 catch (ConnectException e) {
			    // Handle connection refused error
			    e.printStackTrace();
			} catch (IOException e) {
			    // Handle other IO-related errors
			    e.printStackTrace();
			}
			return  new ModelAndView("common-admin/register");
		
	}
		
	@RequestMapping(value = "/coursedetails.html", method = RequestMethod.GET)//out side api for  admin for calling  the course details through api
	public ModelAndView courseDetails(@ModelAttribute("cb") LoginModel lg, Model model, HttpServletRequest request,
			HttpSession session) throws IOException, JSONException, KeyManagementException, NoSuchAlgorithmException {
		try {
			final String USER_AGENT = "Mozilla/5.0";
			final String GET_URL = "https://sctevtexams.in/api/get-all-college-course-details";
			SSLContext ssl_ctx = SSLContext.getInstance("TLS");
			TrustManager[] trust_mgr = get_trust_mgr();
			ssl_ctx.init(null, // key manager
					trust_mgr, // trust manager
					new SecureRandom()); // random number generator
			HttpsURLConnection.setDefaultSSLSocketFactory(ssl_ctx.getSocketFactory());

			System.out.println("inside verification get");
			URL urlForGetRequest = new URL(GET_URL);
			System.out.println("urlForGetRequest " + urlForGetRequest);
			String readLine = null;
			HttpURLConnection conection = (HttpURLConnection) urlForGetRequest.openConnection();
			conection.setRequestMethod("GET");
			conection.setRequestProperty("userId", "a1bcdef");
			// socket.setSoTimeout(30000);
			// conection.set(1000);
			System.out.println("conection " + conection);
			int responseCode = conection.getResponseCode();
			System.out.println("responseCode " + responseCode);
			if (responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader in = new BufferedReader(new InputStreamReader(conection.getInputStream()));
				StringBuffer response = new StringBuffer();
				while ((readLine = in.readLine()) != null) {
					response.append(readLine);
				}
				in.close();
				// print result
				System.out.println("response" + response);

				String result = response.toString();
				System.out.println("result" + result);
				JSONObject re = new JSONObject(result);
				System.out.println(re.toString());

				System.out.println("re " + re);

				JSONArray dataArray = re.getJSONArray("data");
				System.out.println("dataArray" + dataArray);
				int arrayLength = dataArray.length();
				System.out.println("arrayLength" + arrayLength);

				for (int i = 0; i < arrayLength; i++) {

					// System.out.println("Element at index " + i + ": " +
					// dataArray.get(i));
					JSONObject coursedetails = (JSONObject) dataArray.get(i);
					// System.out.println("allCollege"+allCollege);

					String instituteCode = coursedetails.getString("instituteCode");
					System.out.println("instituteCode" + instituteCode);
					String instituteType = coursedetails.getString("instituteType");
					System.out.println("instituteType" + instituteType);

					String instituteName = coursedetails.getString("instituteName");
					System.out.println("instituteName" + instituteName);
				
					
					String courseCode = coursedetails.getString("courseCode");
					System.out.println("courseCode" + courseCode);
					
					String courseName = coursedetails.getString("courseName");
					System.out.println("courseName" + courseName);
					try {
						String principalName = coursedetails.getString("principalName");
						System.out.println("principalName" + principalName);

						int insertCourseDetails = ldao.insertCourseDetails(instituteCode, principalName,
								instituteType, instituteName,courseCode,courseName);
					}

					catch (JSONException e) {
					}

				}

			}

		}

		catch (ConnectException e) {
			// Handle connection refused error
			e.printStackTrace();
		} catch (IOException e) {
			// Handle other IO-related errors
			e.printStackTrace();
		}
		return new ModelAndView("common-admin/register");

	}
	
	
		@RequestMapping(value = "/validateAadhar.html", method = RequestMethod.POST )
		public @ResponseBody String validateOTP( @RequestBody String data) throws JSONException, IOException, ParserConfigurationException, SAXException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException, SQLException {
		
			 	
		        System.out.println("inside generateOTP.html:::::");
		System.out.println("adhar "+data);
	
		String [] x=data.split("&",2);
		for(String a:x)
			System.out.println(a);
		String aadhaar = x[0];
        String studentName = x[1];
        System.out.println("aadhaar"+aadhaar);
       
        String encryptedData =aadhaar;
		//String encryptedDataPan = rs.getString("aadhaar_no");
		
		//String encryptedData = request.getParameter("adhar");
		//System.out.println("encryptedData:::::::::::"+encryptedData);
		
		String data1[] = encryptedData.split(":");
		String iv = data1[0];
		//System.out.println("iv:::::::::::"+iv);
		
		byte[] encryptedByteData =AES.hexStringToByteArray(data1[1]);
		//System.out.println("encryptedByteData:::::::::::"+encryptedByteData);
		
		String keyString = data1[2];
		//System.out.println("keyString:::::::::::"+keyString);
				    
		IvParameterSpec ivs = new IvParameterSpec(Base64.decodeBase64(iv));
		//System.out.println("ivs:::::::::::"+ivs);
		
		Key k = new SecretKeySpec(Base64.decodeBase64(keyString),"AES");
				    try {
				        System.out.println("Decrypted String:"+AES.decrypt(Base64.encodeBase64String(encryptedByteData),k,ivs));
				    } catch (InvalidKeyException | NoSuchAlgorithmException
				            | NoSuchPaddingException | IllegalBlockSizeException |  IOException 
				            | BadPaddingException | InvalidAlgorithmParameterException e) {
				        e.printStackTrace();
				    }
		
	 String adhar= AES.decrypt(Base64.encodeBase64String(encryptedByteData),k,ivs);
        
	 System.out.println(adhar);
	 
        System.out.println("studentName"+studentName);//AUA 
		String studentName1 = "ANANDA BEHERA";
		BufferedWriter bufferedWriter = null;
		//URL url = new URL("http://osrdh.odisha.gov.in/AuthJsonMetaService/authenticate");
		//URL url = new URL("https://osrdh.odisha.gov.in/authpreprodv4/api/authenticate");// preproduction
		URL url = new URL("http://10.150.9.43/authpreprodv4/api/authenticate");// preproduction
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setDoOutput(true);
	
		//String jsonInputString = "{\n  \"uid\":\"" + adhaar+ "\",\n  \"uidType\": \"A\",\n  \"subAuaCode\": \"POSDA12309\",\n  \"consent\": \"Y\",\n  \"txn\":\""+ txn + "\",\n  \"otpValue\":\"" + otp+ "\",\n  \"isOTP\": \"y\",\n  \"isPI\": \"n\",\n  \"isBio\": \"n\"}";
		//String jsonInputString = "{\n  \"uid\":\""+ aadhaar+ "\" ,\n \"uidType\":\"A\",\"consent\":\"Y\",\n \"subAuaCode\":\"SSDTE12311\",\n \"txn\":\"\",\"isPI\":\"y\",\"isBio\":\"n\",\"isOTP\":\"n\",\"bioType\":\"\",\"name\":\"" + studentName1 +"\",\"rdInfo\":\"\",\"rdData\":\"\",\"otpValue\":\"\"	}";
		String jsonInputString = "{\n  \"uid\":\""+ adhar+ "\" ,\n \"uidType\":\"A\",\"consent\":\"Y\",\n \"subAuaCode\":\"SSDTE12311\",\n \"txn\":\"\",\"isPI\":\"y\",\"isBio\":\"n\",\"isOTP\":\"n\",\"bioType\":\"\",\"name\":\"" + studentName +"\",\"rdInfo\":\"\",\"rdData\":\"\",\"otpValue\":\"\"	}";
 System.out.println("jsonInputString "+jsonInputString);
		DataOutputStream out = new DataOutputStream(conn.getOutputStream());
		 System.out.println("out "+out);
		out.write(jsonInputString.getBytes());
		out.close();

		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String output;
		output = br.readLine();
		System.out.println("output  " + output);
		JSONObject jo = new JSONObject(output);
		 String ret = jo.getString("ret");
		 System.out.println("ret"+ret);
		
	
		conn.disconnect();
		return jo.toString();
	}
		
		@RequestMapping(value = "/featchCollegeAPI.html", method = RequestMethod.POST)
		public String fetch(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
				HttpSession session,RedirectAttributes redirectAttributes) throws JSONException, IOException, ParserConfigurationException, SAXException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException, SQLException {
		
			System.out.println("Enter into the post");
			String studentName=lg.getStudentName();
			String aadhaar=lg.getAadhaar();
			System.out.println("aadhaar"+aadhaar);
			String email=lg.getEmail();
			String regNo=lg.getRollId();
			String gender=lg.getGender();
			String fatherName=lg.getFathername();
			String motherName=lg.getMothername();
			String mobile=lg.getMobileNumber();
			String instituteCode=lg.getInstituteCode();
			String semester=lg.getSemestar();
			String academicYear=lg.getAcademicYear();
			String dob=lg.getDob();
			String instituteName=lg.getInstituteName();
			String studentPhoto=lg.getPhoto();
			System.out.println("studentPhoto"+studentPhoto);
			String courseName=lg.getCourseName();
			System.out.println("courseName"+courseName);
			
			  String encryptedData =aadhaar;
				//String encryptedDataPan = rs.getString("aadhaar_no");
				
				//String encryptedData = request.getParameter("adhar");
				//System.out.println("encryptedData:::::::::::"+encryptedData);
				
				String data1[] = encryptedData.split(":");
				String iv = data1[0];
				//System.out.println("iv:::::::::::"+iv);
				
				byte[] encryptedByteData =AES.hexStringToByteArray(data1[1]);
				//System.out.println("encryptedByteData:::::::::::"+encryptedByteData);
				
				String keyString = data1[2];
				//System.out.println("keyString:::::::::::"+keyString);
						    
				IvParameterSpec ivs = new IvParameterSpec(Base64.decodeBase64(iv));
				//System.out.println("ivs:::::::::::"+ivs);
				
				Key k = new SecretKeySpec(Base64.decodeBase64(keyString),"AES");
						    try {
						        System.out.println("Decrypted String:"+AES.decrypt(Base64.encodeBase64String(encryptedByteData),k,ivs));
						    } catch (InvalidKeyException | NoSuchAlgorithmException
						            | NoSuchPaddingException | IllegalBlockSizeException |  IOException 
						            | BadPaddingException | InvalidAlgorithmParameterException e) {
						        e.printStackTrace();
						    }
				
			 String adhar= AES.decrypt(Base64.encodeBase64String(encryptedByteData),k,ivs);
		        
			 System.out.println(adhar);
			/*System.out.println("aadhaar"+aadhaar);
			System.out.println("email"+email);
			System.out.println("semester"+semester);
			System.out.println("regNo"+regNo);
			System.out.println("gender"+gender);
			System.out.println("fatherName"+fatherName);
			System.out.println("motherName"+motherName);
			System.out.println("mobile"+mobile);
			System.out.println("instituteCode"+instituteCode);
			System.out.println("academicYear"+academicYear);
			System.out.println("dob"+dob);
			System.out.println("instituteName"+instituteName);*/
			
			BufferedWriter bufferedWriter = null;
			//URL url = new URL("http://117.239.112.230/AadhaarVaultEncryption/rest/getRefFromAadhaar"); // preproduction
			URL url = new URL("http://10.150.9.68/AadhaarVaultEncryption/rest/getRefFromAadhaar"); // preproduction
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-type", "application/json");
			conn.setDoOutput(true);
			// String adhaar="317712894608";
			
			String jsonInputString = "{\n \"aadhaarNo\":\""+adhar+"\",\"schemeId\":\"" + 1 +"\"}";

			 System.out.println("jsonInputString "+jsonInputString);
			DataOutputStream out = new DataOutputStream(conn.getOutputStream());
			// System.out.println("out "+out);
			out.write(jsonInputString.getBytes());
			out.close();

			BufferedReader br = null;
			try {
				br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String output;
			output = br.readLine();
			//System.out.println("output  " + output);
			JSONObject jo = new JSONObject(output);
			JSONObject data=jo.getJSONObject("aadhaarDetails");
			//System.out.println("data"+data);
			
			long referenceNo = data.getLong("referenceNo");

		//System.out.println("referenceNo" + referenceNo);
			String ipFromHeader = request.getHeader("X-FORWARDED-FOR");
			System.out.println("ipFromHeader "+ipFromHeader);
			String ip = request.getHeader("X-Forwarded-For");      
			  if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
			      ip = request.getHeader("Proxy-Client-IP");      
			      System.out.println("ip 1 "+ip);
			  }      
			  if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
			      ip = request.getHeader("WL-Proxy-Client-IP");
			      System.out.println("ip 2 "+ip);
			     
			  }      
			  if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
			      ip = request.getRemoteAddr();
			      System.out.println("ip 3 "+ip);
			  }
			  if (ip.contains(",")) {
			  String iparr[] = ip.split(",");
			  ip = iparr[0];
			  }

			int i = ldao.savetxnDetailss( lg,studentName,email,semester,regNo,gender,fatherName,motherName,mobile,instituteCode,academicYear,dob,instituteName,referenceNo,studentPhoto,ip,courseName);
			System.out.println("the"+i);
			return "redirect:verification.html";
		}
		
		@RequestMapping(value = "/featchCollegeAPIITI.html", method = RequestMethod.POST)
		public String fetchH(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
				HttpSession session,RedirectAttributes redirectAttributes) throws JSONException, IOException, ParserConfigurationException, SAXException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException, SQLException {
		
			System.out.println("Enter into the post");
			String studentName=lg.getTraineeName();
			String aadhaar=lg.getAadhaar();
			System.out.println("aadhaar"+aadhaar);
			String fatherName=lg.getGardianName();
			String regNo=lg.getApplicationNo();
			String instituteName=lg.getItiName();
			String dob=lg.getDob();
			String trade=lg.getTrade();
			String category=lg.getCatagory();
			String misiticode=lg.getMisItiCode();
			System.out.println("misiticode"+misiticode);

 


			
			
			
			  String encryptedData =aadhaar;
				//String encryptedDataPan = rs.getString("aadhaar_no");
				
				//String encryptedData = request.getParameter("adhar");
				//System.out.println("encryptedData:::::::::::"+encryptedData);
				
				String data1[] = encryptedData.split(":");
				String iv = data1[0];
				//System.out.println("iv:::::::::::"+iv);
				
				byte[] encryptedByteData =AES.hexStringToByteArray(data1[1]);
				//System.out.println("encryptedByteData:::::::::::"+encryptedByteData);
				
				String keyString = data1[2];
				//System.out.println("keyString:::::::::::"+keyString);
						    
				IvParameterSpec ivs = new IvParameterSpec(Base64.decodeBase64(iv));
				//System.out.println("ivs:::::::::::"+ivs);
				
				Key k = new SecretKeySpec(Base64.decodeBase64(keyString),"AES");
						    try {
						        System.out.println("Decrypted String:"+AES.decrypt(Base64.encodeBase64String(encryptedByteData),k,ivs));
						    } catch (InvalidKeyException | NoSuchAlgorithmException
						            | NoSuchPaddingException | IllegalBlockSizeException |  IOException 
						            | BadPaddingException | InvalidAlgorithmParameterException e) {
						        e.printStackTrace();
						    }
				
			 String adhar= AES.decrypt(Base64.encodeBase64String(encryptedByteData),k,ivs);
		        
			 System.out.println(adhar);
			
			
			BufferedWriter bufferedWriter = null;
			//URL url = new URL("http://117.239.112.230/AadhaarVaultEncryption/rest/getRefFromAadhaar"); // preproduction
			URL url = new URL("http://10.150.9.68/AadhaarVaultEncryption/rest/getRefFromAadhaar"); // preproduction
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-type", "application/json");
			conn.setDoOutput(true);
			// String adhaar="317712894608";
			
			String jsonInputString = "{\n \"aadhaarNo\":\""+adhar+"\",\"schemeId\":\"" + 1 +"\"}";

			 System.out.println("jsonInputString "+jsonInputString);
			DataOutputStream out = new DataOutputStream(conn.getOutputStream());
			// System.out.println("out "+out);
			out.write(jsonInputString.getBytes());
			out.close();

			BufferedReader br = null;
			try {
				br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String output;
			output = br.readLine();
			//System.out.println("output  " + output);
			JSONObject jo = new JSONObject(output);
			JSONObject data=jo.getJSONObject("aadhaarDetails");
			//System.out.println("data"+data);
			
			long referenceNo = data.getLong("referenceNo");

		//System.out.println("referenceNo" + referenceNo);
			String ipFromHeader = request.getHeader("X-FORWARDED-FOR");
			System.out.println("ipFromHeader "+ipFromHeader);
			String ip = request.getHeader("X-Forwarded-For");      
			  if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
			      ip = request.getHeader("Proxy-Client-IP");      
			      System.out.println("ip 1 "+ip);
			  }      
			  if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
			      ip = request.getHeader("WL-Proxy-Client-IP");
			      System.out.println("ip 2 "+ip);
			     
			  }      
			  if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
			      ip = request.getRemoteAddr();
			      System.out.println("ip 3 "+ip);
			  }
			  if (ip.contains(",")) {
			  String iparr[] = ip.split(",");
			  ip = iparr[0];
			  }

			int i = ldao.savetxnDetailIti( lg,studentName,regNo,fatherName,dob,instituteName,trade,category,misiticode,referenceNo,ip);
			System.out.println("the"+i);
			return "redirect:verification.html";
		}
		 @RequestMapping(value="/dept-logout.html")
		 public ModelAndView getLogin(@ModelAttribute("cb") LoginModel lg,HttpSession session,HttpServletRequest request)
		 {
			
			 
			/* String userID = admin.getLoginid().toUpperCase();//Added BY RAKESH on 30-04-2017;
			System.out.println("userID:::::::::::::"+userID);*/
			 
			 String userID = (String)session.getAttribute("userID");
			 System.out.println("logouttime::::userID::::::"+userID);
			 
			 String ipaddr = (String)session.getAttribute("ipaddr");
			 System.out.println("logouttime::::ipaddr::::::"+ipaddr);
			 
			 String idsession = (String)session.getAttribute("idsession");
			 System.out.println("logouttime::::idsession::::::"+idsession);	
				
			 
			
				
				String logouttime= ldao.logouttime();
				System.out.println("logouttime::::status::::::"+logouttime);
				
				//int i = adao.updatelogouttime(userID,ipaddr,idsession,logouttime);
				
				
				session.invalidate();
				
				/*http.logout().deleteCookies("JSESSIONID").invalidateHttpSession(true)*/
				
				//handleLogout(http);
					  
				
				
			   return new ModelAndView("Authorised/dept-logout");
		 }
		 @RequestMapping("/admin-login.html")
		 public String adminHomePage(LoginModel lg,Model model,HttpServletRequest request,HttpSession session)
		 {
			//System.out.println("enter into get home page");
			 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
			Date x = new Date();
			//System.out.println(dateFormat.format(x));
			String attendate = (dateFormat.format(x));
			//System.out.println("attendate" + attendate);
			
			List<LoginModel> studentcount = ldao.getCountTheStudentCollegeWisePresent(attendate);
			  model.addAttribute("studentcount", studentcount);
			  //System.out.println("studentcount"+studentcount);
				//System.out.println("avdmDeviceInfo lg "+lg.getStudentName());
				
				List<LoginModel> studentcountabsent = ldao.getCountTheStudentCollegeWiseabsent(attendate);
				  model.addAttribute("studentcountabsent", studentcountabsent);
	/*			  System.out.println("studentcountabsent"+studentcountabsent);
	*/			  
				  
				  List<LoginModel> studentcountA = ldao.getCountTheStudentCollegeWiseAbsentPresent(attendate);
				  model.addAttribute("studentcountA", studentcountA);
	/*			  System.out.println("studentcountA"+studentcountA);
	*//*				System.out.println("avdmDeviceInfo lg "+lg.getStudentName());
	*/				
					List<LoginModel> studentcountabsentA = ldao.getCountTheStudentCollegeWiseAbsentAbsent(attendate);
					  model.addAttribute("studentcountabsentA", studentcountabsentA);
	/*				  System.out.println("studentcountabsentA"+studentcountabsentA);
	*/				  
				  List<LoginModel> totalstudentcountpresent = ldao.getTotalCountTheStudentPresent(attendate);
				  model.addAttribute("totalstudentcountpresent", totalstudentcountpresent);
	/*			  System.out.println("totalstudentcountpresent"+totalstudentcountpresent);
	 * 
	*/			  List<LoginModel> totalstudentcountPercentage = ldao.getTotalCountTheStudentPercentage(attendate);
					model.addAttribute("totalstudentcountPercentage", totalstudentcountPercentage);
					//System.out.println("totalstudentcountPercentage"+totalstudentcountPercentage);
					

				  List<LoginModel> totalstudentcountabsent = ldao.getTotalCountTheStudentabsent(attendate);
				  model.addAttribute("totalstudentcountabsent", totalstudentcountabsent);
	
		 
		 return "index";
		 }
		 @RequestMapping("/contactus.html")
		 public String contact(LoginModel lg,Model model,HttpServletRequest request,HttpSession session)
		 {

		 
		 return "contactus";
		 }
		 @RequestMapping("/inner.html")
		 public String inner(LoginModel lg,Model model,HttpServletRequest request,HttpSession session)
		 {

		 
		 return "inner";
		 }
		 
			@RequestMapping(value="/create-userid-password.html",method = RequestMethod.GET)
			public String useridpassword(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
					HttpSession session) 
			
			{ 
				List<LoginModel> instituteId = ldao.getAllInstituteList();
				  model.addAttribute("instituteId", instituteId);
				 // System.out.println("instituteId"+instituteId);
					//System.out.println("avdmDeviceInfo lg "+lg.getInstituteCode());
					
					List<LoginModel> role = ldao.getAllRole();
					  model.addAttribute("role", role);
					 // System.out.println("role"+role);
						
			System.out.println("Enter into create userid password");	
		 return "login/create-userid-password";
		 
		 
			}
			@RequestMapping(value="/create-userid-password.html",method = RequestMethod.POST)
			public ModelAndView useridpasswordPOST(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
					HttpSession session) 
			
			{ 
				System.out.println("POST");
				List<LoginModel> instituteId = ldao.getAllInstituteList();
				  model.addAttribute("instituteId", instituteId);
				 /* System.out.println("instituteId"+instituteId);
					System.out.println("avdmDeviceInfo lg "+lg.getInstituteCode());*/
					
					List<LoginModel> role = ldao.getAllRole();
					  model.addAttribute("role", role);
					 // System.out.println("role"+role);
				//System.out.println("avdmDeviceInfo lg "+lg.getInstituteCode());
				String selectedinstitute=lg.getInstituteCode();
				//System.out.println("avdmDeviceInfo lg "+lg.getMonth());
				String selectedmonth=lg.getMonth();
				//System.out.println("avdmDeviceInfo lg "+lg.getPassword());
				String selectedpassword=lg.getPassword();
				//System.out.println("avdmDeviceInfo lg "+lg.getUserName());
				String selectedusename=lg.getUserName();
			     int insertlogin = ldao.insertlogin(selectedinstitute,selectedmonth,selectedpassword,selectedusename);
			    // System.out.println("insertlogin"+insertlogin);
						
		//	System.out.println("Enter into create userid password");	
		 return new ModelAndView("login/create-userid-password","message","Update Sucessfully");
		 
		 
			}

			@RequestMapping(value = "/registered-student.html", method = RequestMethod.GET)
			public String registeredS(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
					HttpSession session) {
				
				String loginid =(String)session.getAttribute("admin_loginid");
				//System.out.println("::loginid::admin-login:::get::::::::"+loginid);
				String collegecode = ldao.featchcollegecode(loginid);
				//System.out.println("collegecode"+collegecode);
				
				List<LoginModel> instituteId = ldao.getInstitute(collegecode);
				  model.addAttribute("instituteId", instituteId);
				 // System.out.println("instituteId"+instituteId);
				//	System.out.println("avdmDeviceInfo lg "+lg.getInstituteCode());
				
				List<LoginModel> registeredStudent =ldao.getRegisteredStudent(collegecode);
				 model.addAttribute("registeredStudent", registeredStudent);
				// System.out.println("registeredStudent"+registeredStudent);
				 
				return "login/registered-student";
				
			}
			@RequestMapping(value = "/present-student.html", method = RequestMethod.GET)
			public String presentStudentS(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
					HttpSession session) {
				
				String loginid =(String)session.getAttribute("admin_loginid");
			//	System.out.println("::loginid::admin-login:::get::::::::"+loginid);
				
				DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
				Date x = new Date();
				System.out.println(dateFormat.format(x));
				String attendate = (dateFormat.format(x));
				
				//System.out.println("ENTER INTO VIEW");
				List<LoginModel> listOfStudentCollwise1 = ldao.getAllPresentstudentListCollegeWise1(loginid,attendate);
				model.addAttribute("listOfStudentCollwise1", listOfStudentCollwise1);
				//System.out.println("listOfStudentCollwise1"+listOfStudentCollwise1);
				 
				return "login/present-student";
			}
			@RequestMapping(value = "/view-all-college-list.html", method = RequestMethod.GET)
			public String viewalllistcollege(@ModelAttribute("b") LoginModel b, Model m,
					HttpSession session,HttpServletRequest request)
			{
				
				
				System.out.println("ENTER INTO VIEW");
				List<LoginModel> listOfCollege = ldao.getAllCollegeList();
				m.addAttribute("listOfCollege", listOfCollege);
				//System.out.println("listOfCollege"+listOfCollege);


				return "login/view-all-college-list";
				
			}

			@RequestMapping(value = "/view-present-student-list-current-college-wise.html", method = RequestMethod.GET)
			public String viewPresentStudentCollegeWise(@ModelAttribute("b") LoginModel b, Model m,
					HttpSession session,HttpServletRequest request)
			{
				
				String loginid =(String)session.getAttribute("admin_loginid");
				System.out.println("::loginid::admin-login:::get::::::::"+loginid);
				
				DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
				Date x = new Date();
				System.out.println(dateFormat.format(x));
				String attendate = (dateFormat.format(x));
				
				//System.out.println("ENTER INTO VIEW");
				List<LoginModel> listOfStudentCollwise = ldao.getAllPresentstudentListCollegeWise(loginid,attendate);
				m.addAttribute("listOfStudentCollwise", listOfStudentCollwise);
				//System.out.println("listOfStudentCollwise"+listOfStudentCollwise);
				

				return "login/view-present-student-list-current-college-wise";
				
			}
			@RequestMapping(value = "/collegewise-student-list.html", method = RequestMethod.GET)
			public String collegewise(@ModelAttribute("b") LoginModel b, Model m,
					HttpSession session,HttpServletRequest request)
			{
				
				
				String loginid =(String)session.getAttribute("admin_loginid");
				System.out.println("::loginid::admin-login:::get::::::::"+loginid);
				
				
				String loginid1 =(String)session.getAttribute("admin_loginid");
				//System.out.println("::loginid::admin-login:::get::::::::"+loginid1);
				
				
				System.out.println("ENTER INTO VIEW");
				List<LoginModel> collegewisestudent = ldao.getCollegeWisesStudentList(loginid);
				m.addAttribute("collegewisestudent", collegewisestudent);
				//System.out.println("collegewisestudent"+collegewisestudent);
				

				return "login/collegewise-student-list";
				
			}
			
			@RequestMapping(value = "/registered-institute.html", method = RequestMethod.GET)
			public String allinstitute(@ModelAttribute("b") LoginModel b, Model m,
					HttpSession session,HttpServletRequest request)
			{
				
				List<LoginModel> collegetype = ldao.getcollegetype();
				m.addAttribute("collegetype", collegetype);
				
				return "login/registered-institute";
			}
			@RequestMapping(value = "/registered-institute.html", method = RequestMethod.POST)
			public String allinstituteQ(@ModelAttribute("b") LoginModel b, Model m,
					HttpSession session,HttpServletRequest request)
			{
				System.out.println("ENTER INTO VIEW");
				String selectedInstitutetype=b.getInstituteCode();
				//System.out.println("selectedInstitutetype"+selectedInstitutetype);
				List<LoginModel> collegetype = ldao.getcollegetype();
				m.addAttribute("collegetype", collegetype);
				List<LoginModel> collegelist = ldao.getAllCollegeadmin(selectedInstitutetype);
				m.addAttribute("collegelist", collegelist);
/*				System.out.println("collegelist"+collegelist);
*/				
				return "login/registered-institute";
			}
			/*@RequestMapping(value = "/attendance-report-datewise.html", method = RequestMethod.GET)
			public String datewise(@ModelAttribute("cb") LoginModel b, Model m,
					HttpSession session,HttpServletRequest request)
			{
				System.out.println("ENTER INTO VIEW");
				List<LoginModel> listOfCollege = ldao.getAllCollegeList();
				m.addAttribute("listOfCollege", listOfCollege);
				System.out.println("listOfCollege"+listOfCollege);
				
				List<LoginModel> institute = ldao.getAllInstituteList();
				  m.addAttribute("institute", institute);
				  System.out.println("institute"+institute);
					System.out.println("avdmDeviceInfo lg "+b.getInstituteCode());

				  List<LoginModel> semestar = ldao.getSemesterList();
				  m.addAttribute("semestar", semestar);
				  System.out.println("semestar"+semestar);
					System.out.println("avdmDeviceInfo lg "+b.getSemestar());
				
				return "login/attendance-report-datewise";
			}
			@RequestMapping(value = "/attendance-report-datewise.html", method = RequestMethod.POST)
			public String datewisepost(@ModelAttribute("cb") LoginModel b, Model m,
					HttpSession session,HttpServletRequest request)
			{
				String loginid =(String)session.getAttribute("admin_loginid");
				System.out.println("::loginid::admin-login:::get::::::::"+loginid);
				
				List<LoginModel> listOfCollege = ldao.getAllCollegeList();
				m.addAttribute("listOfCollege", listOfCollege);
				System.out.println("listOfCollege"+listOfCollege);
				
				
				 
					System.out.println("avdmDeviceInfo lg "+b.getInstituteCode());
					String selectedInstitute=b.getInstituteCode();
					m.addAttribute("selectedInstitute", selectedInstitute);

				  
				  List<LoginModel> semestar = ldao.getSemesterList();
				  m.addAttribute("semestar", semestar);
				  System.out.println("semestar"+semestar);
					System.out.println("avdmDeviceInfo lg "+b.getSemestar());
					m.addAttribute("semestar", semestar);

					String selectedSemester=b.getSemestar();
					System.out.println("selectedSemester "+selectedSemester);
					m.addAttribute("selectedSemester", selectedSemester);


					String date=b.getDob();
					System.out.println("date "+date);
					m.addAttribute("date", date);

				  

				  List<LoginModel>viewData1=ldao.viewData1(selectedInstitute,selectedSemester,date);
					m.addAttribute("viewData1",viewData1);
				return "login/attendance-report-datewise";
				
				
				    }*/
			@RequestMapping(value = "/attendance-report-datewise-principal.html", method = RequestMethod.GET)
			public String datewiseP(@ModelAttribute("cb") LoginModel b, Model m,
					HttpSession session,HttpServletRequest request)
			{			
				System.out.println("ENTER INTO VIEW");

				String loginid =(String)session.getAttribute("admin_loginid");
				System.out.println("::loginid::admin-login:::get::::::::"+loginid);
				System.out.println("ENTER INTO VIEW");
				
				
				String collegecode = ldao.featchcollegecode(loginid);
				//System.out.println("collegecode"+collegecode);
				 m.addAttribute("collegecode", collegecode);
				 
				List<LoginModel> institute = ldao.getAllInstituteList();
				  m.addAttribute("institute", institute);
				 // System.out.println("institute"+institute);
					System.out.println("avdmDeviceInfo lg "+b.getInstituteCode());

				 // List<LoginModel> semestar = ldao.getSemesterList();
					List<LoginModel> semestar = ldao.getSemesterListt(collegecode); 
				  m.addAttribute("semestar", semestar);
				//  System.out.println("semestar"+semestar);
				  List<LoginModel> branch = ldao.getBranchListt(collegecode);
				  m.addAttribute("branch", branch);
				 // System.out.println("branch"+branch);
					//System.out.println("avdmDeviceInfo lg "+b.getCourseName());
					
					//System.out.println("avdmDeviceInfo lg "+b.getSemestar());
				
				return "login/attendance-report-datewise-principal";
			}
			@RequestMapping(value = "/attendance-report-datewise-principal.html", method = RequestMethod.POST)
			public String datewisepostp(@ModelAttribute("cb") LoginModel b, Model m,
					HttpSession session,HttpServletRequest request)
			{
				String loginid =(String)session.getAttribute("admin_loginid");
				System.out.println("::loginid::admin-login:::get::::::::"+loginid);
				String collegecode = ldao.featchcollegecode(loginid);
				//System.out.println("collegecode"+collegecode);
				 m.addAttribute("collegecode", collegecode);
				 
				List<LoginModel> institute = ldao.getAllInstituteList();
				  m.addAttribute("institute", institute);
				 // System.out.println("institute"+institute);
				 
					 

				  List<LoginModel> semestar = ldao.getSemesterListt(collegecode); 
				 // List<LoginModel> semestar = ldao.getSemesterList();
				  m.addAttribute("semestar", semestar);
				 // System.out.println("semestar"+semestar);
					String selectedSemester=b.getSemestar();

					//System.out.println("avdmDeviceInfo lg "+b.getSemestar());
					  m.addAttribute("selectedSemester", selectedSemester);

					
					
					 //List<LoginModel> branch = ldao.getBranchList();
					  List<LoginModel> branch = ldao.getBranchListt(collegecode);

					  m.addAttribute("branch", branch);
					//  System.out.println("branch"+branch);
					  String selectedbranch=b.getCourseName();
					//	System.out.println("avdmDeviceInfo lg "+b.getCourseName());
						  m.addAttribute("selectedbranch", selectedbranch);


					String date=b.getDob();
					//System.out.println("date "+date);
					  m.addAttribute("date", date);


				  List<LoginModel>viewData2=ldao.viewData2(collegecode,selectedSemester,selectedbranch,date);
					m.addAttribute("viewData1",viewData2);
				return "login/attendance-report-datewise-principal";
				
				
				    }
			@RequestMapping("/change-password.html")
			public ModelAndView changePasswordnew(@ModelAttribute("cb") LoginModel admin,HttpSession session)
			{
			//System.out.println("inside change-password::::::::::: ");

			return new ModelAndView("login/change-password");
			}

			@RequestMapping(value="/change-password.html",method=RequestMethod.POST)
			public ModelAndView changePasswordAdminnew(@ModelAttribute("cb") LoginModel admin,HttpSession session,RedirectAttributes redirectAttributes,
			@RequestParam("udata") String randomvalue)
			{
			if((String)session.getAttribute("admin_loginid")==null)
			{
			return new ModelAndView("index");
			}


			String encryptedrandomvalue= null;
			String password= null;


			String admin_loginid = (String)session.getAttribute("admin_loginid");
			   //System.out.println("admin_loginid:::::::::::"+admin_loginid);
			admin.setLoginid(admin_loginid);
			   admin.setPassword(admin.getOldPassword());
			//System.out.println("admin.getOldPassword()::::controller::::::"+admin.getOldPassword());

			   /*int flag = adao.getFlag(admin);
			//System.out.println("flag:::::::::::::::::::"+flag);*/

			   
			   String salt = (String)session.getAttribute("salt");
			   
			   //System.out.println("salt:::::controller::::"+salt);
			admin.setSalt(salt);


			//fghbj

			int status = ldao.checkPreviousPassword(admin);
			   //System.out.println("Status:::"+status+"admin_loginid:::"+admin_loginid+"admin.getOldPassword():::"+admin.getOldPassword());

			String message="";
			if(status==1)
			{
			  //System.out.println("status::::::");
			String isMatchingNewAndConfirmPwd=ldao.isMatchingNewAndConfirmPwd(admin);


			//gggg
			if(isMatchingNewAndConfirmPwd.equals("match"))


			{
			int statuscheck = ldao.checkconfirmandoldpass(admin);
			message="";
			//System.out.println("status:::::controller:::::checkconfirmandoldpass::::::"+statuscheck);
			if(statuscheck==1)
			{

			//System.out.println("if statuscheck==1::::::");
			message="Current password and New Password shouldnot be same";
			return new ModelAndView("login/change-password","message",message);

			}

			/*else if(statuscheck==0)

			{

			//System.out.println("if statuscheck==0::::::");
			adao.updatepasswordhistory(admin);
			message="Password updated successfully";

			}*/

			////System.out.println("getNewPassword::::::"+admin.getNewPassword());
			////System.out.println("inside controller  randomvalue::::::"+randomvalue);
			/*encryptedrandomvalue = MD5.getMD5(randomvalue);*/
			encryptedrandomvalue = hash.gethash(randomvalue);
			//System.out.println("inside controller  hashrandom::::::"+encryptedrandomvalue);
			password=admin.getNewPassword().split(encryptedrandomvalue)[0];
			//System.out.println("inside controller password::::::"+password);


			//adao.adminUpdatePassword(admin,password);
			ldao.adminUpdateChangePassword(admin,password);
			message="Password updated successfully";

			}
			/*{


			  //System.out.println("isMatchingNewAndConfirmPwd:::::::::");

			int datacheck = adao.checkexistingpasswords(admin,admin_loginid);
			message="";
			//System.out.println("status:::::controller:::::checkconfirmandoldpass::::::"+datacheck);
			if(datacheck==1)
			{

			//System.out.println("if statuscheck==1::::::");

			message="Current password and New Password shouldnot be same";
			return new ModelAndView("login/change-password","message",message);

			}

			else if(datacheck==0)

			{

			//int flagstat = adao.checkPreviousPassword(admin);


			int flag = adao.getFlag(admin);
			//System.out.println("flagcount:::::::::::::::::::"+flag);


			if(flag==2)
			{
			////System.out.println("if(flag==2):::::::::::::::::::"+flag);  
			   adao.updatepasswordhistorypass(admin);
			message="Password updated successfully";
			}

			if(flag>=3)
			{
			////System.out.println("if(flag>=3):::::::::::::::::::"+flag);

			List<LoginBean> lastpass = adao.checkthreepasswords(admin);
			//model.addAttribute("lastpass", lastpass);


			//System.out.println("lastpass:::::::::::::::::::"+lastpass);

			String a =  lastpass.get(0).getPasshistory();
			salt = admin.getSalt();
			 
			String acpwd = hash.gethash(salt+a);
			byte[] encoded = Base64.encodeBase64(acpwd.getBytes());
			String passhistoryone = new String(encoded);
			////System.out.println("a:::::::::::::::::::"+a);
			////System.out.println("a:::passhistoryone::::::::::::::::"+passhistoryone);


			   String b =  lastpass.get(1).getPasshistory();
			   String acpwd1 = hash.gethash(salt+b);
			byte[] encoded1 = Base64.encodeBase64(acpwd1.getBytes());
			String passhistorytwo = new String(encoded1);
			////System.out.println("b:::::::::::::::::"+b);
			////System.out.println("b:::passhistorytwo::::::::::::::::"+passhistorytwo);


			   String c =  lastpass.get(2).getPasshistory();
			   String acpwd2 = hash.gethash(salt+c);
			byte[] encoded2 = Base64.encodeBase64(acpwd2.getBytes());
			String passhistorythree = new String(encoded2);
			////System.out.println("c:::::::::::::::::::"+c);
			////System.out.println("c:::passhistorythree::::::::::::::::"+passhistorythree);


			String cnewpass = admin.getCnewPassword();
			String acpwd3 = hash.gethash(salt+cnewpass);
			byte[] encoded3 = Base64.encodeBase64(acpwd3.getBytes());
			String passcnewpass = new String(encoded3);

			//System.out.println("cnewpass::::::::::::::::"+cnewpass);
			//System.out.println("passcnewpass::::::::::::::::"+passcnewpass);
			//System.out.println("oldpassword::::::::::::::::"+admin.getOldPassword());
			//System.out.println(":::passcnewpass::::::::::::::::"+passcnewpass);
			//System.out.println("a:::passhistoryone::::::::::::::::"+passhistoryone);
			//System.out.println("b:::passhistorytwo::::::::::::::::"+passhistorytwo);
			//System.out.println("c:::passhistorythree::::::::::::::::"+passhistorythree);


			if(passcnewpass.equals(passhistoryone) || passcnewpass.equals(passhistorytwo) || passcnewpass.equals(passhistorythree))
			{
			   message="The given Password already exists.";
			return new ModelAndView("login/change-password","message",message);
			}

			else
			{
			 //System.out.println("else:::::::::::::::::::"+flag);  
			   adao.updatepasswordhistory(admin);
			redirectAttributes.addFlashAttribute("MSGS", "Password updated successfully");

			message="Password updated successfully";

			}


			}

			else

			{
			//System.out.println("second else::::::::::::");
			adao.updatepasswordhistory(admin);
			message="Password updated successfully";
			redirectAttributes.addFlashAttribute("MSGS", "Password updated successfully");

			}



			}

			//System.out.println("getNewPassword::::::"+admin.getNewPassword());
			//System.out.println("inside controller  randomvalue::::::"+randomvalue);
			////System.out.println("inside controller  hashrandom::::::"+encryptedrandomvalue);

			encryptedrandomvalue = hash.gethash(randomvalue);
			password=admin.getNewPassword().split(encryptedrandomvalue)[0];

			  //System.out.println("inside controller password::::::"+password);
			// //System.out.println("else:::::::::::::::::::"+flag);  

			adao.updatepasswordhistory(admin);
			message="Password updated successfully";

			adao.adminUpdatePassword(admin,password);
			message="Password updated successfully";
			redirectAttributes.addFlashAttribute("MSGS", "Password updated successfully");


			}*/// matching with match is ended.
			else
			{
			message="New and confirm Password mismatch";
			return new ModelAndView("login/change-password","message",message);
			}
			return  new ModelAndView("login/dashboard","message",message);
			}
			else
			{
			message="Current password is incorrect";
			return new ModelAndView("login/change-password","message",message);
			}
			}
			
			
	@RequestMapping("/bar-chart.html")
	public ModelAndView barchart(@ModelAttribute("cb") LoginModel admin, Model model, HttpSession session) {
		System.out.println("inside bar-chart::::::::::: ");
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date x = new Date();
		// System.out.println(dateFormat.format(x));
		String attendate = (dateFormat.format(x));
		List<LoginModel> studentcountgovtpoly = ldao.getCountTheStudentCollegeWisePresentGovtpolyBar(attendate);
		model.addAttribute("studentcountgovtpoly", studentcountgovtpoly);

		List<LoginModel> studentcountITI = ldao.getCountTheStudentCollegeWisePresentITI(attendate);
		model.addAttribute("studentcountITI", studentcountITI);
		//System.out.println("studentcountITI" + studentcountITI);

		List<LoginModel> studentcountpolypiebar = ldao.getCountTheStudentCollegeWisepolypiebar(attendate);
		model.addAttribute("studentcountpolypiebar", studentcountpolypiebar);
		//System.out.println("studentcountpolypiebar" + studentcountpolypiebar);

		List<LoginModel> studentcountITIpiebar = ldao.getCountTheStudentCollegeWiseITIpiebar(attendate);
		model.addAttribute("studentcountITIpiebar", studentcountITIpiebar);
		//System.out.println("studentcountITIpiebar" + studentcountITIpiebar);
		return new ModelAndView("login/bar-chart");
	}
	
	@RequestMapping("/piechart-admin.html")
	public ModelAndView piechart(@ModelAttribute("cb") LoginModel admin, Model model, HttpSession session) {
		System.out.println("inside bar-chart::::::::::: ");
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date x = new Date();
		// System.out.println(dateFormat.format(x));
		String attendate = (dateFormat.format(x));
		List<LoginModel> totalstudentcountpoly = ldao.getTotalCountTheStudentPOLY(attendate);
		model.addAttribute("totalstudentcountpoly", totalstudentcountpoly);
		//System.out.println("totalstudentcountpoly"+totalstudentcountpoly);
		List<LoginModel> totalstudentcountiti = ldao.getTotalCountTheStudentITI(attendate);
		model.addAttribute("totalstudentcountiti", totalstudentcountiti);
		//System.out.println("totalstudentcountiti"+totalstudentcountiti);
		
	
		return new ModelAndView("login/piechart-admin");
	}
	@RequestMapping("/piechart-institutewise.html")
	public ModelAndView piechartinstitute(@ModelAttribute("cb") LoginModel admin, Model model, HttpSession session) {
		System.out.println("inside bar-chart::::::::::: ");
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date x = new Date();
		String attendate = (dateFormat.format(x));
		// System.out.println(dateFormat.format(x));
		String loginid =(String)session.getAttribute("admin_loginid");
		
		String collegecode = ldao.featchcollegecode(loginid);
		System.out.println("collegecode"+collegecode);
	List<LoginModel> totalstudentcount = ldao.getTotalCountTheStudentcollegebarchart(attendate,collegecode);
		model.addAttribute("totalstudentcount", totalstudentcount);
		System.out.println("totalstudentcount"+totalstudentcount);
		/*		List<LoginModel> totalstudentcountpoly = ldao.getTotalCountTheStudentPOLY(attendate);
		model.addAttribute("totalstudentcountpoly", totalstudentcountpoly);
		//System.out.println("totalstudentcountpoly"+totalstudentcountpoly);
		List<LoginModel> totalstudentcountiti = ldao.getTotalCountTheStudentITI(attendate);
		model.addAttribute("totalstudentcountiti", totalstudentcountiti);
		//System.out.println("totalstudentcountiti"+totalstudentcountiti);
		
		*/
		List<LoginModel> totalstudentcountinstitutewise = ldao.getTotalCountTheStudentinstitutewise(attendate,collegecode);
		model.addAttribute("totalstudentcountinstitutewise", totalstudentcountinstitutewise);
	System.out.println("totalstudentcountinstitutewise"+totalstudentcountinstitutewise);
		return new ModelAndView("login/piechart-institutewise");
	}
			@RequestMapping(value = "/attendance-report-datewise.html", method = RequestMethod.GET)
			public String datewise(@Valid @ModelAttribute("cb") LoginModel b, Model m,
					HttpSession session,HttpServletRequest request)
			{
				System.out.println("ENTER INTO VIEW");
				List<LoginModel> listOfCollege = ldao.getAllCollegeList();
				m.addAttribute("listOfCollege", listOfCollege);
				//System.out.println("listOfCollege"+listOfCollege);
				
				/*List<LoginModel> institute = ldao.getAllInstituteList();
				  m.addAttribute("institute", institute);
				  System.out.println("institute"+institute);*/
				/*	System.out.println("avdmDeviceInfo lg "+b.getInstituteCode());

				  List<LoginModel> semestar = ldao.getSemesterList();
				  m.addAttribute("semestar", semestar);
				  System.out.println("semestar"+semestar);
					System.out.println("avdmDeviceInfo lg "+b.getSemestar());*/
				
				return "login/attendance-report-datewise";
			}
			@RequestMapping(value = "/attendance-report-datewise.html", method = RequestMethod.POST)
			public String datewisepost(@ModelAttribute("cb") reportmodel b,BindingResult result, Model m,
					HttpSession session,HttpServletRequest request)
			{				// String regex = "^[a-zA-Z0-9]+$";

				 String regex = "^[a-zA-Z0-9]+$";
				
				 String regex2 ="^\\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01])$";
				String loginid =(String)session.getAttribute("admin_loginid");
				System.out.println("::loginid::admin-login:::get::::::::"+loginid);
				
				List<LoginModel> listOfCollege = ldao.getAllCollegeList();
				m.addAttribute("listOfCollege", listOfCollege);
				//System.out.println("listOfCollege"+listOfCollege);
				
				
				 
					//System.out.println("avdmDeviceInfo lg "+b.getInstituteCode());
					String selectedInstitute=b.getInstituteCode();
				    
					 Pattern pattern = Pattern.compile(regex);
				        
				        // Match the pattern against the input string
				        Matcher matcher = pattern.matcher(selectedInstitute);
				        
				        if (!matcher.matches()) {
				            System.out.println("The selectedInstitute is valid.");
				            return "login/attendance-report-datewise";
				        }
				         
					
				  
					
					if (selectedInstitute == null || selectedInstitute.trim().isEmpty()) {
					    // Handle the error, e.g., set an error message
					    throw new IllegalArgumentException("Institute code cannot be null or empty.");
					}
					m.addAttribute("selectedInstitute", selectedInstitute);

				  
				  List<LoginModel> semestar = ldao.getSemesterList();
				  m.addAttribute("semestar", semestar);
				 // System.out.println("semestar"+semestar);
					

					String selectedSemester=b.getSemestar();
					//System.out.println("selectedSemester "+selectedSemester);
					 String regex1 = "^[0-9]+$";
					
					
					
				 	 Pattern pattern1 = Pattern.compile(regex1);
				        
				        // Match the pattern against the input string
				        Matcher matcher1 = pattern1.matcher(selectedSemester);
				        
				        if (!matcher1.matches()) {
				            System.out.println("The selectedInstitute is valid.");
				            return "login/attendance-report-datewise";
				        }
				         
				        m.addAttribute("selectedSemester", selectedSemester);
					String date=b.getDob();
					//System.out.println("date "+date);
					
					
				 	 Pattern pattern2 = Pattern.compile(regex2);

				     Matcher matcher12 = pattern2.matcher(date);
				        
				        if (!matcher12.matches()) {
				            System.out.println("The selectedInstitute is valid.");
				            return "login/attendance-report-datewise";
				        }
				        m.addAttribute("date", date);
					
					if (result.hasErrors()) {

						System.out.println("inside if:::::::::::::::");
						return "errorpages/405-error";

					}
					else{
					
					  
					boolean isValid = true;
			        StringBuilder validationErrors = new StringBuilder();

			        if (!isValidString(selectedInstitute)) {
			        	
			            isValid = false;
						System.out.println("date "+isValid);

			            validationErrors.append("Institute code is invalid. ");
			        }

			        if (!isValidString(selectedSemester)) {
			            isValid = false;
			            validationErrors.append("Semester is invalid. ");
			        }

			        if (!isValidDate(date)) {
			            isValid = false;
			            validationErrors.append("Date of birth is invalid. ");
			        }

			        if (isValid) {
			            // If all validations pass, call the method
			            List<LoginModel> viewData1 = ldao.viewData1(selectedInstitute, selectedSemester, date);
			            m.addAttribute("viewData1",viewData1);
			            // Handle the viewData1 as required
			        } else {
			            // If validation fails, print or log errors
			            System.out.println("Validation errors: " + validationErrors.toString());
			            // You may want to throw an exception or handle the error appropriately
			        }

				  
					}
					
				return "login/attendance-report-datewise";
				
				
				    }
			  private static boolean isValidString(String str) {
			        return str != null && !str.trim().isEmpty();
			    }
			    private static boolean isValidDate(String date) {
			        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			        sdf.setLenient(false);
			        try {
			            sdf.parse(date);
			            return true;
			        } catch (ParseException e) {
			            return false;
			        }
			    }
				@RequestMapping(value = "/getInstituteCode.html", method = RequestMethod.GET, headers="Accept=application/json",produces = MediaType.APPLICATION_JSON_VALUE)
				public @ResponseBody
				List<LoginModel> getPIATC(@RequestParam("institutecode") String institutecode)
				{
					System.out.println("piaId::getPIATC.html:::::::::::::::"+institutecode);
					
					List<LoginModel> semester= ldao.getsemesterAjax(institutecode);
					//System.out.println("piaList::::::::statedistrict::::::::::::::"+semester);
					return semester;
				}
				@RequestMapping(value = "/getInstituteCodeToBranch.html", method = RequestMethod.GET, headers="Accept=application/json",produces = MediaType.APPLICATION_JSON_VALUE)
				public @ResponseBody
				List<LoginModel> getBREANCH(@RequestParam("institutecode") String institutecode)
				{
					System.out.println("piaId::getPIATC.html:::::::::::::::"+institutecode);
					
					List<LoginModel> branch= ldao.getbranchAjax(institutecode);
					//System.out.println("piaList::::::::statedistrict::::::::::::::"+branch);
					return branch;
				}
				@RequestMapping(value = "/getBranchToMonth.html", method = RequestMethod.GET, headers="Accept=application/json",produces = MediaType.APPLICATION_JSON_VALUE)
				public @ResponseBody
				List<LoginModel> getmonth(@RequestParam("institutecode") String institutecode,@RequestParam("branch") String branch)

				{
					System.out.println("piaId::getPIATC.htmlBRANCH:::::::::::::::"+institutecode);
					System.out.println("piaId::getPIATC.htmlBRANCH:::::::::::::::"+branch);

					List<LoginModel> month= ldao.getmonthAjax(institutecode,branch);
					//System.out.println("piaList::::::::statedistrict::::::::::::::"+month);
					return month;
				}
				
				@RequestMapping(value = "/attendance-report-datewise-iti.html", method = RequestMethod.GET)
				public String datewiseiti(@Valid @ModelAttribute("cb") LoginModel b, Model m,
						HttpSession session,HttpServletRequest request)
				{
					System.out.println("ENTER INTO VIEW");
					List<LoginModel> listOfCollege = ldao.getAllCollegeListiti();
					m.addAttribute("listOfCollege", listOfCollege);
					//System.out.println("listOfCollege"+listOfCollege);
					
				
					
					return "login/attendance-report-datewise-iti";
				}
				@RequestMapping(value = "/attendance-report-datewise-iti.html", method = RequestMethod.POST)
				public String datewiseiti2(@ModelAttribute("cb") reportmodel b,BindingResult result, Model m,
						HttpSession session,HttpServletRequest request)
				{
					System.out.println("ENTER INTO VIEW");
					List<LoginModel> listOfCollege = ldao.getAllCollegeListiti();
					m.addAttribute("listOfCollege", listOfCollege);
					//System.out.println("listOfCollege"+listOfCollege);
					
					//System.out.println("avdmDeviceInfo lg "+b.getInstituteCode());
					String selectedInstitute=b.getInstituteCode();
					
					 String regex = "^[a-zA-Z0-9]+$";

					 Pattern pattern = Pattern.compile(regex);
				        
				        // Match the pattern against the input string
				        Matcher matcher = pattern.matcher(selectedInstitute);
				        
				        if (!matcher.matches()) {
				            System.out.println("The selectedInstitute is valid.");
				            return "login/attendance-report-datewise-iti";
				        }
				        m.addAttribute("selectedInstitute", selectedInstitute);
				        
				        String date=b.getDob();
				        
						System.out.println("date "+date);
						/* String regex2 ="^\\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01])$";

						
						
					 	 Pattern pattern2 = Pattern.compile(regex2);

					     Matcher matcher12 = pattern2.matcher(date);
					        
					        if (!matcher12.matches()) {
					            System.out.println("The selectedInstitute is valid.");
					            return "login/attendance-report-datewise-iti";
					        }*/
						System.out.println("1");
					        m.addAttribute("date", date);

					        if (result.hasErrors()) {
					        	System.out.println("2");
								//System.out.println("inside if:::::::::::::::");
								return "errorpages/405-error";

							}
							else{
							
							  
							boolean isValid = true;
					        StringBuilder validationErrors = new StringBuilder();

					        if (!isValidString(selectedInstitute)) {
					        	
					            isValid = false;
								System.out.println("date "+isValid);

					            validationErrors.append("Institute code is invalid. ");
					        }

					    

					        if (!isValidDate(date)) {
					            isValid = false;
					            validationErrors.append("Date of birth is invalid. ");
					        }

					        if (isValid) {
					            // If all validations pass, call the method
					        	System.out.println("3");
					        	List<LoginModel> viewData1 = ldao.viewDataITIPresent(selectedInstitute,date);
					            m.addAttribute("viewData1",viewData1);
					            // Handle the viewData1 as required
					        } else {
					            // If validation fails, print or log errors
					        	System.out.println("4");
					            System.out.println("Validation errors: " + validationErrors.toString());
					            // You may want to throw an exception or handle the error appropriately
					        }
					        	
				      
					
					
				}
					        return "login/attendance-report-datewise-iti";
				}
				@RequestMapping(value = "/attendance-report-datewise-principal-iti.html", method = RequestMethod.GET)
				public String datewiseitiP(@Valid @ModelAttribute("cb") LoginModel b, Model m,
						HttpSession session,HttpServletRequest request)
				{
					//System.out.println("ENTER INTO VIEW");

					String loginid =(String)session.getAttribute("admin_loginid");
					System.out.println("::loginid::admin-login:::get::::::::"+loginid);
					//System.out.println("ENTER INTO VIEW");
					
					
					String collegecode = ldao.featchcollegecode(loginid);
					//System.out.println("collegecode"+collegecode);
					/* m.addAttribute("collegecode", collegecode);*/
					 
					  List<LoginModel> branch = ldao.getBranchListt(collegecode);
					  m.addAttribute("branch", branch);
					//  System.out.println("branch"+branch);
				
				  return "login/attendance-report-datewise-principal-iti";
				}
				@RequestMapping(value = "/attendance-report-datewise-principal-iti.html", method = RequestMethod.POST)
				public String datewiseitiPp(@Valid @ModelAttribute("cb") LoginModel b, Model m,
						HttpSession session,HttpServletRequest request)
				{
					System.out.println("ENTER INTO VIEW");

					String loginid =(String)session.getAttribute("admin_loginid");
					System.out.println("::loginid::admin-login:::get::::::::"+loginid);
					//System.out.println("ENTER INTO VIEW");
					
					
					String collegecode = ldao.featchcollegecode(loginid);
					//System.out.println("collegecode"+collegecode);
					 m.addAttribute("collegecode", collegecode);
					 
					  
					  List<LoginModel> branch = ldao.getBranchListt(collegecode);

					  m.addAttribute("branch", branch);
					 // System.out.println("branch"+branch);
					  String selectedbranch=b.getCourseName();
						//System.out.println("avdmDeviceInfo lg "+b.getCourseName());
						  m.addAttribute("selectedbranch", selectedbranch);


					String date=b.getDob();
					//System.out.println("date "+date);
					  m.addAttribute("date", date);
				
					  List<LoginModel>viewData2=ldao.viewData3(collegecode,selectedbranch,date);
						m.addAttribute("viewData1",viewData2);
						
				  return "login/attendance-report-datewise-principal-iti";
				}
				@RequestMapping(value = "/view-all-student-list-sidebar.html", method = RequestMethod.GET)
				public String viewallliststudents(@ModelAttribute("b") LoginModel b, Model m,
						HttpSession session,HttpServletRequest request)
				{
					
					
					//System.out.println("ENTER INTO VIEW");
					List<LoginModel> collegetype = ldao.getcollegetype();
					m.addAttribute("collegetype", collegetype);
					List<LoginModel> listOfStudent = ldao.getAllstudentList();
					m.addAttribute("listOfStudent", listOfStudent);
					//System.out.println("listOfStudent"+listOfStudent);
					

					return "login/view-all-student-list-sidebar";
					
				}
				@RequestMapping(value = "/view-all-student-list-sidebar.html", method = RequestMethod.POST)
				public String viewallliststudentss(@ModelAttribute("b") LoginModel b, Model m,
						HttpSession session,HttpServletRequest request)
				{
					
					
					//System.out.println("ENTER INTO VIEW");
					List<LoginModel> collegetype = ldao.getcollegetype();
					m.addAttribute("collegetype", collegetype);
					//System.out.println("avdmDeviceInfo lg "+b.getInstituteCode());
					String instituteType=b.getInstituteCode();
					//System.out.println("instituteType"+instituteType);

					List<LoginModel> listOfStudent = ldao.getAllstudentListcollegeTypewise(instituteType);
					m.addAttribute("listOfStudent", listOfStudent);
					//System.out.println("listOfStudent"+listOfStudent);
					

					return "login/view-all-student-list-sidebar";
					
				}
				
				@RequestMapping("/bar-chart-govt-polytechnic.html")
				public ModelAndView barchartgovtpoly(@ModelAttribute("cb") LoginModel admin, Model model, HttpSession session) {
					System.out.println("inside bar-chart::::::::::: ");
					DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
					Date x = new Date();
					// System.out.println(dateFormat.format(x));
					String attendate = (dateFormat.format(x));
					List<LoginModel> studentcountgovtpoly = ldao.getCountTheStudentCollegeWiseGovtpolyBardivided1(attendate);
					model.addAttribute("studentcountgovtpoly", studentcountgovtpoly);
					List<LoginModel> studentcountgovtpoly2 = ldao.getCountTheStudentCollegeWiseGovtpolyBardivided2(attendate);
					model.addAttribute("studentcountgovtpoly2", studentcountgovtpoly2);
				
					return new ModelAndView("login/bar-chart-govt-polytechnic");
				}	
				
	@RequestMapping("/bar-chart-ITI.html")
	public ModelAndView barchartITI(@ModelAttribute("cb") LoginModel admin, Model model, HttpSession session) {
		System.out.println("inside bar-chart::::::::::: ");
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date x = new Date();
		// System.out.println(dateFormat.format(x));
		String attendate = (dateFormat.format(x));
		List<LoginModel> studentcountITI1 = ldao.getCountTheStudentCollegeWiseITIBardivided1(attendate);
		model.addAttribute("studentcountITI1", studentcountITI1);
		
		List<LoginModel> studentcountITI2 = ldao.getCountTheStudentCollegeWiseITIBardivided2(attendate);
		model.addAttribute("studentcountITI2", studentcountITI2);
		
		List<LoginModel> studentcountITI3 = ldao.getCountTheStudentCollegeWiseITIBardivided3(attendate);
		model.addAttribute("studentcountITI3", studentcountITI3);
		
		List<LoginModel> studentcountITI4 = ldao.getCountTheStudentCollegeWiseITIBardivided4(attendate);
		model.addAttribute("studentcountITI4", studentcountITI4);

		return new ModelAndView("login/bar-chart-ITI");
	}
	@RequestMapping("/attendance-report-branch-ITI.html")
	public ModelAndView reportiti(@ModelAttribute("cb") LoginModel lg, Model model, HttpSession session) {
	
		String loginid =(String)session.getAttribute("admin_loginid");
		System.out.println("::loginid::admin-login:::get::::::::"+loginid);
		
		String collegecode = ldao.featchcollegecode(loginid);
		//System.out.println("collegecode"+collegecode);
		model.addAttribute("collegecode", collegecode);

	
			
			  List<LoginModel> branch = ldao.getBranchListitireport(collegecode);
			  model.addAttribute("branch", branch);
			 // System.out.println("branch"+branch);
			
			  List<LoginModel> month = ldao.getMonthListitireport(collegecode);
			  model.addAttribute("month", month);
			//  System.out.println("month"+month);
			  
	return new ModelAndView("login/attendance-report-branch-ITI");
	}
	
	@RequestMapping(value = "/attendance-report-branch-ITI.html", method = RequestMethod.POST)
	public String reportiti(@ModelAttribute("cb") LoginModel lg,Model model, HttpServletRequest request,
			HttpSession session) {
		
		/*System.out.println("semestar1"+semestar1);
		System.out.println("month1"+month1);*/
		
		String loginid =(String)session.getAttribute("admin_loginid");
		System.out.println("::loginid::admin-login:::get::::::::"+loginid);
		
		String collegecode = ldao.featchcollegecode(loginid);
		//System.out.println("collegecode"+collegecode);
		model.addAttribute("collegecode", collegecode);

	
			
			  List<LoginModel> branch = ldao.getBranchListitireport(collegecode);
			  model.addAttribute("branch", branch);
			  //System.out.println("branch"+branch);
			
			  List<LoginModel> month = ldao.getMonthListitireport(collegecode);
			  model.addAttribute("month", month);
			 // System.out.println("month"+month);
	
			 // System.out.println("avdmDeviceInfo lg "+lg.getCourseName());
			  String course=lg.getCourseName();
			 // System.out.println("avdmDeviceInfo lg "+lg.getMonth());
			  String selectedMonth=lg.getMonth();
			  model.addAttribute("selectedMonth", selectedMonth);
			  model.addAttribute("course", course);


	

				 List<LoginModel> studentview =ldao.getCandidatebranchITI(collegecode,course,selectedMonth);
				 model.addAttribute("studentview", studentview);
				// System.out.println("studentview"+studentview);
				
			
		return "login/attendance-report-branch-ITI";
	}
	
	@RequestMapping(value = "/registered-institute-student.html", method = RequestMethod.GET)
	public String allinstitutexfgh(@ModelAttribute("b") LoginModel b, Model m,
			HttpSession session,HttpServletRequest request)
	{
		
		List<LoginModel> collegetype = ldao.getcollegetype();
		m.addAttribute("collegetype", collegetype);
		
		return "login/registered-institute-student";
	}
	@RequestMapping(value = "/registered-institute-student.html", method = RequestMethod.POST)
	public String allinstituteQdf(@ModelAttribute("b") LoginModel b, Model m,
			HttpSession session,HttpServletRequest request)
	{
		//System.out.println("ENTER INTO VIEW");
		String selectedInstitutetype=b.getInstituteCode();
		//System.out.println("selectedInstitutetype"+selectedInstitutetype);
		List<LoginModel> collegetype = ldao.getcollegetype();
		m.addAttribute("collegetype", collegetype);
		List<LoginModel> collegelist = ldao.getAllCollegeadminstudent(selectedInstitutetype);
		m.addAttribute("collegelist", collegelist);
/*				System.out.println("collegelist"+collegelist);
*/				
		return "login/registered-institute-student";
	}
	
	@RequestMapping(value = "/view-institute-semesterwise-count.html", method = RequestMethod.GET)
	public String allinstitutexf(@ModelAttribute("b") LoginModel b, Model m,
			HttpSession session,HttpServletRequest request,@RequestParam("institutecode") String institutecode)
	{
		
		System.out.println("institutecode" + institutecode);
		String institutetype = ldao.featchinstitutetype(institutecode);
		System.out.println("institutetype" + institutetype);
		if(institutetype.equals("G"))
		{
			System.out.println("for govt poly");
		List<LoginModel> semesterwisecount = ldao.getcollegelistcountsemesterwise(institutecode);
		m.addAttribute("semesterwisecount", semesterwisecount);
		System.out.println("semesterwisecount" + semesterwisecount);
		
		return "login/view-institute-semesterwise-count";
		}
		else if (institutetype.equals("I")){
			System.out.println("for iti");
			List<LoginModel> branchrwisecount = ldao.getcollegelistcountbranchwise(institutecode);
			m.addAttribute("branchrwisecount", branchrwisecount);
			System.out.println("branchrwisecount" + branchrwisecount);
			return "login/view-institute-branchwise-count";	
		}
		else{
			return null;
		}
		
	}
	
	@RequestMapping(value = "/view-institute-semesterwise-studentname-count.html", method = RequestMethod.GET)
	public String allinstitutex(@RequestParam String instituteName,@RequestParam String instituteCode,@RequestParam String semester ,@ModelAttribute("b") LoginModel b, Model m,
			HttpSession session,HttpServletRequest request)
	{
		
System.out.println("institutecode"+instituteCode);
System.out.println("instituteName"+instituteName);

System.out.println("semester"+semester);


List<LoginModel> semesterwisecount = ldao.getstudentlistcountsemesterwise(instituteCode,semester);
m.addAttribute("semesterwisecount", semesterwisecount);
System.out.println("semesterwisecount"+semesterwisecount);
		
		return "login/view-institute-semesterwise-studentname-count";
	}
	@RequestMapping(value = "/view-institute-branchwise-studentname-count.html", method = RequestMethod.GET)
	public String allinstitute(@RequestParam String instituteName,@RequestParam String instituteCode,@RequestParam String courseName ,@ModelAttribute("b") LoginModel b, Model m,
			HttpSession session,HttpServletRequest request)
	{
		
System.out.println("institutecode"+instituteCode);
System.out.println("instituteName"+instituteName);

System.out.println("semester"+courseName);


List<LoginModel> semesterwisecount = ldao.getstudentlistcountbranchwise(instituteCode,courseName);
m.addAttribute("semesterwisecount", semesterwisecount);
System.out.println("semesterwisecount"+semesterwisecount);
		
		return "login/view-institute-branchwise-studentname-count";
	}
	
	@RequestMapping(value = "/registered-student-details.html", method = RequestMethod.GET)
	public String inst(@ModelAttribute("b") LoginModel b, Model m,
			HttpSession session,HttpServletRequest request)
	{
		
		String loginid =(String)session.getAttribute("admin_loginid");
		System.out.println("::loginid::admin-login:::get::::::::"+loginid);
		
		String collegecode = ldao.featchcollegecode(loginid);
		m.addAttribute("collegecode", collegecode);
		String institutetype = ldao.featchinstitutetype(collegecode);
		System.out.println("institutetype" + institutetype);
		if(institutetype.equals("G"))
		{
			List<LoginModel> collegeCountDetails = ldao.getcollegestudentlistcountbranchwise(collegecode);
			m.addAttribute("collegeCountDetails", collegeCountDetails);
			System.out.println("collegeCountDetails"+collegeCountDetails);
					
					return "login/registered-student-details";
		}
		
		else if (institutetype.equals("I")){
			System.out.println("for iti");
			List<LoginModel> collegeCountDetails = ldao.getcollegestudentlistcountbranchwise(collegecode);
			m.addAttribute("collegeCountDetails", collegeCountDetails);
			System.out.println("collegeCountDetails"+collegeCountDetails);
			return "login/count-branchwise-institute";	
		}
		
		else{
			return null;
		}
		



	}
}
