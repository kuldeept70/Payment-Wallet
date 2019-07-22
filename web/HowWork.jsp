<%-- 
    Document   : HowWork
    Created on : 9 May, 2019, 3:08:02 PM
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
    
<h3 style="color:blue;">How PayJnu Works?</h3><br>
<p style="font-size:18px; text-align: justify">
PayJnu is offering two options for the money transfer - E-wallet and Payments Bank. When you open account at payJnu, you are eligible for the e-wallet. And if you provide the KYC document then you will be able to hold the money in the payments bank. Payments bank gives interest on the money hold in the account. So it's good practice to open payments bank account by providing KYC once the payment banks option is enabled in account. 

Process of paying through payJnu works in this way.<br><br> 

1. You open account with PayJnu.<br> 
2. You add money from your bank to payJnu wallet.<br> 
3. You use this money to pay person who has payjnu wallet.<br> 
4. Just add the respective amount.<br> 
5. Choose the sender correctly using email or phone number or QR code.<br> 
6. Click send button.<br> <br>

In future payjnu may allow paying to UPI based users through the app. However current payJnu update doesn't have that feature. 

You can later withdraw this money to your bank account. There will be some transaction charges that will be applied so you have to accumulate some money before sending it from wallet to bank account. 

Here's how the payJnu works after January 2019 onwards. The payJnu will be divided into two sets of operation - 
<br><br>
1. E-wallet to E-wallet money transfer. <br>
2. Bank to Bank money transfer. <br><br>

In these two scenarios only the money from your own e-wallet can be withdrawn to your own bank (any bank where you hold the account. 

You can use your E-wallet to pay someone on their own bank account. Bank to e-wallet and vice versa are not allowed in the transaction. The same rule applies to  the PayJnu app as well. 

Business are making use of the QR code feature to help people accurately autofill the data of the business account. And you just have to use that to pay. If you don't want to use QR code then payJnu app also allows you to pay through the mobile number attached to the payJnu wallet.</p>
</div> 
<br><br>
<%@include file="NewFooter.jsp" %>
<br><br>
</body>
</html>
