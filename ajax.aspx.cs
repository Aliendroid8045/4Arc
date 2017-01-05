using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ajax : System.Web.UI.Page
{
    static string constr = System.Configuration.ConfigurationManager.AppSettings["constring"];
    SqlConnection con = new SqlConnection(constr);
    protected void Page_Load(object sender, EventArgs e)
    {
        string name = Request.QueryString["name"];
        //Response.Write(name);


        //query

        con.Open();
        string get = "select * from avatar where name LIKE '%"+name+"%' ";
        SqlCommand cmd = new SqlCommand(get,con);

        SqlDataReader dr = cmd.ExecuteReader();
       

        

        

        //result generate
        string html = "";

        html = "<table>";
        while (dr.Read())
        {

            string abc = dr["avatar2"].ToString();

            abc = abc.Substring(2);

            html = html + "<tr>";
            html = html + "<td><img src='"+ abc +"' width='40px' height='40px' /></td>";

            html = html + "<td><a href='cmd.aspx?id=" + dr["user_id"] + "'>" + dr["name"] + "</td>";
            html = html + "<td><a href='cmd.aspx?id=" + dr["user_id"] + "'>View Profile</td>";
            html = html + "<td></td>";

            html = html + "</tr>";

           
        }
        Response.Write(html);
        html = "</table>";
        
        // print html -->
        con.Close();

    }
}