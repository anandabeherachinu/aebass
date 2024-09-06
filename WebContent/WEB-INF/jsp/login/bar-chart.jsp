<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@page import="java.util.Random"%>

<!DOCTYPE html>
<html lang="en">
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






<%
   response.setHeader( "Pragma", "no-cache" );
   response.setHeader( "Cache-Control", "private, no-cache, no-store, must-revalidate, proxy-revalidate" );
   response.setDateHeader( "Expires", 0 );
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <jsp:include page="../common-admin/head.jsp"></jsp:include> 
    
    <title>College Attendance Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
      <style>
        #chartContainer {
            width: 600px;
            height: 400px;
            margin: auto;
        }
   /*      canvas {
            display: block;
        }
           #chartContainer1, #chartContainer2 {
            {
            margin-top:100px;
            width: 100% !important;
            height: 100% !important;
        } */
             #chartContainer1, #chartContainer2 {
             
            width: 600px;
            height: 400px;
            margin: auto;
        }
        canvas {
                    margin-top:5px;
        
            width: 100% !important;
            height: 100% !important;
        }
    </style>
</head>
<body>
<c:choose>
<c:when test="${sessionScope.role_id eq '1' }"> 			

 <jsp:include page="../common-admin/upper_block.jsp"></jsp:include>
		<div class="container-fluid">
 		<div class="row-fluid">	

    <div  id="chartContainer1" style="width: 60%; margin: auto ; height: 500px; width: 1550px;">
        <canvas id="attendanceChart1"></canvas>
        
    </div>
