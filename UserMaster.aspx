<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UserMaster.aspx.cs" Inherits="UserMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 15%;
    }
    .style2
    {
        height: 65px;
        width: 2%;
    }
    .style3
    {
        width: 2%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
           <table style=" font-size: medium; width: 100%; overflow: auto">
        <tr>
        <td style="width: 5%">  Id</td>
        <td style="width: 400px">  Description </td>
        
        </tr>
      
        </table>
        <br />
            <asp:DataList ID="DataList2" runat="server" OnEditCommand="Edit_Command">
                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="white" />
                <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <ItemTemplate>
                    <table style="padding: 4px; font-size: medium; width: 100%; overflow: auto">
                        <tr>
                            <td style="width: 10%">
                                &nbsp;<%# Eval("UserID") %></td>
                            <td style="width: 400px">
                                &nbsp;<%# Eval("UserDesc")%></td>
                            <td style="width: 10%">
                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%#Eval("UserID") %>'></asp:LinkButton>
                            </td>
                            <td style="width: 10%">
                                &nbsp;<asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete"
                                    OnClientClick="return confirm('Are you Sure to Delete Selected Record?')" Visible="true"></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:Panel ID="Panel1" runat="server">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="btnfirst" runat="server" Font-Bold="true" Text="<<" Height="31px"
                                Width="43px" OnClick="btnfirst_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnprevious" runat="server" Font-Bold="true" Text="<" Height="31px"
                                Width="43px" OnClick="btnprevious_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnnext" runat="server" Font-Bold="true" Text=">" Height="31px" Width="43px"
                                OnClick="btnnext_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnlast" runat="server" Font-Bold="true" Text=">>" Height="31px"
                                Width="43px" OnClick="btnlast_Click" />
                        </td>
                        <td>
                        </td>
                        <td>
                            <asp:Button ID="b_add_type" runat="server" Text="Add User" OnClick="b_add_type_Click"
                                Width="100px" Font-Bold="True" Height="35px" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table>
                <tr>
                    <td class="style3">
                        <asp:Label ID="l_User_id" runat="server" Text="User Id"></asp:Label>
                    </td>
                    <td>
                        &nbsp;&nbsp;<asp:TextBox ID="t_User_id" name="txtFacultyCode" runat="server" BorderStyle="Solid"
                            BorderWidth="1" CssClass="radius"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="l_User_desc" runat="server" Text="User Desc"></asp:Label>
                    </td>
                    <td>
                        &nbsp;&nbsp;<asp:TextBox ID="t_User_desc" name="txtFacultyName" runat="server"  
                            CssClass="radius"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*This Field is required"
                            ControlToValidate="t_User_desc" ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                    </td>
                    <td class="style1">
                        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Save" Width="100px"
                            CssClass="radius" Font-Bold="True" OnClick="btnSave_Click"
                            ValidationGroup="insert" />&nbsp;
                        <asp:Button ID="t_back" runat="server" OnClick="Button3_Click" Text="Back" Width="100px"
                            Font-Bold="True" CssClass="radius" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

