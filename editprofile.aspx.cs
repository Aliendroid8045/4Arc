using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class editprofile : System.Web.UI.Page
{
    static string constr = System.Configuration.ConfigurationManager.AppSettings["constring"];
    SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("home.aspx");
        }
        if (!IsPostBack)
        {
            con.Open();
            //string select = "select * from sign where user_id='" + Session["user"].ToString() + "'";
            string select1 = "select * from basic where user_id='" + Session["user"].ToString() + "'";
            string avatar = "select * from avatar where user_id='" + Session["user"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(avatar, con);
            SqlCommand cmd1 = new SqlCommand(select1, con);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    string path = dr["avatar2"].ToString();
                   
                    string path1=dr["avatar1"].ToString();
                    Session["avatar1"]=path1;
                    

                }
            }
            dr.Close();
            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.HasRows)
            {
                while (dr1.Read())
                {
                    emailaddress.Text = dr1[1].ToString();
                    TextBox2.Text = dr1[2].ToString();
                   
                    TextBox3.Text = dr1[3].ToString();
                    birthdate.Text = dr1[4].ToString();
                    
                    sex.SelectedItem.Text = dr1[5].ToString();
                    hobbies.Text = dr1[8].ToString();
                    contactno.Text = dr1[9].ToString();
                    address.Text = dr1[10].ToString();
                    school.Text = dr1[11].ToString();
                    Highschool.Text = dr1[12].ToString();
                    college.Text = dr1[13].ToString();
                    compnyname.Text = dr1[14].ToString();
                    post.Text = dr1[15].ToString();
                    aboutme.Text = dr1[16].ToString();
                    movies.Text = dr1[17].ToString();
                    tvshows.Text = dr1[18].ToString();
                    music.Text = dr1[19].ToString();
                    books.Text = dr1[20].ToString();
                }

            }
            dr1.Close();
            con.Close();
        }
    }
    
    protected void Button11_Click(object sender, EventArgs e)
    {
        if (relationshipstatus.SelectedItem.Text == "Relationship Status")
        {
            Label8.Text = "Please Select Relationship";
        }
        if (sex.SelectedItem.Text == "I am")
        {
            Label9.Text = "Please select Gender";
        }

        if (FileUpload1.HasFile)
        {
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Server.MapPath("Image/" + filename));
            string path = "~/Image/" + FileUpload1.FileName;
            con.Open();
            string avatar = "update avatar set avatar2='" + path + "' where user_id='"+Session["user"].ToString()+"'";
            SqlCommand cmd3 = new SqlCommand(avatar, con);
            cmd3.ExecuteNonQuery();
             string avatar22="insert into photos(user_id,avatar2) values('"+Session["User"]+"','"+path+"') ";
            SqlCommand cmd4 = new SqlCommand(avatar22, con);
            cmd4.ExecuteNonQuery();
            con.Close();               
            }
        
        con.Open();
         string upa = "update basic set fn='" + TextBox2.Text + "',ln='" + TextBox3.Text + "',gender='" + sex.SelectedItem.Text + "',birthdate='" + birthdate.Text + "',relationship='" + relationshipstatus.SelectedItem.Text + "',hobbies='" + hobbies.Text + "',contact='" + contactno.Text + "',address='" + address.Text + "',school='" + school.Text + "',high='" + Highschool.Text + "',college='" + college.Text + "',job='" + compnyname.Text + "',post='" + post.Text + "',about='" + aboutme.Text + "', movies='" + movies.Text + "',tv='" + tvshows.Text + "',music='" + music.Text + "',book='" + books.Text + "' where user_id='" + Session["User"].ToString() + "' ";
        SqlCommand cmd1 = new SqlCommand(upa, con);
         cmd1.ExecuteNonQuery();
         Response.Redirect("D.aspx");
        con.Close();
        
        }
    protected void Button10_Click(object sender, EventArgs e)
    {
        Response.Redirect("Pro.aspx");
    }
}

