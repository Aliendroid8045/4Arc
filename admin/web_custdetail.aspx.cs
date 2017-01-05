using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_web_custdetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            fill_grid();
    }

    public void fill_grid()
    {
        Cls_Customer cls = new Cls_Customer();
        DataTable dt = new DataTable();
        dt = cls.get_all_customer_data();
        if (dt != null)
        {
            if (dt.Rows.Count > 0)
            {
                DG.DataSource = dt;
                DG.DataBind();
            }
            else
            {
                DG.DataSource = null;
                DG.DataBind();
            }
        }
    }

    protected void DG_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "first" || e.CommandName == "previous" || e.CommandName == "next" || e.CommandName == "last")
        {
            fill_grid();
        }

    }
    public void setpages()
    {
        ((Label)DG.FooterRow.FindControl("lbl_pg_ind")).Text = (DG.PageIndex + 1).ToString();
        ((Label)DG.FooterRow.FindControl("lbl_pg_count")).Text = DG.PageCount.ToString();
    }
    protected void img_btn_first_Click(object sender, ImageClickEventArgs e)
    {
        DG.PageIndex = 0;
    }

    protected void img_btn_previous_Click(object sender, ImageClickEventArgs e)
    {
        DG.PageIndex = DG.PageIndex - 1;
    }

    protected void img_btn_next_Click(object sender, ImageClickEventArgs e)
    {
        DG.PageIndex = DG.PageIndex + 1;
    }

    protected void img_btn_last_Click(object sender, ImageClickEventArgs e)
    {
        DG.PageIndex = DG.PageCount - 1;
    }

}