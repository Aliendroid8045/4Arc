<%@ Page Title="" Language="C#" MasterPageFile="~/Header.master" AutoEventWireup="true" CodeFile="Pro.aspx.cs" Inherits="Pro" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/status.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript">
     function uploadStarted() {
         $get("imgDisplay").style.display = "none";
     }
     function uploadComplete(sender, args) {
         var imgDisplay = $get("imgDisplay");
         //                     imgDisplay.src = "~/images/loading.gif";
         //                     imgDisplay.style.cssText = "";
         var img = new Image();
         img.onload = function () {
             imgDisplay.style.cssText = "height:350px;width:1020px";
             imgDisplay.src = img.src;
         };
         img.src = "<%=ResolveUrl(UploadFolderPath) %>" + args.get_fileName();
     }
</script>   
    <script type="text/javascript">
        function uploadStarted1() {
            $get("Image2").style.display = "none";
        }
        function uploadComplete1(sender, args) {
            var imgDisplay = $get("Image2");
            //                     imgDisplay.src = "~/images/loading.gif";
            //                     imgDisplay.style.cssText = "";
            var img = new Image();
            img.onload = function () {
                imgDisplay.style.cssText = "height:150px;width:150px";
                imgDisplay.src = img.src;
            };
            img.src = "<%=ResolveUrl(UploadFolderPath1) %>" + args.get_fileName();
        }
</script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left:12px;margin-top:70px;width:800px">
<div style="width:800px">
<div  style="border:none;width: 900px; height: 350px; padding-top: 0px;margin-top:10px; -webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a; background-color: #000000;">
    <asp:Panel ID="avatar1" runat="server" BackColor="Black">
     <asp:Image ID="imgDisplay" runat="server" Width="900px" Height="350px" 
        ImageUrl="~/Image/Lighthouse.jpg" ClientIDMode="Static" />
        <div style="position: absolute; left:25%; top:12%;">
        <asp:Image ID="imgLoader" runat="server" ImageUrl="~/images/loading.gif" Height="320px" Width="350px" BackColor="Black" /></div></asp:Panel>
   
    <asp:HoverMenuExtender ID="HoverMenuExtender1" runat="server" 
        TargetControlID="avatar1" PopupControlID="Panel2" 
        PopupPosition="center" PopDelay="50" OffsetX="5" 
        OffsetY="300">
    </asp:HoverMenuExtender>
    <asp:Panel ID="Panel2" runat="server" style="cursor:pointer">
        <asp:Label ID="Label2" runat="server" Text="Update Cover Pic" style="position:absolute" 
            ForeColor="Black" Font-Bold="False"></asp:Label>
        
        <asp:AsyncFileUpload ID="A2" runat="server" OnClientUploadComplete="uploadComplete"
    Width="100px" UploaderStyle="Modern" CompleteBackColor="Black" UploadingBackColor="#CCFFFF"
    ThrobberID="imgLoader" OnUploadedComplete="FileUploadComplete" 
        OnClientUploadStarted = "uploadStarted"  
         ToolTip="Update Cover Pic "/>
    </asp:Panel>   
<div style="width: 150px; height: 258px;float:right; padding-top: 100px; position: absolute; right:40%; top:10%;background:rgba(1,1,1,0.2);-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;   ">
    <asp:Image ID="Image2" runat="server" width="150px" height="150px" 
        ImageUrl="~/images/unknown.gif"  ClientIDMode="Static" />
                <asp:Image ID="I1" runat="server" ImageUrl="~/images/loading.gif" 
        Height="150px" Width="150px" /></div>

    <asp:HoverMenuExtender ID="HoverMenuExtender2" runat="server" 
        PopupControlID="Panel1" TargetControlID="Image2" PopupPosition="center" PopDelay="50" OffsetX="0" 
        OffsetY="130">
    </asp:HoverMenuExtender>
    <asp:Panel ID="Panel1" runat="server" Width="50px">
        <asp:Label ID="Label1" runat="server" Text="Change" 
            style="position:absolute; top:5% ;left:20%" ForeColor="Black"></asp:Label>
        <asp:AsyncFileUpload ID="A1" runat="server" OnClientUploadComplete="uploadComplete1"
    Width="100px" UploaderStyle="Modern" CompleteBackColor="Black" UploadingBackColor="#CCFFFF"
    ThrobberID="I1" OnUploadedComplete="FileUploadComplete1" 
        OnClientUploadStarted = "uploadStarted1" ClientIDMode="Static" 
         ToolTip="Change "/>    </asp:Panel>
    
