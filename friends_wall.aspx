<%@ Page Title="" Language="C#" MasterPageFile="~/Header.master" AutoEventWireup="true" CodeFile="friends_wall.aspx.cs" Inherits="friends_wall" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div  style="border:none;width: 900px; height: 350px; padding-top: 0px;margin-top:70px; -webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a; background-color: #000000;">
    <asp:Panel ID="avatar1" runat="server" BackColor="Black">
     <asp:Image ID="imgDisplay" runat="server" Width="900px" Height="350px" 
        ImageUrl="~/Image/Lighthouse.jpg" />
        </asp:Panel>
    </div>
    <div style="width: 150px; height: 258px;float:right; padding-top: 100px; position: absolute; right:40%; top:10%;background:rgba(1,1,1,0.2);-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;   ">
    <asp:Image ID="Image2" runat="server" width="150px" height="150px" 
        ImageUrl="~/images/unknown.gif" />
                </div>
                <div style="position:absolute;top:380px;left:685px">
                    <asp:Button ID="Button1" runat="server" Text="" 
                        onclick="Button1_Click" Width="100px"/></div>
    <div 
        
        style="border-style: none none none solid; width: 860px; height: 30px; margin-top:20px; background-color:#181919; -webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a; padding-left:40px; border-left-width:6px; border-left-color: #000000;">
        <asp:Label ID="Label1" runat="server" Text="Basic Informatation " 
            Font-Names="Gill Sans MT" Font-Size="Large" ForeColor="White" Font-Bold="True" 
            Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
            Font-Italic="True"></asp:Label></div>
            <div style="padding-top:10px;width: 840px;height:130px;padding-left:20px;margin-left:20px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
    
            <div style="float:left; font-family: calibri; font-weight: bold;">   
            <asp:Label ID="Label19" runat="server" Text="First Name" ></asp:Label><br />
                <asp:Label ID="Label20" runat="server" Text="Last Name"></asp:Label><br />
                <asp:Label ID="Label21" runat="server" Text="Birthdate"></asp:Label><br />
                <asp:Label ID="Label22" runat="server" Text="Relatation Status"></asp:Label><br />
                 <asp:Label ID="Label23" runat="server" Text="Gender"></asp:Label><br />
                 <asp:Label ID="Label24" runat="server" Text="Hobbies"></asp:Label><br />
            </div>
            <div style="float:left;margin-left:50px; font-family: Calibri;" >
                <asp:Label ID="Label5" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="Label6" runat="server" Text=""></asp:Label><br />
                 <asp:Label ID="Label7" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="Label8" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="Label10" runat="server" Text=""></asp:Label><br />
                 <asp:Label ID="Label9" runat="server" Text=""></asp:Label><br />
           </div>
           </div>
    
    <div 
        style="width: 860px; height: 30px;margin-top:20px; background-color:#181919;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;padding-left:40px; border-left-style: solid; border-left-width:6px; border-left-color: #000000;">
        <asp:Label ID="Label2" runat="server" Text="Education " 
            Font-Names="Gill Sans MT" Font-Size="Larger" ForeColor="White" 
            Font-Bold="True" Enabled="False" Font-Italic="True"></asp:Label></div>
            <div id="basic_info" style="padding-top:10px;width: 840px;height:50px;padding-left:20px;margin-left:20px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
                  <div style="float:left; font-weight: bold; font-family: calibri;">
                          <asp:Label ID="Label25" runat="server" Text="High School"></asp:Label><br />
                          <asp:Label ID="Label26" runat="server" Text="College"></asp:Label><br /></div>
          <div style="float:left;margin-left:75px; font-family: calibri;" >
                <asp:Label ID="Label11" runat="server" Text=""></asp:Label><br />
                 <asp:Label ID="Label12" runat="server" Text=""></asp:Label><br /></div>
            </div>
    
     <div 
        style="width: 860px; height: 30px;margin-top:20px; background-color:#181919;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;padding-left:40px; border-left-style: solid; border-left-width: 6px; border-left-color: #000000;">
         <asp:Label ID="Label3" runat="server" Text="Job Status" 
            Font-Names="Gill Sans MT" Font-Size="Larger" ForeColor="White" 
             Font-Bold="True" Font-Italic="True"></asp:Label>   </div>
            <div style="padding-top:10px;width: 840px;height:50px;padding-left:20px;margin-left:20px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
             <div style="float:left; font-family: Calibri; font-weight: bold;">
                <asp:Label ID="Label27" runat="server" Text="Company"></asp:Label><br />
                <asp:Label ID="Label28" runat="server" Text="Post"></asp:Label><br /></div>
           <div style="float:left;margin-left:92px; font-family: calibri;" >
             <asp:Label ID="Label13" runat="server" Text=""></asp:Label><br />
             <asp:Label ID="Label14" runat="server" Text=""></asp:Label><br /></div>
            </div>
 
     <div 
        style="width: 860px; height: 30px;margin-top:20px; background-color:#181919;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;padding-left:40px; border-left-style: solid; border-left-width: 6px;">
            <asp:Label ID="Label4" runat="server" Text="Favorites" 
            Font-Names="Gill Sans MT" Font-Size="Larger" ForeColor="White" 
                Font-Bold="True" Font-Italic="True"></asp:Label></div>
            <div style="padding-top:10px;width: 840px;height:90px;padding-left:20px;margin-left:20px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
             <div style="float:left; font-family: Calibri; font-weight: bold;">
                <asp:Label ID="Label29" runat="server" Text="Movies"></asp:Label><br />
                <asp:Label ID="Label30" runat="server" Text="Tv Shows"></asp:Label><br />
                <asp:Label ID="Label31" runat="server" Text="Music"></asp:Label><br />
                <asp:Label ID="Label32" runat="server" Text="Books"></asp:Label><br /></div>
               <div style="float:left;margin-left:87px; font-family: calibri;" > 
               <asp:Label ID="Label15" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="Label16" runat="server" Text=""></asp:Label><br />
               <asp:Label ID="Label17" runat="server" Text=""></asp:Label><br />
               <asp:Label ID="Label18" runat="server" Text=""></asp:Label><br /></div>
            </div>
    
</asp:Content>

