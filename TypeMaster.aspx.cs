﻿
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
using System.IO;


public partial class TypeMaster : System.Web.UI.Page
{
    SqlDataAdapter dadapter; DataSet dset; PagedDataSource adsource;
    string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    int pos; SqlDataReader dr1; ArrayList arrName = new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {
        var menu = Page.Master.FindControl("NavigationMenu") as Menu;
        if (menu != null)
        { menu.Items.Remove(menu.FindItem("Login")); }

        if (Session["user"] != null)
        {
            Label lb = (Label)Page.Master.FindControl("l_master");
            lb.Text = "Welcome , " + Session["user"].ToString();
            Button lb1 = (Button)Page.Master.FindControl("b_master");
            lb1.Visible = true;
            lb1.Text = "Logout";

        }
        else
        {
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            MultiView1.SetActiveView(View1);

            this.ViewState["vs"] = 0;
        }
        pos = (int)this.ViewState["vs"];
        databind();
        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select upper(typedesc) as typedesc from TypeMaster";
        cmd.Connection = con;
        try
        {
            dr1 = cmd.ExecuteReader();
            if (dr1 != null)
                while (dr1.Read())
                {
                    //fill arraylist
                    arrName.Add(dr1["TypeDesc"]);
                    //Response.Write(dr1["TypeDesc"]);

                }
        }
        finally
        {
            con.Close();
        }


    }
    public void databind()
    {
        dadapter = new SqlDataAdapter("select * from TypeMaster", connstring);
        dset = new DataSet();
        adsource = new PagedDataSource();
        dadapter.Fill(dset);
        adsource.DataSource = dset.Tables[0].DefaultView;
        adsource.PageSize = 25;
        adsource.AllowPaging = true;
        adsource.CurrentPageIndex = pos;
        btnfirst.Enabled = !adsource.IsFirstPage;
        btnprevious.Enabled = !adsource.IsFirstPage;
        btnlast.Enabled = !adsource.IsLastPage;
        btnnext.Enabled = !adsource.IsLastPage;
        DataList2.DataSource = adsource;
        DataList2.DataBind();
    }

    protected void btnfirst_Click(object sender, EventArgs e)
    {
        pos = 0;
        databind();
    }

    protected void btnprevious_Click(object sender, EventArgs e)
    {
        pos = (int)this.ViewState["vs"];
        pos -= 1;
        this.ViewState["vs"] = pos;
        databind();
    }

    protected void btnnext_Click(object sender, EventArgs e)
    {
        pos = (int)this.ViewState["vs"];
        pos += 1;
        this.ViewState["vs"] = pos;
        databind();
    }

    protected void btnlast_Click(object sender, EventArgs e)
    {
        pos = adsource.PageCount - 1;
        databind();
    }

    protected void Edit_Command(object source, DataListCommandEventArgs e)
    {
        MultiView1.SetActiveView(View2);
        l_type_id.Visible = true;
        t_type_id.Visible = true;
        int ID = Convert.ToInt32(e.CommandArgument);
        t_type_id.Text = ID.ToString();
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM TypeMaster where TypeId=@TypeId";
        cmd.Parameters.Add("@TypeId", ID);


        cmd.Connection = con1;
        SqlDataReader rdr;
        rdr = cmd.ExecuteReader();
        int j = 0;
        if (rdr != null)
        {
            while (rdr.Read())
            {
                j++;
                t_type_id.Text = rdr.GetDecimal(0).ToString();
                t_type_desc.Text = rdr.GetString(1);
            }

        }
        t_type_id.Enabled = false;
        databind();
    }



    protected void btnSave_Click(object sender, EventArgs e)
    {
        //--if it is in "insert" mode
        if (t_type_id.Text == "fl")
        {
            SqlCommand insert_type;
            string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con1 = new SqlConnection(cs1);
            con1.Open();
            string n = t_type_desc.Text.ToUpper().Trim();
            //Response.Write("entered value s " + n);
            if (arrName.Contains(n))
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Type is already added.');", true);
                MultiView1.SetActiveView(View1);
            }
            else
            {
                insert_type = new SqlCommand("INSERT INTO TypeMaster (TypeDesc) VALUES(@TypeDesc)", con1);
                insert_type.Parameters.Add("@TypeDesc", t_type_desc.Text);
                if ((con1.State & ConnectionState.Open) > 0)
                {
                    //Response.Write("Connection OK!");
                    int i = insert_type.ExecuteNonQuery();
                    if (i != 0)
                    {
                       // Response.Write(i);
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Type Added Succesfully.');", true);
                        string log = System.Configuration.ConfigurationManager.AppSettings["FilePath"].ToString();
                        using (StreamWriter outputFile = new StreamWriter(log, true))
                        {

                            outputFile.WriteLine(System.DateTime.Now.ToString() + "Type Added ");

                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('There is some problem try after sometime.');", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('There is some problem try after sometime.');", true);
                }
                con1.Close();
                databind();
                MultiView1.SetActiveView(View1);
            }
        }
        //--if it is in "update" mode
        else
        {
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();

            SqlCommand cmd = new SqlCommand("update TypeMaster set TypeDesc=@TypeDesc where TypeId=@TypeId", con);
            cmd.Parameters.Add("@TypeId", t_type_id.Text);
            cmd.Parameters.Add("@Typedesc", t_type_desc.Text);
            if ((con.State & ConnectionState.Open) > 0)
            {
                //Response.Write("Connection OK!");
                int i = cmd.ExecuteNonQuery();
                if (i != 0)
                {
                    //Response.Write(i);
                    //Response.Write("row updated");
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Type Updated Succesfully.');", true);
                    string log = System.Configuration.ConfigurationManager.AppSettings["FilePath"].ToString();
                    using (StreamWriter outputFile = new StreamWriter(log, true))
                    {

                        outputFile.WriteLine(System.DateTime.Now.ToString() + "Type Updated ");

                    }
                    con.Close();
                }
                else
                {
                    //Response.Write("row not updated");
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('There is some problem try after sometime.');", true);
                }

            }
            databind();
            MultiView1.SetActiveView(View1);
        }
    }


    protected void b_add_type_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View2);
        t_type_id.Text = "fl";
        t_type_id.Visible = false;
        l_type_id.Visible = false;
        t_type_desc.Text = " ";


    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);
    }
}
