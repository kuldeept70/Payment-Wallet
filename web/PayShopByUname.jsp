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
<title>Shop Payment</title>
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
           if(session.getAttribute("uDetail")==null){
            response.sendRedirect("CustomerLogin.jsp");
           }
        else{
            u=(UserDetails)session.getAttribute("uDetail");
            u=mngt.getDetails(u.uname, 1);
            session.setAttribute("uDetail", u);
        }
 %>
 <% 
    if(request.getParameter("reqOTP")!=null&&request.getParameter("reqOTP").equals("3")){
            //System.out.print("Hello test 1");
            String otp=mngt.SendOtp(u.mno);
            session.setAttribute("OTP",otp);
            session.setAttribute("PageRequest","3");
            session.setAttribute("cotp","0");
    }
 %>
<p>&nbsp;
<img border="0" src="image/onlinelogo.jpg" width="349" height="106" /></p>
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

<div style="width:60.7%;height:auto;margin-left:25%;float:top;background-color:#F5F5F5;"> 
   <br><br>
    <br><br>
    <% if(session.getAttribute("status")!=null){
       String status=(String)session.getAttribute("status");
       session.removeAttribute("status");
       %>
       <p style="margin-left: 25%;color: green"><% out.print(status); %></p>
       <%
      }
   %>
    <p style="font-size:25px;margin-left:32%;">Pay Shop Through PayJnu </p>
    <%if(!(session.getAttribute("OTP")!=null&&session.getAttribute("PageRequest")!=null&&session.getAttribute("PageRequest").equals("3"))){%>
    <form style="margin-left:25%; padding:8px;line-height:23px; background: #F5F5F5;" action="PayShopByUname.jsp" method="post" onsubmit="return validation();">
        <input type="hidden" name="reqOTP" value="3">
        <input type="hidden" name="PageRequest" value="3">
        Enter UserName:
       <input type="text" name="Uname" style="margin-top:6px;margin-left:23px;" id="uname">
        <br>
        <span id="suname" class="text-danger"></span> <br> 
        Renter UserName:
       <input type="password" name="cUname" style="margin-top:8px; margin-left:14px;" id="cuname"> <br>
       <span id="scuname" class="text-danger"></span> <br> 
        Enter Amount:
       <input type="text" name="Amount" style="margin-top:6px;margin-left:42px;" id="amt"><br>
       <span id="samt" class="text-danger"></span> <br>   
       <input type="Submit" style="margin-left:193px;margin-top:20px;" value="Get OTP"><br>
       </form>
    <%}%>
    <%if(session.getAttribute("OTP")!=null&&session.getAttribute("PageRequest")!=null&&session.getAttribute("PageRequest").equals("3")){%>
    <form style="margin-left:25%; padding: 0 8px;line-height:23px; background: #F5F5F5;" action="PayShopByUname.jsp" method="post">
            Please Do not Refresh Page While Transaction<br>Only 3 attempt allowed.<br>
        <%    if(request.getParameter("otp")!=null){
                        String otp1=request.getParameter("otp");
                        String otp2=(String)session.getAttribute("OTP");
                        if(otp1.equals(otp2)){
                        System.out.println("OTP Match");
                        RequestDispatcher rd=request.getRequestDispatcher("PayShop");
                        rd.forward(request, response);
                        }
                        else{
                        %>
                        <script>
                                alert("Wrong OTP");
                        </script>
                        <%
                        String n=(String)session.getAttribute("cotp");
                        System.out.print(n);
                        n+=1;
                        session.setAttribute("cotp",n);
                        if(n.length()==4){
                            session.removeAttribute("OTP");
                            session.removeAttribute("PageRequest");
                            response.sendRedirect("PayShopByUname.jsp");
                        }
                        }
             }
             if(request.getParameter("Uname")==null){
              session.removeAttribute("OTP");
              session.removeAttribute("PageRequest");
              response.sendRedirect("PayShopByUname.jsp");
            }
        %>
        <input type="hidden" name="Uname" value="<%out.print(request.getParameter("Uname"));%>">
        <input type="hidden" name="Amount" value="<%out.print(request.getParameter("Amount"));%>"><br>
        Enter OTP:
        <input type="password" name="otp" style="margin-top:8px; margin-left:60px;"><br>
        <input type="submit" style="margin-left:193px;margin-top:20px;margin-bottom: 8px;" value="Submit"><br>
    </form>
    <%}
    %>
 </div> 
<br><br><br><br>
<%@include file="NewFooter.jsp" %>
<script>
function validation(){
            var uname=document.getElementById("uname").value;
            var cuname=document.getElementById("cuname").value;
            var amt=document.getElementById("amt").value;
            if(uname===""){
                document.getElementById("suname").innerHTML="* Field Can't be empty.";
                return false;
            }
            else
            {
              document.getElementById("suname").innerHTML="";  
            }
            if(uname!==cuname){
              document.getElementById("scuname").innerHTML="* Username do not matched.";
              return false;
            }
            else
            {
              document.getElementById("scuname").innerHTML="";  
            }
            if(amt===""){
                document.getElementById("samt").innerHTML="* This field Can't be empty."; 
                return false;
            }
            else{
                document.getElementById("samt").innerHTML=""; 
            }
            if(isNaN(amt)){
              document.getElementById("samt").innerHTML="* Not a Valid Amount."; 
              return false;
            }
    }
</script>
 </body>
 </html>

