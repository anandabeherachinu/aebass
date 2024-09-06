<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<%
   response.setHeader( "Pragma", "no-cache" );
   response.setHeader( "Cache-Control", "private, no-cache, no-store, must-revalidate, proxy-revalidate" );
   response.setDateHeader( "Expires", 0 );
%>
<%
String roleid = (String)request.getAttribute("roleId");
//System.out.println("roleid moal "+roleid);

%>

 <link rel="stylesheet" type="text/css" href="datepicker/jquery.datepick.css" />
 
 <link rel="stylesheet" type="text/css" href="css/bootstrap-multiselect.css" />
 <link href="/css/style.css" rel="stylesheet" type="text/css">
<head><title>View Remark</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
 
<h1>vfgvjg jbn nknb b</h1>
<%-- <div class="panel-body">
		 		  <input class="btn btn-primary btn-font-size " type="submit" id="print_id" value="PRINT" onclick="myApp.printTable()"/>
            	<h4><i class="halflings-icon align-justify"></i><span class="break"></span></h4>
		 			<table class="table_display" id="remark">
		 			 
		 			 <% if (roleid.equals("20"))
						{ %>			<tr>
					       				<td>PIA Claim Date  : <label class="required-field"></label></td>
					       				<td>${t.piasentDate}</td>
					       		     </tr>  	
									<tr>
					       				<td>${t.aso} (ASO)  : <label class="required-field"></label></td>
					       				<td>${t.asoremarks}</td>
					       		     </tr>  
					       		     <tr>
					       				<td>ASO Approved Date : <label class="required-field"></label></td>
					       				<td>${t.asoAproveDate}</td>
					       		     </tr>  	
					<%}else if (roleid.equals("21"))
						{ %>			<tr>
					       				<td>PIA Claim Date  : <label class="required-field"></label></td>
					       				<td>${t.piasentDate}</td>
					       		     </tr>  	
									<tr>
					       				<td>${t.aso} (ASO)  : <label class="required-field"></label></td>
					       				<td>${t.asoremarks}</td>
					       		     </tr>  
					       		     <tr>
					       				<td>ASO Approved Date : <label class="required-field"></label></td>
					       				<td>${t.asoAproveDate}</td>
					       		     </tr>  	
					<%} else if (roleid.equals("22"))
		 			{ %>              <tr>
					       				<td>PIA Claim Date  : <label class="required-field"></label></td>
					       				<td>${t.piasentDate}</td>
					       		     </tr>  
			                          <tr>
					       				<td> ${t.aso} (ASO) : <label class="required-field"></label></td>
					       				<td>${t.asoremarks}</td>
					       			</tr> 
					       			 <tr>
					       				<td>ASO Approved Date : <label class="required-field"></label></td>
					       				<td>${t.asoAproveDate}</td>
					       		     </tr>  
					       			<tr>
					       				<td>${t.so} (SO)  : <label class="required-field"></label></td>
					       				<td>${t.soremarks}</td>
					       		     </tr>  
					       		      <tr>
					       				<td>SO Approved Date : <label class="required-field"></label></td>
					       				<td>${t.soAproveDate}</td>
					       		     </tr> 
		 			<%} else if (roleid.equals("23"))
		 			{ %>               <tr>
					       				<td>PIA Claim Date  : <label class="required-field"></label></td>
					       				<td>${t.piasentDate}</td>
					       		     </tr> 
			                          <tr>
					       				<td> ${t.aso} (ASO) : <label class="required-field"></label></td>
					       				<td>${t.asoremarks}</td>
					       			</tr> 
					       			<tr>
					       				<td>ASO Approved Date : <label class="required-field"></label></td>
					       				<td>${t.asoAproveDate}</td>
					       		     </tr>
					       			<tr>
					       				<td>${t.so} (SO)  : <label class="required-field"></label></td>
					       				<td>${t.soremarks}</td>
					       		     </tr>  
					       		     <tr>
					       				<td>SO Approved Date : <label class="required-field"></label></td>
					       				<td>${t.soAproveDate}</td>
					       		     </tr>
					       		     <tr>
					       				<td>${t.no} (NO) : <label class="required-field"></label></td>
					       				<td>${t.noremarks}</td>
					       		     </tr>  
					       		     <tr>
					       				<td>NO Approved Date : <label class="required-field"></label></td>
					       				<td>${t.noAproveDate}</td>
					       		     </tr>
		 				<%} else if (roleid.equals("24"))
		 			{ %>               <tr>
					       				<td>PIA Claim Date  : <label class="required-field"></label></td>
					       				<td>${t.piasentDate}</td>
					       		     </tr> 
			                          <tr>
					       				<td>${t.aso} (ASO) : <label class="required-field"></label></td>
					       				<td>${t.asoremarks}</td>
					       			</tr> 
					       			<tr>
					       				<td>ASO Approved Date : <label class="required-field"></label></td>
					       				<td>${t.asoAproveDate}</td>
					       		     </tr>
					       			<tr>
					       				<td>${t.so} (SO)  : <label class="required-field"></label></td>
					       				<td>${t.soremarks}</td>
					       		     </tr>  
					       		       <tr>
					       				<td>SO Approved Date : <label class="required-field"></label></td>
					       				<td>${t.soAproveDate}</td>
					       		     </tr>
					       		     <tr>
					       				<td>${t.no} (NO) : <label class="required-field"></label></td>
					       				<td>${t.noremarks}</td>
					       		     </tr>  
					       		     <tr>
					       				<td>NO Approved Date : <label class="required-field"></label></td>
					       				<td>${t.noAproveDate}</td>
					       		     </tr>
					       		      <tr>
					       				<td>${t.ao} (AO) : <label class="required-field"></label></td>
					       				<td>${t.aoremarks}</td>
					       		     </tr>  
					       		      <tr>
					       				<td>AO Approved Date : <label class="required-field"></label></td>
					       				<td>${t.aoAproveDate}</td>
					       		     </tr>
		 				<%} else if (roleid.equals("25"))
		 			{ %>               <tr>
					       				<td>PIA Claim Date  : <label class="required-field"></label></td>
					       				<td>${t.piasentDate}</td>
					       		     </tr> 
			                          <tr>
					       				<td>${t.aso} (ASO) : <label class="required-field"></label></td>
					       				<td>${t.asoremarks}</td>
					       			</tr> 
					       			<tr>
					       				<td>ASO Approved Date : <label class="required-field"></label></td>
					       				<td>${t.asoAproveDate}</td>
					       		     </tr>
					       			<tr>
					       				<td>${t.so}(SO)  : <label class="required-field"></label></td>
					       				<td>${t.soremarks}</td>
					       		     </tr>
					       		       <tr>
					       				<td>SO Approved Date : <label class="required-field"></label></td>
					       				<td>${t.soAproveDate}</td>
					       		     </tr>  
					       		     <tr>
					       				<td>${t.no} (NO) :<label class="required-field"></label></td>
					       				<td>${t.noremarks}</td>
					       		     </tr> 
					       		      <tr>
					       				<td>NO Approved Date : <label class="required-field"></label></td>
					       				<td>${t.noAproveDate}</td>
					       		     </tr> 
					       		      <tr>
					       				<td>${t.ao} (AO) : <label class="required-field"></label></td>
					       				<td>${t.aoremarks}</td>
					       		     </tr> 
					       		      <tr>
					       				<td>AO Approved Date : <label class="required-field"></label></td>
					       				<td>${t.aoAproveDate}</td>
					       		     </tr>
					       		      <tr>
					       				<td>DD Remark : <label class="required-field"></label></td>
					       				<td>${t.ddremarks}</td>
					       		     </tr> 
					       		      <tr>
					       				<td>DD Approved Date : <label class="required-field"></label></td>
					       				<td>${t.ddAproveDate}</td>
					       		     </tr>
		 				<% } %>		 				
		 				</table> 
		 				
		 				
 </div> --%>
 <%-- <table>
 <tr>
 <th align="center">ASO Remark </th>
 <td>${t.asoremarks}</td>
 </tr>
 
 </table> --%>
 	
