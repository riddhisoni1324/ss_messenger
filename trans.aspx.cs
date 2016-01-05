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
using System.Net;
using System.Net.Mail;



public partial class trans : System.Web.UI.Page
{
    SqlCommand insert_cat; int id = 0;
    SqlDataAdapter dadapter;
    DataSet dset; string t_id; int c_id = 0;
    PagedDataSource adsource; int dtid = 0;
    string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    int pos; SqlCommand cmd; string email;
    ArrayList ae_mem = new ArrayList(); string file_name; ArrayList ae_atch = new ArrayList();
    List<string> file1 = new List<string>();
    string formatted = DateTime.Now.ToString("MMddyyyyHHmmssfff");
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

        string formatted = DateTime.Now.ToString("MMddyyyyHHmmssfff");
        Response.Write(formatted);
        if (!IsPostBack)
        {
            MultiView1.SetActiveView(View1);
            this.ViewState["vs"] = 0;
            l_mem.Text = "";

            string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con1 = new SqlConnection(cs1);
            con1.Open();

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "select * from MemberMaster";


            cmd.Connection = con1;
            SqlDataReader rdr;
            rdr = cmd.ExecuteReader();
            ListBox2.DataSource = rdr;
            ListBox2.DataTextField = "membername";
            ListBox2.DataValueField = "code";
            ListBox2.DataBind();
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
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Category Added Succesfully.');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('There is some problem try after sometime.');", true);
                }
            }
            t_doc_detail.Text = "";
            t_doc_title.Text = "";
            con1.Close();


            

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
        ListBox2.DataSource = rdr;
        ListBox2.DataTextField = "membername";
        ListBox2.DataValueField = "code";
        ListBox2.DataBind();
       // MultiView1.SetActiveView(View3);
    }
    protected void b_sel_mem_Click(object sender, EventArgs e)
    {
        l_mem.Text = "";
        foreach (ListItem li1 in ListBox2.Items)
        {
            //Response.Write("sadsad"+li1.Text);
            li1.Selected = true;
            ae_mem.Add(li1.Value);
             Response.Write(li1.Value + "<br>");
            //l_mem.Text += li1.Text + ":";
            // l_mem.Text = li1.Value;

        }

     
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
       
        MultiView1.SetActiveView(View2);
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        foreach (ListItem li1 in ListBox2.Items)
        {
            if (li1.Selected)
            {
                ae_mem.Add(li1.Value);
                Response.Write(li1.Value + "<br>");
            }

        }
        //---fetch dtid 
        var s13 = DropDownList2.SelectedItem.Value;
        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd; SqlDataReader rdr;
        cmd = new SqlCommand("select top 1 * from doctrans order by dtid desc", con);
        cmd.Parameters.Add("@docid", s13);
        rdr = cmd.ExecuteReader();

        if (rdr != null)
        {
            while (rdr.Read())
            {
                h_dtid.Value = rdr["dtid"].ToString();

            }
        }
        con.Close();
        rdr.Close();

        foreach (var i in ae_mem)
        {
            Response.Write("in foor loop");


            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con56 = new SqlConnection(cs);
            con56.Open();
            cmd = new SqlCommand("select * from membermaster where code=@code", con56);
            cmd.Parameters.Add("@code", i);
            cmd.Connection = con56;
            SqlDataReader rdr1;
            rdr1 = cmd.ExecuteReader();

            if (rdr1 != null)
            {
                while (rdr1.Read())
                {

                 
                    string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    SqlConnection con1 = new SqlConnection(cs1);
                    con1.Open();
                    insert_cat = new SqlCommand("INSERT INTO dochistory (dtid,memberid)VALUES(@dtid,@memberid)", con1);
                    insert_cat.Parameters.Add("@dtid", h_dtid.Value);
                    insert_cat.Parameters.Add("@memberid", i);
                    int i13 = 0;
                    if ((con1.State & ConnectionState.Open) > 0)
                    {
                        i13 = insert_cat.ExecuteNonQuery();


                    }
                }

            }
            con56.Close();


            string s1 = DropDownList2.SelectedItem.Text;
            var s = DropDownList2.SelectedItem.Value;
           
            //---file upload start
            if (FileUpload2.HasFile)     // CHECK IF ANY FILE HAS BEEN SELECTED.
            {
                
                HttpFileCollection hfc = Request.Files;
                if (hfc.Count <= 5)    // 5 FILES RESTRICTION.
                {
                    for (int i1 = 0; i1 < hfc.Count; i1++) ///--iterate start over each file upload
                    {

                        HttpPostedFile hpf = hfc[i1];
                        if (hpf.ContentLength > 0 && hpf.ContentLength < 2048000)
                        {

                            // SAVE THE FILE IN A FOLDER.
                            file_name = Path.GetFileName(hpf.FileName);
                            hpf.SaveAs(Server.MapPath("~/Attachment/" + s1 + "/") + Path.GetFileName(s1 + "_" + h_dtid.Value + "_" + formatted + "_" + hpf.FileName));
                            file1.Add("~/Attachment/" + s1 + "/" + Path.GetFileName(s1 + "_" + h_dtid.Value + "_"+formatted+"_"+ hpf.FileName));


                            //according dtid enter data in attach table
                            SqlConnection con12 = new SqlConnection(connstring);
                            con12.Open();
                            insert_cat = new SqlCommand("INSERT INTO docattach (dtid,docfilename,docfilepath,memberid) VALUES(@dtid,@docfilename,@docfilepath,@memberid)", con12);
                            insert_cat.Parameters.Add("@dtid", Convert.ToInt32(h_dtid.Value));
                            insert_cat.Parameters.Add("@docfilename", file_name);
                            insert_cat.Parameters.Add("@docfilepath", "no");
                            insert_cat.Parameters.Add("@memberid",i);

                            if ((con12.State & ConnectionState.Open) > 0)
                            {
                                int i2 = insert_cat.ExecuteNonQuery();
                                if (i2 != 0)
                                {
                                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('doc attch Succesfully.');", true);
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
            string cs14 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con45 = new SqlConnection(cs14);
            con45.Open();
            SqlCommand cmd45;
            cmd45 = new SqlCommand("select * from membermaster where code=@code", con45);
            cmd45.Parameters.Add("@code", i);
            cmd45.Connection = con45;
            SqlDataReader rdr45;
            rdr45 = cmd45.ExecuteReader();
            //send mail start
            if (rdr45 != null)
            {
                while (rdr45.Read())
                {

                    email = rdr45["emailid"].ToString();
                    Response.Write(email + "<br>");
                   
                    using (MailMessage mm = new MailMessage("adharvotingsystem@gmail.com", email))
                    {
                        mm.Subject = "Attch Mail";
                        mm.Body = "hello ";
                        foreach(string f in file1){
                            mm.Attachments.Add(new Attachment(Server.MapPath(f)));

                        }
                        mm.IsBodyHtml = false;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";
                        smtp.EnableSsl = true;
                        NetworkCredential NetworkCred = new NetworkCredential("adharvotingsystem@gmail.com", "citybuzz");
                        smtp.UseDefaultCredentials = true;
                        smtp.Credentials = NetworkCred;
                        smtp.Port = 587;
                        smtp.Send(mm);
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('mail sent.');", true);
                    }

                }
            }
            //send mail end
            con45.Close();

        }//--iteration of perticular member done

    }
}