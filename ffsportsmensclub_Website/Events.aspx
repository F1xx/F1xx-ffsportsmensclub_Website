<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="ffsportsmensclub_Website.Events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="jumbotron">
            <h1>Fort Frances Men&#39;s Club</h1>
             <p class="lead">Welcome to the Events Page!</p>
            </div>
    </div>

    <div class="container">
        <div class="row">
            <h1>Currently Approved Events</h1>
            <div class="col-md-12">
                <p>Here you can see all of the approved events we currently have going on in the organization! 
                    You can see what the event is, where it'll be and when, and a brief description telling you what it's all about! 
                    Feel free to browse and see what event you feel like attending!
                </p>
            </div>
        </div>
    </div>

    <%-- Trying out a repeater here to make it look a little nicer --%>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <div class="col-md-4">
        <div class="eventBody">
            <h1 class="eventTitle"><%# DataBinder.Eval(Container.DataItem,"Title") %></h1>
            <h3 class="eventDate"><%# DataBinder.Eval(Container.DataItem,"Date") %></h3>
            <p class="eventInfo"><%# DataBinder.Eval(Container.DataItem,"Description") %></p>
            <p class="eventName">By: <%# DataBinder.Eval(Container.DataItem,"Name") %></p>
        </div>
                </div>
    </ItemTemplate>
    </asp:Repeater>

    <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>
            <%-- This is the template you want to put stuff in that can only be seen when you login --%>
            <%-- Cannot connect currently to the Database, but this is the template you want to use when only viewing stuff when logged in --%>
            <p>LOOK MOM, I'M LOGGED IN!!</p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FFCP440Student %>" SelectCommand="SELECT DISTINCT * FROM [Events] WHERE ([Approved] = 0)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="Approved" Type="Byte" />
                </SelectParameters>
            </asp:SqlDataSource>
        </LoggedInTemplate>
    </asp:LoginView>

</asp:Content>
