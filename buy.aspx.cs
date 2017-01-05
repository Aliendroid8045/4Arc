using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

using System.Net.Mail;
using System.Net;


public partial class Default2 : System.Web.UI.Page
{
    static string constr = System.Configuration.ConfigurationManager.AppSettings["constring"];
    SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("home.aspx");
        }
       

    }
    protected void Button4_Click(object sender, EventArgs e)
    {

        Button btn = (Button)sender;
        string id = btn.CommandArgument.ToString();
        con.Open();
        string query = "select * from product where id='"+id+"'";
        SqlCommand command = new SqlCommand(query, con);
        SqlDataReader reader = command.ExecuteReader();
        if (reader.HasRows)

        {
            while (reader.Read())
            {
                
                ViewState["email"]=reader["email"].ToString();
                ViewState["title"] = reader["title"].ToString();
                ViewState["catagory"] = reader["catagory"].ToString();


            }
        }
        reader.Close();
        con.Close();
        
        string email = ViewState["email"].ToString();
        
        MailMessage mail = new MailMessage();
        mail.To.Add(email);

            mail.From = new MailAddress("4arc.developer@gmail.com");


            mail.Subject = "regarding your product";

            mail.Body = "Hi...";

            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);

            NetworkCredential creden = new NetworkCredential("4arc.developer@gmail.com", "dddvdeveloper");

            smtp.Credentials = creden;
            smtp.EnableSsl = true;

            try
            {

                smtp.Send(mail);
                Label2.Text = "sucessfully email";
                con.Open();
                string qry = "insert into admin values('" + Session["user"] + "','" + ViewState["email"] + "', '"+ViewState["title"]+"', '"+ViewState["catagory"]+"')";
                SqlCommand command1 = new SqlCommand(qry, con);
                command1.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                Label2.Text = "Error in sending mail";
            }

           
       
    }



   
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        con.Open();
        string q="select id,title,descript,price,image from product where catagory='"+DropDownList1.SelectedItem.Text+"'";
        SqlCommand cmd = new SqlCommand(q,con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            GridView2.DataSource = dr;
            GridView2.DataBind();
        }
        dr.Close();
        con.Close();
        




    }
}