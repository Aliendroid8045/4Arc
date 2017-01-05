<%@ Page Title="" Language="C#" MasterPageFile="~/profile.master" AutoEventWireup="true" CodeFile="buy.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
<div style="float:left">
     <asp:DropDownList ID="DropDownList1" runat="server" Width="150px" 
         CssClass="glowing-border" Height="25px" DataSourceID="SqlDataSource2" 
         DataTextField="catagory" DataValueField="catagory" 
         onselectedindexchanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
    
    </asp:DropDownList>
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         SelectCommand="SELECT [catagory] FROM [catagory]"></asp:SqlDataSource>
    </div>
<div style="float:left;width:530px;height:30px;background-color: #181919;margin-left:30px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;" >
    <div align="center">
        <asp:Label ID="Label1" runat="server" Text="Market Express" 
            Font-Names="Calibri" ForeColor="White"></asp:Label>
    </div>
</div><br />
<div style="width:500px;float:left;margin-left:190px">

    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
         Width="510px" >
        <Columns>
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" 
                ItemStyle-Width="80px" >
<ItemStyle Width="80px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="descript" HeaderText="descript" 
                SortExpression="descript" ItemStyle-Width="170px"  >
<ItemStyle Width="170px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" 
                ItemStyle-Width="80px" >
<ItemStyle Width="80px"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField>
                <ItemTemplate>
                    
                        <asp:Image ID="Image7" runat="server" ImageUrl='<%# Eval("image") %>' Width="100px" Height="100px"/>
                        <div style="float:right;margin-top:30px">
                        <asp:Button ID="Button4" runat="server" Text="Buy" 
                                CommandArgument='<%# Eval("id") %>' onclick="Button4_Click"/>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
   
</div>
    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
</asp:Content>

