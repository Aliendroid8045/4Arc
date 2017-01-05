<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vconnect</title>
   
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="css/bar.css" rel="stylesheet" type="text/css" />
    <link href="css/light.css" rel="stylesheet" type="text/css" />
    <link href="css/dark.css" rel="stylesheet" type="text/css" />
    <link href="css/nivo-slider.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
   
    <link href="css/default.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
           function CheckForPastDate(sender, args) {
               var selectedDate = new Date();
               selectedDate = sender._selectedDate;

               var todayDate = new Date();

               if (selectedDate.getDateOnly() > todayDate.getDateOnly()) {

                   sender._selectedDate = todayDate;
                   sender._textbox.set_Value(sender._selectedDate.format(sender._format));

                   alert("Date cannot be in the future");
               }
               function abc(sender, args) {
                   var a = sender._textbox.get_Value;
                   if (a <= 0) {
                       alert("wrong dates");
                   }
               }
           }
</script>

    

</head>
<body>
    <form id="form1" runat="server">
     <div style=" background-color: #ffffff;">
   <div style=" height: 93px; background-color: #7F7F7F; background-image: url('images/hea.jpg'); background-repeat: no-repeat;">

        &nbsp;&nbsp;&nbsp;&nbsp;
      <img src="images/final1.png" alt="" style="height: 110px; width: 230px" />
        </div>
    
   
   <div style=" width: 100%; height: 2px; background-color: #ffffff;"></div>
       
    
    <div style="margin-right: 20px; margin-top:20px; float: right;width:270px">
       
      <div class="shadow" style=" background-color: #181919; 
    height:30px; ">
   
         <asp:Label ID="Label2" runat="server" Text="Log In" Font-Names="Gabriola" 
            ForeColor="#ffffff" Font-Size="X-Large" style="margin-left:100px"></asp:Label>
            </div>
           <div class="shadow" style="background-color: #ffffff;padding:12px;width:226px;margin-left:10px;margin-top:1px">
<asp:textbox ID="uname" runat="server" placeholder="user name" 
            ValidationGroup="login" CssClass="glowing-border" ></asp:textbox><br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
               <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                   ValidationGroup="forget" Font-Names="Calibri" Font-Size="Medium" 
                   TabIndex="4">Forgot Password??</asp:LinkButton>

        <br />
        <asp:TextBox ID="pas" runat="server" placeholder="Password" TextMode="Password" 
            ValidationGroup="login" CssClass="glowing-border"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="pass" ErrorMessage="enter password"></asp:RequiredFieldValidator>
        <br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="login" runat="server" Text="Login" onclick="login_Click" 
            ValidationGroup="login" /><br /> 

 </div><br /> <br /><br /><br /><br />
        <asp:Panel ID="Panel1" runat="server">
        
        <div id="forget">

   
      <div class="shadow" style="background-color: #181919; height:30px">
<asp:Label ID="Label3" runat="server" Text="Forget Password" Font-Names="Gabriola" 
            ForeColor="#ffffff" Font-Size="X-Large" style="margin-left:70px"></asp:Label>
     </div> 
      <div class="shadow" style="background-color: #ffffff;padding:12px;width:226px;margin-left:10px;margin-right:10px">
    <asp:TextBox ID="TextBox1" runat="server" 
        placeholder="enter your email" ValidationGroup="forget" 
              CssClass="glowing-border"></asp:TextBox><br /><br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Button ID="Button1" runat="server" Text="Get It" 
        onclick="Button1_Click" ValidationGroup="forget" />
 </div>
     </div> </asp:Panel>
   </div>
    <div style="margin-left: 20px;margin-top:20px;width:270px; float: left;" >

       
         
      <div class="shadow" style="background-color: #181919; height:30px;">