<%--     <canvas id="attendanceChart1" width="1137" height="568" style="display: block; box-sizing: border-box; height: 379px; width: 758px;"></canvas>
 --%>   
     <div id="chartContainer2" style="width: 60%; margin: auto;  height: 500px; width: 1550px; ">
        <canvas id="attendanceChart2"></canvas>
    </div>
    </div>
    </div>
    
    
    	<div class="hide" ><!-- class="hide" -->
						<table id="data-table">
							<thead>
								<tr>
									<th>college</th>
									<th>absent</th>
									<th>present</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${studentcountgovtpoly}" varStatus="count">
									<tr>
										<td>${s.rollId}</td>
										<td>${s.studentName}</td>
										<td>${s.instituteCode}</td>

									</tr>
								</c:forEach>
								<!-- Add more rows as needed -->
							</tbody>
						</table>
					</div>
					<div class="hide" ><!-- class="hide" -->
						<table id="data-tablee">
							<thead>
								<tr>
									<th>college</th>
									<th>absent</th>
									<th>present</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${studentcountITI}" varStatus="count">
									<tr>
										<td>${s.rollId}</td>
										<td>${s.studentName}</td>
										<td>${s.instituteCode}</td>

									</tr>
								</c:forEach>
								<!-- Add more rows as needed -->
							</tbody>
						</table>
					</div>
						<div class="hide" > 
						<table id="data-table7">
							<thead>
								<tr>
									
									<th>absent</th>
									<th>present</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${studentcountpolypiebar}" varStatus="count">
									<tr>
										
										<td>${s.studentName }</td>
										<td>${s.userName}</td>
									

									</tr>
								</c:forEach>
								<!-- Add more rows as needed -->
							</tbody>
						</table>
					</div>
					
					
					<div class="hide" > 
						<table id="data-table8">
							<thead>
								<tr>
									
									<th>absent</th>
									<th>present</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${studentcountITIpiebar}" varStatus="count">
									<tr>
										
										<td>${s.studentName }</td>
										<td>${s.userName}</td>
									

									</tr>
								</c:forEach>
								<!-- Add more rows as needed -->
							</tbody>
						</table>
					</div>
						</c:when>
		<c:otherwise>
			
					<div class="alert alert-danger">
					
					You are not an Authorized user for the content that you have requested......
					
					</div>
		</c:otherwise>
						</c:choose>
					  <script>
        // Extract data from the table and prepare it for the chart
         document.addEventListener('DOMContentLoaded', function() {
        const table = document.getElementById('data-table');
        const rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

        const colleges = [];
        const absentCounts = [];
        const presentCounts = [];

        for (let row of rows) {
            const cells = row.getElementsByTagName('td');
            const college = cells[0].innerText;
            const absent = parseInt(cells[1].innerText);
            const present = parseInt(cells[2].innerText);

            colleges.push(college);
            absentCounts.push(absent);
            presentCounts.push(present);
        }

        // Create the bar chart
        const ctx = document.getElementById('attendanceChart1').getContext('2d');
        const attendanceChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: colleges,
                datasets: [
                    {
                        label: 'Absent',
                        data: absentCounts,
                        backgroundColor: 'rgba(255, 102, 102, 1)',
                        borderColor: 'rgba(0, 0, 0, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'Present',
                        data: presentCounts,
                        backgroundColor: 'rgba(55, 162, 235, 1)',
                        borderColor: 'rgba(0, 0, 0, 1)',
                        borderWidth: 1
                    }
                ]
            },
            options: {
                responsive: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'Attendance Summary For Govt Poly', // Your desired title here
                        font: {
                            size: 16,
                            weight: 'bold',
                            color: 'rgba(0, 0, 0, 1)'
                        }
                    }
                },
                scales: {
                    x: {
                        stacked: true
                    },
                    y: {
                        beginAtZero: true,
                        stacked: true
                    }
                    
                }
            }
        });
           });
    </script>
    
    <script>
        // Extract data from the table and prepare it for the chart
         document.addEventListener('DOMContentLoaded', function() {
        const table = document.getElementById('data-tablee');
        const rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

        const colleges = [];
        const absentCounts = [];
        const presentCounts = [];

        for (let row of rows) {
            const cells = row.getElementsByTagName('td');
            const college = cells[0].innerText;
            const absent = parseInt(cells[1].innerText);
            const present = parseInt(cells[2].innerText);

            colleges.push(college);
            absentCounts.push(absent);
            presentCounts.push(present);
        }

        // Create the bar chart
        const ctx = document.getElementById('attendanceChart2').getContext('2d');
        const attendanceChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: colleges,
                datasets: [
                    {
                        label: 'Absent',
                        data: absentCounts,
                        backgroundColor: 'rgba(255, 102, 102, 1)',
                        borderColor: 'rgba(0, 0, 0, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'Present',
                        data: presentCounts,
                        backgroundColor: 'rgba(55, 162, 235, 1)',
                        borderColor: 'rgba(0, 0, 0, 1)',
                        borderWidth: 1
                    }
                ]
            },
            options: {
                responsive: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'Attendance Summary For ITI', // Your desired title here
                        font: {
                            size: 16,
                            weight: 'bold',
                            color: 'rgba(0, 0, 0, 1)'
                        }
                    }
                },
                scales: {
                    x: {
                        stacked: true
                    },
                    y: {
                        beginAtZero: true,
                        stacked: true
                    }
                    
                }
            }
        });
         });
    </script>
    <!-- 
 <script type="text/javascript">

  document.addEventListener("DOMContentLoaded", function () {
      // Get data from the table
      var data = [];
      var tableRows = document.querySelectorAll("#data-table7 tbody tr");
     //var tableRows = document.querySelectorAll("#data-table7");
      alert("tableRows",tableRows);
      console.log("tableRows",tableRows);
      tableRows.forEach(function (row) {
    	  console.log(row.cells[0].innerText,'row.cells')
          var category = row.cells[0].innerText;
          var value = row.cells[1].innerText);
          data.push({ label: category, data: value });
      });
console.log(data[0])
      // Create a pie chart
     var ctx = document.getElementById("pie-chart").getContext("2d");
      var pieChart = new Chart(ctx, {
          type: "pie",
          data: {
              labels: data.map(item => item.label),
              datasets: [{
                  data: data.map(item => item.data),
                  backgroundColor: [
                      'rgba(255, 99, 132, 0.7)',
                      'rgba(54, 162, 235, 0.7)',
                      // Add more colors as needed
                  ],
              }]
          },
          options: {
              responsive: true,
              maintainAspectRatio: true, 
          }
      });
  });
</script> -->
 
   
</body>
</html>
