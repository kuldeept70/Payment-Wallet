<%-- 
    Document   : CWelcome
    Created on : 11 Apr, 2019, 10:33:38 PM
    Author     : Kuldeep Raj Tiwari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="kuldeep.*,Interface.*,SupportClass.*;"%>
<%! ManagementImpl mngt=new ManagementImpl(); 
    UserDetails u=new UserDetails();
%>
<html>

<head>
    <link rel="icon" type="image/ico" href="image/icon.png">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Corporate Welcome</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
article{
margin-top:2%;
width:100%;
height:25%;
float:left;
background-color:white;
border-top: 1px dotted #888A8A;
border-radius:10px;
}
</style>
</head>

<body oncontextmenu="return false;">
<% response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
           if(session.getAttribute("cDetail")==null){
            response.sendRedirect("CorLogin.jsp");
           }
        else{
            u=(UserDetails)session.getAttribute("cDetail");
            u=mngt.getDetails(u.uname, 0);
            session.setAttribute("cDetail", u);
        }
 %>
<p>&nbsp;
<img border="0" src="image/onlinelogo.jpg" width="349" height="106" /></p>
<form action="CLogout">        
    <input type="submit" name="B6" style="font-family: Tempus Sans ITC; font-weight: bold ;margin-left:50%;margin-top:-55px;margin-right: 22px; color:red;float: right;" value="Logout">
    <hr>
</form>
<%@include file="CButtontab.jsp" %>
<div style="width:60.7%;height:85px ;background-color:#3E4164;margin-left:25%;float: top;;"> 
    <b><font size="5" face="Segoe MDL2 Assets" color="#FFFFFF">&nbsp;
WELCOME TO PayJnu</font></b><i><br><br></i><font size="4" face="SimSun-ExtB" color="#FFFFFF">&nbsp; The world most-loved way to pay and get 
paid.</font>
</div> 

<div style="width:60.7%;height:auto;margin-left:25%;float:top;"> 
    
    <p>PayJnu portal provides personal banking services that gives you complete control over all your banking demands online.</p>
    <p>PayJnu Never Ask For Confidential Information Such as PIN And OTP From Customer.</p>
    <p>Any Such Call Can Be Made Only By a Fraudster.Please Do not Share Personal Information.</p>
    <p>Dear ‘PayJnu’ users, Payment services will not be accessible to you if your mobile number is not updated in the PayJnu records.</p>
    <p> Please register your mobile number immediately to enjoy uninterrupted INB services.</p>
    <p>Dear customer, beware of fake sites- before logging into PayJnu for making transactions. </p>
    <p>Click the padlock to check the Security Certificate.</p>
    <p>Please notify any unauthorised electronic transaction on 1-800-425-3800/1-800-11-2211 immediately. Longer the time taken to notify, higher would be the risk of loss to you. </p> 
    <p>In case your mobile is deactivated without your request or you get a call in this regard, somebody may be trying to get a duplicate SIM/ steal your credentials like OTP (One time password), confidential details for beneficiary registration etc.</p>
    <p>Please be cautious.</p>
 </div> 
<br><br><br><br>
<%@include file="NewFooter.jsp" %>
 </body>
 </html>
