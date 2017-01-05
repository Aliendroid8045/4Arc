<%@ Page Title="" Language="C#" MasterPageFile="profile.master" AutoEventWireup="true" CodeFile="D.aspx.cs" Inherits="D" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="css/status.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
.modalBackground
{
background-color: Gray;
filter: alpha(opacity=80);
opacity: 0.8;
z-index: 10000;
}
</style>
   
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:700px">
        <div style="width:700px" >
        <div  style="border-style: none none none solid; width: 500px; height: 30px; margin-top:0px; background-color:#181919; -webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a; padding-left:40px; border-left-width:6px; border-left-color: #000000;margin-left:107px;z-index:10;">
      <asp:Label ID="Label1" runat="server" Text="Update Your Status " 
            Font-Names="Gill Sans MT" Font-Size="Large" ForeColor="White" Font-Bold="True" 
            Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
            Font-Italic="True" ></asp:Label></div>
    <div style="margin-top:2px;margin-left:130px;z-index:-10">
          
    <div class="Fm g-s-Ma-ba Ma Nf" >
   
    <div class="Je" style="">
    <div class="xe">
     <div class="be c-B">
         <asp:TextBox ID="TextBox1" runat="server"  Width="454px" Height="50px" 
             TextMode="MultiLine" CssClass="glowing-border" 
             ></asp:TextBox>
            
       <div align="right" style="height:30px;padding-top:2px;width:460px;">
                 <div style="float:right;margin-left:5px">   <asp:Button ID="Button1" runat="server" 
                         Text="Post" onclick="Button1_Click1" /></div>
 
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   <div style="float:right">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/camera.png" 
                 Height="30px" Width="40px" 
                         style=" margin:0px; padding:0px;-webkit-user-select: none;" 
                         onclick="ImageButton1_Click" /> </div>

 <div style="float:right;margin-right:35px;">     <%--<asp:Button ID="Button2" runat="server" Text="+" onclick="Button2_Click" 
           Width="30px" Visible="False" />--%></div>
 <div style="float:right; ">
       <asp:FileUpload ID="file_upload"  runat="server" Visible="False" 
           Height="30px"  style=" background-image: -moz-linear-gradient(transparent, rgba(0,0,0,0.2));" />
    <%-- <asp:Button ID="Button3" runat="server" Text="Bu"  
           Visible="False" OnClientClick="get()"  />--%></div>
       
    
 </div>
 
   </div>
    </div>
    </div>
    </div>
              <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
    </div>
   </div>
   <div style="width:700px;margin-left:20px;margin-top:30px">     
    
     
      
       <asp:DataList ID="DataList1" runat="server" 
           onselectedindexchanged="DataList1_SelectedIndexChanged"  >
       <ItemTemplate>
        <div id="main1" style="width: 500px;margin: 20px;margin-top:10px ">
    <div id="img"  style="padding: 0px 20px 60px 20px; float:left;">
      <asp:Image ID="Image1" runat="server" Height="60px" 
             Width="60px" ImageUrl='<%# Eval("avatar2") %>' /><br />
        <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>' Width="60px" Height="20px"></asp:Label>

    </div>
    <div style="float:left; width: 340px;">
    <div id="wall" >
        <asp:Label ID="Label2" runat="server" Text='<%# Eval("text_post") %>'></asp:Label>
       
        <div style=" padding: 5px; width: 340px; ">
            <asp:Image ID="Image2" runat="server" Height="160px" 
                ImageUrl='<%# Eval("image_post") %>' Width="340px" />
        </div>
       
       
        
        
        </div>
    <div style="border-style: outset none none none; border-width: thin; border-color: #C0C0C0; float:left; width: 350px; height: 20px;padding-top:5px; margin-top:10px;margin-bottom:10px">
        
        <div style="background-image: url('images/Like.png'); background-repeat: no-repeat; cursor: pointer;height:30px;width:50px;float:left;margin-top:-2px">
       <asp:LinkButton ID="lt3" runat="server" onclick="LinkButton3_Click" Text='<%# Eval("likes") %>' CommandArgument='<%# Eval("id") %>' Width="50px" Height="20px" >
        </asp:LinkButton></div> 
           <div style="background-image: url('images/Dislike.png'); background-repeat: no-repeat; cursor: pointer;height:30px;width:50px;float:left;margin-left:10px;margin-top:-2px">
               <asp:LinkButton ID="LinkButton3" runat="server" Text='<%# Eval("dislike") %>' 
                   CommandArgument='<%# Eval("id") %>' Width="50px" Height="20px" 
                   onclick="LinkButton3_Click1"></asp:LinkButton>
       </div>
        <div style="cursor: pointer;height:30px;width:60px;float:left;margin-left:30px;background-repeat: no-repeat;padding-top:5px">
            <asp:LinkButton ID="replay" runat="server" CommandArgument='<%# Eval("id") %>' onclick="replay_Click" >Comment</asp:LinkButton>
       </div>
       <div style="cursor: pointer;height:30px;width:30px;float:right;margin-top:-5px">
           <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/dev7logo.png"  
               Height="30px" Width="30px" onclick="ImageButton2_Click" CommandArgument='<%# Eval("id") %>' />
       </div>
    </div>

    </div>
    <div style="width: 40px;  float: right">
        <asp:ImageButton ID="ImageButton1" runat="server" Width="40px" Height="40px" 
            ImageUrl="~/images/delete.png" onclick="ImageButton1_Click1" CommandArgument='<%# Eval("id") %>'/>
         <asp:Button ID="Button3" runat="server" Text="Button" Visible="False" />

    </div>
    </div>
          <%-- <asp:PopupControlExtender ID="Button3_PopupControlExtender" runat="server" 
               DynamicServicePath="" Enabled="True" PopupControlID="Panel1"  
               TargetControlID="Button3">
           </asp:PopupControlExtender>--%>
                   </ItemTemplate>
       </asp:DataList>
       <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
           TargetControlID="Button3" PopupControlID="Panel1" 
           BackgroundCssClass="modalBackground" CancelControlID="Button6" 
           Drag="True" >
       </asp:ModalPopupExtender>
       <%--<asp:PopupControlExtender ID="PopupControlExtender1" runat="server" 
           PopupControlID="Panel1" TargetControlID="Button3">
       </asp:PopupControlExtender>--%>
  
   <asp:Panel ID="Panel1" runat="server" Visible="True" >

       <div class="Fm g-s-Ma-ba Ma Nf" style="float:left;width:200px;height:70px">
   
    <div class="Je" style="width:400px;height:120px">
        
    <div class="xe" style="width:380px;height:100px">
     <div class="be c-B" style="width:380px;height:100px">
     <div style="float:left">
         <asp:TextBox ID="TextBox2" runat="server"  Width="380px" Height="50px" 
             TextMode="MultiLine" CssClass="glowing-border" 
             ></asp:TextBox>
      </div>
        <div  style="float:right;margin-top:10px">
                     <asp:Button ID="Button6" runat="server" Text="Cancel" />
                 </div>
       <div style="float:right;margin-top:10px;margin-right:10px">
                     <asp:Button ID="Button4" runat="server" Text="Replay" onclick="Button4_Click" />
                   
                 </div>
               
    </div>
    </div>
    </div>
    </div>
       </asp:Panel>                
       
       <asp:Button ID="Button5" runat="server" Text="Button" style="display:none" />

       <asp:ModalPopupExtender ID="ModalPopupExtender2"
           runat="server" PopupControlID="Panel3" TargetControlID="Button5" 
           BackgroundCssClass="modalBackground" OkControlID="Button2" Drag="True" >
       </asp:ModalPopupExtender>
       <asp:Panel ID="Panel3" runat="server" Width="350px" Height="450px" >
            
          <div style="background-color: #181919;width:350px;height:30px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
          <div align="center" style="font-family: Calibri; font-size: medium; color: #FFFFFF;">
              <asp:Label ID="Label6" runat="server" Text="Comments"></asp:Label>
          </div>
              <div style="float:right;margin-top:-21px">
              <asp:Button ID="Button2" runat="server" Text="OK" Width="50px" /></div></div>
          <asp:Panel ID="Panel4" runat="server" BackColor="#ffffff" ScrollBars="Auto" 
               Width="349px" Height="420px" Font-Names="calibri" Font-Size="Medium">
          
           <asp:DataList ID="DataList4" runat="server">

               <ItemTemplate>
               <div style="border-bottom-style: solid; border-bottom-width: thin;height:70px;width:320px">
               <div style="float:left;padding-left:20px; border-right-style: dashed; border-right-width: thin;width:80px">
                   <asp:Image ID="Image7" runat="server" height="50px" Width="50px" ImageUrl='<%# Eval("avatar2") %>'/><br />
                   <asp:Label ID="Label14" runat="server" Text='<%# Eval("name") %>'></asp:Label></div>
                   <div style="margin-left:20px;float:left">
                   <asp:Label ID="Label15" runat="server" Text='<%# Eval("comment") %>'></asp:Label></div>
                   </div>
               </ItemTemplate>

           </asp:DataList>
         
            </asp:Panel>
             <div style="background-color: #181919;width:350px;height:30px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;"></div>
             </asp:Panel>

   </div>
   </div>

   </asp:Content>