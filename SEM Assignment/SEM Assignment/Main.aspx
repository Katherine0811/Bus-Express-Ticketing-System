<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="SEM_Assignment.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            WELCOME TO FAIRY BUS EXPRESS<br />
            <br />
            <br />
        </div>
        <asp:Button ID="btnBook" runat="server" PostBackUrl="~/BookTicket.aspx" Text="Book Tickets Now" />
    </form>
</body>
</html>
