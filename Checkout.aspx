<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Assignment.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript"> 
        function ValidateExpired(source, args) 
        {
            var ddlYear = document.getElementById("<%=ddlYear.ClientID %>");
            var year = ddlYear.options[ddlYear.selectedIndex].innerHTML;
            var ddlMonth = document.getElementById("<%=ddlMonth.ClientID %>");
            var month = ddlMonth.selectedIndex;
            var dt = new Date();
            if (dt.getFullYear() == year && month < (dt.getMonth() + 1)) {
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }
    </script>
    <style type="text/css">
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
        .card{
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.3);
            max-width: 430px;
            margin: auto;
            padding:5px;
        }
        .auto-style3 {
            width: 160px;
        }
        .auto-style4 {
            width: 270px;
        }
        .auto-style5 {
            width: 270px;
            height: 29px;
        }
        .auto-style6 {
            width: 200px;
            height: 29px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p class="header" style="text-align:center"><strong>Checkout</strong></p>
         
                <table style="margin-left:auto;margin-right:auto;">
                    <tr>
                        <td>
                            <div class="card">
                                <b>Payment Details</b><table style="margin-left:auto;margin-right:auto;">
            <tr>
                <td class="auto-style3">Name on Card</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtCardName" runat="server" MaxLength="50" Width="210px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCardName" runat="server" ControlToValidate="txtCardName" ErrorMessage="Name on Card is required!" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regCardName" runat="server" ControlToValidate="txtCardName" ErrorMessage="Please provide a valid Name on Card!" ForeColor="Red" ValidationExpression="[A-Za-z\s-'/']{3,50}">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Card Number*</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtCardNo" runat="server" MaxLength="19" Width="210px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCardNo" runat="server" ControlToValidate="txtCardNo" ErrorMessage="Card Number is required!" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regCardNo" runat="server" ControlToValidate="txtCardNo" ErrorMessage="Please provide a valid Card Number!" ForeColor="Red" ValidationExpression="\d{4}-\d{4}-\d{4}-\d{4}">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Exp Month</td>
                <td class="auto-style6">
                    <asp:DropDownList ID="ddlMonth" runat="server" Width="210px">
                        <asp:ListItem Value="None">--Select a Month--</asp:ListItem>
                        <asp:ListItem>January</asp:ListItem>
                        <asp:ListItem>February</asp:ListItem>
                        <asp:ListItem>March</asp:ListItem>
                        <asp:ListItem>April</asp:ListItem>
                        <asp:ListItem>May</asp:ListItem>
                        <asp:ListItem>June</asp:ListItem>
                        <asp:ListItem>July</asp:ListItem>
                        <asp:ListItem>August</asp:ListItem>
                        <asp:ListItem>September</asp:ListItem>
                        <asp:ListItem>October</asp:ListItem>
                        <asp:ListItem>November</asp:ListItem>
                        <asp:ListItem>December</asp:ListItem>
                    </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvMonth" runat="server" ControlToValidate="ddlMonth" ErrorMessage="Please select the Exp Month!" ForeColor="Red" InitialValue="None">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Exp Year</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="ddlYear" runat="server" Width="210px">
                        <asp:ListItem Value="None">--Select a Year--</asp:ListItem>
                        <asp:ListItem>2022</asp:ListItem>
                        <asp:ListItem>2023</asp:ListItem>
                        <asp:ListItem>2024</asp:ListItem>
                        <asp:ListItem>2025</asp:ListItem>
                        <asp:ListItem>2026</asp:ListItem>
                        <asp:ListItem>2027</asp:ListItem>
                        <asp:ListItem>2028</asp:ListItem>
                        <asp:ListItem>2029</asp:ListItem>
                        <asp:ListItem>2030</asp:ListItem>
                    </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvYear" runat="server" ControlToValidate="ddlYear" ErrorMessage="Please select the Exp Year!" ForeColor="Red" InitialValue="None">*</asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvYear" runat="server" EnableClientScript="true" ClientValidationFunction="ValidateExpired" ErrorMessage="The card already expired!" ForeColor="Red" onservervalidate="cvYear_ServerValidate">*</asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">CVV</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtCVV" runat="server" MaxLength="3" Width="210px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCVV" runat="server" ControlToValidate="txtCVV" ErrorMessage="CVV is required!" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regCVV" runat="server" ControlToValidate="txtCVV" ErrorMessage="Please provide a valid CVV!" ForeColor="Red" ValidationExpression="\d{3}">*</asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        <p>*Card Number Format: 1234-5678-9123-4536</p>
    </div>
                        </td>
                        <td style="vertical-align:top" class="card"><b>Booking Summary<br />
                            <br />
                                        <asp:Label ID="lblDate" runat="server"></asp:Label>
                                    &nbsp;-
                                        <asp:Label ID="lblRoute" runat="server"></asp:Label>
                                    &nbsp;</b><br />
                            <table style="width:100%;">
                                <tr>
                                    <td>Senior: </td>
                                    <td>
                                        <asp:Label ID="lblSenior" runat="server"></asp:Label>
                                    </td>
                                    <td>x RM 2.00 = </td>
                                    <td>
                                        RM
                                        <asp:Label ID="lblSeniorTotal" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Adult: </td>
                                    <td>
                                        <asp:Label ID="lblAdult" runat="server"></asp:Label>
                                    </td>
                                    <td>x RM 8.00 = </td>
                                    <td>
                                        RM
                                        <asp:Label ID="lblAdultTotal" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Child:</td>
                                    <td>
                                        <asp:Label ID="lblChild" runat="server"></asp:Label>
                                    </td>
                                    <td>x RM 2.00 = </td>
                                    <td>
                                        RM
                                        <asp:Label ID="lblChildTotal" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Student:</td>
                                    <td>
                                        <asp:Label ID="lblStudent" runat="server"></asp:Label>
                                    </td>
                                    <td>x RM 4.00 = </td>
                                    <td>
                                        RM
                                        <asp:Label ID="lblStudentTotal" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="text-align:right"><b>Total&nbsp;&nbsp; </b></td>
                                    <td>RM
                                        <asp:Label ID="lblTotal" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
    <div align="center">
        <br />
        <asp:Button class="btn" ID="btnCheckout" runat="server" Text="Complete Checkout" Width="160px" OnClick="btnCheckout_Click" />
    </div>
    </form>
</body>
</html>
