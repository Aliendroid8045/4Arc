using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "4arc.developer@gmail.com" && TextBox2.Text == "dddvdeveloper")
        {
            Response.Redirect("adminhome.aspx");
        }
        else
        {
            TextBox1.Text = "Try Again";
        }
    }
}