<%-- 
    Document   : CustButtontab
    Created on : 14 Apr, 2019, 12:29:22 AM
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
                <button style="height:auto;width:80%;" type="button" onclick="location.href='PayMessBill.jsp';">Pay Mess Bill</button></p><br>

                <p>&nbsp;&nbsp;
                <button style="height:auto;width:80%" type="button" onclick="location.href='PayAcademicFee.jsp';">Pay Academic Fee</button></p><br>
                <p>&nbsp;&nbsp;
                <button style="height:auto;width:80%" type="button" onclick="location.href='PayShopByUname.jsp';">Pay Online</button></p><br>
                <p>&nbsp;&nbsp;
                <button style="height:auto;width:80%" type="button" onclick="location.href='CustTransMoney.jsp';">Transfer Money</button></p><br>
                <p>&nbsp;&nbsp;
                <button style="height:auto;width:80%" type="button" onclick="location.href='#';">Add Money</button></p><br>
                <p>&nbsp;&nbsp;
                <button style="height:auto;width:80%" type="button" onclick="location.href='CustChangeMob.jsp';">Update Profile</button></p><br>       
                <p>&nbsp;&nbsp;
                <button style="height:auto;width:80%" type="button" onclick="location.href='CustStatement.jsp';">Get Account Statement</button></p><br>
                <p>&nbsp;&nbsp;
                <button style="height:auto;width:80%" type="button" onclick="location.href='CheckBalance.jsp';">Check Balance</button></p><br>
        </div>
    </body>
</html>
