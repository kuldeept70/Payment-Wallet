<%-- 
    Document   : CorLogin
    Created on : 4 Apr, 2019, 12:52:19 AM
    Author     : Kuldeep Raj Tiwari
--%>
<html>

<head>
    <link rel="icon" type="image/ico" href="image/icon.png">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Corporate Login</title>
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
    <%
           if(session.getAttribute("uDetail")!=null){
            response.sendRedirect("CustomerWelcome.jsp");
           }
           if(session.getAttribute("cDetail")!=null){
            response.sendRedirect("CWelcome.jsp");
           }
        %>
<p><img border="0" src="image/onlinelogo.jpg" width="349" height="106;"></p>
<form style="">
        &nbsp;&nbsp;
        <button type="button" onclick="location.href='index.jsp';" style="font-family: Tempus Sans ITC; font-weight: bold">Home</button>
        <button type="button" onclick="location.href='CustomerLogin.jsp';" style="font-family: Tempus Sans ITC; font-weight: bold">Customer Login</button>
        <button type="button" onclick="location.href='CorLogin.jsp';" style="font-family: Tempus Sans ITC; font-weight: bold">Corporate Login</button>	
        <button type="button" onclick="location.href='AboutUs.jsp';" style="font-family: Tempus Sans ITC; font-weight: bold">About Us</button>
        <button type="button" onclick="CustomerLogin.jsp" style="font-family: Tempus Sans ITC; font-weight: bold">Contact Us</button>
	<hr>
</form>  
<div style=" width:19.3%;height:auto;background-color:#A9A9A9;margin-left:0.5%;float: left;">
<div style=" background-color:#3E4164;height:auto;width:100%;font-size:20px;margin-left:0.5%;">
    <font color="white" face="Bell MT" size="5">&nbsp;&nbsp;&nbsp;&nbsp;Corporate Login<img border="0" src="image/Lock.gif" width="22" height="22"></font></div>
<form method="post" action="CAuth">
    <%   
        if(session.getAttribute("clocked")!=null){
            out.println("<p style=\"color: #FF0000\">&nbsp;&nbsp;&nbsp;&nbsp;User temporarily Locked.Try after 1 &nbsp;&nbsp;&nbsp;&nbsp;minute</p>");
            
        }
         else if(session.getAttribute("cloginStatus")!=null&&session.getAttribute("cloginStatus").equals("0")){
               int attempt=3-(Integer)session.getAttribute("cattempt");
               out.println("<p style=\"color: #FF0000\">&nbsp;&nbsp;&nbsp;&nbsp;Login Failed. "+attempt+" attempt remaining </p>");
         }
    %>
    <% if(session.getAttribute("status")!=null){
       String status=(String)session.getAttribute("status");
       session.removeAttribute("status");
       %>
       <p style="margin-left: 25%;color: green"><% out.print(status); %></p>
       <%
      }
    %>
	<!--webbot bot="SaveResults" U-File="_private/form_results.csv" S-Format="TEXT/CSV" S-Label-Fields="TRUE" startspan --><input TYPE="hidden" NAME="VTI-GROUP" VALUE="1"><!--webbot bot="SaveResults" i-checksum="43406" endspan -->
	<p style="margin-bottom:-17px">&nbsp;&nbsp;&nbsp;&nbsp;User Id</p><br>
	<p>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="uname" size="20" style="width:70%;"></p><br>
	<p style="margin-bottom:-17px">&nbsp;&nbsp;&nbsp;&nbsp;PayJnu password</p><br>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="pwd" size="20" style="width:70%;"></p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Login"></p>
	<p>&nbsp;&nbsp;&nbsp;&nbsp;<a style="text-decoration: underline; color: #FF0000" href="">
	Problem with login?</a></p>
	<p>&nbsp;&nbsp;&nbsp;&nbsp;New to PayJnu? <a style="color: #0000FF" href="">Sign up</a></p>
</form>
        <hr>
        <div style=" width:100%;height:auto;margin-left: 1%;margin-left: 4%;"><br>
        <p style=""><font face="Arial Narrow" size="5">Get to Know PayJnu</font></p>
        <nav style="margin-left:1.3%">
        <a href="#" style="color:#336699">How PayJnu Works</a><font color="#336699"><br><br>
        </font>
        <a href="#" style="color:#336699">Getting Started</a><font color="#336699"><br><br>
        </font>
        <a href="#" style="color:#336699">Managing Your Account</a><font color="#336699"><br><br>
        </font>
        <a href="#" style="color:#336699">GreatWays to Use PayJnu</a><font color="#336699"><br><br>
        </font>
        <a href="#" style="color:#336699">Top 10 Things to Know about PayJnu</a>
        </nav><br>
        </div> 
</div>
</div><div style="width:60.7%;height:auto;background-color:#3E4164;margin-left:25%;float: top;;"> 
    <b><font size="6" face="Segoe MDL2 Assets" color="#FFFFFF">&nbsp;
WELCOME TO PayJnu</font></b><i><br><br></i><font size="5" face="SimSun-ExtB" color="#FFFFFF">&nbsp; The world most-loved way to pay and get 
paid.</font>
</div> 

<div style="width:60.7%;height:auto;margin-left:25%;float:top;"> 
    
    <div style="class:container;width:100%;"> 
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
       <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="image/card.jpg"  alt="card" style="width:100%;height:260px; ">
      </div>

      <div class="item">
        <img src="image/images.jpg" alt="images" style="width:100%; height:260px;">
      </div>
    
      <div class="item">
        <img src="image/payment.jpg" alt="payemnt" style="width:100%;height:260px;">
      </div>
        <div class="item">
        <img src="image/srd.jpg" alt="srd" style="width:100%;height:260px;">
      </div>
      
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
</div>
<br><br><br><br><br><br><br>
<%@include file="NewFooter.jsp" %>
</body>

</html>

