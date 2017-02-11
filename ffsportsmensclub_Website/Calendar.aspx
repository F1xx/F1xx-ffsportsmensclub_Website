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
        <!--/ACTUAL CALENDAR-->
        </div>
        <div>
            <asp:Label ID="lblID" runat="server">ID: </asp:Label><br />
            <asp:Label ID="lblDate" runat="server">Date: </asp:Label><br />
            <asp:Label ID="lblTitle" runat="server">Title: </asp:Label><br />
            <asp:Label ID="lblDescription" runat="server">Description: </asp:Label><br />
            <asp:Label ID="lblName" runat="server">Name: </asp:Label><br />
            <asp:Label ID="lblEmail" runat="server">Email: </asp:Label><br />
            <asp:Label ID="lblPhone" runat="server">Phone Number: </asp:Label><br />
        </div>
    </div>
</asp:Content>
