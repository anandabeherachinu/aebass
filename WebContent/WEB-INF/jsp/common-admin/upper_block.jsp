<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
<c:if test="${sessionScope.role_id eq '1' ||sessionScope.role_id eq '3' }">
	<%@ include file="header.jsp" %>
		<%@ include file="sidebar.jsp" %>
	</c:if>
	<c:if test="${sessionScope.role_id eq '2' }">
		<%@ include file="header.jsp" %>
	</c:if>
</nav>
 <!-- <div id="wrapper">
 <div id="page-wrapper" >
 style="padding-top:213px; margin-left:-346px;"
 

            <div class="container-fluid"> -->
           
            
            