<%@ Page Language="C#" AutoEventWireup="true" CodeFile="catagory.aspx.cs" Inherits="admin_catagory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-top:200px;width:320px;height:30px;margin-left:510px; float:left;background-color: #181919;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;" align="center">
        <asp:Label ID="Label1" runat="server" Text="Add Catagory" Font-Names="Calibri" 
            Font-Size="Larger" ForeColor="White"></asp:Label>
     </div><br />
      <div style="float:left;border: thin solid #C0C0C0; float: left;; margin-left:525px;height:100px;;padding:20px;width:245px;;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br /><br />
          <asp:Button ID="Add" runat="server" onclick="Button1_Click" Text="Button" /></div>
    </form>
</body>
</html>
