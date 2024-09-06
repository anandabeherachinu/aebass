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
             #chartContainer1, #chartContainer2, #chartContainer3, #chartContainer4{
             
            width: 600px;
            height: 400px;
            margin: auto;
        }
        canvas {
                    margin-top:5px;
        
            width: 100% !important;
            height: 100% !important;
            
        }
          .default-pointer {
            cursor: default;
        }
    </style>
</head>
<body>
<c:choose>
<c:when test="${sessionScope.role_id eq '1' }"> 			

 <jsp:include page="../common-admin/upper_block.jsp"></jsp:include>
		<div class="container-fluid">
 		<div class="row-fluid">	

    <div  id="chartContainer1"  class="default-pointer" style="width: 60%; margin: auto ; height: 550px; width: 950px;">
        <canvas id="attendanceChart1"></canvas>
        
    </div>
   
     <div id="chartContainer2" class="default-pointer" style="width: 60%; margin: auto;  height: 550px; width: 950px; ">
        <canvas id="attendanceChart2"></canvas>
    </div>
    
      <div  id="chartContainer3"  class="default-pointer" style="width: 60%; margin: auto ; height: 550px; width: 950px;">
        <canvas id="attendanceChart3"></canvas>
        
    </div>
   
     <div id="chartContainer4"  class="default-pointer" style="width: 60%; margin: auto;  height: 550px; width: 950px; ">
        <canvas id="attendanceChart4"></canvas>
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
								<c:forEach var="s" items="${studentcountITI1}" varStatus="count">
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
						<table id="data-table1">
							<thead>
								<tr>
									<th>college</th>
									<th>absent</th>
									<th>present</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${studentcountITI2}" varStatus="count">
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
						<table id="data-table2">
							<thead>
								<tr>
									<th>college</th>
									<th>absent</th>
									<th>present</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${studentcountITI3}" varStatus="count">
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
						<table id="data-table3">
							<thead>
								<tr>
									<th>college</th>
									<th>absent</th>
									<th>present</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${studentcountITI4}" varStatus="count">
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
                        text: 'Attendance Summary For ITI-1', // Your desired title here
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
        const table = document.getElementById('data-table1');
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
                        text: 'Attendance Summary For ITI-2', // Your desired title here
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
        const table = document.getElementById('data-table2');
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
        const ctx = document.getElementById('attendanceChart3').getContext('2d');
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
                        text: 'Attendance Summary For ITI-3', // Your desired title here
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
        const table = document.getElementById('data-table3');
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
        const ctx = document.getElementById('attendanceChart4').getContext('2d');
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
                        text: 'Attendance Summary For ITI-4', // Your desired title here
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
  

 
   
</body>
</html>
