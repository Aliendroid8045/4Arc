<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title><link rel="stylesheet" type="text/css" href="StyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
    
    <div align="center" style="margin-top:50px;">
        <img src="../images/final1.png" />
    </div>
    <div>
<div style="width:320px;height:30px; float:left;background-color: #181919;margin-left:510px;margin-top:0px;;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
    <div align="center">
    <asp:Label ID="Label1" runat="server" Text="Admin Login" Font-Names="calibri" Font-Size="Medium" ForeColor="White"></asp:Label></div>
    </div><br /><br />

    <div align="center" 
            style="border: thin solid #C0C0C0; float: left;; margin-left:525px;padding:20px;margin-top:-10px;height:140px;width:245px;;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
        <asp:TextBox ID="TextBox1" runat="server" placeholder="user" 
            CssClass="glowing-border"></asp:TextBox></br></br>
         <asp:TextBox ID="TextBox2" runat="server" placeholder="password" 
            CssClass="glowing-border" TextMode="Password"></asp:TextBox></br></br>
        <asp:Button ID="Button1" runat="server" Text="Log In" onclick="Button1_Click" />
    </div>
    </div>
    
    </form>
</body>
</html>
