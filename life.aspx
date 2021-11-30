<%@ Page Language="C#" MasterPageFile="~/benefitsMaster.master" AutoEventWireup="true" CodeFile="life.aspx.cs" Inherits="life" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <table class="style1">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label4" runat="server" Font-Size="Large" 
                        Text="Life Insurance Application"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="nameTextBox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="nameValidator" runat="server" 
                        ControlToValidate="nameTextBox" ErrorMessage="Name cannot be blank">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Proof of good health appointment"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Birth Date:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="birthTextBox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="birthValidator" runat="server" 
                        ControlToValidate="birthTextBox" ErrorMessage="Birth date cannot be blank">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="birthCompareValidator" runat="server" 
                        ControlToValidate="birthTextBox" ErrorMessage="Birth date format is invalid" 
                        Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                </td>
                <td rowspan="5">
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" 
                        BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                        Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
                        ShowGridLines="True" Width="220px">
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                            ForeColor="#FFFFCC" />
                    </asp:Calendar>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Coverage:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="coverageTextBox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="coverageValidator" runat="server" 
                        ControlToValidate="coverageTextBox" ErrorMessage="Coverage cannot be blank">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="coverageRegexValidator" runat="server" 
                        ControlToValidate="coverageTextBox" 
                        ErrorMessage="Coverage must be a currency value" 
                        ValidationExpression="\d+(\.\d{2})?">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="shortTermCheckBox" runat="server" 
                        Text="Short-term disability" />
                </td>
                <td>
                    <asp:CheckBox ID="longTermCheckBox" runat="server" 
                        Text="Long-term disability" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="saveButton" runat="server" Text="Save" 
                        onclick="saveButton_Click" />
                    <br />
                    <br />
                    <asp:Label ID="messageLabel" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:ValidationSummary ID="textBoxValidationSummary" runat="server" 
                        HeaderText="These errors were found:" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>

