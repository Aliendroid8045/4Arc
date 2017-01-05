<%@ Page Title="" Language="C#" MasterPageFile="~/Header.master" AutoEventWireup="true" CodeFile="Photos.aspx.cs" Inherits="Photos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jquery.fancyzoom.min.js" type="text/javascript"></script>
    <script src="js/jquery.ifixpng.js" type="text/javascript"></script>
    <script src="js/jquery.shadow.js" type="text/javascript"></script>
     <script src="js/JScript.js" type="text/javascript"></script>
    <script src="js/jquery.MultiFile.js" type="text/javascript"></script>
   
    <script type="text/javascript">
        $(function () {
            $('#demo > a:first').fancyzoom({ Speed: 400, showoverlay: false });
            $('#demo > a:last').fancyzoom({ Speed: 400, showoverlay: false });
            $('#nooverlay').fancyzoom({ Speed: 400, showoverlay: false });
            $('img.fancyzoom').fancyzoom();
        });
</script>
 <!-- Add jQuery library -->
	<script type="text/javascript" src="fancybox/jquery-1.10.1.min.js"></script>

	<!-- Add mousewheel plugin (this is optional) -->
	<script type="text/javascript" src="fancybox/jquery.mousewheel-3.0.6.pack.js"></script>

	<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="fancybox/jquery.fancybox.js?v=2.1.5"></script>
	<link rel="stylesheet" type="text/css" href="fancybox/jquery.fancybox.css?v=2.1.5" media="screen" />

	<!-- Add Button helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="fancybox/jquery.fancybox-buttons.css?v=1.0.5" />
	<script type="text/javascript" src="fancybox/jquery.fancybox-buttons.js?v=1.0.5"></script>

	<!-- Add Thumbnail helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="fancybox/jquery.fancybox-thumbs.css?v=1.0.7" />
	<script type="text/javascript" src="fancybox/jquery.fancybox-thumbs.js?v=1.0.7"></script>

	<!-- Add Media helper (this is optional) -->
	<script type="text/javascript" src="fancybox/jquery.fancybox-media.js?v=1.0.6"></script>


	<script type="text/javascript">
	    $(document).ready(function () {
	        /*
	        *  Simple image gallery. Uses default settings
	        */

	        $('.fancybox').fancybox();

	    });
	</script>

<style type="text/css">
A IMG {border:0;}
A{text-decoration:none;color:#000;}
#pageWrapper{
margin:0 auto;
width:1000px;
border:1px solid #000;
background:#FFF;
padding: 0px 20px 40px 20px;	
}
h1{text-align:right;font-size:24px;}
h2{font-size:16px;border-bottom:1px solid #CCC;margin-top:40px;}
h3{font-size:14px;border-bottom:1px solid #CCC;margin-left:40px;}
#demo A {
display:block;
float:left;
width:400px;
text-align:left;
text-decoration:none;
color:#000;
font-size:11px;
}
#demo{
padding-left:200px;
}
#demo  ul {text-align:left;color:#000;}
p.code{
margin-left:60px;
}
pre{
margin-left:60px;
background:#CCC;
padding:6px;
}
</style>
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
    <%--<div id="center" 
        style="padding: 0px; margin: 20px; height:30px;width:880px; background-color: #3399FF; color: #FFFFFF; font-size: x-large; font-style: normal; text-transform: none;" 
        align="center">
    <asp:Label ID="Label1" runat="server" Text="Photos Album"></asp:Label>
