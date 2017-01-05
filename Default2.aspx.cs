using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BT_Enter_Click(object sender, System.EventArgs e)
    {
        Response.Redirect("Default3.aspx?Channel=" + TB_Channel.Text + "&User=" + TB_Username.Text);
    }
}