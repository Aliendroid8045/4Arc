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

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.IsPostBack == false)
        {
            if (Request.Params["Channel"] != null)
                Session["ChatChannel"] = Request.Params["Channel"].ToString();
            else
                Session["ChatChannel"] = "1";


        }
    }
    public string GetChatPage()
    {
        return ("TheChatScreenWin.aspx");
    }
    protected void BT_Send_Click(object sender, System.EventArgs e)
    {
        string sChannel = "";
        string sUser = "";

        if (Request.Params["Channel"] != null)
            sChannel = Request.Params["Channel"].ToString();
        else
            sChannel = "1";

        if (Request.Params["User"] != null)
            sUser = Request.Params["User"].ToString();
        else
        {
            Random pRan = new Random();
            int iNum = pRan.Next(9);
            sUser = "Annonymouse" + iNum;
        }


        if (TB_ToSend.Text.Length > 0)
        {
            SuperJockey.PageModule.Chat.AddMessage(sChannel,
                sUser,
                TB_ToSend.Text);

            TB_ToSend.Text = "";
        }
    }
}