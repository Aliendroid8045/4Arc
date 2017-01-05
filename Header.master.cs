using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Header : System.Web.UI.MasterPage
{
    static string constr = System.Configuration.ConfigurationManager.AppSettings["constring"];
    SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        request.Visible = false;
        // Panel3.Visible = false;
        Panel2.Visible = false;
        DataList3.Visible = false;
        if (Session["user"] == null)
        {
            Response.Redirect("home.aspx");
        }
        else
        {
            con.Open();

           //TextBox1.Attributes.Add("onclick", "document.getElementById('"+Panel2.ClientID+"').style.visible='true';");
            Button1.Text=Session["name"].ToString();
            string select = "select * from avatar where user_id='" + Session["user"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    string path = dr["avatar2"].ToString();
                    Image1.ImageUrl = path;
                    Session["avatar"] = path;
                }
            }
            dr.Close();

            string ds = "select * from avatar where user_id<>'" + Session["user"] + "' and user_id not in(select user_id from friend_list where receiver='" + Session["user"] + "')";
            SqlCommand cs = new SqlCommand(ds, con);
            SqlDataReader fd = cs.ExecuteReader();
            if (fd.HasRows)
            {
                GridView1.DataSource = fd;
                GridView1.DataBind();
            }
            con.Close();
           

        string str = "select * from friends where friend_id='" + Session["user"].ToString() + "' and status='requested'";
        string sa = "select distinct avatar.avatar2,avatar.name,message.user_id from message inner join avatar on message.user_id=avatar.user_id where message.receiver='"+Session["user"]+"' and message.status='unread'";
        
        SqlDataAdapter da = new SqlDataAdapter(str, con);
        DataTable dt = new DataTable();
        da.Fill(dt);


        if (dt.Rows.Count > 0)
        {
           
            DataList2.DataSource = dt;
            DataList2.DataBind();


            Label3.Text = dt.Rows.Count.ToString();

        }
        
            SqlDataAdapter da1 = new SqlDataAdapter(sa, con);
        DataTable dt1 = new DataTable();
        da1.Fill(dt1);


        if (dt1.Rows.Count > 0)
        {
           
            DataList6.DataSource = dt1;
            DataList6.DataBind();

        }
        Label2.Text = dt1.Rows.Count.ToString();
        

        con.Close();
           
        }
            
        
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("home.aspx");
    }
    protected void accept_Click(object sender, EventArgs e)
    {
        con.Open();
        Button btn = (Button)sender;
        string id = btn.CommandArgument.ToString();

        string friend = "update friends set status='accepted' where user_id='" + id + "' and friend_id='" + Session["user"].ToString() + "'";
        SqlCommand cmd = new SqlCommand(friend, con);
        cmd.ExecuteNonQuery();


        string select = "select * from avatar where user_id='" + id + "'";
        SqlCommand cm = new SqlCommand(select, con);
        SqlDataReader dr = cm.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                Session["fname"] = dr["name"].ToString();
                Session["ava2"] = dr["avatar2"].ToString();
            }
        }
        dr.Close();
        string insert = "insert into friend_list  values('" + Session["user"] + "','" + id + "','" + Session["name"] + "','" + Session["fname"] + "')";
        string insertrev = "insert into friend_list  values('" + id + "','" + Session["user"] + "','" + Session["fname"] + "','" + Session["name"] + "')";
        SqlCommand cmd1 = new SqlCommand(insert, con);
        SqlCommand cmd2 = new SqlCommand(insertrev, con);
        cmd1.ExecuteNonQuery();
        cmd2.ExecuteNonQuery();
        con.Close();
        Response.Redirect("pro.aspx");
    }
    protected void notnow_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string id = btn.CommandArgument.ToString();
        con.Open();
        string friend = "update friends set status='pending' where user_id='" + id + "' and friend_id='" + Session["user"].ToString() + "'";
        SqlCommand cmd = new SqlCommand(friend, con);
        cmd.ExecuteNonQuery();
        con.Close();


    }
    protected void friend_Click(object sender, ImageClickEventArgs e)
    {
        request.Visible = true;
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("d.aspx");
    }
    protected void friend_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string id = btn.CommandArgument.ToString();
        con.Open();
        string sele = "select * from avatar where user_id='" + id + "'";
       
        SqlCommand cmd1 = new SqlCommand(sele, con);
        SqlDataReader dr = cmd1.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                string fn = dr["name"].ToString();
                Session["fn"] = fn;
                string avatar2 = dr["avatar2"].ToString();
                Session["avatar2"] = avatar2;
            }
        }
       
        dr.Close();
        con.Close();
        con.Open();
        string friend = "insert into friends(user_id,friend_id,friend_name,user_name,status,u_avatar2,f_avatar2) values('" + Session["user"].ToString() + "','" + id + "','" + Session["fn"].ToString() + "','" + Session["name"].ToString() + "','requested','" + Session["avatar"].ToString() + "','" + Session["avatar2"].ToString() + "')";
        SqlCommand cmd = new SqlCommand(friend, con);
      int a = cmd.ExecuteNonQuery();
      if (a == 1)
      {

          btn.Text = "Request Send";

      }
        con.Close();
    }
   
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("product.aspx");
    }
  
   
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        con.Open();

        string str = "select * from friends where friend_id='" + Session["user"].ToString() + "' and status='pending'";
        SqlCommand cmd = new SqlCommand(str, con);
        SqlDataReader dr = cmd.ExecuteReader();



        if (dr.HasRows)
        {

            DataList3.DataSource = dr;
            DataList3.DataBind();

        }
        con.Close();
        DataList3.Visible = true;
        request.Visible = true;
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        Panel2.Visible = true;
    }
    protected void msg_Click(object sender, EventArgs e)
    {
        con.Open();
        LinkButton ln = (LinkButton)sender;
        string id = ln.CommandArgument.ToString();
        string friend = "update message set status='read' where user_id='" + id + "' and receiver='" + Session["user"].ToString() + "'";
        SqlCommand cmd = new SqlCommand(friend, con);
        cmd.ExecuteNonQuery();
        con.Close();
        Session["msg_frd"] = id;
        Response.Redirect("message.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("pro.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("home.aspx");

    }
    protected void B1_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string id = btn.CommandArgument.ToString();
        con.Open();
        string sele = "select * from avatar where user_id='" + id + "'";

        SqlCommand cmd1 = new SqlCommand(sele, con);
        SqlDataReader dr = cmd1.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                string fn = dr["name"].ToString();
                Session["fn"] = fn;
                string avatar2 = dr["avatar2"].ToString();
                Session["avatar2"] = avatar2;
            }
        }

        dr.Close();
        con.Close();
        con.Open();
        string friend = "insert into friends(user_id,friend_id,friend_name,user_name,status,u_avatar2,f_avatar2) values('" + Session["user"].ToString() + "','" + id + "','" + Session["fn"].ToString() + "','" + Session["name"].ToString() + "','requested','" + Session["avatar"].ToString() + "','" + Session["avatar2"].ToString() + "')";
        SqlCommand cmd = new SqlCommand(friend, con);
        int a = cmd.ExecuteNonQuery();
        if (a == 1)
        {

            btn.Text = "request Send";

        }
        con.Close();
        Response.Redirect("pro.aspx");
    }
    protected void B3_Click(object sender, EventArgs e)
    {
        Response.Redirect("buy.aspx");
    }
}