</div>
<div style="background-color:#181919;width: 900px; height: 40px; margin-top: 20px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
    <asp:HoverMenuExtender ID="HoverMenuExtender7" runat="server" 
        PopupControlID="Button1" TargetControlID="Label4" OffsetX="-80" 
        OffsetY="30" PopupPosition="Top" >
    </asp:HoverMenuExtender>
    <div style="width:225px;height: 30px;float:left; padding-top: 10px; border-right-style:solid; border-right-width:thin;" 
        align="center" >
             <asp:Label ID="Label4" runat="server" Text="Edit Profile" style="cursor:pointer"></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Edit Profile" style="width:224px;height: 40px" Font-Size="Medium" 
             onclick="Button1_Click" />
     </div>
        <asp:HoverMenuExtender ID="HoverMenuExtender4" runat="server" 
            TargetControlID="Label3" PopupControlID="Button2" OffsetX="-68" OffsetY="30" 
                 PopupPosition="Top">
        </asp:HoverMenuExtender>
     <div style="width:224px; border-right-style:solid; border-right-width:thin;height: 30px;float:left; padding-top: 10px;" 
                 align="center" >
         <asp:Label ID="Label3" runat="server" Text="Status & Photo"></asp:Label>
         <asp:Button ID="Button2" runat="server" Text="Status & Photo" 
             style="width:224px;height: 40px" Font-Size="Medium" 
             onclick="Button2_Click"/>
     </div>
     
         <asp:HoverMenuExtender ID="HoverMenuExtender5" runat="server" TargetControlID="Label5" PopupControlID="frd"  OffsetX="-91" OffsetY="30" 
             PopupPosition="Top">
          </asp:HoverMenuExtender>
    <div style="width:224px; border-right-style:solid; border-right-width:thin;height: 30px;float:left; padding-top: 10px;" 
            align="center" >
        
        
             <asp:Label ID="Label5" runat="server" Text="Friends"></asp:Label>
              <asp:Button ID="frd" runat="server" Text="Friends" 
                 style="width:224px;height: 40px" Font-Size="Medium" onclick="frd_Click" 
                 />
     </div>
                <asp:HoverMenuExtender ID="HoverMenuExtender6" runat="server" TargetControlID="Label6" PopupControlID="Button4" OffsetX="-92" OffsetY="30" 
                    PopupPosition="Top">
                 </asp:HoverMenuExtender>
    <div style="width:224px; border-right-style:none ;height: 30px;float:left; padding-top: 10px;" 
        align="center" >
    <asp:Label ID="Label6" runat="server" Text="Photos"></asp:Label>
        <asp:Button ID="Button4" runat="server" Text="Photos" 
            style="width:224px; height:40px" Font-Size="Medium" 
            onclick="Button4_Click"/>
     </div>
    </div>
    <asp:HoverMenuExtender ID="HoverMenuExtender3" runat="server" 
        TargetControlID="Label4" PopupControlID="Panel3" PopupPosition="Bottom" 
        OffsetY="15" OffsetX="-85">
    </asp:HoverMenuExtender>
    
    <asp:Panel ID="status" runat="server" Visible="False" style="margin-top:20px;margin-left:2px" >
   
