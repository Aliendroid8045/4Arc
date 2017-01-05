using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class friends : System.Web.UI.Page
{
    static string constr = System.Configuration.ConfigurationManager.AppSettings["constring"];
    SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("home.aspx");
        }
        con.Open();
        string str = "SELECT  friend_list.receiver,avatar.user_id, avatar.name, avatar.avatar2 FROM    avatar INNER JOIN friend_list ON avatar.user_id = friend_list.receiver WHERE   friend_list.user_id = '"+Session["user"]+"'";
        SqlCommand cmd = new SqlCommand(str, con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {

            DataList2.DataSource = dr;
            DataList2.DataBind();

        }
        dr.Close();
     
       
        con.Close();
       
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton img = (ImageButton)sender;
        string im = img.CommandArgument.ToString();
        Session["frd"] = im;
        Response.Redirect("friends_wall.aspx");
    }
}
