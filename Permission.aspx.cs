﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;


public partial class Permission : System.Web.UI.Page
{
    int type_add, type_edit, type_delete, type_view;
    int cat_add, cat_edit, cat_delete, cat_view;
    int mem_add, mem_edit, mem_delete, mem_view;
    int user_add, user_edit, user_delete, user_view;
    int doc_add, doc_edit, doc_delete, doc_view;
    int doctrans_add, doctrans_edit, doctrans_delete, doctrans_view;

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

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (c_type_add.Checked)
        {
            type_add = 1;
        }

        if (c_type_edit.Checked)
        {
            type_edit = 1;
        }
        if (c_type_delete.Checked)
        {
            type_delete = 1;
        }
        if (c_type_view.Checked)
        {
            type_view = 1;
        }


        if (c_cat_add.Checked)
        {
            cat_add = 1;
        }

        if (c_cat_edit.Checked)
        {
            cat_edit = 1;
        }
        if (c_type_delete.Checked)
        {
            cat_delete = 1;
        }
        if (c_type_view.Checked)
        {
            cat_view = 1;
        }


        if (c_mem_add.Checked)
        {
            mem_add = 1;
        }

        if (c_mem_edit.Checked)
        {
            mem_edit = 1;
        }
        if (c_mem_delete.Checked)
        {
            mem_delete = 1;
        }
        if (c_mem_view.Checked)
        {
            mem_view = 1;
        }

        if (c_user_add.Checked)
        {
            user_add = 1;
        }

        if (c_user_edit.Checked)
        {
            user_edit = 1;
        }
        if (c_user_delete.Checked)
        {
            user_delete = 1;
        }
        if (c_user_view.Checked)
        {
            user_view = 1;
        }

        if (c_doc_add.Checked)
        {
            doc_add = 1;
        }

        if (c_doc_edit.Checked)
        {
            doc_edit = 1;
        }
        if (c_doc_delete.Checked)
        {
            doc_delete = 1;
        }
        if (c_doc_view.Checked)
        {
            doc_view = 1;
        }



        if (c_doctrans_add.Checked)
        {
            doctrans_add = 1;
        }