</div>--%>
<div style="width:880px;margin-top:70px">
<div style="width:880px;height:50px">
   <div style=" float:left; background-color:#181919; width: 700px; height: 40px; margin-top: 20px;margin-right:10px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
     <div style="width:230px;height: 30px;float:left; padding-top: 10px; border-right-style:dotted; border-right-width:thin;" 
        align="center" >
             <asp:Label ID="Label4" runat="server" Text="Profile Photos" 
                 style="cursor:pointer" Font-Bold="False" ForeColor="White" 
                 Font-Names="Calibri"></asp:Label>
     </div>
      
       <asp:HoverMenuExtender ID="HoverMenuExtender1" runat="server" 
           TargetControlID="Label4" PopupControlID="Button2"  OffsetX="-70" 
           OffsetY="30" PopupPosition="Top">
       </asp:HoverMenuExtender>
       <asp:Button ID="Button2" runat="server" Text="Profile Photos" 
             style="width:230px;height: 40px" Font-Size="Medium"  ForeColor="White" 
                 Font-Names="Calibri" 
           onclick="Button2_Click" />
              <div style="width:230px;height: 30px;float:left; padding-top: 10px; border-right-style:dotted; border-right-width:thin;" 
        align="center" >
             <asp:Label ID="Label1" runat="server" Text="Cover Photos" style="cursor:pointer" ForeColor="White" 
                 Font-Names="Calibri"></asp:Label></div>
             <asp:HoverMenuExtender ID="HoverMenuExtender2" runat="server" 
           TargetControlID="Label1" PopupControlID="Button3"  OffsetX="-72" 
           OffsetY="30" PopupPosition="Top">
       </asp:HoverMenuExtender>
       <asp:Button ID="Button3" runat="server" Text="Cover Photos" 
             style="width:230px;height: 40px" Font-Size="Medium" ForeColor="White" 
                 Font-Names="Calibri"    
           onclick="Button3_Click" />
              <div style="width:230px;height: 30px;float:left; padding-top: 10px; " 
        align="center" >
             <asp:Label ID="Label2" runat="server" Text="Photos" style="cursor:pointer"  ForeColor="White" 
                 Font-Names="Calibri" ></asp:Label></div>
             <asp:HoverMenuExtender ID="HoverMenuExtender3" runat="server" 
           TargetControlID="Label2" PopupControlID="Button4"  OffsetX="-92" 
           OffsetY="30" PopupPosition="Top">
       </asp:HoverMenuExtender>
       <asp:Button ID="Button4" runat="server" Text="Photos" 
             style="width:237px;height: 40px" Font-Size="Medium"  ForeColor="White" 
                 Font-Names="Calibri" onclick="Button4_Click" />
     
    </div>
    <div style=" Height:40px; Width:150px;float:left; margin-top:20px;margin-left:20px; ">
        <asp:Button ID="Button1" runat="server" Text="Create New Album" Height="40px" 
            Width="150px" ForeColor="White" 
                 Font-Names="Calibri" onclick="Button1_Click"/>
    </div>
 </div>

<div style="margin:20px; width:880px">
    <asp:Panel ID="Panel1" runat="server">
    
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" Width="643px" >
    <ItemTemplate>
         
        <div style="padding: 5px;border: thin solid #C0C0C0; margin-left:-18px;margin-top:20px;margin-right:52px;width: 180px; height: 180px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
        
<asp:HyperLink ID="HyperLink1" CssClass="fancybox fancybox.iframe" runat="server" NavigateUrl='<%#  Bind("avatar2") %>'>
<asp:Image ID="Image1" Class="fancybox fancybox.iframe" ImageUrl='<%# Bind("avatar2") %>'  runat="server" Width="180px" Height="180px" /></asp:HyperLink>
         
            </div>

       

        </ItemTemplate>
    </asp:DataList>
    </asp:Panel>
     <asp:Panel ID="Panel2" runat="server">
    
    <asp:DataList ID="DataList2" runat="server"  Width="643px" RepeatColumns="2" >
    <ItemTemplate>
         
        <div style="padding: 5px; border: thin solid #C0C0C0; margin-left:-18px; margin-top:30px; margin-right:65px;margin-bottom:30px; width: 400px; height: 160px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
        
<asp:Image ID="Image1" class="fancyzoom"  ImageUrl='<%# Bind("avatar1") %>'  runat="server" Width="400px" Height="160px" />
         
            </div>

       

        </ItemTemplate>
    </asp:DataList>
    </asp:Panel>
