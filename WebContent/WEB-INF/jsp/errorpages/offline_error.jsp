<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<center><h2>Sorry this application is currently <b style="color:red;">offline.</b><br>
Please try to access in online mode......</h2></center>
</body>
<script	src="resources/js/jquery-2.1.4.min.js"></script>
	
<script>
$(document).ready(function(){
		 history.pushState(null, null, document.title);
     		 window.addEventListener('popstate', function () {
         	 history.pushState(null, null, document.title);
      }); 
      });
      </script>

</html>