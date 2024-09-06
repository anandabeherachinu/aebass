<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- <script type="text/javascript">

function setFinancialYear() {
	var finYear = $("#financialYear").val();
	var csrftoken = $("#csrftoken").val();
	window.location = "financialYear.html?finYear=" + finYear
			+ "&OWASP_CSRFTOKEN=" + csrftoken;
}

</script> -->
<style>
img.small {
    width: 435px; /* Adjust the width as needed */
}
 /*  .custom-size {
    font-size: 10px; /* Adjust the size as needed */
  } */


</style>

				<div class="navbar-header">
                   <!--  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button> -->
                <!--     <s:hidden value="%{#session.deptId}" id="deptId_hdn_id"/> -->
                    <span class="navbar-brand" style="color:#fff;">
<!--                     	<i class="fa fa-fw fa-database fa-lg"></i>
 -->                    		<img src="images/sctevt1.png" class="align-self-center b-emblem-image small" title="National Emblem of India" alt="emblem of india logo" style=" margin-top: -27px; ">
<!--                     	margin-left:-400px;
 -->                    	 Aadhaar Enable  Biometric Attendance for Student
                    	<!-- Skill Development -->
                    	<%-- <s:if test="#session.role==3 || #session.role==5 || #session.role==6 || #session.role==7 || #session.role==8 || 
                    					#session.role==9 || #session.role==10 || #session.role==11 || #session.role==12 || #session.role==13">
                    		<s:if test="#session.deptName !=null" >
                    			- <font color="aqua"><%= (String)session.getAttribute("deptName") %></font>
                    		</s:if>
                    	</s:if> --%>
                    </span>
                     <%-- <s:if test="#session.deptName !=null" >
                    	<span class="navbar-brand"  style="color:#fff;"><%= (String)session.getAttribute("deptName") %> </span>
                    </s:if> --%>
                    
          
                    
                </div>
                           <%--  <ul class="navbar-brand">
                    
                     <li><a href="financial_year.html" style="font-size: 11px;">
                     <select name="financialYear" id="financialYear" class="field" onchange="setFinancialYear();"
				                 style="width: 142px; margin-left: 15px; margin-top: 6px;">
					<option value="${financial} ">Financial Year</option>
					
			     </select></a></li>
                      
                    
                    </ul> --%>
                    
            <ul class="nav navbar-right top-nav">
           
                             
 
                 <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <strong class="text-break"><c:out value="${sessionScope.userName}"/></strong> <!-- <b class="caret"></b> --></a>
                    
                  
                    
                    <ul class="dropdown-menu">
                    	<!--
                        	<li>
                        		<a href=""> <i class="fa fa-fw fa-user"></i> Profile</a>
                        	</li>-->
                       
                        
                       <!--  <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li> -->
                        <li>
                            <a href="login.html" style="font-size: 11px;"><i class="fa fa-fw fa-home"></i><b>Home</b></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="change-password.html" style="font-size: 11px;"><i class="fa fa-fw fa-lock"></i><b>Change Password</b></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="dept-logout.html" style="font-size: 11px;" ><i class="fa fa-fw fa-power-off"></i><b>Log Out</b></a>
                        </li>
                    </ul>
                </li>
            </ul>
    