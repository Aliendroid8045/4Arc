using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Reguser_chatroom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        object us = Session["uid"];
        if (Session["uid"] == null || Session["RoleId"] == null)
            Response.Redirect("chat.aspx");
        //TB_Channel.Text = DropDownList1.SelectedItem.Value;
    }
    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        InitializeComponent();
        base.OnInit(e);
    }

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {

    }
    #endregion
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChatWin.aspx?Channel=" + TB_Channel.Text + "&User=" + TB_Username.Text);
    }
}
