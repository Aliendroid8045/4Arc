<%@ Page Title="" Language="C#" MasterPageFile="~/Header.master" AutoEventWireup="true" CodeFile="message.aspx.cs" Inherits="message" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>AutoComplete Box with jQuery</title>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>  

<script type="text/javascript">
    $(document).ready(function () {
        SearchText();
    });
    function SearchText() {
        $(".autosuggest").autocomplete({
            source: function (request, response) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "message.aspx/GetAutoCompleteData",
                    data: "{'username':'" + document.getElementById('txtSearch').value + "'}",
                    dataType: "json",
                    success: function (data) {
                        response(data.d);
                    },
                    error: function (result) {
                        alert("Error");
                    }
                });
            }
        });
    }


   

</script>
<style>
.txt
{
    margin:0 0 5px 130px;
    float:left;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-top:70px">
<div style="width:880px;height:35px;padding-top:5px;background-color:#181919;margin-top:20px;margin-left:13px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;" 
        align="center">
    <asp:Label ID="Label1" runat="server" Text="MESSAGES" 
        Font-Size="X-Large" ForeColor="White" Font-Names="Calibri"></asp:Label></div>


    
<div>
<asp:Panel ID="Panel5" runat="server">
<div style="width:205px;background-color:#181919;height:30px;float:left;margin-top:40px;margin-left:14px;" align="center">
    <asp:Label ID="Label3" runat="server" Text="Converstation" Font-Names="Calibri" 
        Font-Size="Larger" ForeColor="White"></asp:Label>

</div><br/><br/><br/><br/>
<div style="width:205px; background-color:white;float:left; margin-top:-5px; margin-left:14px;">
   
    <asp:DataList ID="DataList4" runat="server" 
        >
    <ItemTemplate>
       
        <div style="width:200px;height:75px; border-bottom-style: solid; border-width: thin; border-color: #000000;margin-top:5px">
         <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" CommandArgument='<%# Eval("user_id") %>'>
            <div style="float:left;">
            <asp:Image ID="Image3" runat="server" Width="70px" Height="70px" ImageUrl='<%# Bind("avatar2") %>'/></div>
            <div style="float:left;margin-top:20px;margin-left:20px; font-family: Calibri; font-size: medium; color: #000000;">
            <asp:Label ID="Label4" runat="server" Text='<%# Bind("name") %>' > </asp:Label></div>
           </asp:LinkButton>
        </div>
        </ItemTemplate>
    </asp:DataList>
</div></asp:Panel>
 <div class="demo" style="margin:20px;float:left">
<div class="ui-widget" style="margin-left:100px;margin-top:-58px">
    
<%--    <input type="text" id="txtSearch" class="autosuggest" name="la" />
--%>    
 <asp:TextBox ID="txtSearch" runat="server" placeholder="Enter Friend Name" width="300px" Font-Names="Calibri" Font-Size="large" CssClass="txt"></asp:TextBox>
   <asp:Button ID="Button1" runat="server" Text="Search" Width="100px" 
        onclick="Button1_Click" Font-Names="Calibri" Font-Size="large" />
     </div>
    
     <asp:Panel ID="Panel2" runat="server">
  <div style=" width:300px; height:400px; margin-left:100px; margin-top:20px; background-color:#ffffff">
    <asp:DataList ID="DataList1" runat="server" ForeColor="#3333CC">
        <ItemTemplate>
        <div style="width:300px;height:70px; border-style: solid; border-width: thin; border-color: #C0C0C0">
            <div style="float:left;">
            <asp:Image ID="Image3" runat="server" Width="70px" Height="70px" ImageUrl='<%# Bind("avatar2") %>'/></div>
            <div style="float:left;margin-left:20px;margin-top:20px;">
            <asp:Label ID="Label4" runat="server" Text='<%# Bind("name") %>' > </asp:Label></div>
            <div style="float:left;margin-left:100px;margin-top:20px;">
            <asp:Button ID="Button3" runat="server" Text="Message" CommandArgument='<%# Eval("user_id") %>' onclick="Button3_Click" />
            </div>
        </div>
        </ItemTemplate>
    </asp:DataList>
</div>
     </asp:Panel>
    <%-- <asp:Panel ID="Panel4" runat="server" Visible="False">
     <div style="width:400px;height:70px;">
          <div style="float:left;">
              <asp:Image ID="Image1" runat="server" Width="70px" Height="70px" /></div>
          <div style="float:left;margin-left:20px;margin-top:20px;">
              <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></div>
          <div style="float:right;margin-top:20px">
              <asp:Button ID="Button4" runat="server" Text="Show" onclick="Button4_Click" /></div>


      </div>
     </asp:Panel>--%>
<asp:Panel ID="Panel1" runat="server" Visible="True" >
<div style="width:600px;height:300px;margin-top:30px">  
      <div style="width:600px;height:100px">
      <div>
            <asp:Image ID="Image3" runat="server" Width="70px" Height="70px" />
            </div>
            <div style="margin-left:10px;margin-top:10px;">
            <asp:Label ID="Label4" runat="server"  > </asp:Label></div>
            
            </div>
            <div style="width:600px">
           <asp:Panel ID="Panel3" runat="server" Width="600px" Height="200px" >
                <div style="border: thin solid #000000; float:left; width:280px; height:180px; margin-top:10px; margin-left:5px" >
                 <asp:Panel ID="Panel4" runat="server" ScrollBars="Auto" Width="280px" Height="180px">
                
          
        
              <asp:DataList ID="DataList2" runat="server" ItemStyle-Wrap="False" >
              <ItemTemplate> <div style="float:left;margin-top:10px;margin-left:10px">
              <div style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0;width:260px;height:20px"><asp:Label ID="Label2" runat="server" Text='<%# Eval("user_msg") %>'></asp:Label></div></div>
              </ItemTemplate>
              </asp:DataList>       </asp:Panel></div>
                <div style="border: thin solid #000000; float:left; width:280px; height:180px;margin-left:15px; margin-top:10px; ">
                  <asp:Panel ID="Panel6" runat="server" ScrollBars="Auto"  Width="280px" Height="180px">
                 
         
             
              
              <asp:DataList ID="DataList3" runat="server" Width="300px" >
              <ItemTemplate>
              <div style="float:left;margin-top:5px;margin-left:10px">
              <div style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0;width:260px;height:20px"><asp:Label ID="Label2" runat="server" Text='<%# Eval("user_msg") %>'></asp:Label></div>
               </div>
              </ItemTemplate>
              </asp:DataList>
             
              </asp:Panel> </div>
                  </asp:Panel></div>
             
          
</div>
</asp:Panel>
    <div style="width:470px;margin-left:50px;margin-top:20px;height:80px">
    <div style="float:left;margin-top:13px;margin-left:50px">
    <asp:TextBox ID="TextBox1" runat="server" placeholder="Write Message" 
            TextMode="MultiLine" Width="300px" ></asp:TextBox></div>
    <div style="float:left;margin-top:30px;margin-left:10px"> <asp:Button ID="Button2" 
            runat="server" Text="Send" onclick="Button2_Click" width="100px"/></div>
     </div>
     </asp:Panel>
</div>
</div>

    
    </div>
</asp:Content>

