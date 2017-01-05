using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Login : System.Web.UI.Page
{
    Cls_User cls = new Cls_User();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session.Abandon();
            Session.Remove("uid");
            txt_UserName.Focus();
        }
    }
    protected void img_btn_Login_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = new DataTable();
        dt = cls.Check_Login(txt_UserName.Text, txt_Password.Text);

        if (dt != null)
        {
            if (dt.Rows.Count > 0)
            {
                Session["uid"] = dt.Rows[0][0].ToString();
                Response.Redirect("web_adminhome.aspx");
            }
            else
            {
                lbl_msg.Text = "Invalid User Id or Password";
            }
        }
        else
        {
            lbl_msg.Text = "Invalid User Id or Password";
        }
    }
}