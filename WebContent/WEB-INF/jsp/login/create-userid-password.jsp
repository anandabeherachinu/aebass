<%@page import="java.util.Random"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<%
int n1 = 0;
if(session.getAttribute("n1") == null)
{
	//System.out.println("inside jsp n1::::::::::::::::::n1"+n1);srf
Random rand = new Random();
n1 = rand.nextInt(900000000) + 100000000;
//System.out.println("n1:::::::sec::::::::::::"+n1);
}
%>

<%

session.setAttribute("n1",n1);
//System.out.println("inside jsp n1::::::::::::::::session.get::"+(Integer)session.getAttribute("n1"));

%>


<%-- <%

int n2 = (Integer)session.getAttribute("n1");
System.out.println("n2:::::::::::::::::::"+n2);
session.setAttribute("n2", n2);
%> --%>

<%-- n2<c:out value="${n2}"></c:out> --%>

<%--  <c:if test="${not empty MSGS}">
					<div class="alert alert-success">
						${MSGS}
					</div>
				</c:if> --%>

<%-- <%
int n4 = (Integer)request.getAttribute("n2")!=null?(Integer)request.getAttribute("n2"):0;
System.out.println("request.getAttribute:::::::::::::::::::"+n4); 

if (n4 != 0 )
{
	System.out.println("INSIDE REQUEST::::::::::::::::::"); 	
int n3 = (Integer)request.getAttribute("n2");
System.out.println("n3:::::::::::::::::::"+n3);

}

%> --%>



<%
   response.setHeader( "Pragma", "no-cache" );
   response.setHeader( "Cache-Control", "private, no-cache, no-store, must-revalidate, proxy-revalidate" );
   response.setDateHeader( "Expires", 0 );
%>

<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <jsp:include page="../common-admin/head.jsp"></jsp:include> 
 
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
 <script type="text/javascript" src="js/cand_register.js"></script> 
<script src="js/popper.min.js"></script>
<script src="js/hash.js"></script>
<script src="js/jquery.base64.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="scripts/jqueryslidemenu.js"></script>
<script type="text/javascript" src="js/styleswitch.js"></script>
<script src="js/jquery-1.8.2.js"></script>
<script src="js/jquery-ui.js"></script>

 
  <!-- <link rel="stylesheet" type="text/css"
	href="css/pia-register.css" />  -->
	<link href="apps-style.css" rel="stylesheet" type="text/css" />
  <link href='css/fontapi.css' rel='stylesheet' type='text/css' />

   
 
<!--  <script>
 function aproveSet(obj)
 
 {
	 		alert("inside aproveS",true);
			window.addEventListener("offline", function()
					
			{
				alert("inside aproveSsss",true);
				$('#globalDiv').hide();
				$('#message').html('WARNING: Internet connection has ben lost.').show;
			});
			
			window.addEventListener("online", function()
					
			{
				
				$('#message').empty().hide();
				$('#globalDiv').show;
			});
			
			}
		</script>
  -->
   <script>
 function aproveSet(obj)
 
 {
	 		//alert("inside aproveS",true);
	 		window.addEventListener("offline", function () {
	 		    console.log("Online status: " + navigator.onLine);
	 		}, false);

	 		window.addEventListener("online", function () {
	 		    console.log("Online status: " + navigator.onLine);
	 		}, false);
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
 
 <script type="text/javascript">
 	 function checkDelete() 
	 {
			var r = confirm("Do you want to delete");
			if(r == true)
			{
				return true;
			}
			else
			{
				return false;
			}
			
	 } 
 </script>
 
 	<!-- Data table Start -->
    <script src="admin-public/js/datatable/jquery.dataTables.min.js"></script>
	<script src="admin-public/js/datatable/dataTables.bootstrap.min.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function() 
	{
	    $('#deptpaging').DataTable({
	    	
	    	'language':
	    	{
	            'search': '_INPUT_',
	            'searchPlaceholder': 'Search Sector'
	        },
	        "stateSave":true
	    });
	});
	</script>
	<!-- Data table End -->
