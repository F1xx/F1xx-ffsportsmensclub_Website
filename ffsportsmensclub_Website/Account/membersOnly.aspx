<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="membersOnly.aspx.cs" Inherits="ffsportsmensclub_Website.Account.membersOnly" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            You are not logged in, please log in to view more here.
        </AnonymousTemplate>
            <LoggedInTemplate>
                You have successfully logged in to the website, congratulations <asp:LoginName ID="LoginName1" runat="server" />
            </LoggedInTemplate>
        </asp:LoginView>
    </div>
</asp:Content>
