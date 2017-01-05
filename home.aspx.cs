using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Net;
using System.Net.Mail;

public partial class _Default : System.Web.UI.Page
{
    static string constr = System.Configuration.ConfigurationManager.AppSettings["constring"];
    SqlConnection con = new SqlConnection(constr);

    protected void Page_Load(object sender, EventArgs e)
    {
        
        //Label10.Text = "";
        Label9.Text = "";
                //if (DropDownList1.SelectedItem.Text == "write your own question?")
        //{
        //    TextBox5.Visible = true;
        //} 
        Panel1.Visible = false;

    }
    public void ownque()
    {
        Label10.Visible = false;
        fname.Text = "";
        lname.Text = "";
        email.Text = "";
        iam.SelectedItem.Text = "I am";
        cal.Text = "";
        
    }
    private string Encryptdata(string password)
    {
        string strmsg = string.Empty;
        byte[] encode = new byte[password.Length];
        encode = System.Text.Encoding.UTF8.GetBytes(password);
        strmsg = Convert.ToBase64String(encode);
        return strmsg;
    }

    protected void Submit_Click1(object sender, EventArgs e)
    {
        
        try
        {
            if (iam.SelectedItem.Text == "I am")
            {
                Label9.Text = "select Gender";
            }



            else
            {
                con.Open();
                string fn = fname.Text;
                string ln = lname.Text;
                string em = email.Text;
                string pa = pass.Text;
                string gender = iam.SelectedItem.Text;
                string strpassword = Encryptdata(pass.Text);

                string lang = cal.Text;
                               
                //string ins = "insert into sign values('" + em + "','" + fn + "','" + ln + "','" + gender + "','" + lang + "','" + pa + "')";
                string insert = "insert into basic (user_id,fn,ln,birthdate,gender,password) values('" + em + "','" + fn + "','" + ln + "','" + lang + "','" + gender + "','" + strpassword + "')";
                string insert1 = "insert into avatar (user_id,name,avatar1,avatar2) values('" + em + "','"+fn+"','~/Image/Desert.jpg','~/Image/male.png')";
                //string post = "insert into post(user_id,name) values('" + em + "','" + fn + "')";
                SqlCommand cmd2 = new SqlCommand(insert1, con);
                //SqlCommand cmd = new SqlCommand(ins, con);
                SqlCommand cmd1 = new SqlCommand(insert, con);
                //SqlCommand cmd3 = new SqlCommand(post, con);
                //cmd3.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                //cmd.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                ////Response.Write("<script> alert('sucess')</script>");
                Response.Write("<script type=\"text/javascript\" language=\"javascript\">");

                Response.Write("alert('sucess');");

                Response.Write("</script>");
                Session["user"] = em;
                Session["name"] = fn;
                Response.Redirect("editprofile.aspx");
                ownque();
            }
        }
        catch (Exception ex)
        {
            Label10.Visible = true;
            Label10.Text = " email address already exist...";
        }
        finally
        {
            con.Close();

        }  
    }

    private string Decryptdata(string encryptpwd)
    {
        string decryptpwd = string.Empty;
        System.Text.UTF8Encoding encodepwd = new System.Text.UTF8Encoding();
        System.Text.Decoder Decode = encodepwd.GetDecoder();
        byte[] todecode_byte = Convert.FromBase64String(encryptpwd);
        int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
        char[] decoded_char = new char[charCount];
        Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
        decryptpwd = new String(decoded_char);
        return decryptpwd;
    } 

    protected void login_Click(object sender, EventArgs e)
    {
                con.Open();
        string name = "select fn from basic where user_id='" + uname.Text + "'";
        SqlCommand cmd1 = new SqlCommand(name, con);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.HasRows)
        {
            while (dr1.Read())
            {
                Session["name"] = dr1["fn"].ToString();
            }
        }
        dr1.Close();


        string getpwd = "select password from basic where user_id='" + uname.Text + "'";
        SqlCommand cmd = new SqlCommand(getpwd, con);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                string dcy = reader["password"].ToString();
                string dec = Decryptdata(dcy);
                // Label11.Text = dec;
               // pas.Text = dec;
                if (dec == pas.Text)
                {
                    Session["user"] = uname.Text;
                    Response.Redirect("d.aspx");
                }
                else
                {

                    Label2.Text = "Try Again";
                }

            } reader.Close();
        }

        //SqlDataReader dr = cmd.ExecuteReader();
        //if (dr.HasRows)
        //{


        //    Session["user"] = uname.Text;
        //    Response.Redirect("d.aspx");

        //}
        //else
        //{

        //    Response.Write("try again");
        //}
        //dr.Close();

        con.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        con.Open();
        string str = "select * from basic where user_id='" + TextBox1.Text + "' ";
        SqlCommand cmd = new SqlCommand(str, con);
        SqlDataReader dr = cmd.ExecuteReader();
        

        if (dr.HasRows)
        {
            while (dr.Read())
            {
                string name = dr["fn"].ToString();
                string pwd = dr["password"].ToString();
                string pp = Decryptdata(pwd);

                MailMessage mail = new MailMessage();
                mail.To.Add(TextBox1.Text);

                mail.From = new MailAddress("4arc.developer@gmail.com");


                mail.Subject = "regarding your password recovery";

                mail.Body = "Hi..." + name + "<br/>" + "your password is " + "<b>" + pp + "</b>";

                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                
                NetworkCredential creden = new NetworkCredential("4arc.developer@gmail.com", "dddvdeveloper");

                smtp.Credentials = creden;
                smtp.EnableSsl = true;
                try
                {

                    smtp.Send(mail);
                    Label3.Text = "sucessfully email";
                }
                catch (Exception ex)
                {
                    Label3.Text = "Error in sending mail";
                }

            }
        }
        else
        {
            TextBox1.Text = "Enter valid Email-id";
        }

    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }
}