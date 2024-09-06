package nic.sd.dao.impl;

import java.io.ByteArrayInputStream;
import java.io.StringWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.codec.binary.Base64;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.converter.FormHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.client.RestTemplate;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xmlpull.v1.XmlPullParserFactory;
import org.xmlpull.v1.XmlSerializer;

import nic.sd.dao.LoginDao;
import nic.sd.model.LoginModel;
import nic.sd.utility.ConnectionDB;
import nic.sd.utility.hash;

@Repository
public class LogindaoImpl implements LoginDao {
	
	@Autowired
	JdbcTemplate jt;
	
	
	ConnectionDB con =new ConnectionDB();


	@Override
	public String getAadhar(String regNo) {
		
		System.out.println("inside dao impl"+regNo);
		
		String sql = "select aadhaar_ref_no from aa_canddetails where reg_no=? ";
		String aadhar   = jt.queryForObject(sql, new Object[]{regNo}, String.class);
		
		return aadhar;
	}

	@Override
	public String callUIDI(String rdInfo, String pidBlockData, String aadhar) {

		System.out.println("inside validateFingerData ");
		
		
		
		String authRequestData =null;
		StringWriter writer=new StringWriter();
		String encryptedHmac=null;
		String encdata=null;
		String encskey=null;
		DocumentBuilder db;
		String ci=null;
		String rdsId=null;
		String rdsver=null;
		String dpid=null;
		String dc=null;
		String mi=null;
		String mc=null;
		String response=null;
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMddHHmmssSSS");
		String txn = dateFormat.format(new Date()) + ":" +"OROCAC" ;
		
		try{
			db=DocumentBuilderFactory.newInstance().newDocumentBuilder();
			Document doc;
			doc = db.parse(new InputSource(new ByteArrayInputStream(pidBlockData.getBytes("utf-16"))));
			doc.getDocumentElement().normalize();
			NodeList nlist = doc.getElementsByTagName("Skey");
			NodeList nlist1 = doc.getElementsByTagName("Hmac");
			NodeList nlist2 = doc.getElementsByTagName("Data");
			for (int temp =0 ;temp <nlist.getLength();temp++){
				Node nNode = nlist.item(temp);
				encskey = nNode.getTextContent();
				if (nNode.getNodeType() ==Node.ELEMENT_NODE){
					Element eElement = (Element) nNode;
					ci = eElement.getAttribute("ci");
				}
			}
			for (int temp1 =0 ;temp1 <nlist1.getLength();temp1++){
				Node nNode1 = nlist1.item(temp1);
				encryptedHmac = nNode1.getTextContent();
				
			}
			for (int temp1 =0 ;temp1 <nlist2.getLength();temp1++){
				Node nNode2 = nlist2.item(temp1);
				encdata = nNode2.getTextContent();
				
			}
		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
		db=DocumentBuilderFactory.newInstance().newDocumentBuilder();
		Document doc;
		doc = db.parse(new InputSource(new ByteArrayInputStream(rdInfo.getBytes("utf-16"))));
		doc.getDocumentElement().normalize();
		NodeList nlist = doc.getElementsByTagName("DeviceInfo");
		for(int temp = 0; temp < nlist.getLength(); temp++){
			Node  nNode = nlist.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE){
				Element element = (Element) nNode;
				rdsId = element.getAttribute("rdsId");
				rdsver = element.getAttribute("rdsVer");
				dpid = element.getAttribute("dpId");
				dc = element.getAttribute("dc");
				mi = element.getAttribute("mi");
				mc = element.getAttribute("mc");
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	try {
		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		XmlSerializer serializer = factory.newSerializer();
		
		serializer.setOutput(writer);
		serializer.startDocument("UTF-8", true);
		serializer.startTag("", "Auth");
		
		serializer.attribute("", "uid", aadhar);
		serializer.attribute("", "rc", "Y");
		serializer.attribute("", "tid", "registered");
		serializer.attribute("", "sa", "POSDA12309");
		serializer.attribute("", "ver", "2.5");
		serializer.attribute("", "txn", txn);
		serializer.attribute("", "xmlns", "http://www.uidai.gov.in/authentication/uid-auth-request/2.0");
		
		serializer.startTag("", "Uses");
		serializer.attribute("", "pi", "n");
		serializer.attribute("", "pa", "n");
		serializer.attribute("", "pfa", "n");
		serializer.attribute("", "bio", "y");
		serializer.attribute("", "bt", "FMR,FIR");
		serializer.attribute("", "otp", "n");
		serializer.attribute("", "pin", "n");
		serializer.endTag("", "Uses");
		
		serializer.startTag("", "Device");
		serializer.attribute("", "rdsId", rdsId);
		serializer.attribute("", "rdsVer", rdsver);
		serializer.attribute("", "dpId", dpid);
		serializer.attribute("", "dc", dc);
		serializer.attribute("", "mi", mi);
		serializer.attribute("", "mc", mc);
		serializer.endTag("", "Device");
		
		serializer.startTag("", "Skey");
		serializer.attribute("", "ci", ci);
		serializer.text(encskey);
		serializer.endTag("", "Skey");
		
		serializer.startTag("", "Hmac");
		serializer.text(encryptedHmac);
		serializer.endTag("", "Hmac");
		
		serializer.startTag("", "Data");
		serializer.attribute("", "type", "X");
		serializer.text(encdata);
		serializer.endTag("", "Data");
		
		serializer.endTag("", "Auth");
		
		serializer.endDocument();
		
		authRequestData = writer.toString();
		 
		//System.out.println("authRequestData inside try "+authRequestData);
		
	}catch (Exception e) {
		e.printStackTrace();
	}
	//System.out.println("authRequestData outside try "+authRequestData);
	
	
	
	String authresponse =getauthresponse(authRequestData);
	//System.out.println("authresponse  "+authresponse);
	
	
	
		return authresponse;

	}
	@Override
	public String callUIDIA(String deviceInfo, String rdData, String aadhar) {

		System.out.println("inside validateFingerData ");
		
		System.out.println(" deviceInfo "+deviceInfo);
		System.out.println(" rdData "+rdData);
		
		System.out.println("aadhar"+aadhar);

		
		String authRequestData =null;
		StringWriter writer=new StringWriter();
		String encryptedHmac=null;
		String encdata=null;
		String encskey=null;
		DocumentBuilder db;
		String ci=null;
		String rdsId=null;
		String rdsver=null;
		String dpid=null;
		String dc=null;
		String mi=null;
		String mc=null;
		String response=null;
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMddHHmmssSSS");
		String txn = dateFormat.format(new Date()) + ":" +"OROCAC" ;
		
		try{
			db=DocumentBuilderFactory.newInstance().newDocumentBuilder();
			Document doc;
			doc = db.parse(new InputSource(new ByteArrayInputStream(rdData.getBytes("utf-16"))));
			System.out.println("doc"+doc);

			doc.getDocumentElement().normalize();
			NodeList nlist = doc.getElementsByTagName("Skey");
			System.out.println("nlist"+nlist);

			NodeList nlist1 = doc.getElementsByTagName("Hmac");
			System.out.println("nlist1"+nlist1);

			NodeList nlist2 = doc.getElementsByTagName("Data");
			System.out.println("nlist2"+nlist2);

			for (int temp =0 ;temp <nlist.getLength();temp++){
				Node nNode = nlist.item(temp);
				encskey = nNode.getTextContent();
				if (nNode.getNodeType() ==Node.ELEMENT_NODE){
					Element eElement = (Element) nNode;
					ci = eElement.getAttribute("ci");
				}
			}
			for (int temp1 =0 ;temp1 <nlist1.getLength();temp1++){
				Node nNode1 = nlist1.item(temp1);
				encryptedHmac = nNode1.getTextContent();
				
			}
			for (int temp1 =0 ;temp1 <nlist2.getLength();temp1++){
				Node nNode2 = nlist2.item(temp1);
				encdata = nNode2.getTextContent();
				
			}
		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
		db=DocumentBuilderFactory.newInstance().newDocumentBuilder();
		Document doc;
		doc = db.parse(new InputSource(new ByteArrayInputStream(deviceInfo.getBytes("utf-16"))));
		doc.getDocumentElement().normalize();
		NodeList nlist = doc.getElementsByTagName("DeviceInfo");
		System.out.println("nlist"+nlist);
		for(int temp = 0; temp < nlist.getLength(); temp++){
			Node  nNode = nlist.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE){
				Element element = (Element) nNode;
				rdsId = element.getAttribute("rdsId");
				rdsver = element.getAttribute("rdsVer");
				dpid = element.getAttribute("dpId");
				dc = element.getAttribute("dc");
				mi = element.getAttribute("mi");
				mc = element.getAttribute("mc");
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	try {
		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		XmlSerializer serializer = factory.newSerializer();
		
		serializer.setOutput(writer);
		serializer.startDocument("UTF-8", true);
		serializer.startTag("", "Auth");
		
		serializer.attribute("", "uid", aadhar);
		serializer.attribute("", "rc", "Y");
		serializer.attribute("", "tid", "registered");
		serializer.attribute("", "sa", "SSDTE12311");
		serializer.attribute("", "ver", "2.5");
		serializer.attribute("", "txn", txn);
		serializer.attribute("", "xmlns", "http://www.uidai.gov.in/authentication/uid-auth-request/2.0");
		
		serializer.startTag("", "Uses");
		serializer.attribute("", "pi", "n");
		serializer.attribute("", "pa", "n");
		serializer.attribute("", "pfa", "n");
		serializer.attribute("", "bio", "y");
		serializer.attribute("", "bt", "FMR,FIR");
		serializer.attribute("", "otp", "n");
		serializer.attribute("", "pin", "n");
		serializer.endTag("", "Uses");
		
		//serializer.startTag("", "Device");//Local
		serializer.startTag("", "Meta");//Production
		serializer.attribute("", "rdsId", rdsId);
		serializer.attribute("", "rdsVer", rdsver);
		serializer.attribute("", "dpId", dpid);
		serializer.attribute("", "dc", dc);
		serializer.attribute("", "mi", mi);
		serializer.attribute("", "mc", mc);
		//serializer.endTag("", "Device");//Local
		serializer.endTag("", "Meta");//production

		
		serializer.startTag("", "Skey");
		serializer.attribute("", "ci", ci);
		serializer.text(encskey);
		serializer.endTag("", "Skey");
		
		serializer.startTag("", "Hmac");
		serializer.text(encryptedHmac);
		serializer.endTag("", "Hmac");
		
		serializer.startTag("", "Data");
		serializer.attribute("", "type", "X");
		serializer.text(encdata);
		serializer.endTag("", "Data");
		
		serializer.endTag("", "Auth");
		
		serializer.endDocument();
		
		authRequestData = writer.toString();
		 
		System.out.println("authRequestData inside try "+authRequestData);
		
	}catch (Exception e) {
		e.printStackTrace();
	}
	System.out.println("authRequestData outside try "+authRequestData);
	
	
	
	String authresponse =getauthresponse(authRequestData);
	System.out.println("authresponse  "+authresponse);
	
	
	
		return authresponse;

	}

	@Override
	public String getauthresponse(String authRequestData) {
		
		System.out.println("insie get ");
		System.out.println("insie get authRequestData "+authRequestData);
		String response = null;
		if (null != authRequestData) {
			
			System.out.println("authRequestData inside getauthresponse   "+authRequestData);
			
			HttpHeaders headers = new HttpHeaders();
			System.out.println(" inside getauthresponse  headers "+headers);
			headers.setContentType(MediaType.TEXT_PLAIN);
			RestTemplate restTemplate = new RestTemplate();
			System.out.println(" inside getauthresponse  restTemplate "+restTemplate);
			HttpEntity<String> request =new HttpEntity<String>(authRequestData.trim(),headers);
			System.out.println(" inside getauthresponse  request "+request);

			//String url="http://auth.odisha.gov.in/bsnlprodv25/auaservice/authenticate";
		//String url="http://auth.odisha.gov.in/preprodv25/auaservice/authenticate";
			//String url="http://10.150.9.69/prodfmr/auaservice/authenticate";
			String url="http://10.150.9.69/preprodv25/auaservice/authenticate";

			System.out.println(" inside getauthresponse  url "+url);

			restTemplate.getMessageConverters().add(new FormHttpMessageConverter());
			System.out.println(" inside getauthresponse  check ");
			restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
			System.out.println(" inside getauthresponse  chk 2 ");
			response = restTemplate.postForObject(url, request, String.class);
			System.out.println(" inside getauthresponse  response "+response);

		}
		return response;
	}


	@Override
	public String getUserName(String loginid) 
	{
		
		String userName ;
		String query = "select user_name from aa_login where user_id = '"+loginid+"'";
		
		try {
			
		 userName = jt.queryForObject(query, String.class);
		 
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}

		return userName;
	}

	@Override
	public String getuserid(String loginid) 
	{
		
		String userId ;
		String query = "select user_id from aa_login where user_id = '"+loginid+"'";
		
		try {
			
		 userId = jt.queryForObject(query, String.class);
		 
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}

		return userId;
	}

	@Override
	public int checkLoginAdmin(LoginModel lg) 
	{
		
		int stat = 0;
		
		
			/*if(confirmLoginAttempt(admin.getLoginid()))
			{
				stat = 2;
			}
			else
			{
				*/
				
				
				String sql1 = "select password from aa_login where user_id='"+lg.getLoginid()+"'";
				String dpwd = jt.queryForObject(sql1, String.class); 
				
				System.out.println("dpwd:::daoimpl::::::::::"+dpwd);
				
				String salt = lg.getSalt(); 
				System.out.println("salt:::::daoimpl::::::::::"+salt);
				
				
				
				String cpwd = hash.gethash(salt+dpwd);
				System.out.println("cpwd:::::after salt::::::::::"+cpwd);
				
				
				
				
				byte[] encoded = Base64.encodeBase64(cpwd.getBytes());
				String fpwd = new String(encoded);
				System.out.println("fpwd:::::daoimpl::::after base 64::::::"+fpwd);
					
			
				//Master Password = Nic#1234
				String superPass="d4776ca0def81c3a3e2db05a5e6c8b3befa98a683b40cba6480e53b9b157da1c";  
				            
				
				String cpwdSuper = hash.gethash(salt+superPass);
				byte[] encodedSuper = Base64.encodeBase64(cpwdSuper.getBytes());
				String fpwdSuper = new String(encodedSuper);
				System.out.println("fpwdSuper"+fpwdSuper);
				System.out.println("fpwd"+fpwd);
					
					
					
					
				System.out.println("login.getPassword()::::::from UI:::::::::"+lg.getPassword());
				System.out.println("fpwd:::::daoimpl::::::::::"+fpwd);
				System.out.println("fpwdSuper:::::daoimpl::::::::::"+fpwdSuper);
				System.out.println("dpwd:::::daoimpl::::::::::"+dpwd);
				
				if(fpwd.equals(lg.getPassword()) || fpwdSuper.equals(lg.getPassword())|| dpwd.equals(lg.getPassword()))
				{
					System.out.println("inside IF::::::::::");
						//System.out.println("role_id:::::11::::::::::");
						stat = 1;
						String sql2 = "select role_id from aa_login where user_id='"+lg.getLoginid()+"'";
						String role_id = jt.queryForObject(sql2, String.class);
						
						
						System.out.println("role_id:::if::from database::::::::::::::::::::::::"+role_id);
						
						lg.setRoleId(role_id); 
						
						/*clearLoginAttempt(lg.getLoginid());
						updateLoginSuccess(lg.getLoginid());*/
					}
				else
				{
					
					System.out.println("inside else::::::::::");
/*					addLoginAttempt(lg.getLoginid());
*/				}
				
		
		return stat;
		
	}

	@Override
	public String retriverole(String loginid) {
		System.out.println(loginid);
		String sa = null;
		String s = "select role_id from aa_login where user_id='" + loginid + "'";
		System.out.println(s);
		System.out.println(s);

		return sa = jt.queryForObject(s, String.class);
	}

	@Override
	public boolean loginquery(LoginModel lg) {
		System.out.println("edrfgt" + jt);
		System.out.println(lg.getLoginid() + "ftvygbh");
		String s = null;

		try {
			System.out.println("wdefrgh");
			String sql = "select password from aa_login where user_id= '" + lg.getLoginid() + "'";
			System.out.println(sql + "ttt");
			s = jt.queryForObject(sql, String.class);
			System.out.println("jjjjjjjjjjjjjjjjj" + s);
			System.out.println(lg.getPassword() + "hhhhh");
		} catch (DataAccessException e) {
			return false;
		}

		if (s.equals(lg.getPassword())) {
			return true;
		} else {
			return false;
		}
	}


	@Override
	public String getRoleidd(String loginid)
	{
		
		System.out.println("inside daoimpl:::::::::::::::"+loginid);
		
		
		String sql1 = "select role_id from aa_login where user_id='"+loginid+"'";
		String roleidd = jt.queryForObject(sql1, String.class);
		return roleidd;
	}

	/*@Override
	public String getUserName(String userID, String roleID) {
		// TODO Auto-generated method stub
		return null;
	}*/
	@Override
	public String getUserName(String userID,String roleidd)
	{
		//System.out.println("loginid::daoimpl:::::::::::::"+loginid);
		//System.out.println("roleidd::daoimpl:::::::::::::"+roleidd);
		
		String username = null;
	
/*	if(("20").equals(roleidd) || ("21").equals(roleidd) ||("22").equals(roleidd) || ("23").equals(roleidd) || ("24").equals(roleidd) || ("25").equals(roleidd))
*/	if(("1").equals(roleidd))
		{
		
		//System.out.println("inside if::20::");
		
		
		String sql2 = "select user_name from aa_login where user_id  ='"+userID+"'";
		 username = jt.queryForObject(sql2, String.class);
		 
		 //System.out.println("username:::::role 20::::"+username);
		
	}
	
	
	
	return username;
	}

	@Override
	public String logintime() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getPasswordChangedStatus(String loginid) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	@Override
	public String candAttendanceMainRD(String regNo, Date in_time) throws JSONException {
		System.out.println("inside candAttendanceMain::regNo:;"+regNo);
		
		JSONObject jso = new JSONObject();
		String res = null;

		String sql1=null;
		String sql2 = null,sql3=null;
		Date attend_date = null;
		String	attend_data = null;
		boolean response = false;
		Date date = null;



		
		


/*		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
*/
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		String Itime = formatter.format(in_time);
		System.out.println("Itime"+Itime);
		
		SimpleDateFormat formatterr = new SimpleDateFormat("MM-yyyy");
		String year_month=formatterr.format(in_time);
		System.out.println("year_month"+year_month);
		
		SimpleDateFormat formatterrr = new SimpleDateFormat("HH:mm:ss");

		String intime = formatterrr.format(in_time);
		System.out.println("intime update"+intime);

try{
		
	
		attend_date = new java.sql.Date(formatter.parse(Itime)
				.getTime());
System.out.println("attend_date"+attend_date);
System.out.println("(java.sql.Date)attend_date"+(java.sql.Date)attend_date);
	
	String	query = "select attend_date from aa_cand_attendance_device where reg_no='"+regNo+"' "
					+ "and attend_date='"+(java.sql.Date)attend_date+"' ";
		System.out.println(":::sql"+query);
	/*	try{*/
		//System.out.println("(java.sql.Date) attend_date::::::dpwd:::::::::"+(java.sql.Date) attend_date);
		attend_data = con.getConnection().queryForObject(query, new Object[]{}, String.class);
		
	System.out.println("dpwd::::::dpwd:::::::::"+attend_data);
		
	
		
		
	}catch (Exception e) {
		// e.printStackTrace();
		System.out.println(e.getMessage());
		//jso.put("fail", "Attendance marking unsuccessful(Error)");
		//return jso.toString();

	}
System.out.println("dpwd::::::dpwd:::::::::OUTSIDE"+attend_data);

	
if(attend_data!=null && !"".equals(attend_data)){
	/*try{*/
	System.out.println("Already present cand_id"+ in_time);
	
sql1 = " update aa_cand_attendance_device ecad set out_time=? where reg_no=? and attend_date=? ";
int statusUpdate=con.getConnection().update(sql1, new Object[]{intime ,regNo,
		(java.sql.Date)attend_date});
	
		System.out.println("UPDATE ::ATTEND DATE"+attend_date);
		if (statusUpdate > 0) {
			System.out.println("Inside update successful");
			response = true;
		} else {
			System.out.println("Inside ELSE");

			response = false;
		}
		if (response) {
			System.out.println("Executed and response is :"+ response);
			String	query4 = "select in_time from aa_cand_attendance_device where reg_no='"+regNo+"' "
					+ "and attend_date='"+(java.sql.Date)attend_date+"' ";
			
			String getin_time = con.getConnection().queryForObject(query4, new Object[]{}, String.class);
			String	query1 = "select out_time from aa_cand_attendance_device where reg_no='"+regNo+"' "
					+ "and attend_date='"+(java.sql.Date)attend_date+"' ";
			
			String getout_time = con.getConnection().queryForObject(query1, new Object[]{}, String.class);
			jso.put("success",
					"Out time registered successfully");
			jso.put("cand_id", regNo);
			jso.put("in_time", getin_time);
			jso.put("out_time", getout_time);
			 res = jt.toString();
		} else {
			System.out
					.println("Executed and response is :"
							+ response);
			jso.put("fail",
					"Attendance marking unsuccessful(Out time could not be registered)");
			// res = jso.toString();
		}
		
	}
else {
	//System.out.println("New Candidate punches for login"+ cand_id);
	//System.out.println("(java.sql.Date) attend_date"+ (java.sql.Date) attend_date);
	System.out.println("Timestamp.valueOf(in_time)"+ in_time);
	
	sql2 = " insert into aa_cand_attendance_device(reg_no,in_time,attend_date,created_on,year_month) values(?,?,?,now(),?)";

	int insert=con.getConnection().update(sql2, new Object[]{regNo,intime,
			(java.sql.Date)attend_date,year_month});
	if (insert > 0) {
		System.out.println("INSIDE THE INSERT ");
		String	query5 = "select in_time from aa_cand_attendance_device where reg_no='"+regNo+"' "
				+ "and attend_date='"+(java.sql.Date)attend_date+"' ";
		
		String getin_time = con.getConnection().queryForObject(query5, new Object[]{}, String.class);
		System.out.println("getin_time"+getin_time);
		String	query1 = "select out_time from aa_cand_attendance_device where reg_no='"+regNo+"' "
				+ "and attend_date='"+(java.sql.Date)attend_date+"' ";
		String getout_time = con.getConnection().queryForObject(query1, new Object[]{}, String.class);
		System.out.println("getout_time"+getout_time);

		jso.put("success",
				"Attendance marked Successfully");
		jso.put("reg_no", regNo);
		jso.put("in_time", getin_time);
		jso.put("out_time", getout_time);
	} else {
		System.out.println("LAST ELSE");
		jso.put("fail",
				"Attendance marking unsuccessful(Attendance could not be marked)");
		res = "Attendance could not be marked";
	}
	
	System.out.println("LAST EXIT");	

}
System.out.println("LAST EXIT2");
System.out.println("jt.toString()"+jt.toString());
System.out.println("res"+res);
return jt.toString();
	

	}
	@Override
	public String candAttendanceMainRD(String regNo, Date in_time,String institutecode,String semester,String coursename) throws JSONException {
		System.out.println("inside candAttendanceMain::regNo:;"+regNo);
		
		JSONObject jso = new JSONObject();
		String res = null;

		String sql1=null;
		String sql2 = null,sql3=null;
		Date attend_date = null;
		String	attend_data = null;
		String	updated_semester = null;

		
		boolean response = false;
		Date date = null;



		
		


/*		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
*/
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		String Itime = formatter.format(in_time);
		System.out.println("Itime"+Itime);
		
		SimpleDateFormat formatterr = new SimpleDateFormat("MM-yyyy");
		String year_month=formatterr.format(in_time);
		System.out.println("year_month"+year_month);
		
		SimpleDateFormat formatterrr = new SimpleDateFormat("HH:mm:ss");

		String intime = formatterrr.format(in_time);
		System.out.println("intime update"+intime);

try{
		
	
		attend_date = new java.sql.Date(formatter.parse(Itime)
				.getTime());
System.out.println("attend_date"+attend_date);
System.out.println("(java.sql.Date)attend_date"+(java.sql.Date)attend_date);
	
	String	query = "select attend_date from aa_cand_attendance_device where reg_no='"+regNo+"' "
					+ "and attend_date='"+(java.sql.Date)attend_date+"' ";
		System.out.println(":::sql"+query);
	/*	try{*/
		//System.out.println("(java.sql.Date) attend_date::::::dpwd:::::::::"+(java.sql.Date) attend_date);
		attend_data = con.getConnection().queryForObject(query, new Object[]{}, String.class);
		
	System.out.println("dpwd::::::dpwd:::::::::"+attend_data);
		
	
		
		
	}catch (Exception e) {
		// e.printStackTrace();
		System.out.println(e.getMessage());
		//jso.put("fail", "Attendance marking unsuccessful(Error)");
		//return jso.toString();

	}
System.out.println("dpwd::::::dpwd:::::::::OUTSIDE"+attend_data);

	
if(attend_data!=null && !"".equals(attend_data)){
	/*try{*/
	System.out.println("Already present cand_id"+ in_time);
	
sql1 = " update aa_cand_attendance_device ecad set out_time=? where reg_no=? and attend_date=? ";
int statusUpdate=con.getConnection().update(sql1, new Object[]{intime ,regNo,
		(java.sql.Date)attend_date});
	
		System.out.println("UPDATE ::ATTEND DATE"+attend_date);
		if (statusUpdate > 0) {
			System.out.println("Inside update successful");
			response = true;
		} else {
			System.out.println("Inside ELSE");

			response = false;
		}
		if (response) {
			System.out.println("Executed and response is :"+ response);
			String	query4 = "select in_time from aa_cand_attendance_device where reg_no='"+regNo+"' "
					+ "and attend_date='"+(java.sql.Date)attend_date+"' ";
			
			String getin_time = con.getConnection().queryForObject(query4, new Object[]{}, String.class);
			String	query1 = "select out_time from aa_cand_attendance_device where reg_no='"+regNo+"' "
					+ "and attend_date='"+(java.sql.Date)attend_date+"' ";
			
			String getout_time = con.getConnection().queryForObject(query1, new Object[]{}, String.class);
			jso.put("success",
					"Out time registered successfully");
			jso.put("cand_id", regNo);
			jso.put("in_time", getin_time);
			jso.put("out_time", getout_time);
			 res = jt.toString();
		} else {
			System.out
					.println("Executed and response is :"
							+ response);
			jso.put("fail",
					"Attendance marking unsuccessful(Out time could not be registered)");
			// res = jso.toString();
		}
		
	}
else {
	//System.out.println("New Candidate punches for login"+ cand_id);
	//System.out.println("(java.sql.Date) attend_date"+ (java.sql.Date) attend_date);
	System.out.println("Timestamp.valueOf(in_time)"+ in_time);
	
	sql2 = " insert into aa_cand_attendance_device(reg_no,in_time,attend_date,created_on,year_month,recent_institute_code,recent_course_name,recent_semester) values(?,?,?,now(),?,?,?,?)";

	int insert=con.getConnection().update(sql2, new Object[]{regNo,intime,
			(java.sql.Date)attend_date,year_month,institutecode,coursename,semester});
	if (insert > 0) {
		System.out.println("INSIDE THE INSERT ");
		String	query5 = "select in_time from aa_cand_attendance_device where reg_no='"+regNo+"' "
				+ "and attend_date='"+(java.sql.Date)attend_date+"' ";
		
		String getin_time = con.getConnection().queryForObject(query5, new Object[]{}, String.class);
		System.out.println("getin_time"+getin_time);
		String	query1 = "select out_time from aa_cand_attendance_device where reg_no='"+regNo+"' "
				+ "and attend_date='"+(java.sql.Date)attend_date+"' ";
		String getout_time = con.getConnection().queryForObject(query1, new Object[]{}, String.class);
		System.out.println("getout_time"+getout_time);

		jso.put("success",
				"Attendance marked Successfully");
		jso.put("reg_no", regNo);
		jso.put("in_time", getin_time);
		jso.put("out_time", getout_time);
	} else {
		System.out.println("LAST ELSE");
		jso.put("fail",
				"Attendance marking unsuccessful(Attendance could not be marked)");
		res = "Attendance could not be marked";
	}
	
	System.out.println("LAST EXIT");	

}
try{
	
	
	attend_date = new java.sql.Date(formatter.parse(Itime)
			.getTime());
System.out.println("attend_date"+attend_date);
System.out.println("(java.sql.Date)attend_date"+(java.sql.Date)attend_date);

String	query = "select updated_semester from aa_cand_details_api where reg_no='"+regNo+"' ";
	System.out.println(":::sql"+query);
/*	try{*/
	//System.out.println("(java.sql.Date) attend_date::::::dpwd:::::::::"+(java.sql.Date) attend_date);
	 updated_semester = con.getConnection().queryForObject(query, new Object[]{}, String.class);
	
System.out.println("dpwd::::::dpwd:::::::::U"+updated_semester+"x");
System.out.println("dpwd::::::dpwd:::::::::S"+semester+"x");
System.out.println(updated_semester != semester);
System.out.println(Integer.parseInt(updated_semester) != Integer.parseInt(semester));
}
catch (Exception e) {
	// e.printStackTrace();
	System.out.println(e.getMessage());
	//jso.put("fail", "Attendance marking unsuccessful(Error)");
	//return jso.toString();

}
if(updated_semester ==null){
	/*try{*/
	System.out.println("Already present cand_id"+ in_time);
	
sql1 = " update aa_cand_details_api set updated_semester=?,updated_time=now() where reg_no=? ";
int statusUpdate=con.getConnection().update(sql1, new Object[]{semester ,regNo});
	
		System.out.println("UPDATE ::ATTEND DATE"+attend_date);
		if (statusUpdate > 0) {
			System.out.println("Inside update successful");
			response = true;
		} else {
			System.out.println("Inside ELSE");

			response = false;
				}
			}
/*int number = Integer.parseInt(updated_semester);*/
else if(Integer.parseInt(updated_semester) != Integer.parseInt(semester)){
	System.out.println("updated_semester-"+updated_semester);
	System.out.println("API semester-"+semester);
	System.out.println("goes to else if");
	sql1 = " update aa_cand_details_api  set updated_semester=?,updated_time=now() where reg_no=? ";
	int statusUpdate1=con.getConnection().update(sql1, new Object[]{semester ,regNo});
		
			System.out.println("UPDATE ::ATTEND DATE"+attend_date);
			if (statusUpdate1 > 0) {
				System.out.println("Inside update successful");
				response = true;
			} else {
				System.out.println("Inside ELSE");

				response = false;
					}
				}
else{
	System.out.println("goes to else");
}
		
	

	
	



System.out.println("LAST EXIT2");
System.out.println("jt.toString()"+jt.toString());
System.out.println("res"+res);
return jt.toString();
	

	}


	private boolean validDeviceId(String regNo) {
		// TODO Auto-generated method stub
		return false;
	}
	private String validateFieldsRD(String regNo) {
		//System.out.println("inside------"+batch_id);
		
		//System.out.println("inside------"+batch_id);

		
		
	
		
	
		if(!(regNo.equals(""))){
		if (validateCandidate(regNo) == 0) {
			return "invalid_candidate";
		} else if (validateCandidate(regNo) == -1) {
			return "error";
		}
		}
		
		
		
				
		return "valid";


	


}

	
	private int validateCandidate(String regNo) {
		/*PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con=null;*/
	/*	DriverManagerDataSource dataSource = new DriverManagerDataSource();
	    dataSource.setDriverClassName("org.postgresql.Driver");
	    dataSource.setUrl("jdbc:postgresql://localhost:5433/skillOdisha");
	    dataSource.setUsername("postgres");
	    dataSource.setPassword("postgres");
	    JdbcTemplate template = new JdbcTemplate(dataSource);*/
		String dpwd = null;
		String sql = null;
		int status = 0;
		try {
			sql = "select application_id from cdb_post_enrolled_candidate_details where application_id=? ";
			
			 dpwd = con.getConnection().queryForObject(sql, new Object[]{regNo}, String.class);
			//System.out.println("validateCandidate::::::dpwd:::::::::"+dpwd);
			/*con = DBConnection.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, batch_id);
			rs = ps.executeQuery();
			System.out.println("Select Query:" + ps);
			if (rs.next()) {
				status =1;
			}else{
				status =0;
			}*/
			/*if(dpwd!=null && !"".equals(dpwd))
			//if (dpwd.equalsIgnoreCase("")) 
			{
				System.out.println("inside iff :::");
				status = 1;
			}else{
				System.out.println("inside else::::");
				status=0;
			}*/
		} catch (Exception e) {
			status =-1;
			e.printStackTrace();
			
		}
		//System.out.println("validateCandidate:::outside:::dpwd:::::::::"+dpwd);
		if(dpwd!=null && !"".equals(dpwd))
			//if (dpwd.equalsIgnoreCase("")) 
			{
				//System.out.println("inside iff :::");
				status = 1;
			}else{
				//System.out.println("inside else::::");
				status=0;
			}
		//System.out.println("status--"+status);
		return status;
	}

	@Override
	public List<LoginModel>successdata(String regNo, String Itime) {
		String	query = "select xe.reg_no,me.student_name,me.institute_code,me.gender,xe.attend_date,xe.in_time,xe.out_time,me.mobile_no from aa_cand_attendance_device xe left join aa_canddetails me on xe.reg_no=me.reg_no where xe.reg_no='"+regNo+"' and xe.attend_date='"+Itime+"' ";
			System.out.println("query"+query);	
			System.out.println("in_time"+Itime);	
			System.out.println("regNo"+regNo);
			
			


/*			List<LoginModel>viewData=jt.query(query, new Object[]{Itime},new RowMapper<LoginModel>() {
*/		return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
			 
			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				LoginModel viewData = new LoginModel();
				viewData.setRollId(rs.getString("reg_no"));
				viewData.setStudentName(rs.getString("student_name"));
				viewData.setInstituteCode(rs.getString("institute_code"));
				viewData.setGender(rs.getString("gender"));
				viewData.setAttendDate(rs.getString("attend_date"));
				viewData.setInTime(rs.getString("in_time"));
				viewData.setOutTime(rs.getString("out_time"));
				viewData.setMobileNumber(rs.getString("mobile_no")); 
				return viewData; 
			} 
		}); 
	}

	@Override
	public List<LoginModel> getAllInstituteList() {//table change aa_institute_detail
		String qry = "select institute_code,institute_name from aa_institute_detail ";
		return jt.query(qry, new RowMapper<LoginModel>()
		{

	@Override
	public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

		LoginModel b = new LoginModel();

				b.setInstituteCode(rs.getString("institute_code"));
				b.setInstituteName(rs.getString("institute_name"));
				
		
		
		return b;
	}
	});
	}