        if (c_doctrans_edit.Checked)
        {
            doctrans_edit = 1;
        }
        if (c_doctrans_delete.Checked)
        {
            doctrans_delete = 1;
        }
        if (c_doctrans_view.Checked)
        {
            doctrans_view = 1;
        }
        string user_type = DropDownList1.SelectedValue;
        insert(user_type, "TypeMaster",type_add,type_delete,type_edit,type_view);
        insert(user_type, "Category",cat_add,cat_delete,cat_edit,cat_view);
        insert(user_type, "UserMaster", user_add, user_delete, user_edit, user_view);
        insert(user_type, "Document",doc_add,doc_delete,doc_edit,doc_view);
        insert(user_type, "DocumnetTrans",doctrans_add,doctrans_delete,doctrans_edit,doctrans_view);
        insert(user_type, "Member",mem_add,mem_delete,mem_edit,mem_view);
    }

    private void insert(string id, string formname,int a,int d,int e,int v)
    {
        //Response.Write(t_add);
        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        con.Open();


        SqlCommand cmd = new SqlCommand("update Permission set f_add=@f_add,f_edit=@f_edit,f_delete=@f_delete,f_view=@f_view where UserId=@UserId and formname=@formname", con);
        cmd.Parameters.Add("@UserId", id);
        cmd.Parameters.Add("@f_add", a);
        cmd.Parameters.Add("@f_edit", e);
        cmd.Parameters.Add("@f_delete", d);
        cmd.Parameters.Add("@f_view", v);
        cmd.Parameters.Add("@formname", formname);

        if ((con.State & ConnectionState.Open) > 0)
        {
            //Response.Write("Connection OK!");
            int i = cmd.ExecuteNonQuery();
            if (i != 0)
            {
                //Response.Write(i);
                //Response.Write("row updated");
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert(' Updated Succesfully.');", true);
                con.Close();
            }
            else
            {
                //Response.Write("row not updated");
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('There is some problem try after sometime.');", true);
            }

        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        c_type_add.Checked = false;
        c_type_edit.Checked = false;
        c_type_view.Checked = false;
        c_type_delete.Checked = false;

        c_cat_add.Checked = false;
        c_cat_edit.Checked = false;
        c_cat_view.Checked = false;
        c_cat_delete.Checked = false;


        c_mem_add.Checked = false;
        c_mem_edit.Checked = false;
        c_mem_view.Checked = false;
        c_mem_delete.Checked = false;

        c_doc_add.Checked = false;
        c_doc_edit.Checked = false;
        c_doc_view.Checked = false;
        c_doc_delete.Checked = false;

        c_doctrans_add.Checked = false;
        c_doctrans_edit.Checked = false;
        c_doctrans_view.Checked = false;
        c_doctrans_delete.Checked = false;

        c_user_add.Checked = false;
        c_user_edit.Checked = false;
        c_user_view.Checked = false;
        c_user_delete.Checked = false;


        string user_type=DropDownList1.SelectedValue;
        select(user_type,"TypeMaster");
        select(user_type, "Category");
        select(user_type, "Member");
        select(user_type, "Document");
        select(user_type, "DocumnetTrans");
        select(user_type, "UserMaster");

        Response.Write("user type"+user_type+" ");
        
    }
    protected void select(string id,string formname) {
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Permission where UserId=@UserId and FormName=@FormName";
        cmd.Parameters.Add("@UserId", id);
        cmd.Parameters.Add("@FormName", formname);

        cmd.Connection = con1;
        SqlDataReader rdr;
        rdr = cmd.ExecuteReader();
        int j = 0;
        if (rdr != null)
        {
            while (rdr.Read())
            {
                j++;
                //  Response.Write(rdr["f_add"]);
                if (formname == "TypeMaster")
                {
                    if (Convert.ToInt32(rdr["f_add"]) == 1)
                    {
                        c_type_add.Checked = true;
                        //    Response.Write(rdr["f_add"]);
                    }
                    if (Convert.ToInt32(rdr["f_edit"]) == 1)
                    {
                        c_type_edit.Checked = true;
                        //    Response.Write(rdr["f_add"]);
                    } if (Convert.ToInt32(rdr["f_view"]) == 1)
                    {
                        c_type_view.Checked = true;
                        //    Response.Write(rdr["f_add"]);
                    } if (Convert.ToInt32(rdr["f_delete"]) == 1)
                    {
                        c_type_delete.Checked = true;
                        //    Response.Write(rdr["f_add"]);
                    }
                }
                if (formname == "Category")
                {
                    if (Convert.ToInt32(rdr["f_add"]) == 1)
                    {
                        c_cat_add.Checked = true;
                        //    Response.Write(rdr["f_add"]);
                    }
                    if (Convert.ToInt32(rdr["f_edit"]) == 1)
                    {
                        c_cat_edit.Checked = true;
                        //    Response.Write(rdr["f_add"]);
                    }
                    if (Convert.ToInt32(rdr["f_view"]) == 1)
                    {
                        c_cat_view.Checked = true;
                        //    Response.Write(rdr["f_add"]);
                    }
                    if (Convert.ToInt32(rdr["f_delete"]) == 1)
                    {
                        c_cat_delete.Checked = true;
                        //    Response.Write(rdr["f_add"]);
                    }
                }
                if (formname == "Member")
                {
                    if (Convert.ToInt32(rdr["f_add"]) == 1)
                    {
                        c_mem_add.Checked = true;
                        //    Response.Write(rdr["f_add"]);
                    }
                    if (Convert.ToInt32(rdr["f_edit"]) == 1)
                    {
                        c_mem_edit.Checked = true;
                        //    Response.Write(rdr["f_add"]);
                    }
                    if (Convert.ToInt32(rdr["f_view"]) == 1)
                    {
                        c_mem_view.Checked = true;
                        //    Response.Write(rdr["f_add"]);
                    }
                    if (Convert.ToInt32(rdr["f_delete"]) == 1)
                    {
                        c_mem_delete.Checked = true;
                        //    Response.Write(rdr["f_add"]);
                    }
                }
                if (formname == "Document")
                {
                    if (Convert.ToInt32(rdr["f_add"]) == 1)
                    {
                        c_doc_add.Checked = true;
                        //    Response.Write(rdr["f_add"]);
                    }
                    if (Convert.ToInt32(rdr["f_edit"]) == 1)
                    {
                        c_doc_edit.Checked = true;
                        //    Response.Write(rdr["f_add"]);
                    }
                    if (Convert.ToInt32(rdr["f_view"]) == 1)
                    {
                        c_doc_view.Checked = true;
                        //    Response.Write(rdr["f_add"]);
                    }
                    if (Convert.ToInt32(rdr["f_delete"]) == 1)
                    {
                        c_doc_delete.Checked = true;
                        //    Response.Write(rdr["f_add"]);
                    }
                }

                if (formname == "DocumnetTrans")
                {
                    if (Convert.ToInt32(rdr["f_add"]) == 1)
                    {
                        c_doctrans_add.Checked = true;
                       
                    }
                    if (Convert.ToInt32(rdr["f_edit"]) == 1)
                    {
                        c_doctrans_edit.Checked = true;

                    }
                    if (Convert.ToInt32(rdr["f_view"]) == 1)
                    {
                        c_doctrans_view.Checked = true;

                    }
                    if (Convert.ToInt32(rdr["f_delete"]) == 1)
                    {
                        c_doctrans_delete.Checked = true;

                    }
                }

                if (formname == "UserMaster")
                {
                    if (Convert.ToInt32(rdr["f_add"]) == 1)
                    {
                        c_user_add.Checked = true;
                        
                    }
                    if (Convert.ToInt32(rdr["f_edit"]) == 1)
                    {
                        c_user_edit.Checked = true;

                    }
                    if (Convert.ToInt32(rdr["f_view"]) == 1)
                    {
                        c_user_view.Checked = true;

                    }
                    if (Convert.ToInt32(rdr["f_delete"]) == 1)
                    {
                        c_user_delete.Checked = true;

                    }
                }



            }

        }
    }
}