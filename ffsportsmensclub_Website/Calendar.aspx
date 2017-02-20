<%@ Page Title="Calendar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="ffsportsmensclub_Website.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script runat="server">
        void Page_Load(Object sender, EventArgs e)
        {
            // Manually register the event-handling method for
            // the Click event of the Button controls.
            //Changing naming scheme of buttons from main page, so as to avoid any overlaps
            ButtonEdit.Click += new EventHandler(this.ButtonEdit_Click);
            ButtonChange.Click += new EventHandler(this.ButtonChange_Click);


            //All the below ifs will check is if the sessions are null or not
            //if not, will update the text within to what the value is
            //will retain throughout the changing of pages
            //will check later to see if its possible to make it a simplified bit of code
            if (Session["txtChange1"] != null)
            {
                thisTitle.InnerText = Session["txtChange1"].ToString();
            }
            if (Session["txtChange2"] != null)
            {
                mainContent.Text = Session["txtChange2"].ToString();
            }
        }

        void ButtonEdit_Click(Object sender, EventArgs e)
        {
            // When the button is clicked,
            // make it invisible, and make other button
            // visible

            Button clickedButton = (Button)sender;
            clickedButton.Visible = false;
            ButtonChange.Visible = true;
            textChange1.Text = thisTitle.InnerText;
            textChange2.Text = mainContent.Text;

            // Display the textbox for editing text.
            textChange1.Visible = true;
            textChange2.Visible = true;
            thisTitle.Visible = false;
            mainContent.Visible = false;
        }


        void ButtonChange_Click(Object sender, EventArgs e)
        {
            // When the button is clicked,
            // make it invisible, and make other button
            // visible
            Button clickedButton = (Button)sender;
            clickedButton.Visible = false;
            ButtonEdit.Visible = true;

            //hide text box for updating text
            textChange1.Visible = false;
            textChange2.Visible = false;
            thisTitle.Visible = true;
            mainContent.Visible = true;

            //update text of page
            //will change sessions, as they can stay within the lifetime of the site being online 
            Session["txtChange1"] = textChange1.Text;
            Session["txtChange2"] = textChange2.Text;
            thisTitle.InnerText = textChange1.Text;
            mainContent.Text = textChange2.Text;
        }
    </script>

    <div class="container">
    <div class="col-md-12">
            <h2 runat="server" id="thisTitle">Wanting to go ahead and book something?</h2>
            <asp:Label runat="server" ID="mainContent" Text="
                Look no further than this page right here! All you have to do is insert your information below, as well as all the information regarding 
                what times you were looking at and for how long. Once you submit your information, one of our members will take a look at the submission and
                 get back to you about whether or not you can obtain that time or not. Until then, feel free to take a look around the site and see what else 
                as a club we can offer to you!">
            </asp:Label>

            <asp:TextBox ID="textChange1" runat="server" Visible="false" Width="100%" TextMode="MultiLine" Wrap="true" Rows="3"></asp:TextBox><br />
            <asp:TextBox ID="textChange2" runat="server" Visible="false" Width="100%" TextMode="MultiLine" Wrap="true" Rows="10"></asp:TextBox><br />
            <asp:Button id="ButtonChange" runat="server"  Text="update" OnClick="ButtonChange_Click" Visible="false"/>
            <asp:Button ID="ButtonEdit" runat="server" Text="Edit" OnClick="ButtonEdit_Click" />
        </div>
    </div>

    <div>
    <div class="col-md-12">
            <h2>Put the calendar in here</h2>
        </div>
    </div>

    <%-- Here is a log in view for yourself monsieur Fixx --%>
    <%-- Anonymous template is for when someone is not logged in; what they will see --%>
    <%-- Logged in template is used for when you want something to be seen when someone is indeed logged in --%>
    <div class="container" runat="server" id="testingView">
        <div class="col-md-12">
           <asp:LoginView id="loginView1" runat="server">
        <AnonymousTemplate>
        please login now to see more stuff here
        </AnonymousTemplate>
        <LoggedInTemplate>
        Welcome , you are now logged in! Gz!
        </LoggedInTemplate>
        </asp:LoginView>

        </div>
    </div>

</asp:Content>
