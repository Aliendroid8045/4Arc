using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    static string constr = System.Configuration.ConfigurationManager.AppSettings["constring"];
    SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        request.Visible = false;
        Panel3.Visible = false;
        
        Panel2.Visible = false;
        DataList3.Visible = false;
        if (Session["user"] == null)
        {
            Response.Redirect("home.aspx");
        }
        else
        {
            //TextBox1.Attributes.Add("onclick", "document.getElementById('"+Panel2.ClientID+"').style.visible='true';");
            con.Open();
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

            string ds = "select * from avatar where user_id<>'"+Session["user"]+"' and user_id not in(select user_id from friend_list where receiver='"+Session["user"]+"')";
            SqlCommand cs = new SqlCommand(ds, con);
            SqlDataReader fd = cs.ExecuteReader();
            if (fd.HasRows)
            {
                DataList1.DataSource = fd;
                DataList1.DataBind();
            }
            con.Close();
            LinkButton1.Text = Session["name"].ToString();
                 con.Open();

        string str = "select * from friends where friend_id='" + Session["user"].ToString() + "' and status='requested'";
        string sa = "select count(*) as record from message inner join avatar on message.user_id=avatar.user_id where message.receiver='"+Session["user"]+"' and message.status='unread'";
        int flag = 0;
        string nott = "";
            string da1 = "select * from post where user_id='" + Session["user"] + "'";
            SqlCommand cmd2 = new SqlCommand(da1, con);
        SqlDataReader dr2 = cmd2.ExecuteReader();
        if (dr2.HasRows)
        {
            while (dr2.Read())
            {
                string id = dr2["id"].ToString();
               // Label3.Text = id;
                flag = 1;
                nott = "select (select count(*) from likes where post_id='" + id + "' and status='unread' and lik_user<>'" + Session["user"] + "') as count1, (select count(*) from comment where post_id='" + id + "' and status='unread' and comment_frd<>'" + Session["user"] + "') as count2 ";

            }
        } dr2.Close();
        if (flag == 1)
        {
            SqlCommand asd = new SqlCommand(nott, con);
            SqlDataReader dp = asd.ExecuteReader();
            if (dp.HasRows)
            {
                while (dp.Read())
                {
                    int i = 0;
                    int j = 0;
                    int total = 0;
                    string sasa = dp["count1"].ToString();
                    string s = dp["count2"].ToString();
                    i = Convert.ToInt32(sasa);
                    j = Convert.ToInt32(s);
                    total = i + j;
                    string st = Convert.ToString(total);
                    Label20.Text = st;

                }
            }
            else
            {
                Label16.Text = "No New Notification Found";
            }
                dp.Close();
        }
        //DataList1.DataSource = dr2;
        //DataList1.DataBind();
        //dr2.Close();
        SqlDataAdapter da = new SqlDataAdapter(str, con);
        DataTable dt = new DataTable();
        da.Fill(dt);


        if (dt.Rows.Count > 0)
        {

            DataList2.DataSource = dt;
            DataList2.DataBind();


            Label3.Text = dt.Rows.Count.ToString();

        }
        else 
        {
            Label2.Text = "NO ReQuest Found";
        }
        SqlCommand dm = new SqlCommand(sa, con);
        SqlDataReader df = dm.ExecuteReader();

        


        if (df.HasRows)
        {
            while (df.Read())
            {
                string co = df["record"].ToString();
                if (co == null)
                {
                    Label15.Text = "";
                }
                else{
                    Label15.Text = co;
                }
            }
        }
        else 
        {
            Label4.Text = "No New Message Found";
        }
       // Label4.Text = i.ToString();
        

        con.Close();
           
        }

       
       

        //con.Open();

        //string str1 = "select * from avatar where user_id<>'"+Session["user"]+"' ";
        //SqlCommand cmd1 = new SqlCommand(str1, con);
        ////  dr1 = cmd1.ExecuteReader();
        //SqlDataReader dr2 = cmd1.ExecuteReader();
        //if (dr2.HasRows)
        //{
        //    DataList1.DataSource = dr2;
        //    DataList1.DataBind();
        //}
        //dr2.Close();
       
       
       
               
                    //DataList1.DataBind();
                
         
           // dt2.Clear();
            //dt.Clear();
          
            
        
        //dr1.Close();

       // con.Close();
      
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
        Response.Redirect("d.aspx");
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
        Response.Redirect("d.aspx");


    }
    protected void friend_Click(object sender, ImageClickEventArgs e)
    {
        request.Visible = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("pro.aspx");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("d.aspx");
    }
   

    protected void Image1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("pro.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("pro.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("friends.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("message.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("photos.aspx");
    }

    protected void LinkButton8_Click(object sender, EventArgs e)
    {
        Response.Redirect("games.aspx");
    }
    protected void LinkButton9_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default2.aspx");
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("setting.aspx");
    }
    protected void LinkButton11_Click(object sender, EventArgs e)
    {
        Response.Redirect("Elearning.aspx");
    }
    
    protected void Button1_Click1(object sender, EventArgs e)
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
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("buy.aspx");
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        con.Open();
        string sa = "select distinct avatar.avatar2,avatar.name,message.user_id from message inner join avatar on message.user_id=avatar.user_id where message.receiver='" + Session["user"] + "' and message.status='unread'";
     
        SqlDataAdapter da1 = new SqlDataAdapter(sa, con);
        DataTable dt1 = new DataTable();
        da1.Fill(dt1);


        if (dt1.Rows.Count > 0)
        {
           
            DataList6.DataSource = dt1;
            DataList6.DataBind();

        }
        else
        {
            Label4.Text = "No New Message Found";
        }
        con.Close();
        Panel2.Visible = true;
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
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        
    }
    protected void allfrnd_Click(object sender, EventArgs e)
    {
        LinkButton ln = (LinkButton)sender;
        string id = ln.CommandArgument.ToString();
        Session["frd"]=id;
        Response.Redirect("friends_wall.aspx");

    }
   
    protected void Button1(object sender, EventArgs e)
    {
        Response.Redirect("home.aspx");
    }
    protected void imageButton2(object sender, ImageClickEventArgs e)
    {

        con.Open();
        int i = 0;
        string lik = "";
        string sle = "select id from post where user_id='" + Session["user"] + "'";
        SqlCommand cmd = new SqlCommand(sle, con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                string id = dr["id"].ToString();
                // Label16.Text = id;
                i = 1;
               
                lik = "select * from avatar inner join likes on likes.lik_user=avatar.user_id where likes.post_id='" + id + "' and likes.status='unread' and lik_user<>'"+Session["user"]+"'";
              
            }
        } dr.Close();
        if (i == 1)
        {
            SqlCommand cmd1 = new SqlCommand(lik, con);
            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.HasRows)
            {

                DataList5.DataSource = dr1;
                DataList5.DataBind();
            } dr1.Close();

        }
        
       
        int j = 0;
      
        string dislik = "";
      
        string sel = "select id from post where user_id='" + Session["user"] + "'";
        SqlCommand cm = new SqlCommand(sel, con);
        SqlDataReader drd = cm.ExecuteReader();
        if (drd.HasRows)
        {
            while (drd.Read())
            {
                string id = drd["id"].ToString();
                // Label16.Text = id;
                j = 1;
                dislik = "select * from likes inner join avatar on likes.dis_user=avatar.user_id where likes.post_id='" + id + "' and likes.status='unread' and dis_user<>'" + Session["user"] + "'";
                
            }
        } drd.Close();
       
        if (j == 1)
        {
            SqlCommand cmd1 = new SqlCommand(dislik, con);
            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.HasRows)
            {
                DataList7.DataSource = dr1;
                DataList7.DataBind();
            } dr1.Close();
        }
        int k = 0;

        string comm = "";

        string sele = "select id from post where user_id='" + Session["user"] + "'";
        SqlCommand cm1 = new SqlCommand(sel, con);
        SqlDataReader drd1 = cm1.ExecuteReader();
        if (drd1.HasRows)
        {
            while (drd1.Read())
            {
                string id = drd1["id"].ToString();
                // Label16.Text = id;
                k = 1;
                comm = "select * from comment inner join avatar on comment.comment_frd=avatar.user_id where comment.post_id='" + id + "' and comment.status='unread' and comment_frd<>'" + Session["user"] + "'";

            }
        } drd1.Close();

        if (k == 1)
        {
            SqlCommand cmd1 = new SqlCommand(comm, con);
            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.HasRows)
            {
                DataList8.DataSource = dr1;
                DataList8.DataBind();
            } dr1.Close();
        }
        con.Close();
        Panel3.Visible = true;
    }
    protected void notify_Click(object sender, EventArgs e)
    {
        LinkButton lnt = (LinkButton)sender;
        string lt = lnt.CommandArgument.ToString();
        ViewState["lt"] = lt;
        notification();
        ModalPopupExtender1.Show();
       
    }
    public void notification() 
    {
        Image8.ImageUrl = Session["avatar"].ToString();
        Label21.Text = Session["name"].ToString();
        
        con.Open();
        string str = "select * from post where id='" + ViewState["lt"] + "'";
        SqlCommand cmd = new SqlCommand(str, con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                Label22.Text = dr["text_post"].ToString();
                string path = dr["image_post"].ToString();
                Image2.ImageUrl = path;
                Label24.Text = dr["likes"].ToString();
                Label25.Text = dr["dislike"].ToString();


            }
        } dr.Close();
        string comm = "select * from comment inner join avatar on comment.comment_frd=avatar.user_id where comment.post_id='" + ViewState["lt"] + "'";
        SqlCommand cmd1 = new SqlCommand(comm, con);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.HasRows)
        {
            DataList9.DataSource = dr1;
            DataList9.DataBind();

        } dr1.Close();

        string iins = "update comment set status='read' where post_id='" + ViewState["lt"] + "'";
        SqlCommand cmd3 = new SqlCommand(iins, con);
        cmd3.ExecuteNonQuery();
        string iins1 = "update likes set status='read' where post_id='" + ViewState["lt"] + "'";
        SqlCommand cmd4 = new SqlCommand(iins1, con);
        cmd4.ExecuteNonQuery();

        con.Close();



    }
    protected void notify_Click1(object sender, EventArgs e)
    {
        LinkButton lnt = (LinkButton)sender;
        string lt = lnt.CommandArgument.ToString();
        ViewState["lt"] = lt;

        notification();
        ModalPopupExtender1.Show();
       
    }
    protected void notify_Click2(object sender, EventArgs e)
    {
        LinkButton lnt = (LinkButton)sender;
        string lt = lnt.CommandArgument.ToString();
        ViewState["lt"] = lt;

        notification();
        ModalPopupExtender1.Show();
       

    }
    protected void Button4_Click(object sender, EventArgs e)
    {

        con.Open();
        string ins = "insert into comment values('" + TextBox2.Text + "','" + Session["user"] + "','" + ViewState["lt"] + "','read')";
        SqlCommand cmd = new SqlCommand(ins, con);
        cmd.ExecuteNonQuery();
        con.Close();
        notification();
    }
    protected void okkk_Click(object sender, EventArgs e)
    {
        Response.Redirect("D.aspx");
    }
}

