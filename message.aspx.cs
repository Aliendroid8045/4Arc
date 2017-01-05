using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services;

public partial class message : System.Web.UI.Page
{
    static string constr = System.Configuration.ConfigurationManager.AppSettings["constring"];
    SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("home.aspx");

            }
            else 
            {
                con.Open();
                string sel = "select * from conversation inner join avatar on avatar.user_id=conversation.user_id where conversation.reciver='" + Session["user"] + "'";
                SqlCommand cm = new SqlCommand(sel, con);
                SqlDataReader de = cm.ExecuteReader();
                if (de.HasRows)
                {
                    DataList4.DataSource = de;
                    DataList4.DataBind();
                } de.Close();            
            }
        //    else if(Session["msg_frd"]!=null)
        //    {
               
        //        Panel1.Visible = false;
        //        Panel2.Visible = false;
                
        //        con.Open();
        //string sle = "select * from avatar where user_id='"+Session["msg_frd"]+"'";
        //SqlCommand cmd = new SqlCommand(sle,con);
        //SqlDataReader dr = cmd.ExecuteReader();
        //if (dr.HasRows) 
        //{
        //    while (dr.Read())
        //    {
                
        //       string ava = dr["avatar2"].ToString();
        //       string nn = dr["name"].ToString();
        //       //Image1.ImageUrl = ava;
        //       //Label3.Text = nn;
 
        //    }
        //} dr.Close();
        //con.Close();
        //Session["msg_frd"] = null;   
                
        //    }
            }
    }
    
    [WebMethod(EnableSession=true)]
    
       public static List<string> GetAutoCompleteData(string username)
    {
        string user=HttpContext.Current.Session["user"].ToString();
        List<string> result = new List<string>();
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("select friend_name from friends where user_id='"+user+"' and friend_name Like '%'+@SearchText+'%'", con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@SearchText", username);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    result.Add(dr["friend_name"].ToString());
                }
                return result;
            }
        }
    }  

    //[System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    //public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    //{
        

    //    return default(string[]);
    //}
    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        Panel1.Visible = false;
        con.Open();
        string sle = "select distinct * from friend_list inner join avatar on friend_list.sen_name=avatar.name where friend_list.sen_name='" + txtSearch.Text + "' and friend_list.receiver='" + Session["user"] + "'";
        SqlCommand cmd = new SqlCommand(sle, con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            DataList1.DataSource = dr;
            DataList1.DataBind();
        }
        dr.Close();
        con.Close();
        txtSearch.Text = "";
    }

   
    protected void Button3_Click(object sender, EventArgs e)
    {
        Button nt = (Button)sender;
        string id = nt.CommandArgument.ToString();
        con.Open();
        string sle = "select * from avatar where user_id='"+id+"'";
        SqlCommand cmd = new SqlCommand(sle,con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows) 
        {
            while (dr.Read())
            {
                Session["fd"] = dr["user_id"].ToString();
                Session["ava2"] = dr["avatar2"].ToString();
                Session["frd"] = dr["name"].ToString();
 
            }
        } dr.Close();
        con.Close();
        con.Open();
        string insert = "";
        string insert1 = "";
        int f = 0;
        string qry = "select * from conversation where user_id='" + Session["user"] + "' and reciver='" + Session["fd"] + "'";
        SqlCommand cmd2 = new SqlCommand(qry, con);
        SqlDataReader dt = cmd2.ExecuteReader();
        if (dt.HasRows)
        {
            while (dt.Read())
            {

                Image3.ImageUrl = Session["ava2"].ToString();
                Label4.Text = Session["frd"].ToString();
                Panel1.Visible = true;
                Panel2.Visible = false;
            }
        }

        else
        {
            f = 1;
            insert = "insert into conversation values('" + Session["User"] + "','" + Session["fd"] + "')";

            insert1 = "insert into conversation values('" + Session["fd"] + "','" + Session["User"] + "')";

            Image3.ImageUrl = Session["ava2"].ToString();
            Label4.Text = Session["frd"].ToString();
            Panel1.Visible = true;
            Panel2.Visible = false;
        }
        dt.Close();
        con.Close();
        if (f == 1)
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand(insert, con);
            cmd1.ExecuteNonQuery();
            SqlCommand cmd3 = new SqlCommand(insert1, con);
            cmd3.ExecuteNonQuery();
            con.Close();
        }

        msg();  
        
 

    }
    public void msg()
    {
        con.Open();
        string ms = "select * from message where receiver='" + Session["user"] + "' and user_id='" + Session["fd"] + "' ";
        SqlCommand cmd1 = new SqlCommand(ms, con);
        string ms1 = "select * from message where user_id='" + Session["user"] + "' and receiver='" + Session["fd"] + "' ";
        SqlCommand cmd2 = new SqlCommand(ms1, con);


        SqlDataReader dr1 = cmd2.ExecuteReader();
        if (dr1.HasRows)
        {
            DataList3.DataSource = dr1;
            DataList3.DataBind();
        }
        

        dr1.Close();
        SqlDataReader dr = cmd1.ExecuteReader();
        if (dr.HasRows)
        {
            DataList2.DataSource = dr;
            DataList2.DataBind();
        }

        dr.Close();
        con.Close();
        con.Open();
        string sel = "select * from conversation inner join avatar on avatar.user_id=conversation.user_id where conversation.reciver='" + Session["user"] + "'";
        SqlCommand cm = new SqlCommand(sel, con);
        SqlDataReader de = cm.ExecuteReader();
        if (de.HasRows)
        {
            DataList4.DataSource = de;
            DataList4.DataBind();
        } de.Close();
        con.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
       
            con.Open();
            string insert = "insert into message(user_id,receiver,user_msg,status) values('" + Session["User"] + "','" + Session["fd"] + "','" + TextBox1.Text + "','unread')";

            SqlCommand cmd = new SqlCommand(insert, con);
            cmd.ExecuteNonQuery();
            con.Close();
            msg();
        
       
        TextBox1.Text = "";
        
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lnt = (LinkButton)sender;
        string mg = lnt.CommandArgument.ToString();
        con.Open();
        string sle = "select * from avatar where user_id='" + mg + "'";
        SqlCommand cmd = new SqlCommand(sle, con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                Session["fd"] = dr["user_id"].ToString();
                Session["ava2"] = dr["avatar2"].ToString();
                Session["frd"] = dr["name"].ToString();

            }
        } dr.Close();
        con.Close();

        Image3.ImageUrl = Session["ava2"].ToString();
        Label4.Text = Session["frd"].ToString();
        Panel1.Visible = true;
        Panel2.Visible = false;
        msg();
    }
}