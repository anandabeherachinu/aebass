<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Menu ul -->


<% String roleId=(String)session.getAttribute("userName");
 %>

<% String role_id=(String)session.getAttribute("role_id");
  %>


<ul class="nav navbar-nav side-nav">

	<li class="active"><a href="dashboard.html"><i
			class="fa fa-fw fa-dashboard"></i> Dashboard </a></li>

	<!-- Iterating Main Menu -->


	<!-- Menu list -->

	<%-- ADMIN --%>
	<c:if test="${sessionScope.role_id eq '1' }">
		<!-- <li><a href="bar-chart.html">Bar chart</a></li> -->
		<li><a href="bar-chart-govt-polytechnic.html">Bar chart Govt PolyTechnic</a></li>
		<li><a href="bar-chart-ITI.html">Bar chart ITI</a></li>
		<li><a href="piechart-admin.html">Pie chart PolyTechnic & ITI</a></li>
		
		
	
	<li><a href="registered-institute.html">Registered Institute</a></li>
		<li><a href="registered-institute-student.html">Registered Institute & Student</a></li>
	
	<li><a href="view-all-student-list-sidebar.html">Total Registered Student</a></li>
	<li> <a href="attendance-report-datewise.html"> Attendance Report Date Wise PolyTechnic</a> </li>  
	<li> <a href="attendance-report-datewise-iti.html"> Attendance Report Date Wise ITI </a> </li>  
	<li><a href="create-userid-password.html"> Create User Id & Password </a></li>
		
			<li>
							<a href="javascript:;" data-toggle="collapse" data-target="#submenu_ul_idcourse4">
							Reports
								<i class="fa fa-fw fa-caret-down"></i></a> 
								<ul id="submenu_ul_idcourse4" class="collapse">
								
				<li> <a href="attendance-report.html"> Attendance Report </a> </li>  
				<li> <a href="attendance-report-semester.html"> Attendance Report semester wise </a> </li>  
				<li> <a href="attendance-report-branch.html"> Attendance Report Branch wise </a> </li>  
				<li> <a href="attendance-report-branch-ITI-Admin.html"> Attendance Report ITI</a> </li>  
				
					
							</ul>
					</li>
					

		

	</c:if>




	<%-- DEPT --%>
	<c:if test="${sessionScope.role_id eq '2' }">
			<li><a href="attendance.html">Attendance New</a></li>
	

	</c:if>
	
		<c:if test="${sessionScope.role_id eq '3' }">
		<li><a href="piechart-institutewise.html">Pie chart </a></li>
			<li><a href="registered-student.html">Registered Student</a></li>
			<li><a href="registered-student-details.html">Registered Student Details</a></li>
							<li><a href="present-student.html">Present Students</a></li>
							<li> <a href="attendance-report-datewise-principal.html"> Attendance Report Date Wise PolyTechnic </a> </li>
							<li> <a href="attendance-report-datewise-principal-iti.html"> Attendance Report Date Wise ITI </a> </li> 
							 
<li>
							<a href="javascript:;" data-toggle="collapse" data-target="#submenu_ul_idcourse4">
							Reports
								<i class="fa fa-fw fa-caret-down"></i></a> 
								<ul id="submenu_ul_idcourse4" class="collapse">
								
<!-- 				<li> <a href="attendance-report.html"> Attendance Report </a> </li>  
 -->				<li> <a href="attendance-report-semester-collegewise.html"> Attendance Report semester wise </a> </li>  
				<li> <a href="attendance-report-branch-collegewise.html"> Attendance Report Branch wise </a> </li>  
				<li> <a href="attendance-report-branch-ITI.html"> Attendance Report ITI</a> </li>  
				
					
							</ul>
					</li>	

	</c:if>

</ul>