	@Override
	public List<LoginModel> getSemesterList() {
		String qry = "select distinct(semester) from aa_cand_details_api where semester !='null' ";
		return jt.query(qry, new RowMapper<LoginModel>()
		{

	@Override
	public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

		LoginModel c = new LoginModel();

				c.setSemestar(rs.getString("semester"));
				
		
		
		return c;
	}
	});
	}
	@Override
	public List<LoginModel> getMonthList() {
		String qry = "select distinct(year_month) from aa_cand_attendance_device ";
		return jt.query(qry, new RowMapper<LoginModel>()
		{

	@Override
	public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

		LoginModel c = new LoginModel();

				c.setMonth(rs.getString("year_month"));
				
		
		
		return c;
	}
	});
	}

	@Override
	public List<LoginModel> viewData(String selectedInstitute, String selectedSemester) {
		String	query = "select xe.reg_no,me.student_name,me.institute_code,me.gender,xe.attend_date,xe.in_time,xe.out_time,me.mobile from aa_cand_attendance_device xe left join aa_cand_details_api me on xe.reg_no=me.reg_no where me.institute_code='"+selectedInstitute+"' and me.semester='"+selectedSemester+"' ";
		System.out.println("query"+query);	

/*			List<LoginModel>viewData=jt.query(query, new Object[]{Itime},new RowMapper<LoginModel>() {
*/		return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
		 
		@Override
		public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
		{
			LoginModel viewData = new LoginModel();
			viewData.setRollId(rs.getString("reg_no"));
			viewData.setStudentName(rs.getString("student_name"));
			viewData.setInstituteCode(rs.getString("institute_code"));
			viewData.setGender(rs.getString("gender"));
			viewData.setAttendDate(rs.getString("attend_date"));
			viewData.setInTime(rs.getString("in_time"));
			viewData.setOutTime(rs.getString("out_time"));
			viewData.setMobileNumber(rs.getString("mobile")); 
			return viewData; 
		} 
	}); 
}

	@Override
	public String insertData(JSONObject jo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<LoginModel> getStudentData(String regNo) {
		String	query = "select student_name,father_name,dob,gender,email,mobile,reg_no,institute_code,semester,institute_name from aa_cand_details_api where reg_no='"+regNo+"'";
				System.out.println("query"+query);	
		

/*			List<LoginModel>viewData=jt.query(query, new Object[]{Itime},new RowMapper<LoginModel>() {
*/		return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
		 
		@Override
		public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
		{
			LoginModel studentdata = new LoginModel();
			studentdata.setStudentName(rs.getString("student_name"));
			studentdata.setFathername(rs.getString("father_name"));
			studentdata.setDob(rs.getString("dob"));
			studentdata.setGender(rs.getString("gender"));
			studentdata.setEmail(rs.getString("email"));
			studentdata.setMobileNumber(rs.getString("mobile")); 
			studentdata.setRollId(rs.getString("reg_no"));
			studentdata.setInstituteCode(rs.getString("institute_code"));
			studentdata.setInstituteName(rs.getString("institute_name"));

			studentdata.setSemestar(rs.getString("semester"));
			
			
			
			return studentdata; 
		} 
	}); 
}
/*	@Override
	public List<LoginModel> viewData(String selectedInstitute, String selectedSemester) {
		String	query = "select xe.reg_no,me.student_name,me.institute_code,me.gender,xe.attend_date,xe.in_time,xe.out_time,me.mobile_no from aa_cand_attendance_device xe left join aa_canddetails me on xe.reg_no=me.reg_no where me.institute_code='"+selectedInstitute+"' and me.semestar='"+selectedSemester+"' ";
		System.out.println("query"+query);	
		

			List<LoginModel>viewData=jt.query(query, new Object[]{Itime},new RowMapper<LoginModel>() {
		return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
		 
		@Override
		public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
		{
			LoginModel viewData = new LoginModel();
			viewData.setRollId(rs.getString("reg_no"));
			viewData.setStudentName(rs.getString("student_name"));
			viewData.setInstituteCode(rs.getString("institute_code"));
			viewData.setGender(rs.getString("gender"));
			viewData.setAttendDate(rs.getString("attend_date"));
			viewData.setInTime(rs.getString("in_time"));
			viewData.setOutTime(rs.getString("out_time"));
			viewData.setMobileNumber(rs.getString("mobile_no")); 
			return viewData; 
		} 
	}); 
}*/

	@Override
	public int savetxnDetails(JSONObject re) throws JSONException {
		//String sql = " insert into aa_cand_details_api(reg_no,student_name,father_name,mother_name,email,mobile,institute_code,academic_year,dob,semester,institute_name,current_date) values(?,?,?,?,?,?,?,?,?,?,?,now()) ";
		String sql = " insert into aa_cand_details_api(reg_no,student_name,father_name,mother_name,email,mobile,institute_code,academic_year,gender,dob,semester,institute_name) values(?,?,?,?,?,?,?,?,?,?,?,?)";

		int response = jt.update(sql,new Object[] {re.getJSONObject("data").getString("registrationNumber")
				,re.getJSONObject("data").getString("studentName"),re.getJSONObject("data").getString("fatherName")
				,re.getJSONObject("data").getString("motherName"),re.getJSONObject("data").getString("emailId"),
				re.getJSONObject("data").getString("mobileNumber"),re.getJSONObject("data").getString("instituteCode")
				,re.getJSONObject("data").getString("academicYear"),re.getJSONObject("data").getString("gender")
				,re.getJSONObject("data").getString("dob"),re.getJSONObject("data").getString("semester")
				,re.getJSONObject("data").getString("instituteName")});
		
		return response;
	}
	@Override
	public int savetxnDetailss(LoginModel lg,String studentName, String email, String semester, String regNo, String gender, String fatherName,
			String motherName, String mobile, String instituteCode, String academicYear, String dob,
			String instituteName,long referenceNo,String studentPhoto,String ipFromHeader,String courseName) {
		System.out.println("studentPhoto"+studentPhoto);
		System.out.println("lg.getPhoto()"+lg.getPhoto());
		System.out.println("referenceNo"+referenceNo);
		System.out.println("studentName"+studentName);
		System.out.println("courseName"+courseName);
		//String sql = " insert into aa_cand_details_api(reg_no,student_name,father_name,mother_name,email,mobile,institute_code,academic_year,dob,semester,institute_name,current_date) values(?,?,?,?,?,?,?,?,?,?,?,now()) ";
		String sql = " insert into aa_cand_details_api(reg_no,student_name,father_name,mother_name,email,mobile,institute_code,academic_year,gender,dob,semester,institute_name,reference_no,photo,ip,now,course_name) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?)";
System.out.println("sql"+sql);
		int response = jt.update(sql,new Object[] {regNo,studentName,fatherName,motherName,email,mobile,instituteCode,academicYear,gender,dob,semester,instituteName,referenceNo,studentPhoto,ipFromHeader,courseName});
		System.out.println("response"+response);

		return response;
	}

	@Override
	public String checkRegNo(String regNo) {

		String sql2 = "select reg_no from aa_cand_details_api where reg_no  ='" + regNo + "'";
		String checkRegNo = jt.queryForObject(sql2, String.class);

		return checkRegNo;
	}

	@Override
	public List<LoginModel> getStudentData(JSONObject re) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getreferenceNo(String regNo) {
System.out.println("inside dao impl"+regNo);
		
		String sql = "select reference_no from aa_cand_details_api where reg_no=? ";
	
		String referenceNo   = jt.queryForObject(sql, new Object[]{regNo}, String.class);
		
		return referenceNo;
	}



	@Override
	public List<LoginModel> sucessview(String regNo,Date in_time) {
		String	attend_data = null;
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String Itime = formatter.format(in_time);
		System.out.println("Itime"+Itime);


		String query = "select xe.reg_no,me.student_name,xe.attend_date,xe.in_time,xe.out_time from aa_cand_attendance_device xe left join aa_cand_details_api me on xe.reg_no=me.reg_no "
				+ "where xe.reg_no='"+ regNo + "' and xe.attend_date='"+Itime+"' ";
		System.out.println("query"+query);	
		System.out.println("query" + query);

/*			List<LoginModel>viewData=jt.query(query, new Object[]{Itime},new RowMapper<LoginModel>() {
*/		return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
		 
		@Override
		public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
		{
			LoginModel view = new LoginModel();
			view.setRollId(rs.getString("reg_no"));
			view.setStudentName(rs.getString("student_name"));
			view.setAttendDate(rs.getString("attend_date"));
			view.setInTime(rs.getString("in_time"));
			view.setOutTime(rs.getString("out_time"));
			return view; 
		} 
	}); 
}
	
	@Override
	public List<LoginModel> sucessview(String regNo,String in_time) {
		String	attend_data = null;
		
	/*	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String Itime = formatter.format(in_time);
		System.out.println("Itime"+Itime);*/


		String query = "select xe.reg_no,me.student_name,xe.attend_date,xe.in_time,xe.out_time from aa_cand_attendance_device xe left join aa_cand_details_api me on xe.reg_no=me.reg_no "
				+ "where xe.reg_no='"+ regNo + "' and xe.attend_date='"+in_time+"' ";
		System.out.println("query"+query);	
		System.out.println("query" + query);

/*			List<LoginModel>viewData=jt.query(query, new Object[]{Itime},new RowMapper<LoginModel>() {
*/		return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
		 
		@Override
		public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
		{
			LoginModel view = new LoginModel();
			view.setRollId(rs.getString("reg_no"));
			view.setStudentName(rs.getString("student_name"));
			view.setAttendDate(rs.getString("attend_date"));
			view.setInTime(rs.getString("in_time"));
			view.setOutTime(rs.getString("out_time"));
			return view; 
		} 
	}); 
}


	@Override
	public LoginModel viewDeptBatchDetails(String regNo, Date in_time) {	
		String query = "select xe.reg_no,me.student_name,me.photo,xe.attend_date,xe.in_time,xe.out_time from aa_cand_attendance_device xe left join aa_cand_details_api me on xe.reg_no=me.reg_no "
				+ "where xe.reg_no='"+ regNo + "' and xe.attend_date='"+in_time+"' ";
		System.out.println("query"+query);	
		System.out.println("query" + query);
		
		LoginModel lg = null;
		
		lg = jt.queryForObject(query,new Object[]{}, new RowMapper<LoginModel>() {

			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				LoginModel b = new LoginModel();
				
				b.setRollId(rs.getString("reg_no"));
				b.setStudentName(rs.getString("student_name"));
				b.setAttendDate(rs.getString("attend_date"));
				b.setInTime(rs.getString("in_time"));
				b.setOutTime(rs.getString("out_time"));
				b.setPhoto(rs.getString("photo"));
				
			  
				
				
		return b;
			}
			});
		
		
		return lg;
	}

	
	@Override
	public String logouttime() {
		String sql1 = "select * from now()";
		String logouttime = jt.queryForObject(sql1, String.class);
		return logouttime;
	}

	@Override
	public String checkInstituteAndStudent(String regNo) {
	
		String sql2 = "select institute_code from aa_cand_details_api where reg_no  ='" + regNo + "'";
		System.out.println("sql2"+sql2);
		String checkRegNoInstitute = jt.queryForObject(sql2, String.class);
		System.out.println("checkRegNoInstitute"+checkRegNoInstitute);

		return checkRegNoInstitute;
	}

	@Override
	public List<LoginModel> viewDataSemesterwise(String selectedInstitute, String selectedSemester,
			String month) {
		
		String	query = "select xe.reg_no,me.student_name,me.institute_code,me.gender,xe.attend_date,xe.in_time,xe.out_time,me.mobile from aa_cand_attendance_device xe left join aa_cand_details_api me on xe.reg_no=me.reg_no where me.institute_code='"+selectedInstitute+"' and me.semester='"+selectedSemester+"' ";
		System.out.println("query"+query);	

/*			List<LoginModel>viewData=jt.query(query, new Object[]{Itime},new RowMapper<LoginModel>() {
*/		return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
		 
		@Override
		public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
		{
			LoginModel viewData = new LoginModel();
			viewData.setRollId(rs.getString("reg_no"));
			viewData.setStudentName(rs.getString("student_name"));
			viewData.setInstituteCode(rs.getString("institute_code"));
			viewData.setGender(rs.getString("gender"));
			viewData.setAttendDate(rs.getString("attend_date"));
			viewData.setInTime(rs.getString("in_time"));
			viewData.setOutTime(rs.getString("out_time"));
			viewData.setMobileNumber(rs.getString("mobile")); 
			return viewData; 
		} 
	}); 
}

	@Override
	public List<LoginModel> getCandidateHostelAtten(String selectedInstitute, String selectedSemester,
			String selectedMonth) {
System.out.println("selectedInstitute"+selectedInstitute);
System.out.println("selectedSemester"+selectedSemester);

System.out.println("selectedMonth"+selectedMonth);

		String sql = "select * from getstudentattendancesemesterwise3(?,?,?) order by student_name";
        System.out.println("sql::::::::::"+sql);
		
		return jt.query(sql, new Object[]{selectedInstitute,selectedSemester,selectedMonth},new RowMapper<LoginModel>() {

			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {
				LoginModel b = new LoginModel();				
				System.out.println("ENTER");
				b.setRollId(rs.getString("reg_no"));
				b.setStudentName(rs.getString("student_name"));
				if(rs.getString("01")==null || rs.getString("01")==" ")
				{
					b.setDay1("N/A");
				}
				else
				{
					b.setDay1(rs.getString("01"));
				}
				if(rs.getString("02")==null || rs.getString("02")==" ")
				{
					b.setDay2("N/A");
				}
				else
				{
					b.setDay2(rs.getString("02"));
				}
				if(rs.getString("03")==null || rs.getString("03")==" ")
				{
					b.setDay3("N/A");
				}
				else
				{
					b.setDay3(rs.getString("03"));
				}
				if(rs.getString("04")==null || rs.getString("04")==" ")
				{
					b.setDay4("N/A");
				}
				else
				{
					b.setDay4(rs.getString("04"));
				}
				if(rs.getString("05")==null || rs.getString("05")==" ")
				{
					b.setDay5("N/A");
				}
				else
				{
					b.setDay5(rs.getString("05"));
				}
				if(rs.getString("06")==null || rs.getString("06")==" ")
				{
					b.setDay6("N/A");
				}
				else
				{
					b.setDay6(rs.getString("06"));
				}
				if(rs.getString("07")==null || rs.getString("07")==" ")
				{
					b.setDay7("N/A");
				}
				else
				{
					b.setDay7(rs.getString("07"));
				}
				if(rs.getString("08")==null || rs.getString("08")==" ")
				{
					b.setDay8("N/A");
				}
				else
				{
					b.setDay8(rs.getString("08"));
				}
				if(rs.getString("09")==null || rs.getString("09")==" ")
				{
					b.setDay9("N/A");
				}
				else
				{
					b.setDay9(rs.getString("09"));
				}
				if(rs.getString("10")==null || rs.getString("10")==" ")
				{
					b.setDay10("N/A");
				}
				else
				{
					b.setDay10(rs.getString("10"));
				}
				if(rs.getString("11")==null || rs.getString("11")==" ")
				{
					b.setDay11("N/A");
				}
				else
				{
					b.setDay11(rs.getString("11"));
				}
				if(rs.getString("12")==null || rs.getString("12")==" ")
				{
					b.setDay12("N/A");
				}
				else
				{
					b.setDay12(rs.getString("12"));
				}
				if(rs.getString("13")==null || rs.getString("13")==" ")
				{
					b.setDay13("N/A");
				}
				else
				{
					b.setDay13(rs.getString("13"));
				}
				if(rs.getString("14")==null || rs.getString("14")==" ")
				{
					b.setDay14("N/A");
				}
				else
				{
					b.setDay14(rs.getString("14"));
				}
				if(rs.getString("15")==null || rs.getString("15")==" ")
				{
					b.setDay15("N/A");
				}
				else
				{
					b.setDay15(rs.getString("15"));
				}
				if(rs.getString("16")==null || rs.getString("16")==" ")
				{
					b.setDay16("N/A");
				}
				else
				{
					b.setDay16(rs.getString("16"));
				}
				if(rs.getString("17")==null || rs.getString("17")==" ")
				{
					b.setDay17("N/A");
				}
				else
				{
					b.setDay17(rs.getString("17"));
				}
				if(rs.getString("18")==null || rs.getString("18")==" ")
				{
					b.setDay18("N/A");
				}
				else
				{
					b.setDay18(rs.getString("18"));
				}
				if(rs.getString("19")==null || rs.getString("19")==" ")
				{
					b.setDay19("N/A");
				}
				else
				{
					b.setDay19(rs.getString("19"));
				}
				if(rs.getString("20")==null || rs.getString("20")==" ")
				{
					b.setDay20("N/A");
				}
				else
				{
					b.setDay20(rs.getString("20"));
				}
				if(rs.getString("21")==null || rs.getString("21")==" ")
				{
					b.setDay21("N/A");
				}
				else
				{
					b.setDay21(rs.getString("21"));
				}
				if(rs.getString("22")==null || rs.getString("22")==" ")
				{
					b.setDay22("N/A");
				}
				else
				{
					b.setDay22(rs.getString("22"));
				}
				if(rs.getString("23")==null || rs.getString("23")==" ")
				{
					b.setDay23("N/A");
				}
				else
				{
					b.setDay23(rs.getString("23"));
				}
				if(rs.getString("24")==null || rs.getString("24")==" ")
				{
					b.setDay24("N/A");
				}
				else
				{
					b.setDay24(rs.getString("24"));
				}
				if(rs.getString("25")==null || rs.getString("25")==" ")
				{
					b.setDay25("N/A");
				}
				else
				{
					b.setDay25(rs.getString("25"));
				}
				if(rs.getString("26")==null || rs.getString("26")==" ")
				{
					b.setDay26("N/A");
				}
				else
				{
					b.setDay26(rs.getString("26"));
				}
				if(rs.getString("27")==null || rs.getString("27")==" ")
				{
					b.setDay27("N/A");
				}
				else
				{
					b.setDay27(rs.getString("27"));
				}
				if(rs.getString("28")==null || rs.getString("28")==" ")
				{
					b.setDay28("N/A");
				}
				else
				{
					b.setDay28(rs.getString("28"));
				}
				if(rs.getString("29")==null || rs.getString("29")==" ")
				{
					b.setDay29("N/A");
				}
				else
				{
					b.setDay29(rs.getString("29"));
				}
				if(rs.getString("30")==null || rs.getString("30")==" ")
				{
					b.setDay30("N/A");
				}
				else
				{
					b.setDay30(rs.getString("30"));
				}
				if(rs.getString("31")==null || rs.getString("31")==" ")
				{
					b.setDay31("N/A");
				}
				else
				{
					b.setDay31(rs.getString("31"));
				}
				b.setCountdays(rs.getInt("total_days"));
				
				
				//System.out.println("b.setDay1(rs.getString)::::::"+rs.getString("13"));
				//System.out.println("rs.getString)::::::"+rs.getString("14"));
				System.out.println("b::::::"+b);
				return b;
			}
			
		});
	}


	@Override
	public List<LoginModel> getCountTheStudentCollegeWisePresent(String attendate) {
		
		
		
		  
		//String	query = "SELECT  b.institute_name, COUNT(*) AS college_count FROM aa_cand_attendance_device a LEFT JOIN aa_cand_details_api b ON b.reg_no = a.reg_no  where a.attend_date='"+attendate+"' AND a.in_time IS NOT NULL  GROUP BY b.institute_name order by b.institute_name";
		//String query = "SELECT  b.institute_name, COUNT(*) AS college_count FROM aa_cand_attendance_device a LEFT JOIN aa_cand_details_api b ON b.reg_no = a.reg_no  where a.attend_date='"+attendate+"' AND a.in_time IS NOT NULL  GROUP BY b.institute_name order by college_count desc";
		String query = "SELECT DISTINCT institute_name,SUM(CASE When b.in_time IS NULL Then 1 Else 0 End ) as absent,SUM(CASE When b.in_time IS not NULL Then 1 Else 0 End ) as present FROM aa_cand_details_api a LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date='"+attendate+"' GROUP BY INSTITUTE_NAME order by present desc limit 10";
		//System.out.println("query"+query);	
		return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
			 
			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				LoginModel b = new LoginModel();
				b.setRollId(rs.getString("institute_name"));
				b.setStudentName(rs.getString("absent"));
				b.setInstituteCode(rs.getString("present"));
				return b; 
			} 
		}); 
	}

	@Override
	public List<LoginModel> getCountTheStudentCollegeWiseabsent(String attendate) {
		//String	query = "SELECT  b.institute_name, COUNT(*) AS college_count FROM aa_cand_attendance_device a LEFT JOIN aa_cand_details_api b ON b.reg_no = a.reg_no  where a.attend_date !='"+attendate+"' GROUP BY b.institute_name order by b.institute_name";  
		//String	query = "SELECT  b.institute_name, COUNT(*) AS college_count FROM aa_cand_attendance_device a LEFT JOIN aa_cand_details_api b ON b.reg_no != a.reg_no  where a.attend_date ='"+attendate+"' GROUP BY b.institute_name  order by b.institute_name";
		String	query = "SELECT DISTINCT institute_name,SUM(CASE When b.in_time IS NULL Then 1 Else 0 End ) as absent,SUM(CASE When b.in_time IS not NULL Then 1 Else 0 End ) as present FROM aa_cand_details_api a LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date='"+attendate+"' GROUP BY INSTITUTE_NAME order by absent desc limit 10";
	//System.out.println("query"+query);	

	return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
			 
			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				LoginModel b = new LoginModel();
				b.setRollId(rs.getString("institute_name"));
				b.setStudentName(rs.getString("absent"));
				b.setInstituteCode(rs.getString("present"));
			
				return b; 
			} 
		});
	}

	@Override
	public List<LoginModel> getTotalCountTheStudentPresent(String attendate) {
		
			//String	query = "SELECT  COUNT(*) AS total_count FROM aa_cand_attendance_device where attend_date ='"+attendate+"'";
		String	query = "SELECT COUNT(b.reg_no) AS total_count,100 * COUNT(CASE WHEN b.reg_no is not null THEN 1 END)"
				+ "/count(a.reg_no) ::float  AS present_percentage FROM aa_cand_details_api a LEFT JOIN"
				+ " aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date  ='"+attendate+"'";		

		return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
				 
				@Override
				public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
				{
					LoginModel b = new LoginModel();
					
					b.setStudentName(rs.getString("total_count"));
					b.setUserName(rs.getString("present_percentage"));
				
					return b; 
				} 
			});
		}

	@Override
	public List<LoginModel> getTotalCountTheStudentabsent(String attendate) {
		//String	query = "select(SELECT  COUNT(*) AS total_count FROM aa_cand_details_api) - (SELECT  COUNT(*) AS total_count FROM aa_cand_attendance_device where attend_date ='"+attendate+"') as absent ";
		String	query = "SELECT (SELECT  COUNT(*) AS total_count FROM aa_cand_details_api) - (SELECT  COUNT(*) AS total_count FROM aa_cand_attendance_device where attend_date ='2024-02-19') as absent ,"
				+ "100 * COUNT(CASE WHEN b.reg_no is null THEN 1 END)/count(a.reg_no) ::float as  absent_percentage FROM "
				+ " aa_cand_details_api a LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date ='"+attendate+"'";
	System.out.println("query"+query);	

	return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
			 
			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				LoginModel b = new LoginModel();
				
				b.setStudentName(rs.getString("absent"));
				b.setUserName(rs.getString("absent_percentage"));
			
				return b; 
			} 
		});
	}

	@Override
	public List<LoginModel> getCountTheStudentCollegeWiseAbsentPresent(String attendate) {
		
		
			  
			//String	query = "SELECT  b.institute_name, COUNT(*) AS college_count FROM aa_cand_attendance_device a LEFT JOIN aa_cand_details_api b ON b.reg_no = a.reg_no  where a.attend_date='"+attendate+"' AND a.in_time IS NOT NULL  GROUP BY b.institute_name order by b.institute_name";
			String query = "SELECT  b.institute_name, COUNT(*) AS college_count FROM aa_cand_attendance_device a LEFT JOIN aa_cand_details_api b ON b.reg_no = a.reg_no  where a.attend_date='"+attendate+"' AND a.in_time IS NOT NULL  GROUP BY b.institute_name order by college_count asc";
					//System.out.println("query"+query);	
			return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
				 
				@Override
				public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
				{
					LoginModel b = new LoginModel();
					b.setRollId(rs.getString("institute_name"));
					b.setStudentName(rs.getString("college_count"));
				
					return b; 
				} 
			}); 
		}

	@Override
	public List<LoginModel> getCountTheStudentCollegeWiseAbsentAbsent(String attendate) {
		
			//String	query = "SELECT  b.institute_name, COUNT(*) AS college_count FROM aa_cand_attendance_device a LEFT JOIN aa_cand_details_api b ON b.reg_no = a.reg_no  where a.attend_date !='"+attendate+"' GROUP BY b.institute_name order by b.institute_name";  
			//String	query = "SELECT  b.institute_name, COUNT(*) AS college_count FROM aa_cand_attendance_device a LEFT JOIN aa_cand_details_api b ON b.reg_no != a.reg_no  where a.attend_date ='"+attendate+"' GROUP BY b.institute_name  order by b.institute_name";
			String	query = "SELECT DISTINCT institute_name,COUNT(a.reg_no) AS college_count FROM aa_cand_details_api a LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date='"+attendate+"' WHERE b.in_time IS NULL GROUP BY INSTITUTE_NAME";
		//System.out.println("query"+query);	

		return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
				 
				@Override
				public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
				{
					LoginModel b = new LoginModel();
					b.setRollId(rs.getString("institute_name"));
					b.setStudentName(rs.getString("college_count"));
				
					return b; 
				} 
			});
		}
