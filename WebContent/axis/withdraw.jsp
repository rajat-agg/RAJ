<html>
    <head>
        <title>Withdraw Money</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="style.css" rel="stylesheet" type="text/css">
    
  <!--  <link href="js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="js-image-slider.js" type="text/javascript"></script>-->
    <link href="js-image-slider1.css" rel="stylesheet" type="text/css" />
    <script src="js-image-slider1.js" type="text/javascript"></script>
        <script language="JavaScript">
            function validate(form)
             {
   for(var i=0; i<form.elements.length; i++)
   {
		if(form.elements[i].value == "")
		{
		   alert("Fill out all Fields");
		   
                   form.elements[i].focus();
		   return false;
		}
   }

   if(isNaN(document.F1.accno.value))
   {
       alert("Account number must  be a number");
	   document.F1.accno.value="";
	   document.F1.accno.focus();
	   return false;
   }
   if(!isNaN(document.F1.amount.value))
   {
	   if(document.F1.amount.value < 200)
	   {
		 alert("Minimum Amount should be Rs200/-");
		 document.F1.amount.value="";
		 document.F1.amount.focus();
         return false;
	   }
   }
   else
   {
       alert("Enter a valid amount");
	   document.F1.amount.value="";
	   return false;
   }
   
   return true;
}
            
            
        </script>
    </head>
    <body background="images/back.jpg">
        <img alt=""  src="images/axis.jpg" style="width:1350px; height:200px;">
          <br>
        <div id="navigation">
    <ul>
        <li><a href="axis_home.jsp">HOME</a></li>
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
            <legend><b>Debit money from your account</b></legend>
            <div><font color="red">
                <%if(request.getAttribute("withdrawdb")!=null)
			{
			out.print(request.getAttribute("withdrawdb"));
			}
			
			 %>
                         </font>
            </div>
            <form name=F1 onSubmit="return validate(this)" action="withdrawdb.jsp" method="post">
                <table>
                    <tr>
                        <td>
                            <b> Account number:</b>
                        </td>
                        <td>
                            <input type="text" name="accno" placeholder="enter your account number">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Password:</b>
                        </td>
                        <td>
                            <input type="password" name="pass" placeholder="enter your password">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Amount:</b>
                        </td>
                        <td>
                            <input type="text" name="amount" placeholder="enter amount"><font size="1px">*should be atleast Rs200/-</font>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Debit">
                        </td>
                    </tr>
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
