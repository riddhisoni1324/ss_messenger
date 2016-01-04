﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

public partial class Home : System.Web.UI.Page
{
    SqlDataAdapter dadapter; DataSet dset; PagedDataSource adsource;
    string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    int pos; SqlDataReader dr1; ArrayList arrName = new ArrayList();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            this.ViewState["vs"] = 0;
        }
        pos = (int)this.ViewState["vs"];
        databind();
    }

    public void databind()
    {
        dadapter = new SqlDataAdapter("select * from DocAttach order by UpdatedOn desc", connstring);
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
        //string filePath = (sender as LinkButton).CommandArgument;
        ///file_name = Path.GetFileName(hpf.FileName);
        //hpf.SaveAs(Server.MapPath("~/Attachment/" + s1 + "/") + Path.GetFileName(s1 + "_" + h_dtid.Value + "_" + formatted + "_" + hpf.FileName));
        string filepath = e.CommandArgument.ToString();
        Response.Write(filepath);
        string fp = Server.MapPath("~/"+filepath);
                           
        string filePath = fp;
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        Response.WriteFile(filePath);
        Response.End();
    }
}