<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="admin_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Admin Login</title>
    <link href="../Client.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            line-height: normal;
            font-weight: normal;
            color: #000000;
            text-decoration: none;
            width: 142px;
        }
        .style2
        {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 11px;
            line-height: normal;
            font-weight: normal;
            color: #ffffff;
            text-decoration: none;
            width: 142px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="middle" style="height: 115px">
        <asp:Image ID="img_logo" runat="server" Height="150px" 
            ImageUrl="~/Images/banner.png" />
      </td>
  </tr>


  <tr>
    <td align="center" valign="top" class="manu-shadow"><img src="../Images/spacer.gif" width="10" height="10"></td>
  </tr>
  <tr>
    <td height="450" align="center" valign="top">
 
	
 
        &nbsp;<asp:Label ID="lbl_msg" runat="server" ForeColor="Red"></asp:Label>
<table width="402" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center" valign="middle">
            <img alt="login-table-top" width="402" 
                height="30" src="../Images/login-table-top.gif"></td>
      </tr>
      <tr>
        <td align="center" valign="top" class="login-bg"><table width="392" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="135" align="left" valign="middle" bgcolor="#FFFFFF"><img src="../Images/dcn-login.jpg" width="135" height="176"></td>
              <td align="center" valign="middle" bgcolor="#FFFFFF"><table width="240" border="0" 
                      align="center" cellpadding="0" cellspacing="0">
                <tr align="left">
                  <td colspan="2" align="center" valign="middle" class="error"> </td>
                  <td align="center" valign="middle" class="error"> &nbsp;</td>
                </tr>
                <tr align="left">
                  <td valign="middle" class="style1">User Name:</td>
                  <td width="135" height="35" align="left" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      
                      <td>
                          <asp:TextBox ID="txt_UserName" runat="server" CssClass="textfield" TabIndex="3"></asp:TextBox>
                        </td>
                      
                    </tr>
                  </table></td>
                  <td width="135" height="35" align="left" valign="middle">
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                          ControlToValidate="txt_UserName" Display="Dynamic" ErrorMessage="*" 
                          ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                  <td align="left" valign="middle" class="style1">Password:</td>
                  <td width="135" height="35" align="left" valign="middle"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="left" valign="middle">
                          <asp:TextBox ID="txt_Password" runat="server" CssClass="textfield" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                  </table></td>
                  <td width="135" height="35" align="left" valign="middle">
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                          ControlToValidate="txt_Password" Display="Dynamic" ErrorMessage="*" 
                          ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                  <td align="left" valign="middle" class="style1">&nbsp;</td>
                  <td height="30" align="left" valign="middle">
                      <asp:ImageButton ID="img_btn_Login" runat="server" 
                          ImageUrl="~/Images/btn-login.jpg" Height="21px" 
                          onclick="img_btn_Login_Click" /></td>
                  <td height="30" align="left" valign="middle">
                      &nbsp;</td>
                </tr>
                <tr>
                  <td align="left" valign="middle" class="style2">&nbsp;</td>
                  <td height="30" align="left" valign="middle">&nbsp;</td>
                  <td height="30" align="left" valign="middle">&nbsp;</td>
                </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td align="center" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
        <td></td>
        </tr>
      </table></td>
  </tr>

</table>
    </div>
    </form>
</body>
</html>
