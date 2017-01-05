<%@ Page Title="" Language="C#" MasterPageFile="~/profile.master" AutoEventWireup="true" CodeFile="setting.aspx.cs" Inherits="setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <link href="css/p.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="margin-top:50px">
<div style="width:320px;height:30px; float:left;background-color: #181919;margin-left:230px;margin-top:0px;;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
    <div align="center">
    <asp:Label ID="Label1" runat="server" Text="change password" Font-Names="calibri" Font-Size="Medium" ForeColor="White"></asp:Label></div>
    </div><br /><br />

    <div align="center" 
            style="border: thin solid #C0C0C0; float: left; margin-left:248px;padding:20px;margin-top:-10px;height:180px;width:245px;;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
        
         
        <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox" placeholder="Old PassWord"></asp:TextBox><br /><asp:RequiredFieldValidator 
            ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" 
            ErrorMessage="*" ValidationGroup="pas"></asp:RequiredFieldValidator>
        <br />
         
        <asp:TextBox ID="newpass" runat="server"  
            CssClass="textbox" TextMode="Password" placeholder="New password"></asp:TextBox><br /><asp:RequiredFieldValidator 
            ID="RequiredFieldValidator2" runat="server" ControlToValidate="newpass" 
            ErrorMessage="*" ValidationGroup="pas"></asp:RequiredFieldValidator>
        <br />
         <asp:TextBox ID="rep" runat="server"  
            CssClass="textbox" TextMode="Password" placeholder="Confirm password"></asp:TextBox><br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="newpass" ControlToValidate="rep" 
            ErrorMessage="password dosen't matched.." ValidationGroup="pas"></asp:CompareValidator>
        <br />
          <asp:Button ID="Button1" runat="server" 
            Text="Done" onclick="Button1_Click" ValidationGroup="pas"/><br />
          <asp:Label ID="Label5" runat="server" ForeColor="Black"></asp:Label>

    </div>
     
   <div style="width:320px;height:30px; float:left;background-color: #181919;margin-left:230px;margin-top:20px;;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
    <div align="center">
        <asp:LinkButton ID="LinkButton1" runat="server" Font-Names="calibri" 
            Font-Size="Medium" ForeColor="White" onclick="LinkButton1_Click">Delete Account</asp:LinkButton></div>
    </div><br /><br />

    <asp:Panel ID="Panel1" runat="server">
    <div align="center" 
            style="border: thin solid #C0C0C0; float: left; margin-left:248px;padding:20px;margin-top:0px;height:80px;width:245px;;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
        
        &nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:Label ID="l" runat="server" Text="Are you sure"></asp:Label> 
            
        <br /><br />
        <asp:Button ID="Button2" runat="server" Text="comfirm" onclick="Button2_Click" />
         

    </div>
    
    </asp:Panel>
   
    </div>

</asp:Content>