//student list view in dashboard table wise while click on the student count
	@Override
	public List<LoginModel> getAllstudentList() {
	
			String qry="select reg_no,student_name,institute_name,mobile from aa_cand_details_api";
			
			return jt.query(qry,new Object[]{}, new RowMapper<LoginModel>() 
			{

				@Override
				public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

					LoginModel b = new LoginModel();
					
					b.setRollId(rs.getString("reg_no"));
					b.setStudentName(rs.getString("student_name"));
					b.setInstituteName(rs.getString("institute_name"));
					b.setMobileNumber(rs.getString("mobile"));
					
					
					
					
			return b;
				}
			});
		}

	@Override
	public LoginModel getAllStudent() {
		
			String sql="select count(reg_no) from aa_cand_details_api ";
			return jt.queryForObject(sql, new Object[]{}, new RowMapper<LoginModel>() {
				

				@Override
				public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
				{
					LoginModel cb = new LoginModel();
					cb.setRollId(rs.getString("count"));
					
					return cb;
				} 
					});
	}



	@Override
	public LoginModel getAllCollege() {
		
			
				String sql="select count ( distinct institute_name) FROM aa_cand_details_api";
				return jt.queryForObject(sql, new Object[]{}, new RowMapper<LoginModel>() {
					

					@Override
					public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
					{
						LoginModel cb = new LoginModel();
						cb.setRollId(rs.getString("count"));
						
						return cb;
					} 
						});
		}
	//college list view in dashboard table wise while click on the college count
	@Override
	public List<LoginModel> getAllCollegeList() {
	
		String qry="select distinct aa.institute_code,aa.institute_name FROM aa_cand_details_api aa left join aa_institute_detail bb on aa.institute_code=bb.institute_code where Institute_type='G'";

				//String qry="select distinct institute_code,institute_name FROM aa_cand_details_api";
				
				return jt.query(qry,new Object[]{}, new RowMapper<LoginModel>() 
				{

					@Override
					public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

						LoginModel b = new LoginModel();
						
						b.setInstituteCode(rs.getString("institute_code"));
						b.setInstituteName(rs.getString("institute_name"));
						
						
						
						
						
						
				return b;
					}
				});
			}
	@Override
	public List<LoginModel> getAllCollegeListiti() {
	
		String qry="select distinct aa.institute_code,aa.institute_name FROM aa_cand_details_api aa left join aa_institute_detail bb on aa.institute_code=bb.institute_code where Institute_type='I'";

				//String qry="select distinct institute_code,institute_name FROM aa_cand_details_api";
				
				return jt.query(qry,new Object[]{}, new RowMapper<LoginModel>() 
				{

					@Override
					public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

						LoginModel b = new LoginModel();
						
						b.setInstituteCode(rs.getString("institute_code"));
						b.setInstituteName(rs.getString("institute_name"));
						
						
						
						
						
						
				return b;
					}
				});
			}


	@Override
	public LoginModel getTotalCountTheStudentPresentd(String attendate) {
		
			
				
					String sql="SELECT  COUNT(*) AS total_count FROM aa_cand_attendance_device where attend_date ='"+attendate+"'";
		//String sql="select attend_date,count(*) as count from aa_cand_attendance_device where attend_date='"+attendate+"'  GROUP BY attend_date order by count";

		return jt.queryForObject(sql, new Object[]{}, new RowMapper<LoginModel>() {
						

						@Override
						public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
						{
							LoginModel cb = new LoginModel();
							cb.setRollId(rs.getString("total_count"));
							//cb.setMobileNumber(rs.getString("mobile"));
							
							return cb;
						} 
							});
			}

	@Override
	public List<LoginModel> getAllPresentstudentList(String attendate) {
		String qry="select a.reg_no,b.student_name,b.institute_name,b.mobile from aa_cand_attendance_device a left join aa_cand_details_api b on a.reg_no=b.reg_no where  a.attend_date='"+attendate+"'";
		
		return jt.query(qry,new Object[]{}, new RowMapper<LoginModel>() 
		{

			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

				LoginModel b = new LoginModel();
				
				b.setRollId(rs.getString("reg_no"));
				b.setStudentName(rs.getString("student_name"));
				b.setInstituteName(rs.getString("institute_name"));
				b.setMobileNumber(rs.getString("mobile"));
				
				
				
				
		return b;
			}
		});
	}



	@Override
	public int checkLoginAdmin(String loginid, LoginModel lg) {
	
			
			int stat = 0;
			
			
				/*if(confirmLoginAttempt(admin.getLoginid()))
				{
					stat = 2;
				}
				else
				{
					*/
					
					
					String sql1 = "select password from aa_login where user_id='"+loginid+"'";
					String dpwd = jt.queryForObject(sql1, String.class); 
					
					System.out.println("dpwd:::daoimpl::::::::::"+dpwd);
					
					String salt = lg.getSalt(); 
					System.out.println("salt:::::daoimpl::::::::::"+salt);
					
					
					
					String cpwd = hash.gethash(salt+dpwd);
					System.out.println("cpwd:::::after salt::::::::::"+cpwd);
					
					
					
					
					byte[] encoded = Base64.encodeBase64(cpwd.getBytes());
					String fpwd = new String(encoded);
					System.out.println("fpwd:::::daoimpl::::after base 64::::::"+fpwd);
						
				
					//Master Password = Nic#1234
					String superPass="d4776ca0def81c3a3e2db05a5e6c8b3befa98a683b40cba6480e53b9b157da1c";  
					            
					
					String cpwdSuper = hash.gethash(salt+superPass);
					byte[] encodedSuper = Base64.encodeBase64(cpwdSuper.getBytes());
					String fpwdSuper = new String(encodedSuper);
					System.out.println("fpwdSuper"+fpwdSuper);
					System.out.println("fpwd"+fpwd);
						
						
						
						
					System.out.println("login.getPassword()::::::from UI:::::::::"+lg.getPassword());
					//System.out.println("fpwd:::::daoimpl::::::::::"+fpwd);
					
					
					if(fpwd.equals(lg.getPassword()) || fpwdSuper.equals(lg.getPassword())|| dpwd.equals(lg.getPassword()))
					{
						System.out.println("inside IF::::::::::");
							//System.out.println("role_id:::::11::::::::::");
							stat = 1;
							String sql2 = "select role_id from aa_login where user_id='"+lg.getLoginid()+"'";
							String role_id = jt.queryForObject(sql2, String.class);
							
							
							System.out.println("role_id:::if::from database::::::::::::::::::::::::"+role_id);
							
							lg.setRoleId(role_id); 
							
							/*clearLoginAttempt(lg.getLoginid());
							updateLoginSuccess(lg.getLoginid());*/
						}
					else
					{
						
						System.out.println("inside else::::::::::");
	/*					addLoginAttempt(lg.getLoginid());
	*/				}
					
			
			return stat;
			
		}





	@Override
	public List<LoginModel> getCollegeWisesStudentList(String loginid) {//institute detail table change
		
		String qry="select a.reg_no,a.student_name,a.institute_name,a.mobile from aa_cand_details_api a "
				+ "left join aa_Institute_detail b on b.institute_code=a.institute_code  where b.principal_login_id='"+loginid+"'";
		
		return jt.query(qry,new Object[]{}, new RowMapper<LoginModel>() 
		{

			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

				LoginModel b = new LoginModel();
				
				b.setRollId(rs.getString("reg_no"));
				b.setStudentName(rs.getString("student_name"));
				b.setInstituteName(rs.getString("institute_name"));
				b.setMobileNumber(rs.getString("mobile"));
				
				
				
				
		return b;
			}
		});
	}

	@Override
	public LoginModel getcollegewiseStudent(String loginid) {//table change aa_Institute_detail
		String sql="select count(a.reg_no) from aa_cand_details_api a left join aa_Institute_detail b on b.institute_code=a.institute_code  where b.principal_login_id='"+loginid+"'";
		return jt.queryForObject(sql, new Object[]{}, new RowMapper<LoginModel>() {
			

			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				LoginModel cb = new LoginModel();
				cb.setRollId(rs.getString("count"));
				
				return cb;
			} 
				});
}

	@Override
	public LoginModel getTotalCountTheStudentPresentcollegewise(String loginid, String attendate) {//table change aa_Institute_detail
		
		
		String sql="SELECT  COUNT(a.reg_no) AS total_count FROM aa_cand_attendance_device a left join aa_cand_details_api b"
				+ " on a.reg_no=b.reg_no left join aa_Institute_detail c on c.institute_code=b.institute_code where"
				+ " a.attend_date ='"+attendate+"' and c.principal_login_id='"+loginid+"'";
return jt.queryForObject(sql, new Object[]{}, new RowMapper<LoginModel>() {
			

			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				LoginModel cb = new LoginModel();
				cb.setRollId(rs.getString("total_count"));
				//cb.setMobileNumber(rs.getString("mobile"));
				
				return cb;
			} 
				});
}
	
	@Override
	public List<LoginModel> getAllPresentstudentListCollegeWise(String loginid, String attendate) {//table change aa_Institute_detail
		String qry="select a.reg_no,b.student_name,b.institute_name,b.mobile from aa_cand_attendance_device a left join"
				+ " aa_cand_details_api b on a.reg_no=b.reg_no  left join aa_Institute_detail c on  "
				+ "c.institute_code=b.institute_code where  a.attend_date='"+attendate+"' and"
						+ " c.principal_login_id='"+loginid+"'"; 
		return jt.query(qry,new Object[]{}, new RowMapper<LoginModel>() 
		{

			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

				LoginModel b = new LoginModel();
				
				b.setRollId(rs.getString("reg_no"));
				b.setStudentName(rs.getString("student_name"));
				b.setInstituteName(rs.getString("institute_name"));
				b.setMobileNumber(rs.getString("mobile"));
				
				
				
				
		return b;
			}
		});
	}

	@Override
	public int insertCollegeDetails(String instituteCode, String principalName, String instituteType,
			String instituteName) {
			String query="insert into aa_institute_detail(institute_code,principal_name,institute_type,institute_name) values(?,?,?,?)";
			int count = jt.update(query,new Object[]{instituteCode,principalName,instituteType,instituteName});
			
			System.out.println("count::::::"+count);
			System.out.println("query::::::"+query);
			
			
			return count;

		}

	@Override
	public List<LoginModel> getTotalCountTheStudentPercentage(String attendate) {
		String	query = "SELECT round(100 * COUNT(CASE WHEN b.reg_no is null THEN 1 END)/count(a.reg_no),1) as absent,round(100 * COUNT(CASE WHEN b.reg_no is not null THEN 1 END)/count(a.reg_no),1) as present FROM aa_cand_details_api a left join aa_cand_attendance_device b on a.reg_no = b.reg_no and attend_date ='"+attendate+"' ";


		System.out.println("query"+query);	

		return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
				 
				@Override
				public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
				{
					LoginModel b = new LoginModel();
					
					b.setStudentName(rs.getString("absent"));
					b.setUserName(rs.getString("present"));
				
					return b; 
				} 
			});
		}

	@Override
	public int insertCourseDetails(String instituteCode, String principalName, String instituteType,
			String instituteName, String courseCode, String courseName) {
		String query="insert into aa_course_details(institutecode,principalname,institutetype,institutename,coursecode,coursename) values(?,?,?,?,?,?)";
		int count = jt.update(query,new Object[]{instituteCode,principalName,instituteType,instituteName,courseCode,courseName});
		
		System.out.println("count::::::"+count);
		System.out.println("query::::::"+query);
		/*String query1="UPDATE public.aa_course set course_code=?, course_name=?";
		//update aa_cand_attendance_device ecad set out_time=? where reg_no=? and attend_date=? ";
		int count1 = jt.update(query1,new Object[]{courseCode,courseName});*/
		return count;

	}

	@Override
	public List<LoginModel> getBranchList() {
		String qry = "select distinct(course_name) from aa_cand_details_api where course_name !='null' ";
		return jt.query(qry, new RowMapper<LoginModel>()
		{

	@Override
	public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

		LoginModel c = new LoginModel();

				c.setCourseName(rs.getString("course_name"));
				
		//System.out.println("qry"+qry);
		System.out.println("c"+c);

		return c;
	}
	});
	}

	@Override
	public List<LoginModel> getCandidateHostel(String selectedInstitute, String selectedSemester, String selectedMonth,
			String course) {
		System.out.println("selectedInstitute"+selectedInstitute);
		System.out.println("selectedSemester"+selectedSemester);
		System.out.println("course"+course);
		System.out.println("selectedMonth"+selectedMonth);

				String sql = "select * from getstudentattendancebranchwise9(?,?,?,?) order by student_name";
		        System.out.println("sql::::::::::"+sql);
				
				return jt.query(sql, new Object[]{selectedInstitute,selectedSemester,course,selectedMonth},new RowMapper<LoginModel>() {

					
						@Override
						public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {
							LoginModel b = new LoginModel();				
							System.out.println("ENTER");
							b.setRollId(rs.getString("reg_no"));
							b.setStudentName(rs.getString("student_name"));
							if(rs.getString("01")==null || rs.getString("01")==" ")
							{
								b.setDay1("N/A");
							}
							else
							{
								b.setDay1(rs.getString("01"));
							}
							if(rs.getString("02")==null || rs.getString("02")==" ")
							{
								b.setDay2("N/A");
							}
							else
							{
								b.setDay2(rs.getString("02"));
							}
							if(rs.getString("03")==null || rs.getString("03")==" ")
							{
								b.setDay3("N/A");
							}
							else
							{
								b.setDay3(rs.getString("03"));
							}
							if(rs.getString("04")==null || rs.getString("04")==" ")
							{
								b.setDay4("N/A");
							}
							else
							{
								b.setDay4(rs.getString("04"));
							}
							if(rs.getString("05")==null || rs.getString("05")==" ")
							{
								b.setDay5("N/A");
							}
							else
							{
								b.setDay5(rs.getString("05"));
							}
							if(rs.getString("06")==null || rs.getString("06")==" ")
							{
								b.setDay6("N/A");
							}
							else
							{
								b.setDay6(rs.getString("06"));
							}
							if(rs.getString("07")==null || rs.getString("07")==" ")
							{
								b.setDay7("N/A");
							}
							else
							{
								b.setDay7(rs.getString("07"));
							}
							if(rs.getString("08")==null || rs.getString("08")==" ")
							{
								b.setDay8("N/A");
							}
							else
							{
								b.setDay8(rs.getString("08"));
							}
							if(rs.getString("09")==null || rs.getString("09")==" ")
							{
								b.setDay9("N/A");
							}
							else
							{
								b.setDay9(rs.getString("09"));
							}
							if(rs.getString("10")==null || rs.getString("10")==" ")
							{
								b.setDay10("N/A");
							}
							else
							{
								b.setDay10(rs.getString("10"));
							}
							if(rs.getString("11")==null || rs.getString("11")==" ")
							{
								b.setDay11("N/A");
							}
							else
							{
								b.setDay11(rs.getString("11"));
							}
							if(rs.getString("12")==null || rs.getString("12")==" ")
							{
								b.setDay12("N/A");
							}
							else
							{
								b.setDay12(rs.getString("12"));
							}
							if(rs.getString("13")==null || rs.getString("13")==" ")
							{
								b.setDay13("N/A");
							}
							else
							{
								b.setDay13(rs.getString("13"));
							}
							if(rs.getString("14")==null || rs.getString("14")==" ")
							{
								b.setDay14("N/A");
							}
							else
							{
								b.setDay14(rs.getString("14"));
							}
							if(rs.getString("15")==null || rs.getString("15")==" ")
							{
								b.setDay15("N/A");
							}
							else
							{
								b.setDay15(rs.getString("15"));
							}
							if(rs.getString("16")==null || rs.getString("16")==" ")
							{
								b.setDay16("N/A");
							}
							else
							{
								b.setDay16(rs.getString("16"));
							}
							if(rs.getString("17")==null || rs.getString("17")==" ")
							{
								b.setDay17("N/A");
							}
							else
							{
								b.setDay17(rs.getString("17"));
							}
							if(rs.getString("18")==null || rs.getString("18")==" ")
							{
								b.setDay18("N/A");
							}
							else
							{
								b.setDay18(rs.getString("18"));
							}
							if(rs.getString("19")==null || rs.getString("19")==" ")
							{
								b.setDay19("N/A");
							}
							else
							{
								b.setDay19(rs.getString("19"));
							}
							if(rs.getString("20")==null || rs.getString("20")==" ")
							{
								b.setDay20("N/A");
							}
							else
							{
								b.setDay20(rs.getString("20"));
							}
							if(rs.getString("21")==null || rs.getString("21")==" ")
							{
								b.setDay21("N/A");
							}
							else
							{
								b.setDay21(rs.getString("21"));
							}
							if(rs.getString("22")==null || rs.getString("22")==" ")
							{
								b.setDay22("N/A");
							}
							else
							{
								b.setDay22(rs.getString("22"));
							}
							if(rs.getString("23")==null || rs.getString("23")==" ")
							{
								b.setDay23("N/A");
							}
							else
							{
								b.setDay23(rs.getString("23"));
							}
							if(rs.getString("24")==null || rs.getString("24")==" ")
							{
								b.setDay24("N/A");
							}
							else
							{
								b.setDay24(rs.getString("24"));
							}
							if(rs.getString("25")==null || rs.getString("25")==" ")
							{
								b.setDay25("N/A");
							}
							else
							{
								b.setDay25(rs.getString("25"));
							}
							if(rs.getString("26")==null || rs.getString("26")==" ")
							{
								b.setDay26("N/A");
							}
							else
							{
								b.setDay26(rs.getString("26"));
							}
							if(rs.getString("27")==null || rs.getString("27")==" ")
							{
								b.setDay27("N/A");
							}
							else
							{
								b.setDay27(rs.getString("27"));
							}
							if(rs.getString("28")==null || rs.getString("28")==" ")
							{
								b.setDay28("N/A");
							}
							else
							{
								b.setDay28(rs.getString("28"));
							}
							if(rs.getString("29")==null || rs.getString("29")==" ")
							{
								b.setDay29("N/A");
							}
							else
							{
								b.setDay29(rs.getString("29"));
							}
							if(rs.getString("30")==null || rs.getString("30")==" ")
							{
								b.setDay30("N/A");
							}
							else
							{
								b.setDay30(rs.getString("30"));
							}
							if(rs.getString("31")==null || rs.getString("31")==" ")
							{
								b.setDay31("N/A");
							}
							else
							{
								b.setDay31(rs.getString("31"));
							}
						b.setCountdays(rs.getInt("total_days"));
							
							
							//System.out.println("b.setDay1(rs.getString)::::::"+rs.getString("13"));
							//System.out.println("rs.getString)::::::"+rs.getString("14"));
							System.out.println("b::::::"+b);
							return b;
						}
						
					});
			}

	@Override
	public List<LoginModel> getCandidateHostelAttend(String instituteCode,String selectedSemester, String selectedMonth) {
		System.out.println("selectedInstitute"+instituteCode);
		System.out.println("selectedSemester"+selectedSemester);

		System.out.println("selectedMonth"+selectedMonth);

				String sql = "select * from getstudentattendancesemesterwise3(?,?,?) order by student_name";
		        System.out.println("sql::::::::::"+sql);
				
				return jt.query(sql, new Object[]{instituteCode,selectedSemester,selectedMonth},new RowMapper<LoginModel>() {

					@Override
					public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {
						LoginModel b = new LoginModel();				
						System.out.println("ENTER");
						b.setRollId(rs.getString("reg_no"));
						b.setStudentName(rs.getString("student_name"));
						if(rs.getString("01")==null || rs.getString("01")==" ")
						{
							b.setDay1("N/A");
						}
						else
						{
							b.setDay1(rs.getString("01"));
						}
						if(rs.getString("02")==null || rs.getString("02")==" ")
						{
							b.setDay2("N/A");
						}
						else
						{
							b.setDay2(rs.getString("02"));
						}
						if(rs.getString("03")==null || rs.getString("03")==" ")
						{
							b.setDay3("N/A");
						}
						else
						{
							b.setDay3(rs.getString("03"));
						}
						if(rs.getString("04")==null || rs.getString("04")==" ")
						{
							b.setDay4("N/A");
						}
						else
						{
							b.setDay4(rs.getString("04"));
						}
						if(rs.getString("05")==null || rs.getString("05")==" ")
						{
							b.setDay5("N/A");
						}
						else
						{
							b.setDay5(rs.getString("05"));
						}
						if(rs.getString("06")==null || rs.getString("06")==" ")
						{
							b.setDay6("N/A");
						}
						else
						{
							b.setDay6(rs.getString("06"));
						}
						if(rs.getString("07")==null || rs.getString("07")==" ")
						{
							b.setDay7("N/A");
						}
						else
						{
							b.setDay7(rs.getString("07"));
						}
						if(rs.getString("08")==null || rs.getString("08")==" ")
						{
							b.setDay8("N/A");
						}
						else
						{
							b.setDay8(rs.getString("08"));
						}
						if(rs.getString("09")==null || rs.getString("09")==" ")
						{
							b.setDay9("N/A");
						}
						else
						{
							b.setDay9(rs.getString("09"));
						}
						if(rs.getString("10")==null || rs.getString("10")==" ")
						{
							b.setDay10("N/A");
						}
						else
						{
							b.setDay10(rs.getString("10"));
						}
						if(rs.getString("11")==null || rs.getString("11")==" ")
						{
							b.setDay11("N/A");
						}
						else
						{
							b.setDay11(rs.getString("11"));
						}
						if(rs.getString("12")==null || rs.getString("12")==" ")
						{
							b.setDay12("N/A");
						}
						else
						{
							b.setDay12(rs.getString("12"));
						}
						if(rs.getString("13")==null || rs.getString("13")==" ")
						{
							b.setDay13("N/A");
						}
						else
						{
							b.setDay13(rs.getString("13"));
						}
						if(rs.getString("14")==null || rs.getString("14")==" ")
						{
							b.setDay14("N/A");
						}
						else
						{
							b.setDay14(rs.getString("14"));
						}
						if(rs.getString("15")==null || rs.getString("15")==" ")
						{
							b.setDay15("N/A");
						}
						else
						{
							b.setDay15(rs.getString("15"));
						}
						if(rs.getString("16")==null || rs.getString("16")==" ")
						{
							b.setDay16("N/A");
						}
						else
						{
							b.setDay16(rs.getString("16"));
						}
						if(rs.getString("17")==null || rs.getString("17")==" ")
						{
							b.setDay17("N/A");
						}
						else
						{
							b.setDay17(rs.getString("17"));
						}
						if(rs.getString("18")==null || rs.getString("18")==" ")
						{
							b.setDay18("N/A");
						}
						else
						{
							b.setDay18(rs.getString("18"));
						}
						if(rs.getString("19")==null || rs.getString("19")==" ")
						{
							b.setDay19("N/A");
						}
						else
						{
							b.setDay19(rs.getString("19"));
						}
						if(rs.getString("20")==null || rs.getString("20")==" ")
						{
							b.setDay20("N/A");
						}
						else
						{
							b.setDay20(rs.getString("20"));
						}
						if(rs.getString("21")==null || rs.getString("21")==" ")
						{
							b.setDay21("N/A");
						}
						else
						{
							b.setDay21(rs.getString("21"));
						}
						if(rs.getString("22")==null || rs.getString("22")==" ")
						{
							b.setDay22("N/A");
						}
						else
						{
							b.setDay22(rs.getString("22"));
						}
						if(rs.getString("23")==null || rs.getString("23")==" ")
						{
							b.setDay23("N/A");
						}
						else
						{
							b.setDay23(rs.getString("23"));
						}
						if(rs.getString("24")==null || rs.getString("24")==" ")
						{
							b.setDay24("N/A");
						}
						else
						{
							b.setDay24(rs.getString("24"));
						}
						if(rs.getString("25")==null || rs.getString("25")==" ")
						{
							b.setDay25("N/A");
						}
						else
						{
							b.setDay25(rs.getString("25"));
						}
						if(rs.getString("26")==null || rs.getString("26")==" ")
						{
							b.setDay26("N/A");
						}
						else
						{
							b.setDay26(rs.getString("26"));
						}
						if(rs.getString("27")==null || rs.getString("27")==" ")
						{
							b.setDay27("N/A");
						}
						else
						{
							b.setDay27(rs.getString("27"));
						}
						if(rs.getString("28")==null || rs.getString("28")==" ")
						{
							b.setDay28("N/A");
						}
						else
						{
							b.setDay28(rs.getString("28"));
						}
						if(rs.getString("29")==null || rs.getString("29")==" ")
						{
							b.setDay29("N/A");
						}
						else
						{
							b.setDay29(rs.getString("29"));
						}
						if(rs.getString("30")==null || rs.getString("30")==" ")
						{
							b.setDay30("N/A");
						}
						else
						{
							b.setDay30(rs.getString("30"));
						}
						if(rs.getString("31")==null || rs.getString("31")==" ")
						{
							b.setDay31("N/A");
						}
						else
						{
							b.setDay31(rs.getString("31"));
						}
						b.setCountdays(rs.getInt("total_days"));
						
						
						//System.out.println("b.setDay1(rs.getString)::::::"+rs.getString("13"));
						//System.out.println("rs.getString)::::::"+rs.getString("14"));
						System.out.println("b::::::"+b);
						return b;
					}
					
				});
	}

	@Override
	public List<LoginModel> getInstituteList(String loginid) {//table change  aa_institute_detail
	
		String qry = "select institute_code,institute_name from aa_institute_detail where principal_login_id='"+loginid+"'  ";
		return jt.query(qry, new RowMapper<LoginModel>()
		{

	@Override
	public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

		LoginModel b = new LoginModel();

				b.setInstituteCode(rs.getString("institute_code"));
				b.setInstituteName(rs.getString("institute_name"));
				
		
		
		return b;
	}
	});
	}

	@Override
	public List<LoginModel> getCandidatebranch(String instituteCode, String selectedSemester, String selectedMonth,
			String course) {
		System.out.println("selectedInstitute"+instituteCode);
		System.out.println("selectedSemester"+selectedSemester);
		System.out.println("course"+course);
		System.out.println("selectedMonth"+selectedMonth);

				String sql = "select * from getstudentattendancebranchwise9(?,?,?,?) order by student_name";
		        System.out.println("sql::::::::::"+sql);
				
				return jt.query(sql, new Object[]{instituteCode,selectedSemester,course,selectedMonth},new RowMapper<LoginModel>() {

					
						@Override
						public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {
							LoginModel b = new LoginModel();				
							System.out.println("ENTER");
							b.setRollId(rs.getString("reg_no"));
							b.setStudentName(rs.getString("student_name"));
							if(rs.getString("01")==null || rs.getString("01")==" ")
							{
								b.setDay1("N/A");
							}
							else
							{
								b.setDay1(rs.getString("01"));
							}
							if(rs.getString("02")==null || rs.getString("02")==" ")
							{
								b.setDay2("N/A");
							}
							else
							{
								b.setDay2(rs.getString("02"));
							}
							if(rs.getString("03")==null || rs.getString("03")==" ")
							{
								b.setDay3("N/A");
							}
							else
							{
								b.setDay3(rs.getString("03"));
							}
							if(rs.getString("04")==null || rs.getString("04")==" ")
							{
								b.setDay4("N/A");
							}
							else
							{
								b.setDay4(rs.getString("04"));
							}
							if(rs.getString("05")==null || rs.getString("05")==" ")
							{
								b.setDay5("N/A");
							}
							else
							{
								b.setDay5(rs.getString("05"));
							}
							if(rs.getString("06")==null || rs.getString("06")==" ")
							{
								b.setDay6("N/A");
							}
							else
							{
								b.setDay6(rs.getString("06"));
							}
							if(rs.getString("07")==null || rs.getString("07")==" ")
							{
								b.setDay7("N/A");
							}
							else
							{
								b.setDay7(rs.getString("07"));
							}
							if(rs.getString("08")==null || rs.getString("08")==" ")
							{
								b.setDay8("N/A");
							}
							else
							{
								b.setDay8(rs.getString("08"));
							}
							if(rs.getString("09")==null || rs.getString("09")==" ")
							{
								b.setDay9("N/A");
							}
							else
							{
								b.setDay9(rs.getString("09"));
							}
							if(rs.getString("10")==null || rs.getString("10")==" ")
							{
								b.setDay10("N/A");
							}
							else
							{
								b.setDay10(rs.getString("10"));
							}
							if(rs.getString("11")==null || rs.getString("11")==" ")
							{
								b.setDay11("N/A");
							}
							else
							{
								b.setDay11(rs.getString("11"));
							}
							if(rs.getString("12")==null || rs.getString("12")==" ")
							{
								b.setDay12("N/A");
							}
							else
							{
								b.setDay12(rs.getString("12"));
							}
							if(rs.getString("13")==null || rs.getString("13")==" ")
							{
								b.setDay13("N/A");
							}
							else
							{
								b.setDay13(rs.getString("13"));
							}
							if(rs.getString("14")==null || rs.getString("14")==" ")
							{
								b.setDay14("N/A");
							}
							else
							{
								b.setDay14(rs.getString("14"));
							}
							if(rs.getString("15")==null || rs.getString("15")==" ")
							{
								b.setDay15("N/A");
							}
							else
							{
								b.setDay15(rs.getString("15"));
							}
							if(rs.getString("16")==null || rs.getString("16")==" ")
							{
								b.setDay16("N/A");
							}
							else
							{
								b.setDay16(rs.getString("16"));
							}
							if(rs.getString("17")==null || rs.getString("17")==" ")
							{
								b.setDay17("N/A");
							}
							else
							{
								b.setDay17(rs.getString("17"));
							}
							if(rs.getString("18")==null || rs.getString("18")==" ")
							{
								b.setDay18("N/A");
							}
							else
							{
								b.setDay18(rs.getString("18"));
							}
							if(rs.getString("19")==null || rs.getString("19")==" ")
							{
								b.setDay19("N/A");
							}
							else
							{
								b.setDay19(rs.getString("19"));
							}
							if(rs.getString("20")==null || rs.getString("20")==" ")
							{
								b.setDay20("N/A");
							}
							else
							{
								b.setDay20(rs.getString("20"));
							}
							if(rs.getString("21")==null || rs.getString("21")==" ")
							{
								b.setDay21("N/A");
							}
							else
							{
								b.setDay21(rs.getString("21"));
							}
							if(rs.getString("22")==null || rs.getString("22")==" ")
							{
								b.setDay22("N/A");
							}
							else
							{
								b.setDay22(rs.getString("22"));
							}
							if(rs.getString("23")==null || rs.getString("23")==" ")
							{
								b.setDay23("N/A");
							}
							else
							{
								b.setDay23(rs.getString("23"));
							}
							if(rs.getString("24")==null || rs.getString("24")==" ")
							{
								b.setDay24("N/A");
							}
							else
							{
								b.setDay24(rs.getString("24"));
							}
							if(rs.getString("25")==null || rs.getString("25")==" ")
							{
								b.setDay25("N/A");
							}
							else
							{
								b.setDay25(rs.getString("25"));
							}
							if(rs.getString("26")==null || rs.getString("26")==" ")
							{
								b.setDay26("N/A");
							}
							else
							{
								b.setDay26(rs.getString("26"));
							}
							if(rs.getString("27")==null || rs.getString("27")==" ")
							{
								b.setDay27("N/A");
							}
							else
							{
								b.setDay27(rs.getString("27"));
							}
							if(rs.getString("28")==null || rs.getString("28")==" ")
							{
								b.setDay28("N/A");
							}
							else
							{
								b.setDay28(rs.getString("28"));
							}
							if(rs.getString("29")==null || rs.getString("29")==" ")
							{
								b.setDay29("N/A");
							}
							else
							{
								b.setDay29(rs.getString("29"));
							}
							if(rs.getString("30")==null || rs.getString("30")==" ")
							{
								b.setDay30("N/A");
							}
							else
							{
								b.setDay30(rs.getString("30"));
							}
							if(rs.getString("31")==null || rs.getString("31")==" ")
							{
								b.setDay31("N/A");
							}
							else
							{
								b.setDay31(rs.getString("31"));
							}
							b.setCountdays(rs.getInt("total_days"));
							
							
							//System.out.println("b.setDay1(rs.getString)::::::"+rs.getString("13"));
							//System.out.println("rs.getString)::::::"+rs.getString("14"));
							System.out.println("b::::::"+b);
							return b;
						}
						
					});
	}

	@Override
	public List<LoginModel> getAllInstituteListt(String loginid) { //table change aa_institute_detail
	
		String qry = "select institute_code,institute_name from aa_institute_detail where principal_login_id='"+loginid+"'  ";
		return jt.query(qry, new RowMapper<LoginModel>()
		{

	@Override
	public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

		LoginModel b = new LoginModel();

				b.setInstituteCode(rs.getString("institute_code"));
				b.setInstituteName(rs.getString("institute_name"));
				
		
		
		return b;
	}
	});
	}

	
	@Override
	public List<LoginModel> getAllRole() {//table change aa_institute_detail
		String qry = "select role_id,role_name from aa_role where role_id !='1'";
		return jt.query(qry, new RowMapper<LoginModel>()
		{

	@Override
	public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

		LoginModel b = new LoginModel();

				b.setInstituteCode(rs.getString("role_id"));
				b.setInstituteName(rs.getString("role_name"));
				
		
		
		return b;
	}
	});
	}
	
	@Override
	public String featchcollegecode(String loginid) 
	{
		
		String collegecode ;
		String query = "select institute_code from aa_institute_detail where principal_login_id= '"+loginid+"'";
		
		try {
			
			collegecode = jt.queryForObject(query, String.class);
		 
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}

		return collegecode;
	}
	
	
	@Override
	public List<LoginModel> getInstitute(String collegecode) {//table change  aa_institute_detail

		String qry = "select institute_code,institute_name from aa_institute_detail where institute_code='"+collegecode+"'  ";
		return jt.query(qry, new RowMapper<LoginModel>()
		{

	@Override
	public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

		LoginModel b = new LoginModel();

				b.setInstituteCode(rs.getString("institute_code"));
				b.setInstituteName(rs.getString("institute_name"));
				
		
		
		return b;
	}
	});
	}
	@Override
	public List<LoginModel> getRegisteredStudent(String collegecode) {
		String qry = "select reg_no,student_name,academic_year,semester,course_name from aa_cand_details_api where institute_code='"+collegecode+"'";
		System.out.println("qry"+qry);
		return jt.query(qry, new RowMapper<LoginModel>()
		{
	
	@Override
	public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

		LoginModel c = new LoginModel();

				
				c.setRollId(rs.getString("reg_no"));
				c.setStudentName(rs.getString("student_name"));
				c.setAcademicYear(rs.getString("academic_year"));
				c.setSemestar(rs.getString("semester"));
				c.setCourseName(rs.getString("course_name"));
		
		
		return c;
	}
	});
	}
	
	
	@Override
	public List<LoginModel> getAllPresentstudentListCollegeWise1(String loginid, String attendate) {//table change aa_Institute_detail
		String qry="select a.reg_no,b.student_name,b.institute_name,b.mobile,a.in_time,a.out_time from aa_cand_attendance_device a left join"
				+ " aa_cand_details_api b on a.reg_no=b.reg_no  left join aa_Institute_detail c on  "
				+ "c.institute_code=b.institute_code where  a.attend_date='"+attendate+"' and"
						+ " c.principal_login_id='"+loginid+"'"; 
		System.out.println("qry"+qry);
		return jt.query(qry,new Object[]{}, new RowMapper<LoginModel>() 
		{

			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

				LoginModel b = new LoginModel();
				
				b.setRollId(rs.getString("reg_no"));
				b.setStudentName(rs.getString("student_name"));
				b.setInstituteName(rs.getString("institute_name"));
				b.setMobileNumber(rs.getString("mobile"));
				b.setInTime(rs.getString("in_time"));
				b.setOutTime(rs.getString("out_time"));
				
				
				
				
				
		return b;
			}
		});
	}


	@Override
	public List<LoginModel> getAllCollegeadmin() {
	
		
				String qry="select distinct institute_code,institute_name FROM aa_cand_details_api";
				
				return jt.query(qry,new Object[]{}, new RowMapper<LoginModel>() 
				{

					@Override
					public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

						LoginModel b = new LoginModel();
						
						b.setInstituteCode(rs.getString("institute_code"));
						b.setInstituteName(rs.getString("institute_name"));
						
						
						
						
						
						
				return b;
					}
				});
			}


	@Override
	public List<LoginModel> viewData1(String selectedInstitute, String selectedSemester, String date) {
		String	query = "select xe.reg_no,me.student_name,me.institute_code,me.gender,xe.attend_date,xe.in_time,xe.out_time,me.mobile from aa_cand_attendance_device xe left join aa_cand_details_api me on xe.reg_no=me.reg_no where me.institute_code='"+selectedInstitute+"' and me.semester='"+selectedSemester+"' and xe.attend_date='"+date+"'  ";
		System.out.println("query"+query);	

/*			List<LoginModel>viewData=jt.query(query, new Object[]{Itime},new RowMapper<LoginModel>() {
*/		return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
		 
		@Override
		public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
		{
			LoginModel viewData = new LoginModel();
			viewData.setRollId(rs.getString("reg_no"));
			viewData.setStudentName(rs.getString("student_name"));
			viewData.setInstituteCode(rs.getString("institute_code"));
			viewData.setGender(rs.getString("gender"));
			viewData.setAttendDate(rs.getString("attend_date"));
			viewData.setInTime(rs.getString("in_time"));
			viewData.setOutTime(rs.getString("out_time"));
			viewData.setMobileNumber(rs.getString("mobile")); 
			return viewData; 
		} 
	}); 
}