<div class="Fm g-s-Ma-ba Ma Nf" style="float:left">
   
    <div class="Je" style="">
    <div class="xe">
     <div class="be c-B">
        
         <asp:TextBox ID="TextBox1" runat="server"  Width="410px" Height="50px" TextMode="MultiLine"></asp:TextBox>
            
       <div align="right" style="height:30px;padding-top:2px;width:410px;">
                 <div style="float:right;margin-left:5px">   
                     <asp:Button ID="Button5" runat="server" 
                         Text="Post" onclick="Button5_Click"  /></div>
 
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   <div style="float:right">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/camera.png" 
                 Height="30px" Width="40px" 
                         style=" margin:0px; padding:0px;-webkit-user-select: none;" onclick="ImageButton1_Click" 
                          /> </div>

 <div style="float:right;margin-right:35px;">     <%--<asp:Button ID="Button2" runat="server" Text="+" onclick="Button2_Click" 
           Width="30px" Visible="False" />--%></div>
 <div style="float:right; ">
       <asp:FileUpload ID="file_upload" class="multi" runat="server" Visible="False" 
           Height="30px"  style=" background-image: -moz-linear-gradient(transparent, rgba(0,0,0,0.2));" />
    <%-- <asp:Button ID="Button3" runat="server" Text="Bu"  
           Visible="False" OnClientClick="get()"  />--%></div>
       
    
 </div>
 
   </div>
    </div>
    </div>
    </div>
      </asp:Panel>
    <asp:Panel ID="friends" runat="server" Visible="False">
        <asp:DataList ID="DataList1" runat="server"  
            RepeatDirection="Horizontal">
       <ItemTemplate>
        <div style="margin-left:20px;margin-top:20px">
        <div>
            <asp:ImageButton ID="ImageButton2" runat="server" Height="80px" Width="80px" ImageUrl='<%# Eval("f_avatar2") %>' />
        </div>
        <div align="center" style="margin-top:5px">
            <asp:Label ID="Label10" runat="server" Text='<%# Eval("friend_name") %>'></asp:Label>
        </div>
        </div>
        </ItemTemplate>

        </asp:DataList>
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">See All</asp:LinkButton>
        
    </asp:Panel>
           
    </div>
   <div style="width:800px;float:left"">     
    
     
      
       <asp:DataList ID="DataList2" runat="server"  >
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

    </div>
    </div>
          <%-- <asp:PopupControlExtender ID="Button3_PopupControlExtender" runat="server" 
               DynamicServicePath="" Enabled="True" PopupControlID="Panel1"  
               TargetControlID="Button3">
           </asp:PopupControlExtender>--%>
                   </ItemTemplate>
       </asp:DataList>
                <asp:Button ID="Button3" runat="server" Text="Button" style="display:none" />

       <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
           TargetControlID="Button3" PopupControlID="Panel3" 
           BackgroundCssClass="modalBackground" CancelControlID="Cancel" >
       </asp:ModalPopupExtender>
       <%--<asp:PopupControlExtender ID="PopupControlExtender1" runat="server" 
           PopupControlID="Panel1" TargetControlID="Button3">
       </asp:PopupControlExtender>--%>
  
   <asp:Panel ID="Panel3" runat="server" Visible="True" >

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
                     <asp:Button ID="Cancel" runat="server" Text="Cancel" />
                 </div>
       <div style="float:right;margin-top:10px;margin-right:10px">
                     <asp:Button ID="rep" runat="server" Text="Replay" onclick="rep_Click"  />
                   
                 </div>
               
       
    

 
   </div>
    </div>
    </div>
    </div>
       </asp:Panel>                <asp:Button ID="Button7" runat="server" Text="Button" style="display:none" />

       <asp:ModalPopupExtender ID="ModalPopupExtender2"
           runat="server" PopupControlID="Panel4" TargetControlID="Button7" 
           BackgroundCssClass="modalBackground" OkControlID="Button8" >
       </asp:ModalPopupExtender>
       <asp:Panel ID="Panel4" runat="server" Width="350px" Height="450px" >
            
          <div style="background-color: #181919;width:350px;height:30px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
          <div align="center" style="font-family: Calibri; font-size: medium; color: #FFFFFF;">
              <asp:Label ID="Label7" runat="server" Text="Comments"></asp:Label>
          </div>
              <div style="float:right;margin-top:-21px">
              <asp:Button ID="Button8" runat="server" Text="OK" Width="50px" /></div></div>
          <asp:Panel ID="Panel5" runat="server" BackColor="#ffffff" ScrollBars="Auto" 
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

