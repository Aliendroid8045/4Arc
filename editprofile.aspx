<%@ Page Title="" Language="C#" MasterPageFile="~/Header.master" AutoEventWireup="true" CodeFile="editprofile.aspx.cs" Inherits="editprofile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script language="javascript" type="text/javascript">
    function CheckForPastDate(sender, args) {
        var selectedDate = new Date();
        selectedDate = sender._selectedDate;

        var todayDate = new Date();

        if (selectedDate.getDateOnly() > todayDate.getDateOnly()) {

            sender._selectedDate = todayDate;
            sender._textbox.set_Value(sender._selectedDate.format(sender._format));

            alert("Date cannot be in the future");
        }
        function abc(sender, args) {
            var a = sender._textbox.get_Value;
            if (a <= 0) {
                alert("wrong dates");
            }
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="main" style="margin-left: 30px;margin-top:70px">
<div id="center" style=" width: 650px; height: 30px;margin:20px 20px 20px 110px;">
  
   <div style="float:left;padding: 0px;  width: 500px;margin-right:10px; height: 30px;background-color:#181919;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;padding-left:20px"">
       <asp:Label ID="Label10" runat="server" Text="EdIt ProFilE"  Font-Bold="True" 
           Font-Size="Larger" ForeColor="White"></asp:Label></div>
    <div style="float:right;margin-right:0px">
        <asp:Button ID="Button11" runat="server" Text="Save" Height="30px" 
            Width="120px" onclick="Button11_Click" />
    </div>
</div>
<div id="left" style=" float:left; width: 300px;  margin-top: 20px;margin-left:110px;">
      <div id="pic"style=" width: 300px;">
      <div style="width: 300px; height: 30px; background-color: #181919;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
          <asp:Label ID="Label2" runat="server" Text="Choose Avatar" Height="20px"   style="margin-top:5px;margin-left:5px" ForeColor="White"></asp:Label>
               </div>

      
      <div style="padding: 28px;width: 224px;margin-left:10px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
          <asp:FileUpload ID="FileUpload1" runat="server" Height="28px" Width="200px" 
               style="font: bold 14px/45px HelveticaNeue, Helvetica, Arial;    
    cursor: pointer;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    border-radius: 4px;
    border: 1px solid rgba(0,0,0,0.4);
    margin: 0px;
    background-image: -moz-linear-gradient(transparent, rgba(0,0,0,0.2));
    background-color: #ffffff;
    color: white;
    text-shadow: rgba(0,0,0,0.3) 0px 1px 1px;
    padding: 0px;
    display: block;" />
         
       </div> </div>
       <div id="basic" style=" width: 300px;margin-top:40px;">
          <div id="basic_label" style="width: 300px; height: 30px; background-color:#181919;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">

           <asp:Label ID="Label1" runat="server" Text="Basic Information" Height="30px" 
                  style="margin-top:5px;margin-left:5px" ForeColor="White"
                  ></asp:Label>
         </div>
         <div id="basic_info" style="padding: 28px;width: 224px;margin-left:10px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;">
           <asp:TextBox ID="TextBox2" runat="server" CssClass="textbox"></asp:TextBox><br /><br />
           <asp:TextBox ID="TextBox3" runat="server" CssClass="textbox"></asp:TextBox><br /><br />
           <asp:TextBox ID="birthdate" runat="server" placeholder="Birthdate" 
                 CssClass="textbox"></asp:TextBox><br /><br />
    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="birthdate" OnClientDateSelectionChanged="CheckForPastDate">
    </asp:CalendarExtender>
    <asp:DropDownList ID="relationshipstatus" runat="server">
        <asp:ListItem>Relationship Status</asp:ListItem>
        <asp:ListItem>Single</asp:ListItem>
        <asp:ListItem>In a Relationship</asp:ListItem>
        <asp:ListItem>Engaged</asp:ListItem>
        <asp:ListItem>Married</asp:ListItem>
        <asp:ListItem>Divorced</asp:ListItem>
        <asp:ListItem>Complicated</asp:ListItem>
    </asp:DropDownList><br />
             <asp:Label ID="Label8" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:DropDownList ID="sex" runat="server">
        <asp:ListItem>I am</asp:ListItem>
        <asp:ListItem>Male</asp:ListItem>
        <asp:ListItem>Female</asp:ListItem>
    </asp:DropDownList><br />
   <asp:Label ID="Label9"
                 runat="server" Visible="False"></asp:Label><br />
    <asp:TextBox ID="hobbies" runat="server" placeholder="Hobbies" CssClass="textbox"></asp:TextBox>
    
           </div>
    

       
<%--
 <asp:Panel ID="Panel1" runat="server" BorderColor="#CCCCCC" BorderStyle="Inset" 
                 >
  <div style="width: 300px; height: 30px; background-color: #0099CC">
          <asp:Label ID="Label8" runat="server" Text="Basic Info" Height="20px"   style="margin-top:5px;margin-left:5px" ForeColor="#ffffff"></asp:Label>
                     <asp:Button ID="Button8" runat="server" Text="Done" Height="30px" 
              Width="40px" style="float:right;" onclick="Button8_Click"/>

      </div>
      <div style="padding:10px;background-color:#ffffff">
             <asp:TextBox ID="fn" runat="server" placeholder="First Name"></asp:TextBox><br/><br />
             <asp:TextBox ID="ln" runat="server" placeholder="Last Name"></asp:TextBox><br/><br />
    <asp:TextBox ID="birthdate" runat="server" placeholder="Birthdate"></asp:TextBox><br /><br />
    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="birthdate">
    </asp:CalendarExtender>
    <asp:DropDownList ID="relationshipstatus" runat="server">
        <asp:ListItem>Relationship Status</asp:ListItem>
        <asp:ListItem>Single</asp:ListItem>
        <asp:ListItem>In a Relationship</asp:ListItem>
        <asp:ListItem>Engaged</asp:ListItem>
        <asp:ListItem>Married</asp:ListItem>
        <asp:ListItem>Divorced</asp:ListItem>
        <asp:ListItem>Complicated</asp:ListItem>
    </asp:DropDownList>
    <br /><br />
    <asp:DropDownList ID="sex" runat="server">
        <asp:ListItem>I am</asp:ListItem>
        <asp:ListItem>Male</asp:ListItem>
        <asp:ListItem>Female</asp:ListItem>
    </asp:DropDownList><br /><br />
   
    <asp:TextBox ID="hobbies" runat="server" placeholder="Hobbies"></asp:TextBox>
    
         </div>
         </asp:Panel>--%>
         <%-- <asp:Panel ID="Panel2" runat="server" BackColor="Black" Height="20px">
              <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>--%>
         
   </div>
   <div id="contact" style=" width: 300px;margin-top: 40px;">
    <%-- <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" 
             TargetControlID="Button3" PopupControlID="Panel2" Drag="True" 
             DropShadow="True" >
          <Animations>             
                <OnShown>
                    <Sequence>
                        <HideAction Visible="true" />
                        <FadeIn duration="0.2" fps="20"></FadeIn>
                    </Sequence>
                </OnShown>
                <OnHiding>
                    <Sequence>
                        <FadeOut duration="0.2" fps="20" minimumOpacity="0"></FadeOut>
                        <HideAction Visible="false" />
                    </Sequence>
                </OnHiding>
            </Animations>
            </asp:ModalPopupExtender>
       <asp:Panel ID="Panel2" runat="server" BorderColor="#CCCCCC" BorderStyle="Inset">
       <div style="width: 300px; height: 30px; background-color: #0099CC">
          <asp:Label ID="Label9" runat="server" Text="Contact Info" Height="20px"   style="margin-top:5px;margin-left:5px" ForeColor="#ffffff"></asp:Label>
                     <asp:Button ID="Button9" runat="server" Text="Done" Height="30px" 
               Width="40px" style="float:right;" onclick="Button9_Click"/>

      </div>
      <div style="padding:10px;background-color:#ffffff">
    <asp:TextBox ID="TextBox5" runat="server" placeholder="EmailAddress"></asp:TextBox><br /><br />
     <asp:TextBox ID="TextBox6" runat="server" placeholder="ContactNo"></asp:TextBox><br /><br />
          <asp:TextBox ID="TextBox7" runat="server" placeholder="Address"></asp:TextBox>
</div>
       </asp:Panel>--%>
    <div style="width: 300px; height: 30px; background-color: #181919;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a; ">
          <asp:Label ID="Label3" runat="server" Text="Contact Info" Height="20px"   style="margin-top:5px;margin-left:5px" ForeColor="White"></asp:Label>

      </div>
      <div style="padding: 28px;width: 224px;margin-left:10px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a; ">
    <asp:TextBox ID="emailaddress" runat="server" placeholder="EmailAddress" 
              CssClass="textbox"></asp:TextBox><br /><br />
     <asp:TextBox ID="contactno" runat="server" placeholder="ContactNo" 
              CssClass="textbox"></asp:TextBox><br /><br />
          <asp:TextBox ID="address" runat="server" placeholder="Address" 
              CssClass="textbox"></asp:TextBox>
</div>
</div>
   </div>
<div id="right" style="float:left ; width: 300px;margin-top: 20px;margin-left:60px">
    <div id="education" style=" width: 300px;">
     <%-- <asp:ModalPopupExtender ID="ModalPopupExtender3" runat="server" 
             TargetControlID="Button4" PopupControlID="Panel3" Drag="True" 
             DropShadow="True"  >
          <Animations>             
                <OnShown>
                    <Sequence>
                        <HideAction Visible="true" />
                        <FadeIn duration="0.2" fps="20"></FadeIn>
                    </Sequence>
                </OnShown>
                <OnHiding>
                    <Sequence>
                        <FadeOut duration="0.2" fps="20" minimumOpacity="0"></FadeOut>
                        <HideAction Visible="false" />
                    </Sequence>
                </OnHiding>
            </Animations>
            </asp:ModalPopupExtender>
        <asp:Panel ID="Panel3" runat="server"  BorderColor="#CCCCCC" 
            BorderStyle="Inset" BackColor="White">
         <div style="width: 300px; height: 30px; background-color: #0099cc">
          <asp:Label ID="Label10" runat="server" Text="Education" Height="20px"   style="margin-top:5px;margin-left:5px" ForeColor="White"></asp:Label>
                     <asp:Button ID="Button12" runat="server" Text="Done" Height="30px" 
                 Width="40px" style="float:right;" onclick="Button12_Click"/>

      </div>
      <div style="padding:20px">
    <asp:TextBox ID="TextBox8" runat="server" placeholder="school"></asp:TextBox><br/><br/>
    <asp:TextBox ID="TextBox9" runat="server" placeholder="Highschool"></asp:TextBox><br/><br/>
    <asp:TextBox ID="TextBox10" runat="server" placeholder="college"></asp:TextBox> <br/><br/>
    </div>
        </asp:Panel>--%>
     <div style="width: 300px; height: 30px; background-color: #181919;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a; ">
          <asp:Label ID="Label4" runat="server" Text="Education" Height="20px"   style="margin-top:5px;margin-left:5px" ForeColor="White"></asp:Label>

      </div>
      <div style="padding:28px;width: 224px;margin-left:10px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a; ">
    <asp:TextBox ID="school" runat="server" placeholder="school" CssClass="textbox" 
              ></asp:TextBox><br/><br/>
    <asp:TextBox ID="Highschool" runat="server" placeholder="Highschool" 
              CssClass="textbox"></asp:TextBox><br/><br/>
    <asp:TextBox ID="college" runat="server" placeholder="college" CssClass="textbox"></asp:TextBox> <br/><br/>
    </div>
    </div>

    <div id="work" style=" width: 300px; margin-top: 40px;">
     <%--<asp:ModalPopupExtender ID="ModalPopupExtender4" runat="server" 
             TargetControlID="Button5" PopupControlID="Panel4" Drag="True" 
             DropShadow="True"   >
          <Animations>             
                <OnShown>
                    <Sequence>
                        <HideAction Visible="true" />
                        <FadeIn duration="0.2" fps="20"></FadeIn>
                    </Sequence>
                </OnShown>
                <OnHiding>
                    <Sequence>
                        <FadeOut duration="0.2" fps="20" minimumOpacity="0"></FadeOut>
                        <HideAction Visible="false" />
                    </Sequence>
                </OnHiding>
            </Animations>
            </asp:ModalPopupExtender>
        <asp:Panel ID="Panel4" runat="server" BorderColor="#CCCCCC" BorderStyle="Inset" 
            BackColor="White">
        <div style="width: 300px; height: 30px; background-color: #0099cc">
          <asp:Label ID="Label11" runat="server" Text="Job Status" Height="20px"   style="margin-top:5px;margin-left:5px" ForeColor="White"></asp:Label>
                     <asp:Button ID="Button13" runat="server" Text="Done" Height="30px" 
                Width="40px" style="float:right;" onclick="Button13_Click"/>

      </div>
      <div style="padding:20px">
        <asp:TextBox ID="TextBox11" runat="server" placeholder="compny"></asp:TextBox><br /><br />
        <asp:TextBox ID="TextBox12" runat="server" placeholder="post"></asp:TextBox>
        </div>
        </asp:Panel>--%>
         <div style="width: 300px; height: 30px; background-color: #181919;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a; ">
          <asp:Label ID="Label5" runat="server" Text="Job Status" Height="20px"   style="margin-top:5px;margin-left:5px" ForeColor="White"></asp:Label>

      </div>
      <div style="padding:28px;width: 224px;margin-left:10px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a; ">
        <asp:TextBox ID="compnyname" runat="server" placeholder="compny" 
              CssClass="textbox"></asp:TextBox><br /><br />
        <asp:TextBox ID="post" runat="server" placeholder="post" CssClass="textbox"></asp:TextBox>
        </div>
    </div>
    <div id="about" style=" width: 300px; margin-top: 40px;">
  <%--   <asp:ModalPopupExtender ID="ModalPopupExtender5" runat="server" 
             TargetControlID="Button6" PopupControlID="Panel5" Drag="True" 
             DropShadow="True"   >
          <Animations>             
                <OnShown>
                    <Sequence>
                        <HideAction Visible="true" />
                        <FadeIn duration="0.2" fps="20"></FadeIn>
                    </Sequence>
                </OnShown>
                <OnHiding>
                    <Sequence>
                        <FadeOut duration="0.2" fps="20" minimumOpacity="0"></FadeOut>
                        <HideAction Visible="false" />
                    </Sequence>
                </OnHiding>
            </Animations>
            </asp:ModalPopupExtender>
        <asp:Panel ID="Panel5" runat="server" BorderColor="#CCCCCC" BorderStyle="Inset" BackColor="White">
        <div style="width: 300px; height: 30px; background-color: #0099cc">
          <asp:Label ID="Label12" runat="server" Text="About Me" Height="20px"   style="margin-top:5px;margin-left:5px" ForeColor="White"></asp:Label>
                     <asp:Button ID="Button14" runat="server" Text="Done" Height="30px" 
                Width="40px" style="float:right;" onclick="Button14_Click"/>

      </div>
      <div style="padding:20px">
    <asp:TextBox ID="TextBox13" runat="server" TextMode="MultiLine" placeholder="About"></asp:TextBox>
    </div>
        </asp:Panel>--%>
    <div style="width: 300px; height: 30px; background-color: #181919;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a; ">
          <asp:Label ID="Label6" runat="server" Text="About Me" Height="20px"   style="margin-top:5px;margin-left:5px" ForeColor="White"></asp:Label>

      </div>
      <div style="padding:28px;width: 224px;margin-left:10px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a; ">
    <asp:TextBox ID="aboutme" runat="server" TextMode="MultiLine" placeholder="About" 
              CssClass="textbox"></asp:TextBox>
    </div>
</div>
    <div id="Favorites" style="width: 300px;margin-top: 40px;">
   <%-- <asp:ModalPopupExtender ID="ModalPopupExtender6" runat="server" 
             TargetControlID="Button7" PopupControlID="Panel6" Drag="True" 
             DropShadow="True"   >
          <Animations>             
                <OnShown>
                    <Sequence>
                        <HideAction Visible="true" />
                        <FadeIn duration="0.2" fps="20"></FadeIn>
                    </Sequence>
                </OnShown>
                <OnHiding>
                    <Sequence>
                        <FadeOut duration="0.2" fps="20" minimumOpacity="0"></FadeOut>
                        <HideAction Visible="false" />
                    </Sequence>
                </OnHiding>
            </Animations>
            </asp:ModalPopupExtender>
        <asp:Panel ID="Panel6" runat="server" BorderColor="#CCCCCC" BorderStyle="Inset" 
            BackColor="White">
              
    <div style="width: 300px; height: 30px; background-color: #0099cc">
          <asp:Label ID="Label13" runat="server" Text="Favorites" Height="20px"   style="margin-top:5px;margin-left:5px" ForeColor="White"></asp:Label>
                     <asp:Button ID="Button15" runat="server" Text="Done" Height="30px" 
              Width="40px" style="float:right;" onclick="Button15_Click"/>

      </div>
      <div style="padding:20px">
    <asp:TextBox ID="TextBox14" runat="server" placeholder="Movies"></asp:TextBox><br/><br/>
    <asp:TextBox ID="TextBox15" runat="server" placeholder="Tv Shows"></asp:TextBox><br/><br/>
    <asp:TextBox ID="TextBox16" runat="server" placeholder="Music"></asp:TextBox> <br/><br/>
<asp:TextBox ID="TextBox17" runat="server" placeholder="Books"></asp:TextBox>
</div>
        </asp:Panel>--%>
    <div style="width: 300px; height: 30px; background-color: #181919;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a; ">
          <asp:Label ID="Label7" runat="server" Text="Favorites" Height="20px"   style="margin-top:5px;margin-left:5px" ForeColor="White"></asp:Label>

      </div>
      <div style="padding:28px;width: 224px;margin-left:10px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a; ">
    <asp:TextBox ID="movies" runat="server" placeholder="Movies" CssClass="textbox"></asp:TextBox><br/><br/>
    <asp:TextBox ID="tvshows" runat="server" placeholder="Tv Shows" CssClass="textbox" ></asp:TextBox><br/><br/>
    <asp:TextBox ID="music" runat="server" placeholder="Music" CssClass="textbox"></asp:TextBox> <br/><br/>
<asp:TextBox ID="books" runat="server" placeholder="Books" CssClass="textbox"></asp:TextBox>
</div>
</div>


</div>
    
</div>

   
</asp:Content>