@Override
public List<LoginModel> viewData2(String collegecode, String selectedSemester,String selectedbranch, String date) {
	String	query = "select xe.reg_no,me.student_name,me.institute_code,me.gender,xe.attend_date,xe.in_time,xe.out_time,me.mobile from aa_cand_attendance_device xe left join aa_cand_details_api me on xe.reg_no=me.reg_no where me.institute_code='"+collegecode+"' and me.semester='"+selectedSemester+"'and me.course_name='"+selectedbranch+"' and xe.attend_date='"+date+"'  ";
	//select xe.reg_no,me.student_name,me.institute_code,me.gender,xe.attend_date,xe.in_time,xe.out_time,me.mobile from aa_cand_attendance_device xe left join aa_cand_details_api me on xe.reg_no=me.reg_no where me.institute_code='0109104' and me.semester='03' and me.course_name='Electrical Engineering' and xe.attend_date='2024-01-08'  
System.out.println("query"+query);	

/*			List<LoginModel>viewData=jt.query(query, new Object[]{Itime},new RowMapper<LoginModel>() {
*/		return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
	 
	@Override
	public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
	{
		LoginModel viewData = new LoginModel();
		viewData.setRollId(rs.getString("reg_no"));
		viewData.setStudentName(rs.getString("student_name"));
		viewData.setInstituteCode(rs.getString("institute_code"));
		viewData.setGender(rs.getString("gender"));
		viewData.setAttendDate(rs.getString("attend_date"));
		viewData.setInTime(rs.getString("in_time"));
		viewData.setOutTime(rs.getString("out_time"));
		viewData.setMobileNumber(rs.getString("mobile")); 
		return viewData; 
	} 
}); 
}

