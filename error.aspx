<%@ Page Language="C#" AutoEventWireup="true" CodeFile="error.aspx.cs" Inherits="error" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
   <p> Oops!!!!! </p>
    <p>something wrong</p>
    <p>Pls try after some time</p>
        <asp:Button ID="Button1" runat="server" Text="Home Page" 
            PostBackUrl="~/Login.aspx" />
    </div>
    </form>
</body>
</html>
