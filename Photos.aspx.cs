using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Collections;


public partial class Photos : System.Web.UI.Page
{
    static string constr = System.Configuration.ConfigurationManager.AppSettings["constring"];
    SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel5.Visible = false;
        //Panel3.Visible = false;
       // AsyncFileUpload1.Visible = false;
        //Button6.Visible = false;
        if (Session["user"] == null)
        {
            Response.Redirect("home.aspx");
        }
       

    }
   
   
    protected void Button2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
        Panel5.Visible = false;
        con.Open();
        //Query to get ImagesName and Description from database
        SqlCommand command = new SqlCommand("SELECT * from photos where user_id='" + Session["user"] + "' and avatar2 is not null", con);
        SqlDataAdapter da = new SqlDataAdapter(command);
        DataTable dt = new DataTable();
        da.Fill(dt);

        DataList1.DataSource = dt;
        DataList1.DataBind();


         con.Close();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        Panel1.Visible = false;
             con.Open();
        //Query to get ImagesName and Description from database
             SqlCommand command = new SqlCommand("SELECT * from photos where user_id='" + Session["user"] + "' and avatar1 is not null", con);
        SqlDataAdapter da = new SqlDataAdapter(command);
        DataTable dt = new DataTable();
        da.Fill(dt);

        DataList2.DataSource = dt;
        DataList2.DataBind();


         con.Close();
    }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel3.Visible = true;
        //AsyncFileUpload1.Visible = false;
        //Button6.Visible = false;
    }
    public void bind()
    {
        con.Open();
        string sele = "select * from photos where user_id='" + Session["user"] + "' and alb_name='" + TextBox1.Text + "'";
        SqlCommand cmd = new SqlCommand(sele, con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            DataList3.DataSource = dr;
            DataList3.DataBind();
        }
        dr.Close();
        con.Close();
        //GridView1.DataSource = files;
        //GridView1.DataBind();
    }
    protected void Button5_Click1(object sender, EventArgs e)
    {
      
        con.Open();
        string dhr = "insert into album values('"+Session["user"]+"','"+TextBox1.Text+"','"+ViewState["img"]+"')";
        SqlCommand cmd = new SqlCommand(dhr, con);
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("photos.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        HttpFileCollection fileCollection = Request.Files;
        for (int i = 0; i < fileCollection.Count; i++)
        {
            HttpPostedFile uploadfile = fileCollection[i];
            string fileName = Path.GetFileName(uploadfile.FileName);
            if (uploadfile.ContentLength > 0)
            {
                file_upload.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
                string path = "~/Images/" + fileName;
                ViewState["img"] = path;
                con.Open();
                string inse = "insert into photos(user_id,alb_name,alb_photo) values('" + Session["user"] + "','" + TextBox1.Text + "','" + path + "') ";
                SqlCommand cmd = new SqlCommand(inse, con);
                cmd.ExecuteNonQuery();
                con.Close();

                bind();
            }
        }
        
       

    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        con.Open();
        string del = "delete from photos where user_id='" + Session["user"] + "' and alb_name='" + TextBox1.Text + "'";
        SqlCommand cmd = new SqlCommand(del, con);
        cmd.ExecuteNonQuery();
        con.Close();
        //Panel3.Visible = false;
        Response.Redirect("photos.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Panel4.Visible = true;
        con.Open();
        string sele = "select * from album where user_id='" + Session["user"] + "' ";
        SqlCommand cmd = new SqlCommand(sele, con);
        SqlDataReader dr=cmd.ExecuteReader();
        if (dr.HasRows)
        {
           
            DataList4.DataSource = dr;
            DataList4.DataBind();
        }
        dr.Close();
        con.Close();
        

    }
    //protected void Button8_Click(object sender, EventArgs e)
    //{
    //    Button btn = (Button)sender;
    //    string id = btn.CommandArgument.ToString();
    //    con.Open();
    //    string sele = "select * from photos where alb_name='"+id+"' and user_id='"+Session["user"].ToString()+"'";

    //    SqlCommand cmd1 = new SqlCommand(sele, con);
    //    SqlDataReader dr = cmd1.ExecuteReader();
    //    if (dr.HasRows)
    //    {
    //        while (dr.Read())
    //        {
    //            DropDownList1.Text = dr["alb_photo"].ToString();
    //        }
    //        DataList5.DataSource = dr;
    //        DataList5.DataBind();
    //    }
    //    else {
    //        Response.Write("error");
    //    }
    //    dr.Close();
    //    con.Close();
    //    Panel4.Visible = false;
    //}

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        string id = btn.CommandArgument.ToString();
        con.Open();
        string sele = "select * from photos where alb_name='" + id + "' and user_id='" + Session["user"] + "'";
        SqlCommand cmd = new SqlCommand(sele, con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            DataList6.DataSource = dr;
            DataList6.DataBind();
        }
        dr.Close();
        con.Close();

        Panel4.Visible = false;
        Panel5.Visible = true;

    }
    protected void DataList6_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}