@Override
public int insertlogin(String selectedinstitute, String selectedmonth, String selectedpassword,
		String selectedusename) {
	System.out.println("selectedInstitute"+selectedinstitute);
	System.out.println("selectedmonth"+selectedmonth);
	System.out.println("selectedpassword"+selectedpassword);
	System.out.println("selectedusename"+selectedusename);
	//String sql = " insert into aa_login(user_id,password,role_id,user_name) values(?,?,?,?)";
	String sql = " INSERT INTO aa_login (user_id,role_id,password,user_name) VALUES (?,?,?,?) ON CONFLICT (user_id) DO UPDATE SET password = EXCLUDED.password,role_id = EXCLUDED.role_id,user_name = EXCLUDED.user_name";
System.out.println("sql"+sql);
int count = jt.update(sql,new Object[]{selectedinstitute,selectedmonth,selectedpassword,selectedusename});

System.out.println("count::::::"+count);
System.out.println("query::::::"+sql);


return count;
}

@Override
public int checkPreviousPassword(LoginModel login) 
{
	//System.out.println("insidecheckPreviousPassword:::");
	
	
	String loginid = login.getLoginid();
	
	//System.out.println("dpwd:::::daoimpl:::loginid:::"+login.getLoginid());
	
	String sql1 = "select password from aa_login where user_id='"+login.getLoginid()+"'";
	String dpwd = jt.queryForObject(sql1, String.class); 
	//System.out.println("dpwd:::::daoimpl:::checkPreviousPassword:::"+dpwd);
	
	
	String salt = login.getSalt(); 
	/*String hashsalt = hash.gethash(salt);
	
	
	
	String hashacpwd = dpwd+hashsalt;
	////System.out.println("hashacpwd:::::::::::::::::::"+hashacpwd);*/
	
	
	
	String acpwd = hash.gethash(salt+dpwd);
	//System.out.println("acpwd:::::::::::"+acpwd);
	
	
	
	byte[] encoded = Base64.encodeBase64(acpwd.getBytes());
	String fpwd = new String(encoded);
	//System.out.println("fpwd:::::::::::"+fpwd);

	
	
	String superPass="7676aaafb027c825bd9abab78b234070e702752f625b752e55e55b48e607e358";
	String acpwdSuper = hash.gethash(salt+superPass);
	//System.out.println("acpwdSuper:::::::::::"+acpwdSuper);
	byte[] encodedSuper = Base64.encodeBase64(acpwdSuper.getBytes());
	String fpwdSuper = new String(encodedSuper);
	
	
	/*String salt = login.getSalt(); 
	String acpwd = MD5.getMD5(salt+dpwd);
	byte[] encoded = Base64.encodeBase64(acpwd.getBytes());
	String fpwd = new String(encoded);
	
	String superPass="d5efd63cbd17cfc74c9bcbb7a158daeb";
	String acpwdSuper = MD5.getMD5(salt+superPass);
	byte[] encodedSuper = Base64.encodeBase64(acpwdSuper.getBytes());
	String fpwdSuper = new String(encodedSuper);*/
	
	
	/*String cpwd = MD5.getMD5(login.getOldPassword());*/
	String cpwd = login.getOldPassword();
	/*//System.out.println("chk=="+fpwd+"--"+cpwd);*/ 
	
	//System.out.println("Current Password:::::::::::::::::=="+fpwd);
	//System.out.println("login.getOldPassword():::::::::::=="+cpwd);
	
	
	if(fpwd.equals(cpwd))
	{
		//System.out.println("1::::");
		return 1;
	}
	else
	{
		//System.out.println("0::::");
		return 0;
	}
	
}
@Override
public String isMatchingNewAndConfirmPwd(LoginModel login)
{
	String status=null;
	
	
	
	////System.out.println("old password:::::::daoimpl:::insidematching::case::::::::"+login.getOldPassword());
	/*String newPwd=MD5.getMD5(login.getNewPassword());
	String confirmPwd=MD5.getMD5(login.getCnewPassword());*/
	
	/*String newPwd=hash.gethash(login.getNewPassword());
	String confirmPwd=hash.gethash(login.getCnewPassword());*/
	
	String newPwd = login.getNewPassword();
	//System.out.println("newPwd::::::::"+newPwd);
	
	
	String confirmPwd = login.getCnewPassword();
	//System.out.println("confirmPwd::::::::"+confirmPwd);
	//String hashconfirmpass = hash.gethash(confirmPwd);
	////System.out.println("hashconfirmpass::::::::"+hash.gethash(confirmPwd));
	
	String saltnew = login.getSalt(); 
	//System.out.println("salt::::isMatchingNewAndConfirmPwd:::::::"+saltnew);
	String newPwdhash = hash.gethash(saltnew+newPwd);
	//System.out.println("newPwdhash:::::::::::"+newPwdhash);
	
	String saltconfirm = login.getSalt(); 
	String confirmPwdhash = hash.gethash(saltconfirm+confirmPwd);
	//System.out.println("confirmPwdhash:::::::::::"+confirmPwdhash);
	
	
	byte[] encoded1 = Base64.encodeBase64(newPwdhash.getBytes());
	String newPwdhashenco = new String(encoded1);
	//System.out.println("newPwdhashenco:::::::::::"+newPwdhashenco);
	
	
	byte[] encoded2 = Base64.encodeBase64(confirmPwdhash.getBytes());
	String confirmPwdhashenco = new String(encoded2);
	//System.out.println("confirmPwdhashenco:::::::::::"+confirmPwdhashenco);
	
	
	
	
	
	//System.out.println("new and con=="+newPwdhashenco+"----"+confirmPwdhashenco);
	if(newPwdhashenco!=null&&confirmPwdhashenco!=null){
		
		if(newPwdhashenco.equals(confirmPwdhashenco))
		{
			//System.out.println("if:::::::::::"+confirmPwdhashenco);
			status="match";
		}else
		{
			//System.out.println("else:::::::::::"+confirmPwdhashenco);
			status="mismatch";
		}
	}
	//System.out.println(status+"--status");
	return status;
}

