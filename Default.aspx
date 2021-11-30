<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EXPERIENCIA2._1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
    <div class="row">
        <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Página Principal</a>
           
       <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Acerca de</a>
        </div>
    <p></p>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <p></p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Page_Load">
            </asp:Timer>
        </ContentTemplate>
    </asp:UpdatePanel>
    <p></p>
     <p></p>
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <p></p>
    <p></p>
    
    

</asp:Content>
