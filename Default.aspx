<%@ Page Title="" Language="C#" MasterPageFile="~/profile.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
        <asp:Label ID="Label2" runat="server" Text="Edit profile picture"></asp:Label><br /><br />
    
        <asp:FileUpload ID="FileUpload1" runat="server" Height="28px" Width="319px" 
            EnableViewState="False" Enabled="False" EnableTheming="False" />
       
   
        <br />
    <asp:Image ID="propic" runat="server" Height="200px" Width="200px"/>
    </div><br />
    <div align="center">
        <asp:Label ID="Label1" runat="server" Text="Basic Info:"></asp:Label><br /><br />
        <asp:TextBox ID="Hobby" runat="server" placeholder="Hobby" ></asp:TextBox><br /><br />
        <asp:TextBox ID="City" runat="server" placeholder="City"></asp:TextBox><br /><br />
        
        <asp:TextBox ID="Interest" runat="server" placeholder="Intereted In"></asp:TextBox><br /><br />
        <asp:TextBox ID="Relationship" runat="server" placeholder="Relationship Status"></asp:TextBox><br /><br />
        
        <asp:TextBox ID="Religious" runat="server" placeholder="Religious"></asp:TextBox>
     <br /><br />
        
        
        <asp:Label ID="Label3" runat="server" Text="Contact Info:"></asp:Label><br /><br />
        <asp:TextBox ID="Contact" runat="server" placeholder="Contact No"></asp:TextBox><br /><br /><br />
         <asp:Button ID="Button1" runat="server" Text="Save" onclick="Button1_Click" />
        <br />
</div> 
</asp:Content>