</head>
<body>
 <jsp:include page="../common-admin/upper_block.jsp"></jsp:include>
 	<div class="container-fluid">
 		<div class="row-fluid">
 			
 			<div id="page-title">      
  <div class="panel-heading">
  
 
                <%--  <c:if test="${sessionScope.role_id eq '1' }">
                         	<h3>Welcome</h2>
                         </c:if>
                         <c:if test="${sessionScope.role_id eq '2' }">
                         	<h3>Welcome, ${sessionScope.user}</h2>
                         </c:if> --%>
                         
                          <c:if test="${sessionScope.role_id eq '5' }">
                         	<h3>Welcome, ${sessionScope.user}</h2>
                         </c:if> 
                         	<%
					String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
					ArrayList al = new ArrayList();
					int strLen = str.length() - 1;
					for (int i = 0; i < 8; i++) {
						Random r = new Random();
						int n = r.nextInt(strLen);
						al.add(str.charAt(n));
					}

					StringBuilder sb = new StringBuilder();
					for (Object s : al) {
						sb.append(s);
					}
					String salt = sb.toString();
					Date dt = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss");
					Random r = new Random();
					int x = r.nextInt(1000);
					String sdate = sdf.format(dt);
					salt = x + salt + sdate;
					session.setAttribute("salt", salt);
				%>
				<c:set var="salt" value="<%=salt%>" scope="page"></c:set>
                        
                </div>
               </div>
               
                 
             
 				<c:choose>
 			<%--  <c:when test="${sessionScope.role_id eq '1'}">  --%>
 		
 			<%-- <c:when test="${sessionScope.role_id eq '2'}"> --%>
 			<c:when test="${sessionScope.role_id eq '1' }">
 			<%-- <c:out value="${sessionScope.role_id}"></c:out> --%>
 			<div class="box col-md-12">
 			
 			
 				<form:form class="form-horizontal" action="create-userid-password.html" method="post"  modelAttribute="cb" ><!-- autocomplete="off" id="attTc" -->
 				<input type="hidden" name="udata"
								value="<c:out value="${salt}"/>" id="udata">
								<span style="font-size: 17px;color: red; position: absolute;margin-top: -29px">
										                    ${message}
										                </span>
				<table class="table_form">
 						<th colspan="2">Create UserId & Password</th>
 					
 					
 			
 					
 					<tr>
						<!-- <td><label id="secetor-text">Training Center:<span class="required-star">*</span></label></td> -->
						<td id="secetor-text">Select Institute Id:<span class="required-star">*</span></td>
						
						<td>
							 <form:select path="instituteCode" class="courese-sector" required="true" id="tcAjax">
					      			<form:option value="">Select</form:option>
					      			<c:forEach var="d"  items="${instituteId}">
					      				<form:option value="${d.instituteCode}" class="disablityosda">${d.instituteCode}/${d.instituteName}</form:option>
					      						
					      			</c:forEach>
				      		
				      		</form:select>
						</td>
						
						
					</tr>
 						<tr>
						<td id="secetor-text">Enter Role:<span class="required-star">*</span></td>
						
						<td>
							 <form:select path="month" class="courese-sector" required="true" id="tcAjax">
					      			<form:option value="">Select</form:option>
					      			<c:forEach var="s"  items="${role}">
					      				<form:option value="${s.instituteCode}" class="disablityosda">${s.instituteCode}/${s.instituteName}</form:option>
					      			</c:forEach>
				      		
				      		</form:select>
				      		
						</td>
						
						
					</tr>
					<tr>
											<td id="secetor-text">Enter Password:<span class="required-star">*</span></td>
					
					<td>
					 <form:password path="password" class="courese-sector" required="true" id="password"/>
					      			
				      		
 					</td>
 				</tr>
 				<tr>
											<td id="secetor-text">Choose a User Name:<span class="required-star">*</span></td>
					
					<td>
					 <form:input path="userName" class="courese-sector" required="true" id="tcAjax"/>
					      			
				      		
 					</td>
 				</tr>
					
					<tr>
						<td colspan="2" class="button-row">  
							<input type="submit" name="submit" value="Submit" class="btn btn-success" onclick="submitForm()"/>  <!-- onclick="return aproveSet(this)" -->
					       	<input type="reset" name="reset" value="Reset" class="btn btn-danger"/>
					       
						</td> 
					</tr>
					<tr>
						<td colspan="2" class="button-row">  
							<c:if test="${not empty MSGS}">
							<script>
							
					    	$('#sectorName').val("");
					    	$('#mesSectorCode').val("");
							</script>
								<div class="alert alert-success">
									${MSGS}
								</div>
							</c:if>
							<c:if test="${not empty MSGW}">
								<div class="alert alert-danger">
									${MSGW}
								</div>
							</c:if>
						</td> 
					</tr>
					
 				</table>
 				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
 				
 				
 				<input type="hidden" name="csrf" value="${n1}"/>
 				
 				
 					<%-- <%
					       	session.removeAttribute("n1");
					    	session.removeAttribute("n2");
					       	%> --%>
 				
 				</form:form>
 				
 	
 			
 			
 				
 				
 				</div>	
 				
 			
 				
 				</c:when>
		<c:otherwise>
			
					<div class="alert alert-danger">
					
					You are not an Authorized user for the content that you have requested......
					
					</div>
		</c:otherwise>
		</c:choose>
 				
 				<br/>
 		
 				



 		</div>
 	</div>

              

 <script>
 /* function ValidateAlpha(evt)
 {
     var keyCode = (evt.which) ? evt.which : evt.keyCode
     if ((keyCode < 65 || keyCode > 90) && !(keyCode ==8 || keyCode ==9) && (keyCode < 97 || keyCode > 123 &&!(keyCode ==8 || keyCode ==9)) && keyCode != 32) 
      
     return false;
         return true;
 } */
 function ValidateAlpha(evt)
 {
	 if(!((evt.key).match(/^[a-zA-Z ]*$/))){
		 
			document.getElementById("Sector_nm").innerHTML="<font size=2px color=red>Only Alphabets are allowed  Hints: (AGRICULTURE) </font>";
			document.getElementById("Sector_nm").focus();
			return false;
		}else{
			document.getElementById("Sector_nm").innerHTML="";
			/*  if((evt.key).match(/^((?!\s{2}).)*$/)){
				return false;
			}  */
			return true;	
		}
	 
	 return true;
	 /* alert("evt--"+evt.key,true);
     var keyCode = (evt.which) ? evt.which : evt.keyCode;
    
     if((keyCode < 65 || keyCode > 90&&!(keyCode==9||keyCode==8)) && (keyCode < 97 || keyCode > 123&&!(keyCode==9||keyCode==8)) &&( keyCode != 32&&!(keyCode==9||keyCode==8)))
     return false;
         return true; */
 }
 function isNumber(evt) {
	    evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	        return false;
	    }
	    return true;
	}
 
 
