<%@ Page Title="Customer Details" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="web_custdetail.aspx.cs" Inherits="admin_web_custdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%" align="left">
        <tr>
            <td align="center" style="font-size: 12pt; font-family: Times New Roman" valign="top"
                    width="100%">
                <table align="right" border="0" cellpadding="0" cellspacing="0" width="99%">
                    <tr>
                        <td align="right" height="40" valign="top">
                            <table align="right" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    
                                    <td align="left" class="dark-bg" valign="middle" style="height: 30px">
                                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="200">
                                            <tr align="left" valign="middle">
                                                <td class="new-order" style="width: 216px; height: 14px">
                                                    Customer Detail</td>
                                            </tr>
                                        </table>
                                    </td>
                                    
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">
                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="center" valign="top">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="left" style="height: 12px" valign="bottom" width="11">
                                                    <img height="12" src="../images/table-corner-tl.jpg" width="12" />
                                                </td>
                                                <td align="center" class="style2" style="background-image: url('../images/table-corner-tm.jpg');"
                                                        valign="top">
                                                    <img height="12" src="../images/spacer.gif" width="12" />
                                                </td>
                                                <td align="right" valign="bottom">
                                                    <img height="12" src="../images/table-corner-tr.jpg" width="12" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" class="table-middle-left" style="background-image: url(../images/table-middle-left.jpg)"
                                                        valign="top">
                                                </td>
                                                <td align="center" valign="top" class="style5">
                                                    <table width="100%">
                                                        <tr>
                                                            <td class="style6">
 
                                                                        <table cellspacing="0" cellpadding="0" align="left" border="0" style="width: 100%">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td align="left">
                                                                                        <asp:GridView ID="DG" runat="server" AllowPaging="True" 
                                                                                            AutoGenerateColumns="False" Caption="Customer Master" CssClass="font-black01" 
                                                                                            DataKeyNames="id" Font-Bold="False" OnRowCommand="DG_RowCommand" 
                                                                                            PageSize="5" ShowFooter="True" 
                                                                                            TabIndex="9" Width="91%">
                                                                                            <FooterStyle BackColor="#E0E0E0" />
                                                                                            <Columns>
                                                                                                <asp:TemplateField HeaderText="Customer Id">
                                                                                                    <FooterTemplate>
                                                                                                        Page :
                                                                                                        <asp:Label ID="lbl_pg_ind" runat="server"></asp:Label>
                                                                                                        /
                                                                                                        <asp:Label ID="lbl_pg_count" runat="server"></asp:Label>
                                                                                                    </FooterTemplate>
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="Label1" runat="server" __designer:wfdid="w2" 
                                                                                                            Text='<%# Eval("id") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="User Name">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="Label2" runat="server" __designer:wfdid="w3" 
                                                                                                            Text='<%# Eval("user_id") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="First Name">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="Label3" runat="server" __designer:wfdid="w2" 
                                                                                                            Text='<%# Eval("fn") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Last Name">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("ln") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Gender">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("gender") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Email Id">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("user_id") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Contact No">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("contact") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                            </Columns>
                                                                                            <PagerTemplate>
                                                                                                <asp:ImageButton ID="img_btn_first" runat="server" __designer:wfdid="w5" 
                                                                                                    CausesValidation="False" CommandName="first" ImageUrl="~/Images/btn-first.jpg" 
                                                                                                    OnClick="img_btn_first_Click" TabIndex="11" />
                                                                                                <asp:ImageButton ID="img_btn_previous" runat="server" __designer:wfdid="w6" 
                                                                                                    CausesValidation="False" CommandName="previous" 
                                                                                                    ImageUrl="~/Images/btn-previous.jpg" OnClick="img_btn_previous_Click" 
                                                                                                    TabIndex="12" />
                                                                                                <asp:ImageButton ID="img_btn_next" runat="server" __designer:wfdid="w7" 
                                                                                                    CausesValidation="False" CommandName="next" ImageUrl="~/Images/btn-next1.jpg" 
                                                                                                    OnClick="img_btn_next_Click" TabIndex="13" />
                                                                                                <asp:ImageButton ID="img_btn_last" runat="server" __designer:wfdid="w8" 
                                                                                                    CausesValidation="False" CommandName="last" ImageUrl="~/Images/btn-last.jpg" 
                                                                                                    OnClick="img_btn_last_Click" TabIndex="14" />
                                                                                            </PagerTemplate>
                                                                                            <HeaderStyle BackColor="#E0E0E0" Font-Bold="False" />
                                                                                            <AlternatingRowStyle BackColor="WhiteSmoke" />
                                                                                        </asp:GridView>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                   
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right" style="background-image: url(../images/table-middle-right.jpg); background-repeat: repeat-y;"
                                                        class="table-middle-right" width="12">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" valign="top">
                                                    <img height="50" src="../images/table-corner-bl.jpg" width="12" />
                                                </td>
                                                <td align="center" class="style4" style="background-image: url(../images/table-corner-bm.jpg)">
                                                </td>
                                                <td align="right" valign="top">
                                                    <img height="50" src="../images/table-corner-br.jpg" width="12" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

