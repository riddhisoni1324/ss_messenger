﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class trans : System.Web.UI.Page
{
    SqlCommand insert_cat; int id = 0;
    SqlDataAdapter dadapter;
    DataSet dset; string t_id; int c_id = 0;
    PagedDataSource adsource;
    string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    int pos;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            MultiView1.SetActiveView(View1);
            this.ViewState["vs"] = 0;
        }
        pos = (int)this.ViewState["vs"];
        databind();

    }



    public void databind()
    {
        dadapter = new SqlDataAdapter("select * from doctrans inner join docMaster on doctrans.docId=docMaster.docId", connstring);
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

    



    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (h_id.Text == "fl")
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('insert.');", true);
            DropDownList2.Enabled = true;
            var s = DropDownList2.SelectedItem.Value;
            string s1 = DropDownList2.SelectedItem.Text;
            //Response.Write(t_cat_desc.Text+s1);
            string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con1 = new SqlConnection(cs1);
            con1.Open();
            insert_cat = new SqlCommand("INSERT INTO doctrans (docid,title,docdetail) VALUES(@docid,@title,@docdetail)", con1);
            insert_cat.Parameters.Add("@title", t_doc_title.Text);
            insert_cat.Parameters.Add("@docdetail", t_doc_detail.Text);
            insert_cat.Parameters.Add("@docid",s);

            if ((con1.State & ConnectionState.Open) > 0)
            {
                int i = insert_cat.ExecuteNonQuery();
                if (i != 0)
                {
                    //Response.Write(i);
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Category Added Succesfully.');", true);
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

            t_doc_detail.Text = "";
            t_doc_title.Text = "";
            con1.Close();
            MultiView1.SetActiveView(View1);
            databind();

        }

        databind();

       
    }




    protected void b_add_category_click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View2);
        h_id.Text = "fl";
        t_doc_detail.Text = "";
        t_doc_title.Text = "";
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);
    }
    protected void Button3_Click1(object sender, EventArgs e)
    {

    }
    protected void b_sel_mem_Click(object sender, EventArgs e)
    {

    }
    protected void Button4_Click(object sender, EventArgs e)
    {

    }
}