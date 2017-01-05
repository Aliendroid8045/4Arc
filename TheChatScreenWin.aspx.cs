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
using System.ComponentModel;
using System.Drawing;
using System.Web.SessionState;



public partial class Reguser_TheChatScreenWin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sDealer = "";
        if (Session["ChatChannel"] != null)
            sDealer = Session["ChatChannel"].ToString();

        Response.Write("<meta http-equiv=\"Refresh\"content=\"4\">");
        Response.Write(SuperJockey.PageModule.Chat.GetAllMessages(sDealer));
    }
}