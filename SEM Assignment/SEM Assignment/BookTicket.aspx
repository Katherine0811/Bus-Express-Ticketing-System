<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookTicket.aspx.cs" Inherits="SEM_Assignment.BookTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 297px;
        }
        .auto-style2 {
            width: 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            TICKET BOOKING<br />
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">Choose a Route</td>
                    <td class="auto-style2">:</td>
                    <td>
                        <asp:RadioButtonList ID="rblStation" runat="server">
                            <asp:ListItem Value="Setapak">Setapak Station</asp:ListItem>
                            <asp:ListItem Value="KL Sentral">KL Sentral Station</asp:ListItem>
                            <asp:ListItem Value="Kepong">Kepong Station</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnSchedule" runat="server" Text="Check Schedule" />
                        <br />
                        <asp:DataList ID="DataList1" runat="server">
                        </asp:DataList>
                        ^ sini put timetable </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">:</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
        </div>
    </form>
</body>
</html>
