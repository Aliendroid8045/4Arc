using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    static string constr = System.Configuration.ConfigurationManager.AppSettings["constring"];
    SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //string _Path=string.Empty;
        if (FileUpload1.HasFile)
        {
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Server.MapPath("Image/" + filename));
            //        getimage();

            string path = "~/Image/" + FileUpload1.FileName;

            //propic.ImageUrl = path;


            con.Open();
            string ins = "insert into pro values('" + Session["user"].ToString() + "','" + path + "')";
            SqlCommand cmd = new SqlCommand(ins, con);
            int i = cmd.ExecuteNonQuery();
            if (i == 1)
            {
                FileUpload1.Visible = false;
                Button1.Visible = false;
                Response.Redirect("Default.aspx");
            }




            //if (dataRader.HasRows)
            //{
            //    while (dataRader.Read())
            //    {
            //        propic.ImageUrl = "~/Image/" +dataRader["propic"];
            //    }
            //}
            con.Close();

        }        
   }
    //        public void getimage()
    //        {
    //            DirectoryInfo dir = new DirectoryInfo(MapPath("Image"));

    //            FileInfo[] files = dir.GetFiles();
    //            propic.DataBind();
        
    //}
}