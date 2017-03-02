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

    <%-- Trying out a repeater here to make it look a little nicer --%>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <div class="row">
        <div class="eventBody">
            <h1 class="eventTitle"><%# DataBinder.Eval(Container.DataItem,"Title") %></h1>
            <h3 class="eventDate"><%# DataBinder.Eval(Container.DataItem,"Date") %></h3>
            <p class="eventInfo"><%# DataBinder.Eval(Container.DataItem,"Description") %></p>
            <p class="eventName"><%# DataBinder.Eval(Container.DataItem,"Name") %></p>
        </div>
                </div>
    </ItemTemplate>
    </asp:Repeater>

</asp:Content>
