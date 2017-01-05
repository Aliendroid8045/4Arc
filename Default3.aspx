<%@ Page Title="" Language="C#" MasterPageFile="~/profile.master" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div>
    <table id="Table6" cellSpacing="0" cellPadding="0" width="456" align="center" border="0">
				<tr>
					<td width="8" height="8"><IMG height="8" src="orange1.gif" width="8"></td>
					<td bgColor="gray" height="22" rowSpan="2" width="224" vAlign="bottom">
                        <strong style="color: #FFFFFF; font-family: 'Bell MT'">Chatroom</STRONG></td>
					<td vAlign="bottom" align="right" width="224" bgColor="gray" height="22" rowSpan="2"></td>
					<td width="8" height="8"><IMG height="8" src="orange2.gif" width="8"></td>
				</tr>
				<tr>
					<td bgColor="gray" height="14"><img height="14" src="assets/imgs/spacer.gif" width="1"></td>
					<td bgColor="gray" height="14"><img height="14" src="assets/imgs/spacer.gif" width="1"></td>
				</tr>
			</table>
			<table id="Table3" cellSpacing="0" cellPadding="1" border="0" align="center" bgColor="gray">
				<tr>
					<td>
						<iframe style="BORDER-RIGHT:gray 2px solid; BORDER-TOP: gray 2px solid; BORDER-LEFT: gray 2px solid; WIDTH: 450px; BORDER-BOTTOM: gray 2px solid; HEIGHT: 250px; BACKGROUND-COLOR:white; font-family: 'Bell MT'; color: gray;"
							src="TheChatScreenWin.aspx">Chat</iframe>
					</td>
				</tr>
				<tr>
					<td align="right">
						Message:
						  
        <asp:TextBox id="TB_ToSend" runat="server" Width="300px" tabIndex="1" 
                            BackColor="gray" ></asp:TextBox>
						<asp:Button id="BT_Send" runat="server" Text="Send" Width="80px" 
                            CssClass="button1" onclick="BT_Send_Click" BackColor="Gray" 
                            Font-Names="Bell MT" Font-Size="Small" ForeColor="White"></asp:Button> 
   
						
					</td>
				</tr>
			</table>
		
            

    </div> 
</asp:Content>
