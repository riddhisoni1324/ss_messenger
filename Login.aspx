<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="LoginID"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="t_login_id" runat="server"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
           <td>
                <asp:Label ID="Label2" runat="server" Text="LoginPass"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="t_login_pass" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="UserType"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="UserDesc" DataValueField="UserId">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [UserMaster]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
        <td></td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Login" onclick="Button1_Click" />
        </td>
        </tr>
    </table>
</asp:Content>

