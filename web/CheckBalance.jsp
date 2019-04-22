<%-- 
    Document   : PayAcademicFee
    Created on : 29 Mar, 2019, 1:14:49 AM
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
<title>Check Balance</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
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
<body >
<% response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
           if(session.getAttribute("uDetail")==null){
            response.sendRedirect("CustomerLogin.jsp");
           }
        else{
            u=(UserDetails)session.getAttribute("uDetail");
            u=mngt.getDetails(u.uname, 1);
            session.setAttribute("uDetail", u);
        }
 %>
<p>&nbsp;
<img border="0" src="image/onlinelogo.jpg" width="349" height="106" ></p>
<form action="logout">        
    <input type="submit" name="B6" style="font-family: Tempus Sans ITC; font-weight: bold ;margin-left:50%;margin-top:-55px;margin-right: 22px; color:red;float: right;" value="Logout">
    <hr>
</form>
<%@include file="CustButtontab.jsp"%>
<div style="width:60.7%;height:85px ;background-color:#3E4164;margin-left:25%;float: top;;"> 
    <b><font size="5" face="Segoe MDL2 Assets" color="#FFFFFF">&nbsp;
WELCOME TO PayJnu</font></b><i><br><br></i><font size="4" face="SimSun-ExtB" color="#FFFFFF">&nbsp; The world most-loved way to pay and get 
paid.</font>
</div> 

<div style="width:60.7%;height:auto;margin-left:25%;float:top;background-color:#F5F5F5;text-align: center;"><br><br>
    <p ><img border="0" src="image/wallet.png" width="100" height="106" ></p>
    <p style="align-content: center;"><br>
        <font style="font-size:26px;face:Arial Narrow; margin-left:1%;float: next;">Your Account Balance is:  INR <% out.println(u.balance);%></font><br><br>
    </p>
 </div> 
<br><br><br><br>
<%@include file="NewFooter.jsp" %>
 </body>
 </html>


