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

public partial class trans : System.Web.UI.Page
{
    SqlCommand insert_cat; int id = 0;
    SqlDataAdapter dadapter;
    DataSet dset; string t_id; int c_id = 0;
    PagedDataSource adsource; int dtid = 0;
    string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    int pos;
    ArrayList ae_mem = new ArrayList(); string file_name; ArrayList ae_atch = new ArrayList();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            MultiView1.SetActiveView(View1);
            this.ViewState["vs"] = 0;
            l_mem.Text = "";
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
            insert_cat.Parameters.Add("@docid", s);

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


            //---file upload start
            if (FileUpload1.HasFile)     // CHECK IF ANY FILE HAS BEEN SELECTED.
            {


                HttpFileCollection hfc = Request.Files;
                //Response.Write(hfc);
                //Response.Write(hfc.Count);

                if (hfc.Count <= 5)    // 5 FILES RESTRICTION.
                {
                    for (int i = 0; i < hfc.Count; i++) ///--iterate start over each file upload
                    {

                        HttpPostedFile hpf = hfc[i];
                        //Response.Write("file count " + i + hpf);
                        //--start checking file size
                        if (hpf.ContentLength > 0 && hpf.ContentLength < 2048000) 
                        {
                            // SAVE THE FILE IN A FOLDER.
                            file_name = Path.GetFileName(hpf.FileName);
                            hpf.SaveAs(Server.MapPath("~/Attachment/") + Path.GetFileName(hpf.FileName));
                            //---fetch dtid 
                            SqlConnection con = new SqlConnection(connstring);
                            con.Open();
                            SqlCommand cmd; SqlDataReader rdr;
                            //Response.Write("sel val is " + s + ":" + DropDownList2.SelectedItem.Text);
                            cmd = new SqlCommand("select top 1 * from doctrans order by dtid desc", con);
                            cmd.Parameters.Add("@docid", s);
                            rdr = cmd.ExecuteReader();

                            if (rdr != null){
                                while (rdr.Read()){
                                    Response.Write(rdr["dtid"].ToString() + "<br>");
                                    h_dtid.Value = rdr["dtid"].ToString();

                                }
                            }
                            con.Close();

                            //according dtid enter data in attach table
                            SqlConnection con12 = new SqlConnection(connstring);
                            con12.Open();
                            insert_cat = new SqlCommand("INSERT INTO docattach (dtid,docfilename,docfilepath) VALUES(@dtid,@docfilename,@docfilepath)", con12);
                            insert_cat.Parameters.Add("@dtid", Convert.ToInt32(h_dtid.Value));
                            insert_cat.Parameters.Add("@docfilename", file_name);
                            insert_cat.Parameters.Add("@docfilepath", "no");

                            if ((con12.State & ConnectionState.Open) > 0)
                            {
                                int i2 = insert_cat.ExecuteNonQuery();
                                if (i2 != 0){
                                    //Response.Write(i);
                                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Category Added Succesfully.');", true);
                                }
                                else{
                                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('There is some problem try after sometime.');", true);
                                }
                            }
                            con12.Close();


                        }//--end of  checking file size

                        else
                        {

                            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please select file size valid.');", true);
                        }
                    }//--iterate end over each file upload

                }//--end of file restriction
                else
                {
                    Response.Write("10 file is allowed");
                }
            }//---file upload end
            else
            {
                Response.Write("file is not selected");
            }


        }


        MultiView1.SetActiveView(View1);
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

        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();

        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "select * from MemberMaster";


        cmd.Connection = con1;
        SqlDataReader rdr;
        rdr = cmd.ExecuteReader();
        ListBox1.DataSource = rdr;
        ListBox1.DataTextField = "membername";
        ListBox1.DataValueField = "code";
        ListBox1.DataBind();
        MultiView1.SetActiveView(View3);
    }
    protected void b_sel_mem_Click(object sender, EventArgs e)
    {
        l_mem.Text = "";
        foreach (ListItem li1 in ListBox1.Items)
        {
            //Response.Write("sadsad"+li1.Text);
            li1.Selected = true;
            ae_mem.Add(li1.Value);
            //  Response.Write(li1.Value + "<br>");
            l_mem.Text += li1.Text + ":";

        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        l_mem.Text = "";
        foreach (ListItem li1 in ListBox1.Items)
        {
            //Response.Write("sadsad"+li1.Text);
            if (li1.Selected)
            {
                ae_mem.Add(li1.Value);
                // Response.Write(li1.Value + "<br>");
                l_mem.Text += li1.Text + ":";
            }

        }
        MultiView1.SetActiveView(View2);
    }
    
}