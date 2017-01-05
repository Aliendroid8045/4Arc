<%@ Page Title="" Language="C#" MasterPageFile="~/Header.master" AutoEventWireup="true" CodeFile="friends.aspx.cs" Inherits="friends" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="main" style="margin-top:70px">
<div style="width:880px;height:35px;padding-top:5px;background-color:#181919;margin-top:20px;margin-left:13px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;" 
        align="center">
    <asp:Label ID="Label1" runat="server" Text="Friends" Font-Names="calibri" Font-Size="X-Large" ForeColor="White"></asp:Label>
</div>

<div id="frd" 
        style="padding: 0px; margin: 20px; width:880px; height: 30px;  color: #000000; font-size: larger; font-style: normal; text-transform: none; font-family: calibri;">
    
   
    <asp:DataList ID="DataList2" runat="server" RepeatColumns="2" Width="643px">
    <ItemTemplate>
        <div style="border: thin solid #C0C0C0; margin-left:50px;margin-top:20px; width: 160px; height: 190px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
        <div style="padding: 5px 5px 0px 5px; width:160px; height:160px;">
            <asp:ImageButton ID="ImageButton2" runat="server" 
                ImageUrl='<%# Eval("avatar2") %>' Height="150px" 
                Width="150px" onclick="ImageButton2_Click" CommandArgument='<%# Eval("user_id") %>'/>
            </div>
            <div style="width:160px; height:20px; border-top-style: solid; border-top-width: thin; border-top-color: #c0c0c0;" align="center">
            <asp:Label ID="La" runat="server" Text='<%# Eval("name") %>'></asp:Label>
            </div>
            </div>

        </ItemTemplate>
    </asp:DataList>
</div>

</div>

</asp:Content>

