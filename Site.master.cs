using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

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
        string log = System.Configuration.ConfigurationManager.AppSettings["FilePath"].ToString();
        using (StreamWriter outputFile = new StreamWriter(log, true))
        {

            outputFile.WriteLine(System.DateTime.Now.ToString() + "User:"+" "+ Session["user"] +" Logged Out ");

        }
        Response.Redirect("Login.aspx");
    }
}
