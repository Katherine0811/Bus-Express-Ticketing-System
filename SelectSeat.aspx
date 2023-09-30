<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectSeat.aspx.cs" Inherits="Assignment.SelectSeat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        table{
            margin-left: auto;
            margin-right: auto;
            border: 1px solid black;
        }

        td{
            padding: 5px;
        }

        .seat{
            border: 1px solid black;
            width: 35px;
            height: 35px;
            background-color: gainsboro;
        }

        .btn{
            border: none;
            outline: 0;
            display: inline-block;
            padding: 7px;
            color: white;
            background-color: rgb(42, 49, 64);
            text-align: center;
            cursor: pointer;
            font-size: 15px;
            border-radius:5px;
        }

        .header{
            color: rgb(93,123,157); font-size: 30px; 
            letter-spacing: 10px; font-weight: bold; 
            font-style: italic;
            text-align: center;
            margin: 0px 0px 20px 0px; padding: 10px 10px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            <p class="header" style="text-align:center"><strong>Seat Selection</strong></p>
            <br />
            <asp:Label ID="lblOrder" runat="server" Visible="False" ></asp:Label>
            <asp:Label ID="lblDate" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblRoute" runat="server" Visible="False"></asp:Label>
            <table>
                <tr>
                    <td></td>
                    <td></td>
                    <td colspan="2" style="text-align:center"><img src="../images/wheel.jpg" alt="Steering Wheel" width="70" height="70" /></td>
                </tr>
                <tr style="padding:0px 0px">
                    <td></td>
                    <td style="padding-right:20px">
                        <asp:Button ID="Button3" runat="server" Text="" BackColor="White" BorderStyle="None" Height="0.5px" Width="50px" /></td>
                    <td style="padding-left:20px">
                        <asp:Button ID="Button4" runat="server" Text="" BackColor="White" BorderStyle="None" Height="0.5px" Width="50px" /></td>
                    <td></td>
                </tr>
                <tr style="text-align:center">    
                    <asp:Repeater ID="rSeat" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="OnItemDataBound">
                        <ItemTemplate>
                            <%# Container.ItemIndex %4 == 0 && Container.ItemIndex > 0 ? "</tr><tr style=\"text-align:center\">" : "" %>
                            <td id="cell"><asp:Button ID="btnSeat" BackColor="Gainsboro" class="seat" runat="server" Text='<%# Eval("seatID") %>' OnClick="btnSeat_Click" /></td>
                        </ItemTemplate>
                    </asp:Repeater>
                </tr>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [seatID] FROM [Seat]"></asp:SqlDataSource>
            </table>
        </div>
        <p style="text-align:center">Total Seats to be Selected: <asp:Label ID="lblSeats" runat="server"></asp:Label></p>
        <p style="text-align:center">
        <asp:Button class="btn" ID="btnCheckout" runat="server" Text="Proceed to Checkout" Width="160px" OnClick="btnCheckout_Click" />
        </p>
    </form>
</body>
</html>
