<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="ffsportsmensclub_Website.Events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="jumbotron">
            <h1>Fort Frances Men&#39;s Club</h1>
             <p class="lead">Welcome to the Events Page!</p>
            </div>
    </div>

    <asp:GridView ID="eventView" runat="server">
        
    </asp:GridView>

</asp:Content>