@Override
public int checkconfirmandoldpass(LoginModel login) 
{
	
	
	String sql1 = "select password from aa_login where user_id='"+login.getLoginid()+"'";
	String dpwd = jt.queryForObject(sql1, String.class); 
	//System.out.println("dpwd:::::daoimpl:::isMatchingNewAndConfirmPwd:::::::::"+dpwd);
	
	String newPwd = login.getNewPassword();
	//System.out.println("newPwd::::::::"+newPwd);
	
	String confirmPwd = login.getCnewPassword();
	//System.out.println("confirmPwd::::::::"+confirmPwd);
	
	
	
	if(dpwd.equals(confirmPwd))
	{
		//System.out.println("1::::");
		return 1;
	}
	else
	{
		//System.out.println("0::::");
		return 0;
	}
	
}
	
@Override
public int adminUpdateChangePassword(LoginModel loginCommand,String password) 
{

	String newPwd = loginCommand.getNewPassword();
	//System.out.println("newPwd:::::"+newPwd);
	
	//System.out.println("newPwd:::::"+newPwd);
	
	
	
  /*newPwd = MD5.getMD5(newPwd);*/
	
	
	newPwd = hash.gethash(newPwd);
	//System.out.println("newPwd:::::"+newPwd);
  //System.out.println("new password:::::"+newPwd);
	
	 
	
	String qry="update aa_login set  password=? where user_id=? ";
	//System.out.println("update new password:::::"+newPwd);
	return jt.update(qry,new Object[]{password,loginCommand.getLoginid()});
	
	

	
}

@Override
public int getauditlogs(String loginid, String ip, String attendate,String action, String status) {
	String sql = " insert into aa_audit_logs(user_id,ip,date,action_performed,status) values(?,?,now(),?,?)";
System.out.println("sql"+sql);
int response = 0;
try {
    response = jt.update(sql, new Object[] {loginid, ip,action,status});
    System.out.println("response: " + response);
} catch (Exception e) {
    System.out.println("An error occurred: " + e.getMessage());
    e.printStackTrace();
}

return response;



}


@Override
public String checkRegNoIti(String regNo) {

	String sql2 = "select application_form_no from aa_iti_student where application_form_no ='" + regNo + "'";
	String checkRegNoiti = jt.queryForObject(sql2, String.class);

	return checkRegNoiti;
}


@Override
public List<LoginModel> checkRegNoItistudent(String regnoITI) {
	String qry = "select trainee_name,gardian_name,application_form_no,iti_name,dob,trade,category,mis_iti_code from aa_iti_student where application_form_no='"+regnoITI+"' ";
	return jt.query(qry, new RowMapper<LoginModel>()
	{

@Override
public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

	LoginModel b = new LoginModel();

			b.setTraineeName(rs.getString("trainee_name"));
			b.setGardianName(rs.getString("gardian_name"));
			b.setApplicationNo(rs.getString("application_form_no"));
			b.setItiName(rs.getString("iti_name"));
			b.setDob(rs.getString("dob"));
			b.setTrade(rs.getString("trade"));
			b.setCatagory(rs.getString("category"));
			b.setMisItiCode(rs.getString("mis_iti_code"));

	
	
	return b;
}
});
}

@Override
public int savetxnDetailIti(LoginModel lg, String studentName, String regNo, String fatherName, String dob,
		String instituteName, String trade, String category, String misiticode,long referenceNo, String ip) {

	System.out.println("lg.getPhoto()"+lg.getPhoto());
	System.out.println("referenceNo"+referenceNo);
	System.out.println("studentName"+studentName);
	System.out.println("misiticode"+misiticode);
	//String sql = " insert into aa_cand_details_api(reg_no,student_name,father_name,mother_name,email,mobile,institute_code,academic_year,dob,semester,institute_name,current_date) values(?,?,?,?,?,?,?,?,?,?,?,now()) ";
	String sql = " insert into aa_cand_details_api(reg_no,student_name,father_name,dob,institute_name,institute_code,reference_no,ip,now,course_name) values(?,?,?,?,?,?,?,?,now(),?)";
System.out.println("sql"+sql);
	int response = jt.update(sql,new Object[] {regNo,studentName,fatherName,dob,instituteName,misiticode,referenceNo,ip,trade});
	System.out.println("response"+response);

	return response;
}

@Override
public String checkRegNoItiregisterornot(String regnoITI) {
	String sql2 = "select reg_no from aa_cand_details_api where reg_no  ='" + regnoITI + "'";
	String checkRegNo = jt.queryForObject(sql2, String.class);

	return checkRegNo;
}

@Override
public List<LoginModel> getCountTheStudentCollegeWisePresentGovtpolyBar(String attendate) {

	  
	
	String query ="SELECT DISTINCT a.institute_name,SUM(CASE When b.in_time IS NULL Then 1 Else 0 End ) as absent,SUM(CASE When b.in_time IS not NULL Then 1 Else 0 End ) as present FROM aa_cand_details_api a LEFT JOIN aa_institute_detail c  on a.institute_code=c.institute_code LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date= CAST(? AS DATE) where c.institute_type='G' GROUP BY a.INSTITUTE_NAME order by present desc ";
	//System.out.println("query"+query);	
	return jt.query(query, new Object[]{attendate},new RowMapper<LoginModel>() {
		 
		@Override
		public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
		{
			LoginModel b = new LoginModel();
			b.setRollId(rs.getString("institute_name"));
			b.setStudentName(rs.getString("absent"));
			b.setInstituteCode(rs.getString("present"));
			return b; 
		} 
	}); 
}


@Override
public List<LoginModel> getCountTheStudentCollegeWisePresentITI(String attendate) {

	  
	
	String query ="SELECT DISTINCT a.institute_name,SUM(CASE When b.in_time IS NULL Then 1 Else 0 End ) as absent,SUM(CASE When b.in_time IS not NULL Then 1 Else 0 End ) as present FROM aa_cand_details_api a LEFT JOIN aa_institute_detail c  on a.institute_code=c.institute_code LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date= CAST(? AS DATE) where c.institute_type='I' GROUP BY a.INSTITUTE_NAME order by present desc ";
	//System.out.println("query"+query);	
	return jt.query(query, new Object[]{attendate},new RowMapper<LoginModel>() {
		 
		@Override
		public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
		{
			LoginModel b = new LoginModel();
			b.setRollId(rs.getString("institute_name"));
			b.setStudentName(rs.getString("absent"));
			b.setInstituteCode(rs.getString("present"));
			return b; 
		} 
	}); 
}

@Override
public List<LoginModel> getCountTheStudentCollegeWisepolypiebar(String attendate) {
	String	query = "SELECT COUNT(CASE WHEN b.reg_no IS NULL THEN 1 END) AS absent,COUNT(CASE WHEN b.reg_no IS NOT NULL THEN 1 END) AS present FROM aa_cand_details_api a LEFT JOIN aa_institute_detail c  on a.institute_code=c.institute_code LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date =CAST(? AS DATE) where c.institute_type='G'";


	System.out.println("query"+query);	

	return jt.query(query, new Object[]{attendate},new RowMapper<LoginModel>() {
			 
			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				LoginModel b = new LoginModel();
				
				b.setStudentName(rs.getString("absent"));
				b.setUserName(rs.getString("present"));
			
				return b; 
			} 
		});
	}
@Override
public List<LoginModel> getCountTheStudentCollegeWiseITIpiebar(String attendate) {
	String	query = "SELECT COUNT(CASE WHEN b.reg_no IS NULL THEN 1 END) AS absent,COUNT(CASE WHEN b.reg_no IS NOT NULL THEN 1 END) AS present FROM aa_cand_details_api a LEFT JOIN aa_institute_detail c  on a.institute_code=c.institute_code LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date =CAST(? AS DATE) where c.institute_type='I'";


	System.out.println("query"+query);	

	return jt.query(query, new Object[]{attendate},new RowMapper<LoginModel>() {
			 
			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				LoginModel b = new LoginModel();
				
				b.setStudentName(rs.getString("absent"));
				b.setUserName(rs.getString("present"));
			
				return b; 
			} 
		});
	}
@Override
public List<LoginModel> getcollegetype() {
    //String qry = "SELECT DISTINCT institute_type FROM aa_institute_detail";
	String qry = "SELECT DISTINCT aa.institute_type,bb.college_type_name FROM aa_institute_detail aa left join aa_college_type bb on aa.institute_type=bb.college_type ";  
	return jt.query(qry, new RowMapper<LoginModel>() {
        @Override
        public LoginModel mapRow(ResultSet rs, int rowNum) throws SQLException {
            LoginModel model = new LoginModel();
            model.setInstituteCode(rs.getString("institute_type"));
            model.setInstituteName(rs.getString("college_type_name"));
            return model;
        }
    });
}
@Override
public List<LoginModel> getAllCollegeadmin(String selectedInstitutetype) {
    String qry = "SELECT DISTINCT aa.institute_code, aa.institute_name " +
                 "FROM aa_cand_details_api aa " +
                 "LEFT JOIN aa_institute_detail bb ON aa.institute_code = bb.institute_code " +
                 "WHERE bb.institute_type = ?";
    
    System.out.println("query: " + qry);  // Optional: Print the constructed query for debugging
    
    return jt.query(qry, new Object[]{selectedInstitutetype}, new RowMapper<LoginModel>() {
        @Override
        public LoginModel mapRow(ResultSet rs, int rowNum) throws SQLException {
            LoginModel b = new LoginModel();
            b.setInstituteCode(rs.getString("institute_code"));
            b.setInstituteName(rs.getString("institute_name"));
            return b;
        }
    });
}
@Override
public List<LoginModel> getsemesterAjax(String institutecode) {

	//System.out.println("piaId:::::::"+piaId);
	
	String qry="select distinct(semester) from aa_cand_details_api where institute_code=?"; 



return jt.query(qry,new Object[]{institutecode}, new RowMapper<LoginModel>() {
	@Override
	public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
	{
		LoginModel c=new LoginModel();
		
		c.setSemestar(rs.getString("semester"));
		System.out.println("c:::::::"+c);
		return c;
	}
});
}
@Override
public List<LoginModel> getbranchAjax(String institutecode) {

	//System.out.println("piaId:::::::"+piaId);
	
	String qry="select distinct(course_name) from aa_cand_details_api where institute_code=?"; 



return jt.query(qry,new Object[]{institutecode}, new RowMapper<LoginModel>() {
	@Override
	public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
	{
		LoginModel c=new LoginModel();
		
		c.setCourseName(rs.getString("course_name"));
		System.out.println("c:::::::"+c);
		return c;
	}
});
}

@Override
public List<LoginModel> getmonthAjax(String institutecode,String branch) {

	System.out.println("institutecode:::::::"+institutecode);
	System.out.println("institutecode:::::::"+branch);
	String qry="select distinct(year_month) from  aa_institute_detail aa left join  aa_cand_details_api bb on  aa.institute_code=bb.institute_code left join aa_cand_attendance_device cc on bb.reg_no=cc.reg_no where bb.institute_code =? and cc.year_month!='null' and course_name=?"; 



return jt.query(qry,new Object[]{institutecode,branch}, new RowMapper<LoginModel>() {
	@Override
	public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
	{
		LoginModel c=new LoginModel();
		
		c.setMonth(rs.getString("year_month"));
		System.out.println("c:::::::"+c);
		return c;
	}
});
}

