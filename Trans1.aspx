<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Trans1.aspx.cs" Inherits="Trans1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 293px;
        }
        .btn-large
        {
            margin-top: 0px;
            margin-left: 30px;
        }
        .style4
        {
            width: 80px;
        }
        .style5
        {
            width: 93px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:SqlDataSource ID="DocTrans1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [DocTrans]"></asp:SqlDataSource>
    <br />
    &nbsp;
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:DataList ID="DataList2" runat="server" OnEditCommand="Edit_Command">
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
                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Upload" CommandName="Edit" CommandArgument='<%#Eval("docdesc") %>'></asp:LinkButton>
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
                    <td class="style5">
                        DocType
                    </td>
                    <td class="style2">
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1"
                            DataTextField="DocDesc" DataValueField="DocID" CssClass="input_dim" Height="25px"
                            Width="205px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT [DocID], [DocDesc] FROM [DocMaster]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        Title
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="t_doc_title" runat="server" CssClass="input_dim" Width="208px"></asp:TextBox>
                    </td>
                    <td class="style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="t_doc_title"
                            ErrorMessage="*This Field is Required" ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        DocDetails
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="t_doc_detail" runat="server" CssClass="input_dim" Width="208px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                <td class="style5"> &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <%--<asp:Button ID="upload" runat="server" Text="check" onclick="upload_Click" />--%>
                    <br />
                </td>
                <td>
                
                
                    &nbsp;</td>
                
                </tr>
                <tr>
                <td class="style5"></td>
                <td>
                    <asp:Button ID="Button1" runat="server" CssClass="radius" 
                        Font-Bold="True" Height="23px" OnClick="btnSave_Click" Text="Save" 
                        ValidationGroup="insert" Width="100px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="t_back" runat="server" Font-Bold="True" OnClick="Button3_Click" 
                        Style="margin-left: 8px" Text="Back" Width="100px" CssClass="radius" />
                    </td>
                </tr>
                
            </table>
            <asp:TextBox ID="flag" runat="server" Visible="False"></asp:TextBox>
            <asp:TextBox ID="h_id" runat="server" Visible="False"></asp:TextBox>
            <br />
            <br />
        </asp:View>
         <asp:View ID="View3" runat="server">
          <table>
                 <tr>
                <td class="style5">
                
                    &nbsp;</td>
                
              
                <td class="style2">
                    
                    &nbsp;</td>
                <td>
                
                    <asp:Label ID="l_mem" runat="server" Text=" "></asp:Label>
                
                    <br />
                    Attach Doc<br />
                
                    <br />
                    <asp:FileUpload ID="FileUpload2" runat="server" AllowMultiple="true" />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Do u want to email?"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:ListBox ID="ListBox2" runat="server" Height="116px" 
                        SelectionMode="Multiple" Width="264px"></asp:ListBox>
                    <br />
                    <br />
                    <asp:Button ID="b_sel_mem0" runat="server" onclick="b_sel_mem_Click" 
                        Text="select all member" CssClass="radius" />
                    <br />
                    <br />
                    <asp:Button ID="Button6" runat="server" onclick="Button5_Click" 
                        Text="save and mail" CssClass="radius" />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="Button7" runat="server" onclick="Button7_Click" Text="Back" 
                        CssClass="radius" />
                    <br />
                    <br />
                    <br />
                    <br />
                
                </td>
                </tr>
                <tr>
                    <td class="style5">
                    </td>
                    <td class="style2">
                        &nbsp;
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:HiddenField ID="h_dtid" runat="server" />
                        <asp:HiddenField ID="h_doctype" runat="server" />
                        <asp:HiddenField ID="h_doc_id" runat="server" />
                        <br />
                    </td>
                </tr>
         
          
          </table>

         </asp:View>
    </asp:MultiView>
</asp:Content>


