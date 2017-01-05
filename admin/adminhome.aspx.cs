using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;
public partial class admin_adminhome : System.Web.UI.Page
{
    static string constr = System.Configuration.ConfigurationManager.AppSettings["constring"];
    SqlConnection con = new SqlConnection(constr);

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string id = btn.CommandArgument.ToString();
        MailMessage mail = new MailMessage();
        mail.To.Add(id);

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
            Label1.Text = "sucessfully email";
        }
        catch (Exception ex)
        {
            Label1.Text = "Error in sending mail";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string id1 = btn.CommandArgument.ToString();
        con.Open();
        string qry="delete from product where email='"+id1+"'";
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.ExecuteNonQuery();
        string qry1="delete from admin where buyer_id='"+id1+"'";
        SqlCommand cmd1 = new SqlCommand(qry1, con);
        cmd1.ExecuteNonQuery();
        con.Close();
    }
}