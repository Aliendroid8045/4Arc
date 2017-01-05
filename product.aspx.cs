using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class product : System.Web.UI.Page
{
    static string constr = System.Configuration.ConfigurationManager.AppSettings["constring"];
    SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
    }
    public void empty()
    {
        
        contact.Text = "";
        descript.Text = "";
        title.Text = "";
        price.Text = "";
        email.Text = "";
        Label3.Text = "";

    }
    protected void add_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.ToString() == "category")
        {
           Label3.Text = "select category";
        }
        else if(FileUpload1.HasFile)
        {
            
           
                string filename = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("Image/" + filename));
                string path = "~/Image/" + FileUpload1.FileName;
                con.Open();
              
              
                string qry1 = "insert into product values('" + title.Text + "','"+path+"','" + descript.Text + "','" + price.Text + "','" + email.Text + "','" + contact.Text + "','"+DropDownList1.Text+"')";
                SqlCommand cmd1 = new SqlCommand(qry1, con);
                cmd1.ExecuteNonQuery();
                Label1.Text = "item added successfully";
                con.Close();

                empty();

 
        }
    }
}