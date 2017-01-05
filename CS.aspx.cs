using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;
 

public partial class CS : System.Web.UI.Page
{
    //string strConnString = 
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);  
    protected void Page_Load(object sender, EventArgs e)
    {
        
            BindGrid();
      //      ClearCache();
       
    }
    private void BindGrid()
    {
       
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Id, Name from tblFiles";
                cmd.Connection = con;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();
           
        }
    }
 
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
            using (BinaryReader br = new BinaryReader(FileUpload1.PostedFile.InputStream))
            {
                byte[] bytes = br.ReadBytes((int)FileUpload1.PostedFile.InputStream.Length);
               // string strConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                //using (SqlConnection con = new SqlConnection(strConnString))
                //{
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "insert into tblFiles(Name, ContentType, Data) values (@Name, @ContentType, @Data)";
                        cmd.Parameters.AddWithValue("@Name", Path.GetFileName(FileUpload1.PostedFile.FileName));
                        cmd.Parameters.AddWithValue("@ContentType", "audio/mpeg3");
                        cmd.Parameters.AddWithValue("@Data", bytes);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        BindGrid();
                    }
                //}
            }
        //}
       // Response.Redirect("CS.aspx");
    }

}