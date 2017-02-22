<%@ Page Title="Calendar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="ffsportsmensclub_Website.About" MaintainScrollPositionOnPostBack = "true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
    <div class="col-md-12">
            <h2>Wanting to go ahead and book something?</h2>
            <p>
                Look no further than this page right here! All you have to do is insert your information below, as well as all the information regarding 
                what times you were looking at and for how long. Once you submit your information, one of our members will take a look at the submission and
                 get back to you about whether or not you can obtain that time or not. Until then, feel free to take a look around the site and see what else 
                as a club we can offer to you!
            </p>
        </div>
    </div>

    <div>
    <div class="col-md-12"> <!-- CALENDAR -->

        <!--TEXTBOXES-->
            <b>Your Name:</b><br />
            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox><br />

            <b>Event Date:</b><br />
            <asp:TextBox ID="txtDate" runat="server" ReadOnly="True"></asp:TextBox><br />

            <b>Event Title:</b><br />
            <asp:TextBox ID="txtEventTitle" runat="server"></asp:TextBox><br />

            <b>Event Description:</b><br />
            <asp:TextBox ID="txtEventDescription" runat="server"></asp:TextBox><br />

            <b>Your Email:</b><br />
            <asp:TextBox ID="txtUserEmail" runat="server"></asp:TextBox><br />

            <b>Your Phone Number:</b><br />
            <asp:TextBox ID="txtUserPhone" runat="server"></asp:TextBox><br />

            <asp:Button ID="cmdCreate" runat="server" Text="Create Event" onclick="cmdCreate_Click" /><br />
        <!--/TEXTBOXES-->

        <!--ACTUAL CALENDAR-->
            <asp:Calendar ID="cldrEventCalendar" runat="server" Height="300px" ondayrender="cldrEventCalendar_DayRender" Width="700px"></asp:Calendar>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SportsmensDB">
        </asp:GridView>
        <asp:SqlDataSource ID="SportsmensDB" runat="server" ConnectionString="<%$ ConnectionStrings:sportsmensClubDBConnectionString %>" ProviderName="<%$ ConnectionStrings:sportsmensClubDBConnectionString.ProviderName %>" SelectCommand="SELECT [EventID], [Approved], [EventDate], [EventDescription], [UserEmail], [UserPhone], [UserName], [EventTitle] FROM [EventList] WHERE ([EventID] = @eventID)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="1" Name="EventID" QueryStringField="EventID=@eventID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <!--/ACTUAL CALENDAR-->
        </div>
        <div>
            <b>Enter an Event ID to find out more information:</b><br />
            <asp:TextBox ID="txtRequestedID" runat="server"></asp:TextBox>
            <asp:Button ID="EventSearch" runat="server" Text="Search" OnClick="EventSearch_Click"/><br />

            <asp:Label ID="lblID" visible="false" runat="server">ID: </asp:Label><br />
            <asp:Label ID="lblApproved" visible="false" runat="server">Approved: </asp:Label><br />
            <asp:Label ID="lblDate" visible="false" runat="server">Date: </asp:Label><br />
            <asp:Label ID="lblTitle" visible="false" runat="server">Title: </asp:Label><br />
            <asp:Label ID="lblDescription" visible="false" runat="server">Description: </asp:Label><br />
            <asp:Label ID="lblName" visible="false" runat="server">Name: </asp:Label><br />
            <asp:Label ID="lblEmail" visible="false" runat="server">Email: </asp:Label><br />
            <asp:Label ID="lblPhone" visible="false" runat="server">Phone Number: </asp:Label><br />
        </div>

        <div>
            <b>SQL Test:</b><br />
            <asp:TextBox ID="txtSQLTest" runat="server"></asp:TextBox>
            <asp:Button ID="btnSQLTest" runat="server" Text="Test" OnClick="Test_Click"/><br />
        </div>
    </div>
</asp:Content>