<asp:Label ID="Label5" runat="server" Text="Register" Font-Names="Gabriola" 
            ForeColor="#ffffff" Font-Size="X-Large" style="margin-left:90px">
            </asp:Label>
           </div> 
           <div class="shadow" style="background-color: #ffffff;padding:12px;width:226px;margin-left:10px; margin-top:1px">
           <asp:TextBox ID="fname" runat="server" 
              placeholder="First Name" ValidationGroup="submit" CssClass="glowing-border" ></asp:TextBox>
             
        
      
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="fname" ErrorMessage="*" Font-Size="Small" 
               ValidationGroup="submit"></asp:RequiredFieldValidator>
  <br />
    
       
    <asp:TextBox ID="lname" runat="server" placeholder="Last Name" 
               ValidationGroup="submit" CssClass="glowing-border" ></asp:TextBox><br />
    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="lname" ErrorMessage="*" Font-Size="Small" 
               ValidationGroup="submit"></asp:RequiredFieldValidator>
 <br />
    
           <asp:DropDownList ID="iam" runat="server" CssClass="glowing-border">
               <asp:ListItem>I am</asp:ListItem>
               <asp:ListItem>Male</asp:ListItem>
               <asp:ListItem>Female</asp:ListItem>
           </asp:DropDownList> <br />

     
 &nbsp;
   
&nbsp;<asp:Label ID="Label9" runat="server" ForeColor="Red" Text="Label"></asp:Label>
&nbsp;<br />
           <asp:ScriptManager ID="ScriptManager1" runat="server">
           </asp:ScriptManager>   
           <asp:TextBox ID="cal" runat="server" placeholder="Date of Birth" 
               ValidationGroup="submit" CssClass="glowing-border"></asp:TextBox><asp:CalendarExtender ID="CalendarExtender1"
               runat="server" TargetControlID="cal" 
               onclientdateselectionchanged="CheckForPastDate"></asp:CalendarExtender>
               <br /> <br />
          <asp:TextBox ID="email" runat="server" placeholder="E-mail ID" 
               ValidationGroup="submit" CssClass="glowing-border" ></asp:TextBox>
 <br />
           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="email" ValidationGroup="submit"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="email" ErrorMessage="Please enter valid email id" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Size="Small"></asp:RegularExpressionValidator>
     
        <div>
        <asp:TextBox ID="pass" runat="server" TextMode="Password" placeholder="Password" 
                CssClass="glowing-border" ></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
               ErrorMessage="*" ControlToValidate="pass" Font-Size="Small" 
               ValidationGroup="submit"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ErrorMessage="more than 4 character & 1 number" 
            ControlToValidate="pass" 
                   ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{4,8})$" 
                   Font-Size="Small"></asp:RegularExpressionValidator>
    
          <div>
          <asp:TextBox ID="cpass" runat="server" TextMode="Password" 
                placeholder="Conform password"  Font-Size="Small" ValidationGroup="submit" 
                  CssClass="glowing-border"></asp:TextBox>
          </div>
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="pass" ControlToValidate="cpass" 
            ErrorMessage="password not matched" Font-Size="Small" 
               ValidationGroup="submit"></asp:CompareValidator>
           <br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:Button ID="Submit" runat="server" Text="Submit" onclick="Submit_Click1" ValidationGroup="submit"/>
   
           <br />
           <asp:Label ID="Label10" runat="server" Visible="False"></asp:Label>
   
   </div> </div>
 <div id="wrapper">
  <div class="slider-wrapper theme-default">
            <div id="slider" class="nivoSlider">
            <img src="images/2.jpg"  alt=""/> 
               <img src="images/3.jpg"  alt="" /> 
                <img src="images/7.jpg"  alt="" />
                <img src="images/6.jpg"  alt=""/>
                <img src="images/5.jpg" alt="" />
    
            </div>
             </div>
</div>
    <script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="js/jquery.nivo.slider.js" type="text/javascript"></script>
   
    <script type="text/javascript">
        $(window).load(function () {
            $('#slider').nivoSlider();
        });
    </script>
     <div style=" width: 100%; height: 2px;margin-top:20px; background-color: #ffffff;"></div>
       
    <div id="footer" class="footer" >
        <asp:Panel ID="Panel2" runat="server">
      <div style="width:150px;height:70px;float:left; margin-top: 10px; padding-left: 250px;">
  
           
     </div>
     <div style="width:230px;height:70px;float:left;margin-top: 10px;padding-left: 150px; ">
     </div>
     <div style="width:230px;height:70px;float:left;margin-top: 10px;padding-left: 100px; ">
     <div style="float:left; margin-top:-45px; margin-left: 80px;">
         </div>
    
     </div>
       </asp:Panel>
    </div>
    </div>
    </form>
</body>
</html>
