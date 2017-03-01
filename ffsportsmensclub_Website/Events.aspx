﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="ffsportsmensclub_Website.Events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="jumbotron">
            <h1>Fort Frances Men&#39;s Club</h1>
             <p class="lead">Welcome to the Events Page!</p>
            </div>
    </div>

    <asp:GridView ID="eventView" runat="server">
        
    </asp:GridView>

    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            <asp:GridView ID="grdAdminGrid" runat="server" DataSourceID="SqlDataSource1">
        
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FFSportsmensClubConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [Events] WHERE ([Approved] = 0)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="Approved" Type="Byte" />
                </SelectParameters>
            </asp:SqlDataSource>
        </AnonymousTemplate>

    </asp:LoginView>

</asp:Content>
