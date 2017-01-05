<%@ Page Title="" Language="C#" MasterPageFile="~/profile.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="margin-top:30px">
<div style="width:300px;height:30px; float:left;background-color: #181919;margin-left:150px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;" 
        align="center">
    <asp:Label ID="Label2" runat="server" Text="Product" Font-Names="calibri" 
            ForeColor="#ffffff" Font-Size="large"></asp:Label>
      </div>
      <div style="float:left;margin-left:10px;width:100px">
            <asp:Button ID="add" runat="server" Text="Add" onclick="add_Click" 
                ValidationGroup="add" />
            </div>
<div style="border: thin solid #C0C0C0;width:240px;height:340px;margin-left:160px;padding:20px;margin-top:60px;padding-top:50px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;" >
   <asp:DropDownList ID="DropDownList1" runat="server" CssClass="glowing-border"  
        Height="25px" Width="210px" CausesValidation="True" 
        DataSourceID="SqlDataSource1" DataTextField="catagory" 
        DataValueField="catagory" ValidationGroup="add">
    </asp:DropDownList>
    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [catagory] FROM [catagory]"></asp:SqlDataSource>
    
    <br/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="title" ErrorMessage="*" ValidationGroup="add"></asp:RequiredFieldValidator>
    <br/>
    <asp:TextBox ID="title" runat="server" placeholder="Title" 
        CssClass="glowing-border" Height="20px" Width="210px" 
        ValidationGroup="add"></asp:TextBox>
   
    <br/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="FileUpload1" ErrorMessage="*" ValidationGroup="add"></asp:RequiredFieldValidator>
    <br/>
    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="glowing-border" /><br/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="descript" ErrorMessage="*" ValidationGroup="add"></asp:RequiredFieldValidator>
    <br/>
    <asp:TextBox ID="descript" runat="server" TextMode="MultiLine"  placeholder="Description"
        CssClass="glowing-border" Width="210px" ValidationGroup="add"></asp:TextBox>
    
    <br/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="price" ErrorMessage="*" ValidationGroup="add"></asp:RequiredFieldValidator>
    <br/>
    <asp:TextBox ID="price" runat="server" placeholder="Price" 
        CssClass="glowing-border"  Height="20px" Width="210px" 
        ValidationGroup="add"></asp:TextBox><br/>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="email" ErrorMessage="enter valid email" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
        ValidationGroup="add"></asp:RegularExpressionValidator>
    <br/>
    <asp:TextBox ID="email" runat="server" placeholder="E-mail id" 
        CssClass="glowing-border"  Height="20px" Width="210px" 
        ValidationGroup="add"></asp:TextBox><br/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ControlToValidate="contact" ErrorMessage="*" ValidationGroup="add"></asp:RequiredFieldValidator>
    <br/>
    <asp:TextBox ID="contact" runat="server" placeholder="Contact no" 
        CssClass="glowing-border"  Height="20px" Width="210px" 
        ValidationGroup="add"></asp:TextBox>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

  

 </div>
 </div>
 


</asp:Content>

