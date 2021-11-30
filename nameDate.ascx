<%@ Control Language="C#" AutoEventWireup="true" CodeFile="nameDate.ascx.cs" Inherits="nameDate" %>
<style type="text/css">

        .style1
        {
            width: 100%;
        }
    </style>
        <table class="style1" style="width: 335px">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="nameTextBox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="nameValidator" runat="server" 
                        ControlToValidate="nameTextBox" ErrorMessage="Name cannot be blank">*</asp:RequiredFieldValidator>
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
            </tr>
        </table>
    