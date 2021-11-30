<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" Trace="false" %>

<%@ Register src="header.ascx" tagname="header" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:header ID="header1" runat="server" />
    
    </div>
    <br />
    <asp:CheckBoxList ID="listBenefitsCheckBoxList" runat="server">
    </asp:CheckBoxList>
    <br />
    <asp:Button ID="submitButton" runat="server" Text="Submit" 
        onclick="submitButton_Click" />
    <br />
    <br />
    <asp:Label ID="selectionsLabel" runat="server" Text="Selected items:"></asp:Label>
    </form>
</body>
</html>
