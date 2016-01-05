using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           //b_master.Visible = false;
           
        }
    }
    public Label master_label
    {
        get { return l_master; }
        set { l_master = value; }
    }
    protected void b_master_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}
