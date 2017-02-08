<%@ Page Title="Calendar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="ffsportsmensclub_Website.About" %>

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
            <b>Description::</b><br />
            <asp:Label ID="lblDescription" runat="server"></asp:Label><br />

            <b>Event ID:</b><br />
            <asp:TextBox ID="txtEventID" runat="server"></asp:TextBox><br />

            <b>Event Date:</b><br />
            <asp:TextBox ID="txtDate" runat="server" ReadOnly="True"></asp:TextBox><br />

            <b>Event Title:</b><br />
            <asp:TextBox ID="txtEvent" runat="server"></asp:TextBox><br />

            <b>Event Description:</b><br />
            <asp:TextBox ID="txtEventDescription" runat="server"></asp:TextBox><br />

            <asp:Button ID="cmdCreate" runat="server" Text="Create Event" onclick="cmdCreate_Click" /><br />
        <!--/TEXTBOXES-->

        <!--ACTUAL CALENDAR-->
            <asp:Calendar ID="cldrEventCalendar" runat="server" Height="300px" ondayrender="cldrEventCalendar_DayRender" Width="700px"></asp:Calendar>
        <!--/ACTUAL CALENDAR-->
        </div>
    </div>
</asp:Content>
