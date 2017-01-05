using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

public partial class D : System.Web.UI.Page
{
    static string constr = System.Configuration.ConfigurationManager.AppSettings["constring"];
    SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["user"] == null)
        {
            Response.Redirect("home.aspx");
        }
        //if (!IsPostBack)
        //{
        //    con.Open();
        //    string select = "select * from avatar where user_id='" + Session["user"].ToString() + "'";
        //    SqlCommand cmd = new SqlCommand(select, con);

        //    SqlDataReader dr = cmd.ExecuteReader();
        //    if (dr.HasRows)
        //    {
        //        while (dr.Read())
        //        {
        //            string path = dr["avatar2"].ToString();
        //            Image1.ImageUrl = path;

        //        }
        //    }
        //    dr.Close();
        //    con.Close();

        
        
        else
        {
        con.Open();
       string str1 = "SELECT avatar.avatar2, post.name,post.likes,post.dislike, post.text_post, post.image_post, avatar.user_id, post.id FROM avatar INNER JOIN post ON avatar.user_id = post.user_id ORDER BY post.id DESC";
        SqlCommand cmd1 = new SqlCommand(str1, con);
        //SqlDataReader dr = cmd.ExecuteReader();
        SqlDataReader dr1 = cmd1.ExecuteReader();
       
        DataList1.DataSource = dr1;
        DataList1.DataBind();
        dr1.Close();
       
       
        con.Close();
       
    }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        file_upload.Visible = true;
        //Button2.Visible = true;
        //Button3.Visible = true;
      
    }
    protected void BindDataList()
    {
        //DirectoryInfo dir = new DirectoryInfo(MapPath("Image"));
        //FileInfo[] files = dir.GetFiles();
        //ArrayList listItems = new ArrayList();
        //foreach (FileInfo info in files)
        //{
        //    listItems.Add(info);
        //}
        //dtlist.DataSource = listItems;
        //dtlist.DataBind();

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {

        string path = "~/Image/" + file_upload.FileName;
        con.Open();
        //string ins = "update post set text_post='" + TextBox1.Text + "',image_post='" + path + "' where user_id='" + Session["user"].ToString() + "'";
        string ins1 = "insert into post(user_id,name,text_post,image_post) values('" + Session["user"].ToString() + "','" + Session["name"].ToString() + "','" + TextBox1.Text + "','" + path + "')";
        SqlCommand cmd = new SqlCommand(ins1, con);
        cmd.ExecuteNonQuery();
        Response.Redirect("d.aspx");
        con.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //HttpFileCollection fileCollection = Request.Files;
        //for (int i = 0; i < fileCollection.Count; i++)
        //{
        //    HttpPostedFile uploadfile = fileCollection[i];
        //    string fileName = Path.GetFileName(uploadfile.FileName);
        //    if (uploadfile.ContentLength > 0)
        //    {
        //        uploadfile.SaveAs(Server.MapPath("~/Image/") + fileName);
        //        //Label1.Text += fileName + "sucessfullyupload<br>";
        //        //string path = "~/Image/" + file_upload.FileName;
        //        //Image2.ImageUrl = path;
        //        Button1_Click1();


        //    }
        //}
        if (file_upload.HasFile)
        {
            string filename = Path.GetFileName(file_upload.PostedFile.FileName);
            file_upload.SaveAs(Server.MapPath("Image/" + filename));
            string path = "~/Image/" + file_upload.FileName;
            Button1_Click1();
        }
    }

    private void Button1_Click1()
    {
        throw new NotImplementedException();
    }


   
   

   
   

    public string sel { get; set; }
    
    
    
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        con.Open();
        LinkButton ln = (LinkButton)sender;
        string img1 = ln.CommandArgument.ToString();
        string ins = "";
       
        int f = 0;
          string insert = "insert into likes(likes,lik_user,post_id,status) values('like','"+Session["user"]+"','"+img1+"','unread')";
            SqlCommand cmd = new SqlCommand(insert, con);
            cmd.ExecuteNonQuery();
         string sel = "select count(*) as record from likes where post_id='"+ img1+"' and likes='like'";
        SqlCommand cmd1 = new SqlCommand(sel, con);
        //SqlDataAdapter da = new SqlDataAdapter(sel, con);
        //DataTable dt = new DataTable();
        //da.Fill(dt);
        SqlDataReader dr = cmd1.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                string dt = dr["record"].ToString();
                //ln.Text = dt.ToString();
               // Label4.Text = dt;
                //ln.Text = dt;
                f = 1;
                ins = "update post set likes='"+dt+"' where id='"+img1+"'";

                //foreach (DataListItem r in DataList1.Items)
                //{
                //    LinkButton lt = (LinkButton)r.FindControl("lt3");
                //    lt.Text = dt.ToString();
                ////    string dt = dr["record"].ToString();
                ////    ((LinkButton)(Items.FindControl("LinkButton3"))).Text =dt.ToString();
                //}
                
            }
        }
        dr.Close();
        if (f == 1)
        {
            SqlCommand dm = new SqlCommand(ins, con);
            dm.ExecuteNonQuery();
        }
        con.Close();
        Response.Redirect("d.aspx");
    }
    protected void LinkButton3_Click1(object sender, EventArgs e)
    {
        con.Open();
        LinkButton ln = (LinkButton)sender;
        string img1 = ln.CommandArgument.ToString();
        string ins = "";

        int f = 0;
        string insert = "insert into likes(dislike,dis_user,post_id,status) values('dislike','" + Session["user"] + "','" + img1 + "','unread')";
        SqlCommand cmd = new SqlCommand(insert, con);
        cmd.ExecuteNonQuery();
        string sel = "select count(*) as record from likes where post_id='" + img1 + "' and dislike='dislike'";
        SqlCommand cmd1 = new SqlCommand(sel, con);
        //SqlDataAdapter da = new SqlDataAdapter(sel, con);
        //DataTable dt = new DataTable();
        //da.Fill(dt);
        SqlDataReader dr = cmd1.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                string dt = dr["record"].ToString();
                 f = 1;
                ins = "update post set dislike='" + dt + "' where id='" + img1 + "'";

             

            }
        }
        dr.Close();
        if (f == 1)
        {
            SqlCommand dm = new SqlCommand(ins, con);
            dm.ExecuteNonQuery();
        }
        con.Close();
        Response.Redirect("d.aspx");
    }
   
    
    protected void replay_Click(object sender, EventArgs e)
    {
        LinkButton lt = (LinkButton)sender;
        string lt1 = lt.CommandArgument.ToString();
        //Label3.Text = lt1.ToString();

        //con.Open();
        //string insert = "insert into comment(post_id) values('" + lt1 + "')";
        //SqlCommand cmd = new SqlCommand(insert, con);
        //cmd.ExecuteNonQuery();
       
        //con.Close();
        ViewState["id1"] = lt1;
        //PopupControlExtender1.PopupControlID="Panel1";
        ModalPopupExtender1.Show();
    }
    //protected void Button3_Click(object sender, EventArgs e)
    //{
    //    Button btn=(Button)sender;
    //    string lt1=btn.CommandArgument
    //    con.Open();
    //    string insert = "insert into comment(post_id) values('" + lt1 + "')";
    //    SqlCommand cmd = new SqlCommand(insert, con);
    //    cmd.ExecuteNonQuery();
    //    con.Close();

    //}

    protected void Button4_Click(object sender, EventArgs e)
    {
        con.Open();
        string cmt = "insert into comment(comment,comment_frd,post_id,status) values('" + TextBox2.Text + "','" + Session["user"] + "','"+ViewState["id1"]+"','unread')";
       // string cmt = "update comment set comment='" + TextBox2.Text + "', comment_frd='" + Session["user"] + "' where post_id='"+ViewState["id1"]+"'";
        SqlCommand cmd = new SqlCommand(cmt, con);
        cmd.ExecuteNonQuery();
        con.Close();
        TextBox2.Text = "";
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton im = (ImageButton)sender;
        string img = im.CommandArgument.ToString();
        Session["com"] = img;
       // Label5.Text = img;
        comm();
        ModalPopupExtender2.Show();
    }
    public void comm()
    {
        con.Open();
       // Label4.Text = Session["com"].ToString();
        string st = "select comment.comment,avatar.name,avatar.avatar2 from comment inner join avatar on comment.comment_frd=avatar.user_id where comment.post_id='"+Session["com"]+"'";
        SqlDataAdapter d = new SqlDataAdapter(st, con);
        DataTable d6 = new DataTable();
        d.Fill(d6);
        if (d6.Rows.Count > 0)
        {
            DataList4.DataSource = d6;
            DataList4.DataBind();
        }
        else
        {
          //  Label3.Text = "error";
        }
        con.Close();


 
    }
    protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
    {
        ImageButton im = (ImageButton)sender;
        string mn=im.CommandArgument.ToString();
        con.Open();
        string del = "delete from post where id='"+mn+"'";
        SqlCommand cmd = new SqlCommand(del, con);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("d.aspx");


    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}