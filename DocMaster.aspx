<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DocMaster.aspx.cs" Inherits="DocMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 16%;
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
    .style4
    {
        width: 2%;
        height: 26px;
    }
    .style5
    {
        height: 26px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<br />
    <br />
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
                                &nbsp;<%# Eval("DocID") %></td>
                            <td style="width: 400px">
                                &nbsp;<%# Eval("DocDesc")%></td>
                            <td style="width: 10%">
                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%#Eval("DocID") %>'></asp:LinkButton>
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
                            <asp:Button ID="b_add_type" runat="server" Text="Add Doc" OnClick="b_add_type_Click"
                                Width="100px" Font-Bold="True" Height="35px" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table>
                <tr>
                    <td class="style4">
                        <asp:Label ID="l_type_id" runat="server" Text="Doc Id"></asp:Label>
                    </td>
                    <td class="style5">
                        &nbsp;&nbsp;<asp:TextBox ID="t_doc_id" name="txtFacultyCode" runat="server" BorderStyle="Solid"
                            BorderWidth="1" CssClass="radius"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="l_type_desc" runat="server" Text="Doc Desc"></asp:Label>
                    </td>
                    <td>
                        &nbsp;&nbsp;<asp:TextBox ID="t_doc_desc" name="txtFacultyName" runat="server"  
                            CssClass="radius"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*This Field is required"
                            ControlToValidate="t_doc_desc" ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>
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

