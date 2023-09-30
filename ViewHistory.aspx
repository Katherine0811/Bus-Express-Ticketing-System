<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectBus.aspx.cs" Inherits="Assignment.SelectBus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 120px;
        }
        .card{
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.3);
            max-width: 430px;
            margin: auto;
            padding:5px;
            background-color:rgb(222, 244, 252)
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
        .column
        {
            border: 1px solid #000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-right:auto; margin-left:auto">
            <p style="text-align:center">
                <b style="text-align:center" class="header">Order History</b><br />
                <br />
            </p>
            <p style="text-align:center">
                <asp:GridView ID="gvHistory" runat="server" CellPadding="5" CellSpacing="1" HorizontalAlign="Center" ForeColor="#333333" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="orderID" DataSourceID="SqlDataSource1" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="orderID" HeaderText="Order ID" ReadOnly="True" SortExpression="orderID" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="orderDate" HeaderText="Order Date" SortExpression="orderDate" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="departureDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Departure Date" SortExpression="departureDate" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="route" HeaderText="Route" SortExpression="route" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="totalSeats" HeaderText="Total Seats" SortExpression="totalSeats" ItemStyle-HorizontalAlign="Center" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [orderID], [orderDate], [departureDate], [route], [totalSeats] FROM [Order]"></asp:SqlDataSource>
            </p>
        
        </div>
        <p style="text-align:center"><asp:Button ID="btnDisplayHistory" runat="server" Text="Back to Home" class="btn" PostBackUrl="~/SelectBus.aspx"/></p>
        </form>
</body>
</html>