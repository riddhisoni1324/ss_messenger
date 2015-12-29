<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Permission.aspx.cs" Inherits="Permission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">




    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="UserDesc" 
        DataValueField="UserId" AutoPostBack="True" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>







    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [UserMaster]"></asp:SqlDataSource>




        <br /><br />


<table>
<tr>
<td>Type</td>
<td>Add</td>
<td>Edit</td>
<td>Delete</td>
<td>View</td>
</tr>
<tr>
<td>TypeMaster</td>
<td> 
    <asp:CheckBox ID="c_type_add" runat="server" /></td>
<td>
    <asp:CheckBox ID="c_type_edit" runat="server" /></td>
<td>
     <asp:CheckBox ID="c_type_delete" runat="server" /></td>
<td>
     <asp:CheckBox ID="c_type_view" runat="server" /></td>
</tr>

<tr>
<td>Category</td>
<td>
     <asp:CheckBox ID="c_cat_add" runat="server" /></td>
<td>
      <asp:CheckBox ID="c_cat_edit" runat="server" /></td>
<td>
        <asp:CheckBox ID="c_cat_delete" runat="server" /></td>
<td>
        <asp:CheckBox ID="c_cat_view" runat="server" /></td>
</tr>

<tr>
<td>Member</td>
<td>
     <asp:CheckBox ID="c_mem_add" runat="server" /></td>
<td>
      <asp:CheckBox ID="c_mem_edit" runat="server" /></td>
<td>
        <asp:CheckBox ID="c_mem_delete" runat="server" /></td>
<td>
        <asp:CheckBox ID="c_mem_view" runat="server" /></td>
</tr>



<tr>
<td>Document</td>
<td>
     <asp:CheckBox ID="c_doc_add" runat="server" /></td>
<td>      <asp:CheckBox ID="c_doc_edit" runat="server" /></td>
<td>
        <asp:CheckBox ID="c_doc_delete" runat="server" /></td>
<td>
        <asp:CheckBox ID="c_doc_view" runat="server" /></td>
</tr>


<tr>
<td>DocumnetTrans</td>
<td>
     <asp:CheckBox ID="c_doctrans_add" runat="server" /></td>
<td>
      <asp:CheckBox ID="c_doctrans_edit" runat="server" /></td>
<td>
        <asp:CheckBox ID="c_doctrans_delete" runat="server" /></td>
<td>
        <asp:CheckBox ID="c_doctrans_view" runat="server" /></td>
</tr>


<tr>
<td>Usermaster</td>
<td>
     <asp:CheckBox ID="c_user_add" runat="server" /></td>
<td>
      <asp:CheckBox ID="c_user_edit" runat="server" /></td>
<td>
        <asp:CheckBox ID="c_user_delete" runat="server" /></td>
<td>
        <asp:CheckBox ID="c_user_view" runat="server" /></td>
</tr>





</table>

    <asp:Button ID="Button1" runat="server" Text="Apply Changes" 
        onclick="Button1_Click" />

</asp:Content>

