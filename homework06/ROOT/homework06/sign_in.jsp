<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<meta charset="UTF-8" />
	<link href="form.css" rel="stylesheet" />
</head>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homework06.CheckerSignIn" %>

<jsp:useBean id="arrayBean" class="homework06.CheckerSignIn"/>

<jsp:setProperty name='arrayBean' property='login' value="${param['login']}"/>
<jsp:setProperty name='arrayBean' property='password' value="${param['password']}"/>

<body>
	<c:set var='log' value="${arrayBean.login}"/>
    <c:set var='access' value="${arrayBean.access}"/>
    <c:set var='show' value="${arrayBean.show}"/>
	<c:set var='result' value=''/>
</body>


<c:set var='mysession' value="tryCheck" scope="session"/>
<center>
  
<c:if test = "${access eq 'Successfully logged'}">
	<script>
    alert( 'Successfully logged!' );
	</script>
		<c:set var='mysession' value="checkLog" scope="session"/>
</c:if>


<c:if test = "${(param['logOut'] eq 'logOut')}">
     
		<c:set var='mysession' value="uncheck" scope="session"/>	
	
	<c:set var='show' value='false'/>
	
	
</c:if>


<c:if test = "${(sessionScope.mysession eq 'checkLog')}">
	 <c:set var='name' value="${arrayBean.name}"/>
	<c:set var='result' value='Hello ${name}!'/>
	${result}<br>
	<c:set var='show' value="${(sessionScope.mysession eq 'checkLog') ? 'true' : 'false'}"/>
</c:if>

<c:if test = "${show eq 'false'}">
<form action="index.jsp" method="post">
   
   <input type="hidden" name="currentSession" value="${mysession}" />
	<br><button  class="button" type=submit>
				Return Menu</button><br>
				</form>


<form id="loginForm" action="" method="post">
<table>


	<tr>
	
	
		<td>
		<label>Enter your login:</label>
		</td>
		<td align="center">
		<input type="text" name="login" id="login" value="${param['login']}"/>
		</td>
	
	</tr>

	<tr>
		<td>
		<label>Enter your password:</label>
		</td>
		<td align="center">
		<input type="password" name="password" value="" id="pass" />
		</td>
	
	
	</tr>
	

<c:if test = "${access eq 'Incorrect username or password' && param['login']!=null}">
	<tr>
	<td><label>Error:</label></td>
	<td align="center"><label>Incorrect username or password</label></td>
	</tr>
</c:if>
	
</table>

	<div class="submit">
		<button type="submit">Enter</button>
		<label id="remember" align="left"><input name="" type="checkbox" value="" /> Remember me</label>
	</div>

</form>
</c:if>

<c:if test = "${show eq 'true'}">

<form action="index.jsp" method="post">
   
   <input type="hidden" name="currentSession" value="${mysession}" />
   <input type="hidden" name="currentName" value="${result}" />
	<br><button  class="button" type=submit>
				Return Menu</button>
				</form><br>
				
 <form action = '' method="post">
  
	
    <button type = 'submit', name = 'logOut' value="logOut">Log out</button>
    
	</form>
</c:if>

</center>
</html>
