<%@ Page Title="" Language="C#" MasterPageFile="~/profile.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<link rel="stylesheet" type="text/css" href="css/chat.css" />
    <asp:Label ID="Label3" runat="server" Text="Chat Room" CssClass="chtlbl"></asp:Label>
            
			<table id="maintbl">
				<tr>
					<td>
						<asp:Label id="Label1" runat="server" CssClass="lbl1">ChatRoom</asp:Label></TD>
					<td>
						<asp:TextBox id="TB_Channel" runat="server" placeholder="Enter The Name of ChatRoom" CssClass="txt"></asp:TextBox>
						<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage=" * Required" ControlToValidate="TB_Channel"></asp:RequiredFieldValidator></TD>
				</tr>
				<tr>
					<td>
						<asp:Label id="Label2" runat="server" CssClass="lbl1" >Username</asp:Label></TD>
					<td>
						<asp:TextBox id="TB_Username" runat="server" placeholder="Enter Your Name" CssClass="txt"></asp:TextBox>
						<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="* Required" ControlToValidate="TB_Username"></asp:RequiredFieldValidator></TD>
				</tr>
				<tr>
					<td></td>
					<td>
						<asp:Button id="BT_Enter" runat="server" Text="Join Chat" 
                            onclick="BT_Enter_Click" CssClass="join" ></asp:Button></TD>
				</tr>
			</table>
		    <p>
                &nbsp;</p>
		
</asp:Content>
