<%@ Page Language="C#" AutoEventWireup="true" CodeFile="doctors.aspx.cs" Inherits="doctors" %>

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
    <p>
        <asp:Label ID="specialtiesLabel" runat="server" Text="Specialties"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="City"></asp:Label>
&nbsp;<asp:DropDownList ID="citiesList" runat="server" AutoPostBack="True" 
            onselectedindexchanged="citiesList_SelectedIndexChanged">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="submitButton" runat="server" Text="Submit" 
            onclick="submitButton_Click" />
    </p>
    <p>
        <asp:ListBox ID="specialtiesListBox" runat="server"></asp:ListBox>
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" style="font-weight: 700;font-size: large" 
            Text="Doctors"></asp:Label>
    </p>
    <asp:GridView ID="doctorsGridView" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="dr_id" 
        EmptyDataText="There are no data records to display." 
        onpageindexchanged="doctorsGridView_PageIndexChanged" 
        onpageindexchanging="doctorsGridView_PageIndexChanging" PageSize="5" 
        onselectedindexchanged="doctorsGridView_SelectedIndexChanged">
        <Columns>
            <asp:CommandField HeaderText="Select" ShowSelectButton="True" />
            <asp:BoundField DataField="dr_id" HeaderText="dr_id" ReadOnly="True" 
                SortExpression="dr_id" />
            <asp:BoundField DataField="dr_lname" HeaderText="dr_lname" 
                SortExpression="dr_lname" />
            <asp:BoundField DataField="dr_fname" HeaderText="dr_fname" 
                SortExpression="dr_fname" />
            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
            <asp:BoundField DataField="address" HeaderText="address" 
                SortExpression="address" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
            <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
            <asp:BoundField DataField="zip" HeaderText="zip" SortExpression="zip" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="Data Source=DIOSALINA\SQLEXPRESS;Initial Catalog=doctors;Integrated Security=True" 
        DeleteCommand="DELETE FROM [doctors] WHERE [dr_id] = @dr_id" 
        InsertCommand="INSERT INTO [doctors] ([dr_id], [dr_lname], [dr_fname], [phone], [address], [city], [state], [zip]) VALUES (@dr_id, @dr_lname, @dr_fname, @phone, @address, @city, @state, @zip)" 
        ProviderName="<%$ ConnectionStrings:doctorsConnectionString1.ProviderName %>" 
        SelectCommand="SELECT [dr_id], [dr_lname], [dr_fname], [phone], [address], [city], [state], [zip] FROM [doctors]" 
        
        UpdateCommand="UPDATE [doctors] SET [dr_lname] = @dr_lname, [dr_fname] = @dr_fname, [phone] = @phone, [address] = @address, [city] = @city, [state] = @state, [zip] = @zip WHERE [dr_id] = @dr_id">
        <DeleteParameters>
            <asp:Parameter Name="dr_id" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="dr_id" Type="String" />
            <asp:Parameter Name="dr_lname" Type="String" />
            <asp:Parameter Name="dr_fname" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="zip" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="dr_lname" Type="String" />
            <asp:Parameter Name="dr_fname" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="zip" Type="String" />
            <asp:Parameter Name="dr_id" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
