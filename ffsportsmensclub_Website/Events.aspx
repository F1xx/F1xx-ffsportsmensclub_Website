<%@  Page Title="Events" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="ffsportsmensclub_Website.Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
    .col-md-4 div:target{
        background-color: #ffa;
    }
</style>

    <div class="container">
        <div class="jumbotron" id="eventsPage">
            <h1 class="titleText">Fort Frances Men&#39;s Club</h1>
             <p class="lead">Welcome to the Events Page!</p>
            </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="addABorder">
            <h1>Currently Approved Events</h1>
                </div>
            <div class="col-md-12">
                <p>Here you can see all of the approved events we currently have going on in the organization! 
                    You can see what the event is, where it'll be and when, and a brief description telling you what it's all about! 
                    Feel free to browse and see what event you feel like attending!
                </p>
            </div>
        </div>
    </div>

    <%-- Trying out a repeater here to make it look a little nicer --%>
    <div class="container">
        <div class="events">
            <div class="row">
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <div class="col-md-4">
                <div class="eventBody" id="<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                    <div class="addABorder">
                    <h1 class="eventTitle"><%# DataBinder.Eval(Container.DataItem,"Title") %></h1>
                    </div>
                    <h3 class="eventDate"><%# DataBinder.Eval(Container.DataItem,"Date", "{0:D}") %></h3>
                    <p class="eventInfo"><%# DataBinder.Eval(Container.DataItem,"Description") %></p>
                    <p class="eventName">By: <%# DataBinder.Eval(Container.DataItem,"Name") %></p>
                </div>
            </div>
      </ItemTemplate>
    </asp:Repeater>
                </div>
            </div>
        </div>


    <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>
            <%-- This is the template you want to put stuff in that can only be seen when you login --%>
            <%-- Cannot connect currently to the Database, but this is the template you want to use when only viewing stuff when logged in --%>
           
            <br />
            <br />
            <hr />
            <div class="container">
        <div class="page-header">
            <div class="addABorder">
            <h2>Pending Events</h2>
                </div>
        </div>
    </div>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" CellPadding="12" CellSpacing="20">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkRow" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <br />
            <asp:Button ID="btnDeleteSelected" runat="server" Text="Delete Selected" OnClick="Delete_Click" OnClientClick="return confirm('Are you sure you want to DELETE these Event(s) permanently?')" />
            <asp:Button ID="btnApproveSelected" runat="server" Text="Approve Selected" OnClick="Approve_Click" OnClientClick="return confirm('Are you sure you want to APPROVE these Event(s)?')" />

            <br />
            <hr />
            <div class="container">
        <div class="page-header">
            <div class="addABorder">
            <h2>Manage Events</h2>
                </div>
        </div>
    </div>
            <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" CellPadding="12" CellSpacing="20">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkRow" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:Button ID="btnCancelEvent" runat="server" Text="Cancel Selected" OnClick="Cancel_Click" OnClientClick="return confirm('Are you sure you want to CANCEL these Event(s)?')" />
        </LoggedInTemplate>
    </asp:LoginView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FFCP440Student %>" SelectCommand="SELECT DISTINCT * FROM [Events] WHERE ([Approved] = 0)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="Approved" Type="Byte" />
                </SelectParameters>
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FFCP440Student %>" SelectCommand="SELECT DISTINCT * FROM [Events] WHERE ([Approved] = 1)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="Approved" Type="Byte" />
                </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
