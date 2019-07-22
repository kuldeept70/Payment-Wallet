<%-- 
    Document   : ContactUs
    Created on : 9 May, 2019, 4:56:39 PM
    Author     : Kuldeep Raj Tiwari
--%>
<html>
    <head>
        <link rel="icon" type="image/ico" href="image/icon.png">
        <title>Contact Us</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
                    <p>
            <img border="0" src="image/onlinelogo.jpg" width="349" height="106"></p>
            <form>
                    <button type="button" onclick="location.href='index.jsp';" style="font-family: Tempus Sans ITC; font-weight: bold">Home</button>
                    <button type="button" onclick="location.href='CustomerLogin.jsp';" style="font-family: Tempus Sans ITC; font-weight: bold">Customer Login</button>
                    <button type="button" onclick="location.href='CorLogin.jsp';" style="font-family: Tempus Sans ITC; font-weight: bold">Corporate Login</button>	
                    <button type="button" onclick="location.href='AboutUs.jsp';" style="font-family: Tempus Sans ITC; font-weight: bold">About Us</button>
                    <button type="button" onclick="CustomerLogin.jsp" style="font-family: Tempus Sans ITC; font-weight: bold">Contact Us</button>
                    <hr>
            </form> 
            <div style="height:auto;width:70%;background-color:#F4F6F6  ;margin-left:15%;">
                        <font style="font-size:37px;face:Arial Narrow;margin-left:40%;">About Us<br><br></font><br>
                        <hr>
                        <p style="font-size:20px;face:Arial Narrow;text-align:center;"> Our goal is to make digital payments so easy, safe and accepted across university that people never feel the need to carry 
                        cash or cards again. We believe India is at the cusp of a new mobile revolution, which will change the way we 
                        manage our money on the go. We see ourselves facilitating this change, through technology and dogged customer 
                        centricity.</p><br>


                <p style="font-size:21px;face:Arial Narrow;text-align:center;font-weight: bold;">   Leadership Team</p>


                <br><br>

                <div style="width:100%;height: auto;">       
                <div style="width:22%;height:auto;margin-left:42%;float: top;"> 
                <img  src="image/karan.jpg" width="125" height="115" style="border-radius: 50%">
                <p style="font-size:20px;face:Arial Narrow;">Dr Karan Singh</p>
                <p>Assistant Professor SC&SS JNU New Delhi. He is a Project Mentor.
                </p>
                </div>
                <div style="float:left;width:22%;height:auto;margin-left: 12%;"> 
                 <img  src="image/kuldeep.jpg" width="125" height="115" style="border-radius: 50%">
                <p style="font-size:20px;face:Arial Narrow;">Kuldeep Raj Tiwari(Jnu)</p>
                <p>He is a Team leader of This Project and also a backend developer</p>
               </div>
               <div style="float:left;width:22%;height:auto;margin-left: 12%;">  
                <img  src="image/gaurav.jpg" width="125" height="115" style=" border-radius: 50%">
                <p style="font-size:20px;face:Arial Narrow;">Gaurav Verma(Jnu)</p>
                <p>He is front-end developer of This Project and also a backend developer</p>
               </div>
               <div style="float:left;width:20%;height:auto;margin-left:12%;">  
                  <img  src="image/sandeep.jpg" width="125" height="115" style="border-radius: 50%">
                  <p style="font-size:20px;face:Arial Narrow;">Sandeep Kumar(Jnu)</p>
                  <p style="margin-left:0%">He is a front-end developer of This Project and also a backend developer</p>
               </div>
               </div>             
                <div style="float:bottom;width:100%;height:auto;">
                <br><br><br><br><br><hr>
                <p style="font-size:20px;face:Arial Narrow;text-align:center;">PayJnu is a brand owned by PayJnu Private Limited 
                            (Formerly known as FX Mart Pvt Ltd) (CIN - U67190DL2012PTC303812). 
                            It is licensed by the Jawaharlal Nehru University New,Delhi for issuance and operation of a Semi Closed Prepaid Payment system.

                </p> 
                </div>

            </div>
            <%@include file="NewFooter.jsp" %>
    </body>
</html>
