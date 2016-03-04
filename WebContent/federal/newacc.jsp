<html>
    <head>
        <title>Open New Account</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="style.css" rel="stylesheet" type="text/css">
   <!--  <link href="js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="js-image-slider.js" type="text/javascript"></script>-->
  <link href="js-image-slider1.css" rel="stylesheet" type="text/css" />
    <script src="js-image-slider1.js" type="text/javascript"></script>
   

        <SCRIPT LANGUAGE="JavaScript">
            function DrawCaptcha()
    {
        var a = Math.ceil(Math.random() * 9)+ '';
        var b = Math.ceil(Math.random() * 9)+ '';       
        var c = Math.ceil(Math.random() * 9)+ '';  
        var d = Math.ceil(Math.random() * 9)+ '';  
        var e = Math.ceil(Math.random() * 9)+ '';  
        var f = Math.ceil(Math.random() * 9)+ '';  
        var g = Math.ceil(Math.random() * 9)+ '';  
        var code = a + ' ' + b + ' ' + c + ' ' + d + ' ' + e + ' '+ f + ' ' + g;
        document.getElementById("txtCaptcha").value = code;
    }
function validate(form)
{
        if(!isNaN(document.F1.fname.value))
        {
            alert("First name must be in charaters");
            document.F1.fname.value="";
            document.F1.fname.focus();
            return false;
        }
        if(!isNaN(document.F1.lname.value))
        {
            alert("Last name must be in charaters");
            document.F1.lname.value="";
            document.F1.lname.focus();
            return false;
        }
       if(document.F1.pass.value.length<8)
       {
           alert("password should be atleast 8 characters long");
           document.F1.pass.focus();
           document.F1.pass.value="";
           return false;
       }
    if(document.F1.pass.value!=document.F1.cpass.value)
    {
	   alert("Check Confirm Password"); 
	   document.F1.cpass.value="";
	   document.F1.cpass.focus();	
	   return false;
	}
	
	
	if(!isNaN(document.F1.ph.value))
   {
	   if((document.F1.ph.value.length<10)||(document.F1.ph.value.length>10))
	   {
		 alert("enter a valid mobile number");
		 document.F1.ph.value="";
		 document.F1.ph.focus();
         return false;   
	   }
   }
   else
   {
       alert("This  field  must  be  number");
	   document.F1.ph.value="";
           document.F1.ph.focus();
	   return false;
   }
	
	
	

   if(!isNaN(document.F1.amount.value))
   {
	   if(document.F1.amount.value < 500)
	   {
		 alert("Minimum Balance should be Rs500/-");
		 document.F1.amount.value="";
		 document.F1.amount.focus();
         return false;
	   }
   }
   else
   {
       alert("Amount must  be a  number");
	   document.F1.amount.value="";
           document.F1.amount.focus();
	   return false;
   }
   
   

   for(var i=0; i<form.elements.length; i++)
   {
		if(form.elements[i].value == "")
		{
		   alert("Fill out all Fields");
		   //document.F1.name.focus();
                   form.elements[i].focus();
		   return false;
		}
   }
       var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
        var str2 = removeSpaces(document.getElementById('txtInput').value);
        if (str1 != str2)
        {
            alert("Captcha verification failed ");
            document.F1.captcha.value="";
          document.F1.captcha.focus();
         return false;
            
        }
   

   return true;  
   }
   function removeSpaces(string)
    {
        return string.split(' ').join('');
    }
</SCRIPT>
    </head>
    <body onload="DrawCaptcha();" background="images/back.jpg">
        <img alt=""  src="images/federal.png" style="width:1350px; height:200px;">
          <br>
        <div id="navigation">
    <ul>
        <li><a href="federal_home.jsp">HOME</a></li>
    <li><a href="newacc.jsp">NEW ACCOUNT</a></li>
    <li><a href="checkbal.jsp">BALANCE</a></li>
    <li><a href="deposit.jsp">DEPOSIT</a></li>
    <li><a href="withdraw.jsp">WITHDRAW</a></li>
    <li><a href="transfer.jsp">TRANSFER</a></li>
    <li><a href="close.jsp">CLOSE A/C</a></li>
    <li><a href="about.jsp">ABOUT US</a></li>
    </ul>
</div>
<div>
    <fieldset>
        <legend><b>Registration Form</b></legend>
        <form name="F1"  action="newaccdb.jsp" method="post" autocomplete="off" >
        <table align="left">
            <tr><td>First Name:</td><td> <input type="text" name="fname" placeholder="Enter your first Name" required="required"></td></tr>
            <tr><td>Last Name:</td><td> <input type="text" name="lname" placeholder="Enter your last Name" required="required"></td></tr>
            <tr><td>  Password:</td><td> <input type="password" name="pass" placeholder="Enter password" required="required"><font size="1px">*password must be atleast 8 characters long</font></td></tr>
            <tr><td>  Confirm Password:</td><td> <input type="password" name="cpass" placeholder="Confirm Password" required="required"></td></tr>
            <tr><td> Amount:</td><td> <input type="text" name="amount" placeholder="Enter Amount" required="required"><font size="1px">*initial amount must be atleast Rs500/-</font></td></tr>
            <tr><td> Mobile:</td><td> <input type="text" name="ph" pattern="[789][0-9]{9}" placeholder="Enter Phone" required="required"></td></tr>
            <tr><td> Address:</td><td> <textarea  name="addr" placeholder="Enter address" cols="50" rows="5"></textarea></td></tr>
            <tr><td> Captcha Verification:</td><td><input type="text" id="txtCaptcha" style="background-image:url(1.jpg); text-align:center; border:none; font-weight:bold; font-family:Modern" readonly><a onclick="DrawCaptcha();"><img src="images/refresh.gif"></a> </td></tr>
            <tr><td></td><td><input type="text" name="captcha" id="txtInput" placeholder="enter above code"></td></tr>
            <tr><td></td><td><input type="submit" value="Register"></td></tr>
        </table>

    </form>
        
        <div id="sliderFrame" align="right">
        <div id="slider">
            <img src="images/slide_1.jpg" alt="Benifits of 3-in-1 A/Cs" />
            <img src="images/slide_2.jpg" alt="Educational Loan Scheme" />
            <img src="images/slide_3.jpg" alt="All Bank Ashiana Housing" />
            <img src="images/slide_5.jpg" alt="MSME Adoptation" />
            <img src="images/slide_6.jpg" alt="Dream Car Loan" />
            <img src="images/slide_7.jpg" alt="Start saving with security" />
            <img src="images/slide_9.jpg" alt="All Bank Cash Back" />
        </div>
        
        </div>
        
</fieldset>
</div>


    </body>
    </html>