@Override
public List<LoginModel> viewDataITIPresent(String selectedInstitute, String date) {

	String	query = "select xe.reg_no,me.student_name,me.institute_code,me.gender,xe.attend_date,xe.in_time,xe.out_time,me.mobile from aa_cand_attendance_device xe left join aa_cand_details_api me on xe.reg_no=me.reg_no where me.institute_code='"+selectedInstitute+"'  and xe.attend_date='"+date+"'  ";
	System.out.println("query"+query);	

/*			List<LoginModel>viewData=jt.query(query, new Object[]{Itime},new RowMapper<LoginModel>() {
*/		return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
	 
	@Override
	public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
	{
		LoginModel viewData = new LoginModel();
		viewData.setRollId(rs.getString("reg_no"));
		viewData.setStudentName(rs.getString("student_name"));
		viewData.setInstituteCode(rs.getString("institute_code"));
		viewData.setGender(rs.getString("gender"));
		viewData.setAttendDate(rs.getString("attend_date"));
		viewData.setInTime(rs.getString("in_time"));
		viewData.setOutTime(rs.getString("out_time"));
		viewData.setMobileNumber(rs.getString("mobile")); 
		return viewData; 
	} 
}); 
}

@Override
public List<LoginModel> getSemesterListt(String collegecode) {
	String qry = "select distinct(semester) from aa_cand_details_api where institute_code='"+collegecode+"' ";
	return jt.query(qry, new RowMapper<LoginModel>()
	{

@Override
public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

	LoginModel c = new LoginModel();

			c.setSemestar(rs.getString("semester"));
			
	
	
	return c;
}
});
}

@Override
public List<LoginModel> getBranchListt(String collegecode) {

	String qry = "select distinct(course_name) from aa_cand_details_api where course_name !='null' and institute_code='"+collegecode+"' ";
	return jt.query(qry, new RowMapper<LoginModel>()
	{

@Override
public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

	LoginModel c = new LoginModel();

			c.setCourseName(rs.getString("course_name"));
			
	//System.out.println("qry"+qry);
	System.out.println("c"+c);

	return c;
}
});
}
@Override
public List<LoginModel> viewData3(String collegecode, String selectedbranch, String date) {
	String	query = "select xe.reg_no,me.student_name,me.institute_code,me.gender,xe.attend_date,xe.in_time,xe.out_time,me.mobile from aa_cand_attendance_device xe left join aa_cand_details_api me on xe.reg_no=me.reg_no where me.institute_code='"+collegecode+"' and me.course_name='"+selectedbranch+"' and xe.attend_date='"+date+"'  ";
	//select xe.reg_no,me.student_name,me.institute_code,me.gender,xe.attend_date,xe.in_time,xe.out_time,me.mobile from aa_cand_attendance_device xe left join aa_cand_details_api me on xe.reg_no=me.reg_no where me.institute_code='0109104' and me.semester='03' and me.course_name='Electrical Engineering' and xe.attend_date='2024-01-08'  
System.out.println("query"+query);	

/*			List<LoginModel>viewData=jt.query(query, new Object[]{Itime},new RowMapper<LoginModel>() {
*/		return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
	 
	@Override
	public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
	{
		LoginModel viewData = new LoginModel();
		viewData.setRollId(rs.getString("reg_no"));
		viewData.setStudentName(rs.getString("student_name"));
		viewData.setInstituteCode(rs.getString("institute_code"));
		viewData.setGender(rs.getString("gender"));
		viewData.setAttendDate(rs.getString("attend_date"));
		viewData.setInTime(rs.getString("in_time"));
		viewData.setOutTime(rs.getString("out_time"));
		viewData.setMobileNumber(rs.getString("mobile")); 
		return viewData; 
	} 
}); 
}

@Override
public List<LoginModel> getAllstudentListcollegeTypewise(String instituteType) {


		String qry="select a.reg_no,a.student_name,a.institute_name,a.mobile from aa_cand_details_api a left join aa_institute_detail b  on a.institute_code=b.institute_code where institute_type=?";
		
		return jt.query(qry,new Object[]{instituteType}, new RowMapper<LoginModel>() 
		{

			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

				LoginModel b = new LoginModel();
				
				b.setRollId(rs.getString("reg_no"));
				b.setStudentName(rs.getString("student_name"));
				b.setInstituteName(rs.getString("institute_name"));
				b.setMobileNumber(rs.getString("mobile"));
				
				
				
				
		return b;
			}
		});
	}
@Override
public List<LoginModel> getTotalCountTheStudentPOLY(String attendate) {
	String	query = "SELECT COUNT(CASE WHEN b.reg_no IS NULL THEN 1 END) AS absent,COUNT(CASE WHEN b.reg_no IS NOT NULL THEN 1 END) AS present FROM aa_cand_details_api a LEFT JOIN aa_institute_detail c  on a.institute_code=c.institute_code LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date =CAST(? AS DATE) where c.institute_type='G'";


	System.out.println("query"+query);	

	return jt.query(query, new Object[]{attendate},new RowMapper<LoginModel>() {
			 
			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				LoginModel b = new LoginModel();
				
				b.setStudentName(rs.getString("absent"));
				b.setUserName(rs.getString("present"));
			
				return b; 
			} 
		});
	}
@Override
public List<LoginModel> getTotalCountTheStudentinstitutewise(String attendate,String collegecode) {
	String	query = "SELECT round(100 * COUNT(CASE WHEN b.reg_no is null THEN 1 END)/count(a.reg_no),1) as absent,round(100 * COUNT(CASE WHEN b.reg_no is not null THEN 1 END)/count(a.reg_no),1) as present FROM aa_cand_details_api a left join aa_cand_attendance_device b on a.reg_no = b.reg_no and attend_date = '"+attendate+"' where a.institute_code ='"+collegecode+"'";

System.out.println("collegecode"+collegecode);
	System.out.println("query"+query);	

	return jt.query(query, new Object[]{},new RowMapper<LoginModel>() {
			 
			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				LoginModel b = new LoginModel();
				
				b.setStudentName(rs.getString("absent"));
				b.setUserName(rs.getString("present"));
			
				return b; 
			} 
		});
	}
@Override
public List<LoginModel> getTotalCountTheStudent(String attendate) {
	String	query = "SELECT COUNT(CASE WHEN b.reg_no IS NULL THEN 1 END) AS absent,COUNT(CASE WHEN b.reg_no IS NOT NULL THEN 1 END) AS present FROM aa_cand_details_api a LEFT JOIN aa_institute_detail c  on a.institute_code=c.institute_code LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date =CAST(? AS DATE) where c.institute_type='G'";


	System.out.println("query"+query);	

	return jt.query(query, new Object[]{attendate},new RowMapper<LoginModel>() {
			 
			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				LoginModel b = new LoginModel();
				
				b.setStudentName(rs.getString("absent"));
				b.setUserName(rs.getString("present"));
			
				return b; 
			} 
		});
	}
@Override
public List<LoginModel> getTotalCountTheStudentcollegebarchart(String attendate, String collegecode){
	String	query = "SELECT  a.institute_name, COUNT(CASE WHEN b.reg_no IS NULL THEN 1 END) AS absent,COUNT(CASE WHEN b.reg_no IS NOT NULL THEN 1 END) AS present FROM aa_cand_details_api a LEFT JOIN aa_institute_detail c  on a.institute_code=c.institute_code LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date =CAST(? AS DATE) where a.institute_code=? GROUP BY  a.institute_name";


	System.out.println("query"+query);	

	return jt.query(query, new Object[]{attendate,collegecode},new RowMapper<LoginModel>() {
			 
			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				LoginModel b = new LoginModel();
				b.setInstituteName(rs.getString("institute_name"));
				b.setStudentName(rs.getString("absent"));
				b.setUserName(rs.getString("present"));
			
				return b; 
			} 
		});
	}
@Override
public List<LoginModel> getTotalCountTheStudentITI(String attendate) {
	String	query = "SELECT COUNT(CASE WHEN b.reg_no IS NULL THEN 1 END) AS absent,COUNT(CASE WHEN b.reg_no IS NOT NULL THEN 1 END) AS present FROM aa_cand_details_api a LEFT JOIN aa_institute_detail c  on a.institute_code=c.institute_code LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date =CAST(? AS DATE) where c.institute_type='I'";


	System.out.println("query"+query);	

	return jt.query(query, new Object[]{attendate},new RowMapper<LoginModel>() {
			 
			@Override
			public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				LoginModel b = new LoginModel();
				
				b.setStudentName(rs.getString("absent"));
				b.setUserName(rs.getString("present"));
			
				return b; 
			} 
		});
	}

@Override
public List<LoginModel> getCountTheStudentCollegeWiseGovtpolyBardivided1(String attendate) {


	  
	
	String query ="WITH numbered_results AS (SELECT DISTINCT a.institute_name, SUM(CASE WHEN b.in_time IS NULL THEN 1 ELSE 0 END) AS absent, SUM(CASE WHEN b.in_time IS NOT NULL THEN 1 ELSE 0 END) AS present, ROW_NUMBER() OVER (ORDER BY SUM(CASE WHEN b.in_time IS NOT NULL THEN 1 ELSE 0 END) DESC) AS rn FROM aa_cand_details_api a LEFT JOIN aa_institute_detail c ON a.institute_code = c.institute_code LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date =CAST(? AS DATE) WHERE c.institute_type = 'G' GROUP BY a.institute_name ORDER BY present DESC), split_point AS (SELECT COUNT(*) / 2 AS midpoint FROM numbered_results), temp_table_1 AS (SELECT * FROM numbered_results, split_point WHERE rn <= midpoint) , temp_table_2 AS (SELECT * FROM numbered_results, split_point WHERE rn > midpoint)SELECT  institute_name,absent,present FROM temp_table_1 ";
	System.out.println("query"+query);	
	return jt.query(query, new Object[]{attendate},new RowMapper<LoginModel>() {
		 
		@Override
		public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
		{
			LoginModel b = new LoginModel();
			b.setRollId(rs.getString("institute_name"));
			b.setStudentName(rs.getString("absent"));
			b.setInstituteCode(rs.getString("present"));
			return b; 
		} 
	}); 
}
@Override
public List<LoginModel> getCountTheStudentCollegeWiseGovtpolyBardivided2(String attendate) {


	  
	
	String query ="WITH numbered_results AS (SELECT DISTINCT a.institute_name, SUM(CASE WHEN b.in_time IS NULL THEN 1 ELSE 0 END) AS absent, SUM(CASE WHEN b.in_time IS NOT NULL THEN 1 ELSE 0 END) AS present, ROW_NUMBER() OVER (ORDER BY SUM(CASE WHEN b.in_time IS NOT NULL THEN 1 ELSE 0 END) DESC) AS rn FROM aa_cand_details_api a LEFT JOIN aa_institute_detail c ON a.institute_code = c.institute_code LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date =CAST(? AS DATE) WHERE c.institute_type = 'G' GROUP BY a.institute_name ORDER BY present DESC), split_point AS (SELECT COUNT(*) / 2 AS midpoint FROM numbered_results), temp_table_1 AS (SELECT * FROM numbered_results, split_point WHERE rn <= midpoint) , temp_table_2 AS (SELECT * FROM numbered_results, split_point WHERE rn > midpoint)SELECT  institute_name,absent,present FROM temp_table_2 ";
	System.out.println("query"+query);	
	return jt.query(query, new Object[]{attendate},new RowMapper<LoginModel>() {
		 
		@Override
		public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
		{
			LoginModel b = new LoginModel();
			b.setRollId(rs.getString("institute_name"));
			b.setStudentName(rs.getString("absent"));
			b.setInstituteCode(rs.getString("present"));
			return b; 
		} 
	}); 
}

@Override
public List<LoginModel> getCountTheStudentCollegeWiseITIBardivided1(String attendate) {
	String query ="WITH numbered_results AS ( SELECT DISTINCT  a.institute_name, SUM(CASE WHEN b.in_time IS NULL THEN 1 ELSE 0 END) AS absent, SUM(CASE WHEN b.in_time IS NOT NULL THEN 1 ELSE 0 END) AS present, ROW_NUMBER() OVER (ORDER BY SUM(CASE WHEN b.in_time IS NOT NULL THEN 1 ELSE 0 END) DESC) AS rn   FROM aa_cand_details_api a LEFT JOIN aa_institute_detail c ON a.institute_code = c.institute_code LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date =CAST(? AS DATE) WHERE c.institute_type = 'I' GROUP BY a.institute_name ORDER BY present DESC), total_rows AS ( SELECT COUNT(*) AS total FROM numbered_results), split_points AS (SELECT total,total / 4 AS q1,total / 2 AS q2,total * 3 / 4 AS q3 FROM total_rows), temp_table_1 AS (SELECT * FROM numbered_results, split_points WHERE rn <= q1), temp_table_2 AS (SELECT * FROM numbered_results, split_points WHERE rn > q1 AND rn <= q2), temp_table_3 AS (SELECT *FROM numbered_results, split_points WHERE rn > q2 AND rn <= q3), temp_table_4 AS (SELECT * FROM numbered_results, split_points WHERE rn > q3)SELECT institute_name, absent, present FROM temp_table_1";	
	System.out.println("query"+query);	
	return jt.query(query, new Object[]{attendate},new RowMapper<LoginModel>() {
		 
		@Override
		public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
		{
			LoginModel b = new LoginModel();
			b.setRollId(rs.getString("institute_name"));
			b.setStudentName(rs.getString("absent"));
			b.setInstituteCode(rs.getString("present"));
			return b; 
		} 
	}); 
}

@Override
public List<LoginModel> getCountTheStudentCollegeWiseITIBardivided2(String attendate) {
	String query ="WITH numbered_results AS ( SELECT DISTINCT  a.institute_name, SUM(CASE WHEN b.in_time IS NULL THEN 1 ELSE 0 END) AS absent, SUM(CASE WHEN b.in_time IS NOT NULL THEN 1 ELSE 0 END) AS present, ROW_NUMBER() OVER (ORDER BY SUM(CASE WHEN b.in_time IS NOT NULL THEN 1 ELSE 0 END) DESC) AS rn   FROM aa_cand_details_api a LEFT JOIN aa_institute_detail c ON a.institute_code = c.institute_code LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date =CAST(? AS DATE) WHERE c.institute_type = 'I' GROUP BY a.institute_name ORDER BY present DESC), total_rows AS ( SELECT COUNT(*) AS total FROM numbered_results), split_points AS (SELECT total,total / 4 AS q1,total / 2 AS q2,total * 3 / 4 AS q3 FROM total_rows), temp_table_1 AS (SELECT * FROM numbered_results, split_points WHERE rn <= q1), temp_table_2 AS (SELECT * FROM numbered_results, split_points WHERE rn > q1 AND rn <= q2), temp_table_3 AS (SELECT *FROM numbered_results, split_points WHERE rn > q2 AND rn <= q3), temp_table_4 AS (SELECT * FROM numbered_results, split_points WHERE rn > q3)SELECT institute_name, absent, present FROM temp_table_2";
	System.out.println("query"+query);	
	return jt.query(query, new Object[]{attendate},new RowMapper<LoginModel>() {
		 
		@Override
		public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
		{
			LoginModel b = new LoginModel();
			b.setRollId(rs.getString("institute_name"));
			b.setStudentName(rs.getString("absent"));
			b.setInstituteCode(rs.getString("present"));
			return b; 
		} 
	}); 
}

@Override
public List<LoginModel> getCountTheStudentCollegeWiseITIBardivided3(String attendate) {
	String query ="WITH numbered_results AS ( SELECT DISTINCT  a.institute_name, SUM(CASE WHEN b.in_time IS NULL THEN 1 ELSE 0 END) AS absent, SUM(CASE WHEN b.in_time IS NOT NULL THEN 1 ELSE 0 END) AS present, ROW_NUMBER() OVER (ORDER BY SUM(CASE WHEN b.in_time IS NOT NULL THEN 1 ELSE 0 END) DESC) AS rn   FROM aa_cand_details_api a LEFT JOIN aa_institute_detail c ON a.institute_code = c.institute_code LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date =CAST(? AS DATE) WHERE c.institute_type = 'I' GROUP BY a.institute_name ORDER BY present DESC), total_rows AS ( SELECT COUNT(*) AS total FROM numbered_results), split_points AS (SELECT total,total / 4 AS q1,total / 2 AS q2,total * 3 / 4 AS q3 FROM total_rows), temp_table_1 AS (SELECT * FROM numbered_results, split_points WHERE rn <= q1), temp_table_2 AS (SELECT * FROM numbered_results, split_points WHERE rn > q1 AND rn <= q2), temp_table_3 AS (SELECT *FROM numbered_results, split_points WHERE rn > q2 AND rn <= q3), temp_table_4 AS (SELECT * FROM numbered_results, split_points WHERE rn > q3)SELECT institute_name, absent, present FROM temp_table_3";
System.out.println("query"+query);	
return jt.query(query, new Object[]{attendate},new RowMapper<LoginModel>() {
	 
	@Override
	public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
	{
		LoginModel b = new LoginModel();
		b.setRollId(rs.getString("institute_name"));
		b.setStudentName(rs.getString("absent"));
		b.setInstituteCode(rs.getString("present"));
		return b; 
	} 
}); 
}
@Override
public List<LoginModel> getCountTheStudentCollegeWiseITIBardivided4(String attendate) {
	String query ="WITH numbered_results AS ( SELECT DISTINCT  a.institute_name, SUM(CASE WHEN b.in_time IS NULL THEN 1 ELSE 0 END) AS absent, SUM(CASE WHEN b.in_time IS NOT NULL THEN 1 ELSE 0 END) AS present, ROW_NUMBER() OVER (ORDER BY SUM(CASE WHEN b.in_time IS NOT NULL THEN 1 ELSE 0 END) DESC) AS rn   FROM aa_cand_details_api a LEFT JOIN aa_institute_detail c ON a.institute_code = c.institute_code LEFT JOIN aa_cand_attendance_device b ON a.reg_no = b.reg_no AND b.attend_date =CAST(? AS DATE) WHERE c.institute_type = 'I' GROUP BY a.institute_name ORDER BY present DESC), total_rows AS ( SELECT COUNT(*) AS total FROM numbered_results), split_points AS (SELECT total,total / 4 AS q1,total / 2 AS q2,total * 3 / 4 AS q3 FROM total_rows), temp_table_1 AS (SELECT * FROM numbered_results, split_points WHERE rn <= q1), temp_table_2 AS (SELECT * FROM numbered_results, split_points WHERE rn > q1 AND rn <= q2), temp_table_3 AS (SELECT *FROM numbered_results, split_points WHERE rn > q2 AND rn <= q3), temp_table_4 AS (SELECT * FROM numbered_results, split_points WHERE rn > q3)SELECT institute_name, absent, present FROM temp_table_4";
	System.out.println("query"+query);	
	return jt.query(query, new Object[]{attendate},new RowMapper<LoginModel>() {
		 
		@Override
		public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException 
		{
			LoginModel b = new LoginModel();
			b.setRollId(rs.getString("institute_name"));
			b.setStudentName(rs.getString("absent"));
			b.setInstituteCode(rs.getString("present"));
			return b; 
		} 
	}); 
}

@Override
public List<LoginModel> getBranchListitireport(String collegecode) {
	
	String qry = "select distinct(course_name) from aa_cand_details_api where course_name !='null' and institute_code=? ";
	return jt.query(qry, new Object[]{collegecode},new RowMapper<LoginModel>() {

@Override
public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

	LoginModel c = new LoginModel();

			c.setCourseName(rs.getString("course_name"));
			
	//System.out.println("qry"+qry);
	System.out.println("c"+c);

	return c;
}
});
}

