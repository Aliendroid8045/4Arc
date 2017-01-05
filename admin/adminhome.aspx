<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminhome.aspx.cs" Inherits="admin_adminhome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            
        
    <div align="center">
   <div style="width:760px;height:30px;background-color: #181919;margin-left:5px;-webkit-box-shadow:0px 1px 5px 0px #4a4a4a;
    -moz-box-shadow: 0px 1px 5px 0px #4a4a4a;
    box-shadow:0px 1px 5px 0px #4a4a4a;" >
    <div align="center">
        <asp:Label ID="Label1" runat="server" Text="Market Express" 
            Font-Names="Calibri" ForeColor="White"></asp:Label>
    </div>
</div>
    
    <div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" 
           >
            <Columns>
                <asp:BoundField DataField="buyer_id" HeaderText="buyer_id" 
                    SortExpression="buyer_id" />
                <asp:BoundField DataField="seller_id" HeaderText="seller_id" 
                    SortExpression="seller_id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="catagory" HeaderText="catagory" 
                    SortExpression="catagory" />
                <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" Text="SEND EMAIL" 
                        CommandArgument ='<%# Eval("buyer_id") %>' onclick="Button1_Click"/>
                    <asp:Button ID="Button2"
                        runat="server" Text="CONFIRM" CommandArgument ='<%# Eval("buyer_id") %>' onclick="Button2_Click" />
                </ItemTemplate></asp:TemplateField>
            </Columns>
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT [buyer_id], [seller_id], [title], [catagory] FROM [admin]">
        </asp:SqlDataSource>
    
    </div>
    </div>
    </form>
</body>
</html>
