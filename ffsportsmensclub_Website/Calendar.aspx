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
            <asp:Label ID="lblName" runat="server"><b>Your Name:</b></asp:Label><br />
            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            <asp:Label ID="nameWarning" visible="false" runat="server">*</asp:Label><br />

            <asp:Label ID="lblDate" runat="server"><b>Event Date:</b></asp:Label><br />
            <asp:TextBox ID="txtDate" runat="server" ReadOnly="True"></asp:TextBox>
            <asp:Label ID="dateWarning" visible="false" runat="server">*</asp:Label><br />

            <asp:Label ID="lblTitle" runat="server"><b>Event Title:</b></asp:Label><br />
            <asp:TextBox ID="txtEventTitle" runat="server"></asp:TextBox>
            <asp:Label ID="titleWarning" visible="false" runat="server">*</asp:Label><br />

            <asp:Label ID="lblDesc" runat="server"><b>Event Description:</b></asp:Label><br />
            <asp:TextBox ID="txtEventDescription" runat="server"></asp:TextBox>
            <asp:Label ID="descWarning" visible="false" runat="server">*</asp:Label><br />

            <asp:Label ID="lblEmail" runat="server"><b>Your Email:</b></asp:Label><br />
            <asp:TextBox ID="txtUserEmail" runat="server"></asp:TextBox>
            <asp:Label ID="emailWarning" visible="false" runat="server">*</asp:Label><br />

            <asp:Label ID="lblPhone" runat="server"><b>Your Phone Number:</b></asp:Label><br />
            <asp:TextBox ID="txtUserPhone" runat="server"></asp:TextBox>
            <asp:Label ID="phoneWarning" visible="false" runat="server">*</asp:Label><br />

            <asp:Button ID="cmdCreate" runat="server" Text="Create Event" onclick="cmdCreate_Click" /><br />
        <!--/TEXTBOXES-->

        <!--ACTUAL CALENDAR-->
            <asp:Calendar ID="cldrEventCalendar" runat="server" Height="600px" ondayrender="cldrEventCalendar_DayRender" Width="1000px" CellPadding="5" CellSpacing="10" FirstDayOfWeek="Sunday" NextMonthText="Next" PrevMonthText="Previous">
                <DayHeaderStyle BackColor="#E1E1E1" BorderColor="Gray" BorderStyle="Inset" BorderWidth="5px" Font-Bold="True" Font-Italic="False" Font-Size="Larger" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Top" />
                <DayStyle BackColor="White" BorderColor="Black" BorderStyle="Solid" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Top" />
                <SelectedDayStyle BackColor="#66CCFF" BorderStyle="Outset" BorderWidth="3px" Font-Bold="True" Font-Italic="True" HorizontalAlign="Center" VerticalAlign="Top" />
                <TodayDayStyle BackColor="#FFFFCC" BorderStyle="Outset" BorderWidth="3px" Font-Bold="True" Font-Italic="True" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Top" />
        </asp:Calendar>
        <!--/ACTUAL CALENDAR-->
        </div>
        <div>
            <asp:Label ID="lblSearch" runat="server"><b>SQL Test:</b></asp:Label><br />
            <asp:TextBox ID="txtSQLSearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnSQLSearch" runat="server" Text="Search" OnClick="Search_Click"/><br />
        </div>
        <div>
            <asp:Label ID="lblID" visible="false" runat="server">ID: </asp:Label><br />

            <asp:ListView ID="lstTest" runat="server" DataSourceID="AzureSportsmen">
                <LayoutTemplate>
                    <table runat="server" id="table1" >
                      <tr runat="server" id="itemPlaceholder" ></tr>
                    </table>
                  </LayoutTemplate>
                  <ItemTemplate>
                    <tr runat="server">
                        <td runat="server"><asp:Label ID="lblID" runat="server" Text='<%#Eval("ID") %>' /></td>
                    </tr>
                    <tr runat="server">
                        <td runat="server"><asp:Label ID="lblApproved" runat="server" Text='<%#Eval("Approved") %>' /></td>
                    </tr>
                    <tr runat="server">
                        <td runat="server"><asp:Label ID="lblDate" runat="server" Text='<%#Eval("Date") %>' /></td>
                    </tr>
                    <tr runat="server">
                        <td runat="server"><asp:Label ID="lblTitle" runat="server" Text='<%#Eval("Title") %>' /></td>
                    </tr>
                    <tr runat="server">
                        <td runat="server"><asp:Label ID="lblDescription" runat="server" Text='<%#Eval("Description") %>' /></td>
                    </tr>
                    <tr runat="server">
                        <td runat="server"><asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>' /></td>
                    </tr>
                    <tr runat="server">
                        <td runat="server"><asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>' /></td>
                    </tr>
                    <tr runat="server">
                        <td runat="server"><asp:Label ID="lblPhone" runat="server" Text='<%#Eval("Phone") %>' /></td>
                    </tr>
                  </ItemTemplate>
                  <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
            </asp:ListView>
        </div>
    </div>

    <%-- DATA SOURCE --%>
    <asp:SqlDataSource ID="AzureSportsmen" runat="server" ConnectionString="<%$ ConnectionStrings:FFCP440Student %>" SelectCommand="SELECT [ID], [Approved], [Date], [Title], [Description], [Name], [Email], [Phone] FROM [Events] WHERE ([ID] = @ID)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="ID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>