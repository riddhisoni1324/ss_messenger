﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.IO;

public partial class Login : System.Web.UI.Page
{
    SqlCommand cmd, insert_otp_cmd; string cs; SqlDataReader rdr; int j = 0; int OTP; string get_OTP, set_OTP;
    SqlDataAdapter dadapter; DataSet dset; PagedDataSource adsource;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        var menu = Page.Master.FindControl("NavigationMenu") as Menu;
        if (menu != null)
        {
           
            menu.Items.Remove(menu.FindItem("Permission"));
            menu.Items.Remove(menu.FindItem("TypeMaster"));
            menu.Items.Remove(menu.FindItem("Categorymaster"));
            menu.Items.Remove(menu.FindItem("MemberMaster"));
            menu.Items.Remove(menu.FindItem("DocMaster"));
            menu.Items.Remove(menu.FindItem("DocTrans"));
            menu.Items.Remove(menu.FindItem("UserMaster"));
            menu.Items.Remove(menu.FindItem("Login"));
            menu.Items.Remove(menu.FindItem("Home"));

        }
        
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string login_id = t_login_id.Text;
        string login_pass = t_login_pass.Text;
        string user_type = DropDownList1.SelectedValue;
        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        cmd = new SqlCommand("select * from membermaster where loginid=@login_id and loginpass=@login_pass and usertype=@user_type", con);
        cmd.Parameters.Add("@login_id", login_id);
        cmd.Parameters.Add("@login_pass", login_pass);
        cmd.Parameters.Add("@user_type", user_type);
        cmd.Connection = con;
        rdr = cmd.ExecuteReader();
        int i = 0;
        if (rdr != null)
        {
            while (rdr.Read())
            {
                i++;
                
            }
        }
        if (i != 1)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Information Must Match.');", true);
        }
        else {

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Information Matched.');", true);
            Session["user"] = t_login_id.Text;
            Session["usertype"] = user_type;
            string log = System.Configuration.ConfigurationManager.AppSettings["FilePath"].ToString();
            using (StreamWriter outputFile = new StreamWriter(log, true))
            {

                outputFile.WriteLine(System.DateTime.Now.ToString() + "User: " + t_login_id.Text +" Login Sucess");

            }
            Response.Redirect("Home.aspx");

          
        }

                       
        //Response.Write(" "+login_id+" "+login_pass+" "+user_type);

    }
}