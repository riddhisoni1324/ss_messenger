<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="trans.aspx.cs" Inherits="trans" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

   <asp:SqlDataSource ID="DocTrans1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [DocTrans]"></asp:SqlDataSource>
    <br />
    &nbsp;
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:DataList ID="DataList2" runat="server" >
                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="white" />
                <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <ItemTemplate>
                    <table style="padding: 4px; font-size: medium; width: 100%; overflow: auto">
                        <tr>
                            <td style="width: 200px">
                                &nbsp;<%# Eval("dtid") %></td>
                            <td style="width: 400px">
                                &nbsp;<%# Eval("docdesc")%></td>
                            <td style="width: 200px">
                                &nbsp;<%# Eval("title") %></td>
                            <td style="width: 400px">
                                &nbsp;<%# Eval("docdetail")%></td>
                            <td style="width: 10%">
                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%#Eval("dtid") %>'></asp:LinkButton>
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
                            <asp:Button ID="b_add_type" runat="server" Text="Add doc detail" OnClick="b_add_category_click"
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
                        DocType
                    </td>
                    <td class="style1">
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1"
                            DataTextField="DocDesc" DataValueField="DocID" CssClass="input_dim" Height="25px"
                            Width="205px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT [DocID], [DocDesc] FROM [DocMaster]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Title
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="t_doc_title" runat="server" CssClass="input_dim" Width="208px"></asp:TextBox>
                    </td>
                    <td class="style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="t_doc_title"
                            ErrorMessage="*This Field is Required" ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        DocDetails
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="t_doc_detail" runat="server" CssClass="input_dim" Width="208px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                <td class="style3"> Attach Doc
                </td>
                <td class="style1">
                    <asp:TextBox ID="t_file_upload" runat="server" CssClass="input_dim" 
                        Width="208px"></asp:TextBox>
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true"/>
                    <%--<asp:Button ID="upload" runat="server" Text="check" onclick="upload_Click" />--%>
                </td>
                
                </tr>
                <tr>
                <td>
                
                </td>
                
              
                <td>
                    
                    <asp:Label ID="Label2" runat="server" Text="Do u want to email?"></asp:Label>
                    <asp:Button ID="Button3" runat="server" Text="Save & Mail" 
                        onclick="Button3_Click1" />
                </td>
                <td>
                
                    <asp:Label ID="l_mem" runat="server" Text=" "></asp:Label>
                
                </td>
                </tr>
                <tr>
                    <td class="style3">
                    </td>
                    <td class="style5">
                        <asp:Button ID="Button1" runat="server" Text="Save" Width="100px" CssClass="btn btn-primary btn-large"
                            Font-Bold="True" OnClick="btnSave_Click" ValidationGroup="insert" />&nbsp;
                        <asp:Button ID="t_back" runat="server" OnClick="Button3_Click" Text="Back" Width="100px"
                            Font-Bold="True" Style="margin-left: 8px" />
                    </td>
                </tr>
                
            </table>
            <asp:TextBox ID="flag" runat="server" Visible="False"></asp:TextBox>
            <asp:TextBox ID="h_id" runat="server" Visible="False"></asp:TextBox>
        </asp:View>
        <asp:View ID="View3" runat="server">
        
        
            <br />
            <br />
            <asp:ListBox ID="ListBox1" runat="server" Height="116px" Width="264px" 
                SelectionMode="Multiple"></asp:ListBox>
            <br />
            <br />
            <asp:Button ID="b_sel_mem" runat="server" onclick="b_sel_mem_Click" 
                Text="select all member" />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                Text="save and go back" />
            <br />
        
        
        </asp:View>
    </asp:MultiView>
</asp:Content>