<!-- <div class="row-fluid">
 		<div class="box span12">
	 			
	 		<div class="box-content">
	             <div class="panel panel-default">
	 			 <div class="panel-heading panel-heading-custom panel-background" style="display:none">
	 			 <h3 class="panel-title">Take Action</h3>
	 		     </div>
	 				<h1>hii</h1> 	 
		 		  Lab
	
 </div>
 </div>
 </div>
 </div> -->



 
  <script type="text/javascript" src="datepicker/jquery.plugin.js"></script>
  <script type="text/javascript" src="datepicker/jquery.datepick.js"></script>


 <script type="text/javascript" >
		
		jQuery(function($) {
			
			//alert("inside:::0:::::",true);
			
			var today= new Date();
			$('#dob').datepick({ 
				
				  // minDate: new Date(2013, 6-1, 1), 
			     maxDate: new Date(today.getFullYear()-15, 12-1, 31),
			      monthsToShow: 1, 
			      showTrigger: '#calImg', 
			      
			     // yearRange: '1950:-13', 
			     yearRange: (today.getFullYear()-15+':-60'),
			      dateFormat: 'dd/mm/yyyy'
			    });
			
			
			
		
		});
		 
</script>

<script type="text/javascript">
	    $(function () {
	       
	        $(".disabilityType").hide();
			$(".disability").on("change",function(){
				
				console.log("change="+$(this).val());
			});
					
					
				$("#assessment").on("click",function()
						{
					if($("#assessment").val()=="YES")
					console.log("click="+$(this).val());
							var flag=false;
							
							$(".disability").each(function()
							{
								if($(this).is(":selected"))
									flag=true;
							});
							
							if(flag)
								$(".disabilityType").show();
							else
							
								$(".disabilityType").hide();
						});
				
				
				$(".disabilityType").hide();
				$(".not-disability").on("change",function(){
					console.log("change="+$(this).val());
				});
						
						
				$("#assessment").on("click",function()
							{
					if($("#assessment").val()=="No")
						console.log("click="+$(this).val());
								var flag=false;
								
								$(".not-disability").each(function()
								{
									if($(this).is(":selected"))
										flag=true;
								});
								
								if(flag)
									$(".disabilityType").hide();
								
								
							});
			});
	
	</script>
	 <script>
    var myApp = new function () {
        this.printTable = function () {
            var tab = document.getElementById('remark');
            var win = window.open('', '', 'height=700,width=700');
            win.document.write(tab.outerHTML);
            win.document.close();
            win.print();
        }
    }
</script>
	
	
	   
</body>
</html>