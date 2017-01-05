using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class admin : System.Web.UI.MasterPage
{
    Cls_User cls = new Cls_User();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] != null)
        {
            getname();
        }
        else
            Response.Redirect("Login.aspx");
    }
    protected void lnk_logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Remove("uid");
        Response.Redirect("Login.aspx");
    }

    public void getname()
    {
        DataTable dt = new DataTable();
        dt = cls.get_user(Convert.ToInt32(Session["uid"].ToString()));
        if (dt.Rows.Count > 0)
        {
            lbl_unm.Text = "Welcome " + dt.Rows[0]["admin_name"].ToString();
        }
    }
    protected void lnk_custdetail_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/web_custdetail.aspx");
    }
}
