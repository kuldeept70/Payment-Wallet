<%-- 
    Document   : CButtontab
    Created on : 13 Apr, 2019, 10:46:44 PM
    Author     : Kuldeep Raj Tiwari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style=" background-color:#3E4164;height:auto;width:19.3%;font-size:20px;margin-left:0.5%;">
        <font color="white" face="Bell MT" size="5"><img border="0" src="image/Lock.gif" width="22" height="22">Welcome &nbsp;&nbsp;&nbsp;<%out.println(u.name);%></font></div>
        <div style=" width:19.3%;height:500px;background-color:#A9A9A9;margin-left:0.5%;float: left;overflow-y: scroll;overflow-x: hidden;">
	<br><br> 
        <p>&nbsp;&nbsp;
        <button style="height:auto;width:80%" type="button" onclick="location.href='#';">Reset Password</button></p><br>
        <p>&nbsp;&nbsp;
        <button style="height:auto;width:80%" type="button" onclick="location.href='CAccept.jsp';">Accept Money</button></p><br>
        <p>&nbsp;&nbsp;
        <button style="height:auto;width:80%" type="button" onclick="location.href='CRefund.jsp';">Refund Money</button></p><br>
        <p>&nbsp;&nbsp;
        <button style="height:auto;width:80%" type="button" onclick="location.href='CStatement.jsp';">Get Account Statement</button></p><br>
        <p>&nbsp;&nbsp;
        <button style="height:auto;width:80%" type="button" onclick="location.href='CBalance.jsp';">Check Balance</button></p><br>
        <p>&nbsp;&nbsp;
        <button style="height:auto;width:80%" type="button" onclick="location.href='';">Redeem Meoney</button></p><br>
        <p>&nbsp;&nbsp;
            <button style="height:auto;width:80%" type="button" onclick="location.href='';">Pay to Bank Account</button></p><br>
        </div>
    </body>
</html>
