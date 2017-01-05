using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class setting : System.Web.UI.Page
{
    static string constr = System.Configuration.ConfigurationManager.AppSettings["constring"];
    SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        int i = 0;
        string updat="";
        string sel = "select * from basic where user_id='" + Session["user"] + "'";
        SqlCommand cmd = new SqlCommand(sel,con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
               
                string pass = dr["password"].ToString();
                if (pass == TextBox1.Text)
                {
                    i = 1;
                     updat = "update basic set password='" + newpass.Text + "' where user_id='" + Session["user"] + "'";

                }
                else
                {
                    Label5.Text = "Enter Correct Old Password";
                }
            }

        } dr.Close();
        if (i == 1)
        {
            SqlCommand cmd1 = new SqlCommand(updat, con);
            cmd1.ExecuteNonQuery();
            Label5.Text = "password successfully changed";
        }
        con.Close();
        TextBox1.Text = "";
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        con.Open();
        string qry = "delete from basic where user_id='" + Session["user"] + "'";
        SqlCommand cmd1 = new SqlCommand(qry, con);
        cmd1.ExecuteNonQuery();

        string qry1 = "delete from avatar  where user_id='" + Session["user"] + "'";
        SqlCommand cmd2 = new SqlCommand(qry1, con);
        cmd2.ExecuteNonQuery();
        
        string qry2 = "delete from album where user_id='" + Session["user"] + "'";
        SqlCommand cmd3 = new SqlCommand(qry2, con);
        cmd3.ExecuteNonQuery();
        
        string qry3 = "delete from conversation where user_id='" + Session["user"] + "'";
        SqlCommand cmd4 = new SqlCommand(qry3, con);
        cmd4.ExecuteNonQuery();
        
        string qry4 = "delete from friend_list where user_id='" + Session["user"] + "'";
        SqlCommand cmd5 = new SqlCommand(qry4, con);
        cmd5.ExecuteNonQuery();
        
        string qry5 = "delete from friends where user_id='" + Session["user"] + "'";
        SqlCommand cmd6 = new SqlCommand(qry5, con);
        cmd6.ExecuteNonQuery();
        
        string qry6 = "delete from message where user_id='" + Session["user"] + "'";
        SqlCommand cmd7 = new SqlCommand(qry6, con);
        cmd7.ExecuteNonQuery();
        
        string qry7 = "delete from photos where user_id='" + Session["user"] + "'";
        SqlCommand cmd8 = new SqlCommand(qry7, con);
        cmd8.ExecuteNonQuery();
        
        string qry8 = "delete from post where user_id='" + Session["user"] + "'";
        SqlCommand cmd9 = new SqlCommand(qry8, con);
        cmd9.ExecuteNonQuery();
        con.Close();
        Response.Redirect("home.aspx");
    }
}