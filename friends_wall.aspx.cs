using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class friends_wall : System.Web.UI.Page
{
    static string constr = System.Configuration.ConfigurationManager.AppSettings["constring"];
    SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["frd"] == null)
        {
            Response.Redirect("d.aspx");

        }
        else
        {
            con.Open();
            string sele = "select * from avatar where user_id='"+Session["frd"]+"' ";
            string sel = "select * from basic where user_id='"+Session["frd"]+"'";
            string dz = "select user_id from friend_list where receiver='"+Session["user"]+"' and user_id='"+Session["frd"]+"'";
            SqlCommand cmd = new SqlCommand(sele, con);
            SqlCommand dm = new SqlCommand(sel, con);
            SqlCommand dzp = new SqlCommand(dz, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read()) 
                {
                    string path = dr["avatar2"].ToString();
                    string path2 = dr["avatar1"].ToString();
                    Image2.ImageUrl = path;
                    imgDisplay.ImageUrl = path2;
                    ViewState["fn"] = dr["name"].ToString();
                    ViewState["avatar2"] = path;
 
                }

            } dr.Close();
            SqlDataReader dr1 = dm.ExecuteReader();
            if (dr1.HasRows)
            {
                while (dr1.Read())
                {
                    
                        Label10.Text = dr1["gender"].ToString();
                        Label11.Text = dr1["high"].ToString();
                        Label12.Text = dr1["college"].ToString();
                        Label13.Text = dr1["job"].ToString();
                        Label14.Text = dr1["post"].ToString();
                        Label15.Text = dr1["movies"].ToString();
                        Label16.Text = dr1["tv"].ToString();
                        Label17.Text = dr1["music"].ToString();
                        Label18.Text = dr1["book"].ToString();
                        
                        Label5.Text = dr1["fn"].ToString();
                        Label6.Text = dr1["ln"].ToString();
                        Label7.Text = dr1["birthdate"].ToString();
                        Label8.Text = dr1["relationship"].ToString();
                        Label9.Text = dr1["hobbies"].ToString();
                }
            } dr1.Close();
            SqlDataReader dz1 = dzp.ExecuteReader();
            if (dz1.HasRows)
            {
                Button1.Text="Unfriend";
            }
            else
            {
                Button1.Text="Add Friend";
 
            }
            con.Close();
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Button1.Text == "Add Friend")
        {

            con.Open();
            string friend = "insert into friends(user_id,friend_id,friend_name,user_name,status,u_avatar2,f_avatar2) values('" + Session["user"].ToString() + "','" + Session["frd"] + "','" + ViewState["fn"] + "','" + Session["name"].ToString() + "','requested','" + Session["avatar"].ToString() + "','" + ViewState["avatar2"] + "')";
            SqlCommand cmd = new SqlCommand(friend, con);
            int a = cmd.ExecuteNonQuery();
            if (a == 1)
            {

                Button1.Text = "Request Send";

            }
            con.Close();
        }
        else 
        {
            con.Open();
            string unfriend = "delete from friend_list where user_id='" + Session["user"] + "' and receiver='" + Session["frd"] + "'";
            SqlCommand cmd1 = new SqlCommand(unfriend, con);
            cmd1.ExecuteNonQuery();
            string unfriend1 = "delete from friend_list where user_id='" + Session["frd"] + "' and receiver='" + Session["user"] + "'";
            SqlCommand cmd2 = new SqlCommand(unfriend1, con);
            cmd2.ExecuteNonQuery();
            con.Close();
            Button1.Text = "Add friend";
        }
    }
}