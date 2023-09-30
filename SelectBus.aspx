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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p style="text-align:center">
                ***************************************************************************************<br />
                <b style="text-align:center" class="header">Fairy Bus Express</b><br />
                ***************************************************************************************
            </p>
            <p>
                <table style="border:double;border-width:2px;margin-left:auto;margin-right:auto">
                    <tr style="text-align:center;font-weight:bold;">
                        <td style="border-bottom:dashed;border-width:1px;border-right:double">Setapak Route</td>
                        <td style="border-bottom:dashed;border-width:1px;">KL Sentral Route</td>
                    </tr>
                    <tr>
                        <td style="border-right:double">&nbsp;PV 15 - Setapak Sentral - Wangsa Maju LRT - TARUC Main Gate - Taman Bunga Raya&nbsp;</td>
                        <td>&nbsp;KL Sentral - Methodist College - Mid Valley - Sunway Lagoon - IOI Mall&nbsp;</td>
                    </tr>
                    </table>
                
            </p>
            <p>
                <table style="border:double;border-width:2px;margin-left:auto;margin-right:auto">
                    <tr>
                        <td style="border-right:double;border-width:2px;border-bottom:dashed;">Ticket Catagories (Age Groups)</td>
                        <td style="border-bottom:dashed;border-width:2px;">Ticket Prices</td>
                    </tr>
                    <tr>
                        <td style="border-right:double;border-width:2px">Senior (60 years old and above)</td>
                        <td style="text-align:center">RM 2.00</td>
                    </tr>
                    <tr>
                        <td style="border-right:double;border-width:2px">Adult</td>
                        <td style="text-align:center">RM 8.00</td>
                    </tr>
                    <tr>
                        <td style="border-right:double;border-width:2px">Child (12 years old below)</td>
                        <td style="text-align:center">RM 2.00</td>
                    </tr>
                    <tr>
                        <td style="border-right:double;border-width:2px">Student (must show student card)&nbsp;</td>
                        <td style="text-align:center">RM 4.00</td>
                    </tr>
                </table>
            </p>
            <p>
                 <table class="card" style="margin-left:auto;margin-right:auto">
            <tr>
                <td class="auto-style1">Departure Date:</td>
                <td>
                    <asp:Calendar ID="cldDeparture" runat="server" OnSelectionChanged="cldDeparture_SelectionChanged"></asp:Calendar>
                    <asp:TextBox ID="txtDepartDate" runat="server" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDepartDate" runat="server" ControlToValidate="txtDepartDate" ErrorMessage="Departure date is required!" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Route:</td>
                <td>
                    <asp:DropDownList ID="ddlRoute" runat="server" Width="171px">
                        <asp:ListItem Value="0">--Please select a route--</asp:ListItem>
                        <asp:ListItem>Setapak Route</asp:ListItem>
                        <asp:ListItem>KL Sentral Route</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvRoute" runat="server" ControlToValidate="ddlRoute" ErrorMessage="Route is required!" ForeColor="Red" InitialValue="0">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Senior:</td>
                <td>
                    <asp:TextBox ID="txtSenior" runat="server" TextMode="Number">0</asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSenior" runat="server" ControlToValidate="txtSenior" ErrorMessage="Number of senior is required!" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rvSenior" runat="server" ControlToValidate="txtSenior" ErrorMessage="Please enter a valid number of senior!" ForeColor="Red" MaximumValue="40" MinimumValue="0" Type="Integer">*</asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Adult:</td>
                <td>
                    <asp:TextBox ID="txtAdult" runat="server" TextMode="Number">0</asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAdult" runat="server" ControlToValidate="txtAdult" ErrorMessage="Number of adult is required!" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rvAdult" runat="server" ControlToValidate="txtAdult" ErrorMessage="Please enter a valid number of adult!" ForeColor="Red" MaximumValue="40" MinimumValue="0" Type="Integer">*</asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Child:</td>
                <td>
                    <asp:TextBox ID="txtChild" runat="server" TextMode="Number">0</asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvChild" runat="server" ControlToValidate="txtChild" ErrorMessage="Number of child is required!" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rvChild" runat="server" ControlToValidate="txtChild" ErrorMessage="Please enter a valid number of child!" ForeColor="Red" MaximumValue="40" MinimumValue="0" Type="Integer">*</asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Student:</td>
                <td>
                    <asp:TextBox ID="txtStudent" runat="server" TextMode="Number">0</asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStudent" runat="server" ControlToValidate="txtStudent" ErrorMessage="Number of student is required!" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rvStudent" runat="server" ControlToValidate="txtStudent" ErrorMessage="Please enter a valid number of student!" ForeColor="Red" MaximumValue="40" MinimumValue="0" Type="Integer">*</asp:RangeValidator>
                </td>
            </tr>
                     <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
        </table>
            </p>
        </div>
        <p style="text-align:center">
            <asp:Button ID="btnDisplayHistory" runat="server" Text="View Order History" class="btn" OnClick="btnDisplayHistory_Click" PostBackUrl="~/ViewHistory.aspx" CausesValidation="false" />
            &nbsp;<asp:Button ID="btnSelectSeat" runat="server" Text="Proceed to Select Seat" OnClick="btnSelectSeat_Click" class="btn"/>
&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClientClick="javascript:alert('The booking is cancelled!')" OnClick="btnCancel_Click" CausesValidation="False" class="btn"/>
        </p>
        </form>
</body>
</html>