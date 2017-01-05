
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
using System.Web.UI.HtmlControls;

namespace SuperJockey
{
    /// <summary>
    /// Summary description for ChatWin.
    /// </summary>

    public partial class Reguser_Chat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null || Session["RoleId"] == null)
                Response.Redirect("login.aspx");
            if (Page.IsPostBack == false)
            {
                if (Request.Params["Channel"] != null)
                    Session["ChatChannel"] = Request.Params["Channel"].ToString();
                else
                    Session["ChatChannel"] = "1";


            }
        }

        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {

        }
        #endregion

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
                PageModule.Chat.AddMessage(sChannel,
                    sUser,
                    TB_ToSend.Text);

                TB_ToSend.Text = "";
            }
        }
    }
}

