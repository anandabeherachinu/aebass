
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>

<%
   response.setHeader( "Pragma", "no-cache" );
   response.setHeader( "Cache-Control", "private, no-cache, no-store, must-revalidate, proxy-revalidate" );
   response.setDateHeader( "Expires", 0 );
%>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <jsp:include page="../common-admin/head.jsp"></jsp:include> 

	<link href="css/passwordchange/password_strength.css" rel="stylesheet" type="text/css"/><!-- added -->
	<script src="js/passwordchange/change_password_strength.js"></script>  <!-- added -->
		<!-- <link href="css/password-strength.css" rel="stylesheet" type="text/css" />	 -->	
		<script src="js/passwordchange/passwork_strength.js"></script>	
		
		<!-- <script src="js/jquery.md5.js"></script> -->
		<!-- <script src="js/jquery.base64.min.js"></script> -->
		<script src="js/hash.js"></script>
		<script src="js/jquery.base64.min.js"></script>
		
		
		
	 
	 	<%
		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		ArrayList al = new ArrayList();
		int strLen = str.length()-1;
       for(int i=0;i<8;i++)
       {
       	Random r = new Random();
       	int n = r.nextInt(strLen);
       	al.add(str.charAt(n)); 
       }
       StringBuilder sb = new StringBuilder();
       for (Object s : al)
       {
           sb.append(s);
       }
       String salt = sb.toString();
       Date dt = new Date();
       SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss");
       Random r = new Random();
       int x = r.nextInt(1000);
       String sdate  = sdf.format(dt);
       salt = x+salt+sdate;
       session.setAttribute("salt", salt);
%>
	<script type="text/javascript">
		function checkPassword()
		{
			if(passwordPolicyFlag==true)
			{
				alert("Password Password must meet the following requirements:\nAt least one letter\nAt least one capital letter\nAt least one number Be\nAt least 8 characters");
				return false;
			}
			else
			{
				var npwd = document.getElementById("newPassword").value;
				//alert("pass1::::"+document.getElementById("newPassword").value,true);
				var cnpwd = document.getElementById("cnewPassword").value;
				if(npwd!=cnpwd)
				{
					alert("New Password and Confirm Password Not Matched");
					return false;
				}
				
			//alert("pass1",true);
			var pass = document.getElementById("newPassword").value;
			var oldpass = document.getElementById("oldPassword").value;
			//alert("pass1::222::"+document.getElementById("newPassword").value,true);
			var salt = document.getElementById("udata").value;
			/* var passhash = $.md5(pass);
			var oldpasshash = $.md5(oldpass);
			var salthash = $.md5(salt); */
			
			var passhash = SHA256(pass);
			var oldpasshash = SHA256(oldpass);
			var salthash = SHA256(salt);
			
			console.log(passhash);
			console.log(oldpasshash);
			console.log(salthash);
			
			
			passhash = (passhash + salthash);
			//alert(passhash,true);
			//document.getElementById("udata").value = "";
			//passhash = $.base64.encode(passhash);
			
			var substringpass = passhash.substring(0, 64);
			
			document.getElementById("newPassword").value = substringpass;
			document.getElementById("cnewPassword").value = substringpass;
			
			oldpasshash = SHA256(salt + oldpasshash);
			/* oldpasshash = $.md5(salt + oldpasshash); */
			//document.getElementById("udata").value = "";
			oldpasshash = $.base64.encode(oldpasshash);
			document.getElementById("oldPassword").value = oldpasshash;
			
			return true;
			}
				
		}
	</script>
 <script type="text/javascript">
	$(document).ready(function() 
	{
		 history.replaceState(null, document.title, location.pathname+"#!/");
		    history.pushState(null, document.title, location.pathname);
		    window.addEventListener('popstate', function(event) {
		    history.pushState(null, document.title, location.pathname);
		    }, false);  
	});
	</script>
<body>
<c:set var="salt" value="<%=salt%>" scope="page"></c:set>

 <jsp:include page="../common-admin/upper_block.jsp"></jsp:include>
 	<div class="container-fluid" >
 		<div class="row-fluid">
 			
 				<div class="box col-md-12">
 				
 				<c:if test="${not empty MSGS}">
					<div class="alert alert-success">
						${MSGS}
					</div>
				</c:if>
				
				<c:if test="${not empty MSGW}">
					<div class="alert alert-warning">
						${MSGW}
					</div>
				</c:if>
 				
 				
 				<h4>Change Password</h4>
 				
 				
 					${message}
						<form:form class="form-horizontal" id="register"  method="post" modelAttribute="cb" action="change-password.html" onsubmit="return  checkPassword()" autocomplete="off"> 
 					    <%--   <input type="hidden" id="udata" name="udata"  value="<%= salt %>">
 					     --%>
 					       <input type="hidden" name="udata" value="<c:out value="${salt}"/>" id="udata" > 
			                                      
 					       <table class="table_display"> 
							<tr>
		                        <td class="control-label" for="typeahead"><form:label path="oldPassword">Current Password:</form:label></td>
		                        <td><form:password path="oldPassword" id="oldPassword" class="span6 text-field"  required="true" placeholder=" Current Password"/></td>
		                    </tr>
		                    <tr>
		                        <td class="control-label" for="typeahead"><form:label path="newPassword" >New Password:</form:label></td>
		                        <td><form:password path="newPassword" id="newPassword" class="span6 text-field" required="true" placeholder=" New Password"/><span id="result"></span><br/>
	<!-- <div class="progress progress-striped active">
<div id="jak_pstrength" class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
</div> -->
		                         <div id="pswd_info" style="display:none;width: 100%" >
								    <h4>Password must meet the following requirements:</h4>
								    <ul>
								        <li id="letter" class="invalid">At least <strong>one letter</strong></li>
								        <li id="capital" class="invalid">At least <strong>one capital letter</strong></li>
								         <li id="special" class="invalid">At least <strong>one special character</strong></li>
								        <li id="number" class="invalid">At least <strong>one number</strong></li>
								        <li id="length" class="invalid">Be at least <strong>8 characters</strong></li>
								    </ul>
								</div>
								
								</td>
								
						   </tr> 
		                   <tr>
		                        <td class="control-label" for="typeahead"><form:label path="cnewPassword">Confirm Password:</form:label></td>
		                        <td><form:password path="cnewPassword" id="cnewPassword" class="span6 text-field" required="true" placeholder=" Confirm Password"/></td>
		                  </tr>
		                   
		                   </table>
		                    <br>
		                    
		                     <fieldset class="form-group" style="margin-left: 0px; margin-right: 0px;">
					    	<div class="form-group row" style="margin: 0px;">
						      <label class="col-sm-4 col-form-label"> </label>
						      <label class="col-sm-6 col-form-label"> 
						       <input type="submit" name="submit" value="Submit" class="btn btn-success"/>
						       <input type="reset" name="reset" value="Reset" class="btn btn-danger"/>
						      </label> 
						    </div>
					    </fieldset>
		                    
		                    
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>	
						</form:form>
 				</div>
 			</div>
 		</div>
 	
 	
 	

 
<%--  <jsp:include page="../common-admin/lower_block.jsp"></jsp:include> 
 --%>  
  <!-- <script>
	 	$(document).keydown(function(e){
		    if(e.which === 123){
		       return false;
		    }
		}); 
</script>
<script>

		$(document).bind("contextmenu",function(e) {
			 e.preventDefault();
			});
		</script> -->
 
</body>
</html>