</script>
<!-- <script type="text/javascript" src="js/tc_batch.js"></script> -->
<script type="text/javascript" src="js/atten-pia-tc-bat-year-training.js"></script>

<%--  	<jsp:include page="../common-admin/lower_block.jsp"></jsp:include> 
 --%>  
	<script>
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
		</script>
		<script>
    var myApp = new function () {
        this.printTable = function () {
            var tab = document.getElementById('deptpaging');
            var win = window.open('', '', 'height=700,width=700');
            win.document.write(tab.outerHTML);
            win.document.close();
            win.print();
        }
    }
</script>
	<script>
				function submitForm()
				{
					/* var pass = document.getElementById("password").value;
					var salt = document.getElementById("udata").value;
					var passhash = $.md5(pass);
					console.log(passhash);
					
					passhash = $.md5(salt + passhash);
					document.getElementById("udata").value = "";
					passhash = $.base64.encode(passhash);
					document.getElementById("password").value = passhash; */
					
					/* alert("",true) */
					 alert("pass:::::"+pass) 
					 alert("pass:::::"+pass,true) 
					var pass = document.getElementById("password").value;
				 alert("pass:::::"+pass,true) 
					
					 
					
					 var salt = document.getElementById("udata").value;
					//alert("salt::UI:::"+salt,true) 
					 
					console.log(passhash);
					
					//passhash = SHA256(salt + passhash);
					
					//alert("passhash::after salt::::::"+passhash,true) 
					document.getElementById("udata").value = "";
					
					//passhash = $.base64.encode(passhash);
					var passhash = SHA256(pass); /* $.hash(pass); */
					
					//alert("passhash:::::"+passhash,true) 
					document.getElementById("password").value = passhash;
					
					//alert("passhash::final:after base 64:::::::"+passhash,true) 
					
					
					
					return true;
				}
				
				function disableForm()
				{
					var btn = $("#group-skill");
					btn.prop("disabled", true); 
				}
		</script>
		
	
	</body>
</html>
