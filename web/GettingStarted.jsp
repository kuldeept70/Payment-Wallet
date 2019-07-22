<%-- 
    Document   : GetttingStarted
    Created on : 9 May, 2019, 3:22:19 PM
    Author     : Kuldeep Raj Tiwari
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" type="image/ico" href="image/icon.png">
<title>PayJnu</title>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">


<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>



</head>

<body >
<p>
<img border="0" src="image/onlinelogo.jpg" width="349" height="106"></p>
<form>
    &nbsp;&nbsp;
        <button type="button" onclick="location.href='index.jsp';" style="font-family: Tempus Sans ITC; font-weight: bold">Home</button>
        <button type="button" onclick="location.href='CustomerLogin.jsp';" style="font-family: Tempus Sans ITC; font-weight: bold">Customer Login</button>
        <button type="button" onclick="location.href='CorLogin.jsp';" style="font-family: Tempus Sans ITC; font-weight: bold">Corporate Login</button>	
        <button type="button" onclick="location.href='AboutUs.jsp';" style="font-family: Tempus Sans ITC; font-weight: bold">About Us</button>
        <button type="button" onclick="CustomerLogin.jsp" style="font-family: Tempus Sans ITC; font-weight: bold">Contact Us</button>
	<hr>
</form>      
<div style="width:90%;height:auto;background-color:#3E4164;margin-left:5%;margin-right: 5%;float: top;"> 
    <b><font size="6" face="Segoe MDL2 Assets" color="#FFFFFF">&nbsp;
WELCOME TO PayJnu</font></b><i><br><br></i><font size="5" face="SimSun-ExtB" color="#FFFFFF">&nbsp; The world most-loved way to pay and get 
paid.</font>
</div> 
<div style="width:90%;height:auto;margin-left:5%;margin-right: 5%;background-color:#F4F6F6;align-content: center;"> 
<h3 style="color:blue">HOW TO GET STARTED</h3>
<ul>       
<li style="font-size:22px;text-align: justify;">PayJnu is currently available for Android and iOS users. Android users, please download the app from the Google Play Store and install it on your device.</li>
<li style="font-size:22px;text-align: justify;">Open the website and verify your mobile number (your registered mobile number should be the same as the one registered with your bank account)</li>
<li style="font-size:22px;text-align: justify;">Then OTP will automatically send into your mobile no and put this OTP into OTP textarea and activate the wallet.</li>
<li style="font-size:22px;text-align: justify;">Enter your name, email address DOB,Address,userid which is not used before and set your 4-digit password.</li>

<li style="font-size:22px;text-align: justify;">Link your bank account to the app by selecting your bank, and the app will automatically fetch the details
Confirm your bank details, and start using the app to send or receive money or transact online with ease
</li></ul>
</div> 
<br><br>
<%@include file="NewFooter.jsp" %>
<br><br>
</body>
</html>