</div>
   <%--<asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
        TargetControlID="Button1" PopupControlID="Panel3" DropShadow="True" 
        BackgroundCssClass="modalBackground" >
    </asp:ModalPopupExtender>--%>
      
<div style="margin-left:100px; margin-top:50px" > 
     
    <asp:Panel ID="Panel3"  runat="server" Width="500px" Height="350px" 
        BorderStyle="Solid" Visible="False">
 <div style=" width:487px; height:40px; padding:0px 0px 0px 10px;">
  <div style="float:left;margin-top:10px">  
   <asp:TextBox ID="TextBox1" runat="server" placeholder="Album Name"></asp:TextBox>
         </div>
         <div style="float:left; margin-left:50px;margin-top:10px">
        <asp:FileUpload ID="file_upload" class="multi" runat="server"  
           Height="30px"  style=" background-image: -moz-linear-gradient(transparent, rgba(0,0,0,0.2));" />
             </div>
          <div style="float:right;margin-top:5px">          
        <asp:Button ID="Button6" 
                runat="server" Text="Upload" Width="70px" Font-Names="Calibri" 
                  onclick="Button6_Click" />
             </div>
             
         </div>
        
         <div style="border: thin solid #CCCCCC; height:270px">
         
  
             <asp:DataList ID="DataList3" runat="server" RepeatDirection="Horizontal">
                 
              <ItemTemplate>
                    <asp:Image ID="Image2" runat="server" Width="50px" Height="50px" ImageUrl='<%# Bind("alb_photo") %>' />
                    </ItemTemplate>
             </asp:DataList>
                                  
                    
         </div>
         
         <div style="border: thin solid #CCCCCC; height:30px">
         <div style="float:right;">
             <asp:Button ID="Button5" runat="server" Text="Save" onclick="Button5_Click1"/>
             <asp:Button ID="Button7" runat="server" Text="Cancel" onclick="Button7_Click"/>
         </div>
         </div>
    </asp:Panel>
    
</div> 
<div style="margin-left:0px; margin-top:50px" > 
     
    <asp:Panel ID="Panel4"  runat="server" Width="500px" Height="350px" 
         Visible="False">
        <asp:DataList ID="DataList4" runat="server" RepeatDirection="Horizontal" 
            RepeatColumns="5" >
        <ItemTemplate>
        <div style="width:100px;height:100px;margin-left:20px;margin-bottom:20px">
       
<div style="width:100px;height:100px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
    
    <asp:ImageButton ID="ImageButton2" runat="server" 
        ImageUrl='<%# Eval("alb_photo") %>' CommandArgument='<%# Eval("alb_name") %>' 
        Width="100px" Height="100px" onclick="ImageButton2_Click"/>
        <div align="center" style="font-family: calibri; font-size: Large;margin-left:0px">
    <asp:Label ID="Label3" runat="server" Text='<%# Eval("alb_name") %>' ></asp:Label> </div>     </div>
            </div>
        </ItemTemplate>
        </asp:DataList>
        
         
         
         
    </asp:Panel>
    
</div>
<%--<asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
        TargetControlID="ImageButton1" PopupControlID="Panel5" DropShadow="True" 
        BackgroundCssClass="modalBackground" >
    </asp:ModalPopupExtender>--%>
      
  <div style="margin-left:0px; margin-top:50px" > 
     
    <asp:Panel ID="Panel5"  runat="server" Width="500px" Height="350px" 
        Visible="false">
        <asp:DataList ID="DataList6" runat="server" RepeatColumns="2" 
            onselectedindexchanged="DataList6_SelectedIndexChanged">
           
        <ItemTemplate>
        <div style="width:180px;height:200px;margin-left:30px">
       <div style="padding: 5px; margin-left:-18px;margin-top:20px;margin-right:52px;width: 180px; height: 180px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
            <asp:ImageButton ID="ImageButton1" runat="server" Width="180px" Height="180px" ImageUrl='<%# Eval("alb_photo") %>' 
                />
           
</div>

            </div>
        </ItemTemplate>
        </asp:DataList>
       
        
    </asp:Panel>
    
</div></div>  
</asp:Content>