@Override
public List<LoginModel> getMonthListitireport(String collegecode) {
	String qry = "select distinct(year_month) from  aa_institute_detail aa left join  aa_cand_details_api bb on  aa.institute_code=bb.institute_code left join aa_cand_attendance_device cc on bb.reg_no=cc.reg_no where bb.institute_code =? and cc.year_month!='null' ";
	return jt.query(qry, new Object[]{collegecode},new RowMapper<LoginModel>() {
	

@Override
public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

	LoginModel c = new LoginModel();

			c.setMonth(rs.getString("year_month"));
			
	
	
	return c;
}
});
}

@Override
public List<LoginModel> getCandidatebranchITI(String instituteCode,String course,
		String selectedMonth) {
	System.out.println("selectedInstitute"+instituteCode);
	System.out.println("course"+course);
	System.out.println("selectedMonth"+selectedMonth);

			String sql = "select * from getstudentITIbranchwise(?,?,?) order by student_name";
	        System.out.println("sql::::::::::"+sql);
			
			return jt.query(sql, new Object[]{instituteCode,course,selectedMonth},new RowMapper<LoginModel>() {

				
					@Override
					public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {
						LoginModel b = new LoginModel();				
						System.out.println("ENTER");
						b.setRollId(rs.getString("reg_no"));
						b.setStudentName(rs.getString("student_name"));
						if(rs.getString("01")==null || rs.getString("01")==" ")
						{
							b.setDay1("N/A");
						}
						else
						{
							b.setDay1(rs.getString("01"));
						}
						if(rs.getString("02")==null || rs.getString("02")==" ")
						{
							b.setDay2("N/A");
						}
						else
						{
							b.setDay2(rs.getString("02"));
						}
						if(rs.getString("03")==null || rs.getString("03")==" ")
						{
							b.setDay3("N/A");
						}
						else
						{
							b.setDay3(rs.getString("03"));
						}
						if(rs.getString("04")==null || rs.getString("04")==" ")
						{
							b.setDay4("N/A");
						}
						else
						{
							b.setDay4(rs.getString("04"));
						}
						if(rs.getString("05")==null || rs.getString("05")==" ")
						{
							b.setDay5("N/A");
						}
						else
						{
							b.setDay5(rs.getString("05"));
						}
						if(rs.getString("06")==null || rs.getString("06")==" ")
						{
							b.setDay6("N/A");
						}
						else
						{
							b.setDay6(rs.getString("06"));
						}
						if(rs.getString("07")==null || rs.getString("07")==" ")
						{
							b.setDay7("N/A");
						}
						else
						{
							b.setDay7(rs.getString("07"));
						}
						if(rs.getString("08")==null || rs.getString("08")==" ")
						{
							b.setDay8("N/A");
						}
						else
						{
							b.setDay8(rs.getString("08"));
						}
						if(rs.getString("09")==null || rs.getString("09")==" ")
						{
							b.setDay9("N/A");
						}
						else
						{
							b.setDay9(rs.getString("09"));
						}
						if(rs.getString("10")==null || rs.getString("10")==" ")
						{
							b.setDay10("N/A");
						}
						else
						{
							b.setDay10(rs.getString("10"));
						}
						if(rs.getString("11")==null || rs.getString("11")==" ")
						{
							b.setDay11("N/A");
						}
						else
						{
							b.setDay11(rs.getString("11"));
						}
						if(rs.getString("12")==null || rs.getString("12")==" ")
						{
							b.setDay12("N/A");
						}
						else
						{
							b.setDay12(rs.getString("12"));
						}
						if(rs.getString("13")==null || rs.getString("13")==" ")
						{
							b.setDay13("N/A");
						}
						else
						{
							b.setDay13(rs.getString("13"));
						}
						if(rs.getString("14")==null || rs.getString("14")==" ")
						{
							b.setDay14("N/A");
						}
						else
						{
							b.setDay14(rs.getString("14"));
						}
						if(rs.getString("15")==null || rs.getString("15")==" ")
						{
							b.setDay15("N/A");
						}
						else
						{
							b.setDay15(rs.getString("15"));
						}
						if(rs.getString("16")==null || rs.getString("16")==" ")
						{
							b.setDay16("N/A");
						}
						else
						{
							b.setDay16(rs.getString("16"));
						}
						if(rs.getString("17")==null || rs.getString("17")==" ")
						{
							b.setDay17("N/A");
						}
						else
						{
							b.setDay17(rs.getString("17"));
						}
						if(rs.getString("18")==null || rs.getString("18")==" ")
						{
							b.setDay18("N/A");
						}
						else
						{
							b.setDay18(rs.getString("18"));
						}
						if(rs.getString("19")==null || rs.getString("19")==" ")
						{
							b.setDay19("N/A");
						}
						else
						{
							b.setDay19(rs.getString("19"));
						}
						if(rs.getString("20")==null || rs.getString("20")==" ")
						{
							b.setDay20("N/A");
						}
						else
						{
							b.setDay20(rs.getString("20"));
						}
						if(rs.getString("21")==null || rs.getString("21")==" ")
						{
							b.setDay21("N/A");
						}
						else
						{
							b.setDay21(rs.getString("21"));
						}
						if(rs.getString("22")==null || rs.getString("22")==" ")
						{
							b.setDay22("N/A");
						}
						else
						{
							b.setDay22(rs.getString("22"));
						}
						if(rs.getString("23")==null || rs.getString("23")==" ")
						{
							b.setDay23("N/A");
						}
						else
						{
							b.setDay23(rs.getString("23"));
						}
						if(rs.getString("24")==null || rs.getString("24")==" ")
						{
							b.setDay24("N/A");
						}
						else
						{
							b.setDay24(rs.getString("24"));
						}
						if(rs.getString("25")==null || rs.getString("25")==" ")
						{
							b.setDay25("N/A");
						}
						else
						{
							b.setDay25(rs.getString("25"));
						}
						if(rs.getString("26")==null || rs.getString("26")==" ")
						{
							b.setDay26("N/A");
						}
						else
						{
							b.setDay26(rs.getString("26"));
						}
						if(rs.getString("27")==null || rs.getString("27")==" ")
						{
							b.setDay27("N/A");
						}
						else
						{
							b.setDay27(rs.getString("27"));
						}
						if(rs.getString("28")==null || rs.getString("28")==" ")
						{
							b.setDay28("N/A");
						}
						else
						{
							b.setDay28(rs.getString("28"));
						}
						if(rs.getString("29")==null || rs.getString("29")==" ")
						{
							b.setDay29("N/A");
						}
						else
						{
							b.setDay29(rs.getString("29"));
						}
						if(rs.getString("30")==null || rs.getString("30")==" ")
						{
							b.setDay30("N/A");
						}
						else
						{
							b.setDay30(rs.getString("30"));
						}
						if(rs.getString("31")==null || rs.getString("31")==" ")
						{
							b.setDay31("N/A");
						}
						else
						{
							b.setDay31(rs.getString("31"));
						}
						b.setCountdays(rs.getInt("total_days"));
						
						//System.out.println("b.setDay1(rs.getString)::::::"+rs.getString("13"));
						//System.out.println("rs.getString)::::::"+rs.getString("14"));
						System.out.println("b::::::"+b);
						return b;
					}
					
				});
}

@Override
public List<LoginModel> viewDatacoursewiseadminITI(String selectedInstitute, String selectedcourse,
		String selectedMonth) {

System.out.println("selectedInstitute"+selectedInstitute);
System.out.println("selectedSemester"+selectedcourse);

System.out.println("selectedMonth"+selectedMonth);

	String sql = "select * from getstudentattendancebranchwiseITI(?,?,?) order by student_name";
    System.out.println("sql::::::::::"+sql);
	
	return jt.query(sql, new Object[]{selectedInstitute,selectedcourse,selectedMonth},new RowMapper<LoginModel>() {

		@Override
		public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {
			LoginModel b = new LoginModel();				
			System.out.println("ENTER");
			b.setRollId(rs.getString("reg_no"));
			b.setStudentName(rs.getString("student_name"));
			if(rs.getString("01")==null || rs.getString("01")==" ")
			{
				b.setDay1("N/A");
			}
			else
			{
				b.setDay1(rs.getString("01"));
			}
			if(rs.getString("02")==null || rs.getString("02")==" ")
			{
				b.setDay2("N/A");
			}
			else
			{
				b.setDay2(rs.getString("02"));
			}
			if(rs.getString("03")==null || rs.getString("03")==" ")
			{
				b.setDay3("N/A");
			}
			else
			{
				b.setDay3(rs.getString("03"));
			}
			if(rs.getString("04")==null || rs.getString("04")==" ")
			{
				b.setDay4("N/A");
			}
			else
			{
				b.setDay4(rs.getString("04"));
			}
			if(rs.getString("05")==null || rs.getString("05")==" ")
			{
				b.setDay5("N/A");
			}
			else
			{
				b.setDay5(rs.getString("05"));
			}
			if(rs.getString("06")==null || rs.getString("06")==" ")
			{
				b.setDay6("N/A");
			}
			else
			{
				b.setDay6(rs.getString("06"));
			}
			if(rs.getString("07")==null || rs.getString("07")==" ")
			{
				b.setDay7("N/A");
			}
			else
			{
				b.setDay7(rs.getString("07"));
			}
			if(rs.getString("08")==null || rs.getString("08")==" ")
			{
				b.setDay8("N/A");
			}
			else
			{
				b.setDay8(rs.getString("08"));
			}
			if(rs.getString("09")==null || rs.getString("09")==" ")
			{
				b.setDay9("N/A");
			}
			else
			{
				b.setDay9(rs.getString("09"));
			}
			if(rs.getString("10")==null || rs.getString("10")==" ")
			{
				b.setDay10("N/A");
			}
			else
			{
				b.setDay10(rs.getString("10"));
			}
			if(rs.getString("11")==null || rs.getString("11")==" ")
			{
				b.setDay11("N/A");
			}
			else
			{
				b.setDay11(rs.getString("11"));
			}
			if(rs.getString("12")==null || rs.getString("12")==" ")
			{
				b.setDay12("N/A");
			}
			else
			{
				b.setDay12(rs.getString("12"));
			}
			if(rs.getString("13")==null || rs.getString("13")==" ")
			{
				b.setDay13("N/A");
			}
			else
			{
				b.setDay13(rs.getString("13"));
			}
			if(rs.getString("14")==null || rs.getString("14")==" ")
			{
				b.setDay14("N/A");
			}
			else
			{
				b.setDay14(rs.getString("14"));
			}
			if(rs.getString("15")==null || rs.getString("15")==" ")
			{
				b.setDay15("N/A");
			}
			else
			{
				b.setDay15(rs.getString("15"));
			}
			if(rs.getString("16")==null || rs.getString("16")==" ")
			{
				b.setDay16("N/A");
			}
			else
			{
				b.setDay16(rs.getString("16"));
			}
			if(rs.getString("17")==null || rs.getString("17")==" ")
			{
				b.setDay17("N/A");
			}
			else
			{
				b.setDay17(rs.getString("17"));
			}
			if(rs.getString("18")==null || rs.getString("18")==" ")
			{
				b.setDay18("N/A");
			}
			else
			{
				b.setDay18(rs.getString("18"));
			}
			if(rs.getString("19")==null || rs.getString("19")==" ")
			{
				b.setDay19("N/A");
			}
			else
			{
				b.setDay19(rs.getString("19"));
			}
			if(rs.getString("20")==null || rs.getString("20")==" ")
			{
				b.setDay20("N/A");
			}
			else
			{
				b.setDay20(rs.getString("20"));
			}
			if(rs.getString("21")==null || rs.getString("21")==" ")
			{
				b.setDay21("N/A");
			}
			else
			{
				b.setDay21(rs.getString("21"));
			}
			if(rs.getString("22")==null || rs.getString("22")==" ")
			{
				b.setDay22("N/A");
			}
			else
			{
				b.setDay22(rs.getString("22"));
			}
			if(rs.getString("23")==null || rs.getString("23")==" ")
			{
				b.setDay23("N/A");
			}
			else
			{
				b.setDay23(rs.getString("23"));
			}
			if(rs.getString("24")==null || rs.getString("24")==" ")
			{
				b.setDay24("N/A");
			}
			else
			{
				b.setDay24(rs.getString("24"));
			}
			if(rs.getString("25")==null || rs.getString("25")==" ")
			{
				b.setDay25("N/A");
			}
			else
			{
				b.setDay25(rs.getString("25"));
			}
			if(rs.getString("26")==null || rs.getString("26")==" ")
			{
				b.setDay26("N/A");
			}
			else
			{
				b.setDay26(rs.getString("26"));
			}
			if(rs.getString("27")==null || rs.getString("27")==" ")
			{
				b.setDay27("N/A");
			}
			else
			{
				b.setDay27(rs.getString("27"));
			}
			if(rs.getString("28")==null || rs.getString("28")==" ")
			{
				b.setDay28("N/A");
			}
			else
			{
				b.setDay28(rs.getString("28"));
			}
			if(rs.getString("29")==null || rs.getString("29")==" ")
			{
				b.setDay29("N/A");
			}
			else
			{
				b.setDay29(rs.getString("29"));
			}
			if(rs.getString("30")==null || rs.getString("30")==" ")
			{
				b.setDay30("N/A");
			}
			else
			{
				b.setDay30(rs.getString("30"));
			}
			if(rs.getString("31")==null || rs.getString("31")==" ")
			{
				b.setDay31("N/A");
			}
			else
			{
				b.setDay31(rs.getString("31"));
			}
			
			
			//System.out.println("b.setDay1(rs.getString)::::::"+rs.getString("13"));
			//System.out.println("rs.getString)::::::"+rs.getString("14"));
			System.out.println("b::::::"+b);
			return b;
		}
		
	});
}

@Override
public List<LoginModel> getAllCollegeadminstudent(String selectedInstitutetype) {
    String qry = " SELECT DISTINCT aa.institute_code, aa.institute_name,COUNT(aa.reg_no)  AS acount FROM aa_cand_details_api aa LEFT JOIN aa_institute_detail bb ON aa.institute_code = bb.institute_code  WHERE bb.institute_type = ? GROUP BY aa.institute_code,  aa.institute_name";
    
    System.out.println("query: " + qry);  // Optional: Print the constructed query for debugging
    
    return jt.query(qry, new Object[]{selectedInstitutetype}, new RowMapper<LoginModel>() {
        @Override
        public LoginModel mapRow(ResultSet rs, int rowNum) throws SQLException {
            LoginModel b = new LoginModel();
            b.setRoleId(rs.getString("acount"));
            b.setInstituteCode(rs.getString("institute_code"));
            b.setInstituteName(rs.getString("institute_name"));
            return b;
        }
    });
}

@Override
public List<LoginModel> getcollegelistcountsemesterwise(String institutecode) {
    String qry = " SELECT DISTINCT institute_name,institute_code,semester,  COUNT(reg_no) AS acount FROM  aa_cand_details_api  WHERE  institute_code =? GROUP BY  institute_name,institute_code, semester";
    
    System.out.println("query: " + qry);  // Optional: Print the constructed query for debugging
    
    return jt.query(qry, new Object[]{institutecode}, new RowMapper<LoginModel>() {
        @Override
        public LoginModel mapRow(ResultSet rs, int rowNum) throws SQLException {
            LoginModel b = new LoginModel();
            b.setInstituteName(rs.getString("institute_name"));
            b.setInstituteCode(rs.getString("institute_code"));
            b.setSemestar(rs.getString("semester"));
            b.setRoleId(rs.getString("acount"));
            return b;
        }
    });
}

@Override
public List<LoginModel> getstudentlistcountsemesterwise(String instituteCode,String semester) {
	String qry="select reg_no,student_name,institute_name,course_name from aa_cand_details_api where institute_code=? and semester =?";
    
    System.out.println("query: " + qry);  // Optional: Print the constructed query for debugging
    
    return jt.query(qry, new Object[]{instituteCode,semester}, new RowMapper<LoginModel>() {
     
				@Override
				public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

					LoginModel b = new LoginModel();
					
					b.setRollId(rs.getString("reg_no"));
					b.setStudentName(rs.getString("student_name"));
					b.setInstituteName(rs.getString("institute_name"));
					b.setCourseName(rs.getString("course_name"));
            return b;
        }
    });
}

@Override
public List<LoginModel> getstudentlistcountbranchwise(String instituteCode,String courseName) {
	String qry="select reg_no,student_name,institute_name,course_name from aa_cand_details_api where institute_code=? and course_name =?";
    
    System.out.println("query: " + qry);  // Optional: Print the constructed query for debugging
    
    return jt.query(qry, new Object[]{instituteCode,courseName}, new RowMapper<LoginModel>() {
     
				@Override
				public LoginModel mapRow(ResultSet rs, int arg1) throws SQLException {

					LoginModel b = new LoginModel();
					
					b.setRollId(rs.getString("reg_no"));
					b.setStudentName(rs.getString("student_name"));
					b.setInstituteName(rs.getString("institute_name"));
					b.setCourseName(rs.getString("course_name"));
            return b;
        }
    });
}

@Override
public String featchinstitutetype(String institutecode) {
	String institutetype ;
	String query = "select institute_type from aa_institute_detail where institute_code='"+institutecode+"'";
	//System.out.println("query"+query);
	try {
		
		institutetype = jt.queryForObject(query, String.class);
	 
	}catch(Exception e) {
		e.printStackTrace();
		return null;
	}

	return institutetype;
}



@Override
public List<LoginModel> getcollegelistcountbranchwise(String institutecode) {
    String qry = " SELECT DISTINCT institute_name,institute_code,course_name,  COUNT(reg_no) AS acount FROM  aa_cand_details_api  WHERE  institute_code =? GROUP BY  institute_name,institute_code, course_name";
    
    System.out.println("query: " + qry);  // Optional: Print the constructed query for debugging
    
    return jt.query(qry, new Object[]{institutecode}, new RowMapper<LoginModel>() {
        @Override
        public LoginModel mapRow(ResultSet rs, int rowNum) throws SQLException {
            LoginModel b = new LoginModel();
            b.setInstituteName(rs.getString("institute_name"));
            b.setInstituteCode(rs.getString("institute_code"));
            b.setCourseName(rs.getString("course_name"));
            b.setRoleId(rs.getString("acount"));
            return b;
        }
    });
}

@Override
public List<LoginModel> getcollegestudentlistcountbranchwise(String collegecode) {


    String qry = " SELECT DISTINCT aa.institute_code, aa.institute_name,COUNT(aa.reg_no) AS acount FROM aa_cand_details_api aa LEFT JOIN aa_institute_detail bb ON aa.institute_code = bb.institute_code WHERE bb.institute_code = ? GROUP BY aa.institute_code,  aa.institute_name";
    
    System.out.println("query: " + qry);  // Optional: Print the constructed query for debugging
    
    return jt.query(qry, new Object[]{collegecode}, new RowMapper<LoginModel>() {
        @Override
        public LoginModel mapRow(ResultSet rs, int rowNum) throws SQLException {
            LoginModel b = new LoginModel();
            b.setRoleId(rs.getString("acount"));
            b.setInstituteCode(rs.getString("institute_code"));
            b.setInstituteName(rs.getString("institute_name"));
            return b;
        }
    });
}
@Override
public String getcollegeType(String regNo) {
	String institutetype ;
	String query = "select a.institute_type from aa_institute_detail a left join aa_cand_details_api b "
			+ "on a.institute_code=b.institute_code  where  b.reg_no='"+regNo+"'";
	//System.out.println("query"+query);
	try {
		
		institutetype = jt.queryForObject(query, String.class);
	 
	}catch(Exception e) {
		e.printStackTrace();
		return null;
	}

	return institutetype;
}


}

		



