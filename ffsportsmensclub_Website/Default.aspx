<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ffsportsmensclub_Website._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
            
    <script runat="server">

        void Page_Load(Object sender, EventArgs e)
        {
            // Manually register the event-handling method for
            // the Click event of the Button controls.
            ButtonTest.Click += new EventHandler(this.ButtonTest_Click);
            ButtonUpdate.Click += new EventHandler(this.ButtonUpdate_Click);

            ButtonTest2.Click += new EventHandler(this.ButtonTest2_Click);
            ButtonUpdate2.Click += new EventHandler(this.ButtonUpdate2_Click);

            if (Session["txtUpdate1"] != null)
            {
                title1.InnerText = Session["txtUpdate1"].ToString();
            }
            if (Session["txtUpdate2"] != null)
            {
                textArea2.Text = Session["txtUpdate2"].ToString();
            }
            if (Session["txtUpdate3"] != null)
            {
                title2.InnerText = Session["txtUpdate3"].ToString();
            }
            if (Session["txtUpdate4"] != null)
            {
                textArea3.Text = Session["txtUpdate4"].ToString();
            }
        }

        //This is for the first column on the main page
        void ButtonTest_Click(Object sender,
                               EventArgs e)
        {
            // When the button is clicked,
            // make it invisible, and make other button
            // visible

            Button clickedButton = (Button)sender;
            clickedButton.Visible = false;
            ButtonUpdate.Visible = true;
            textUpdate1.Text = title1.InnerText;
            textUpdate2.Text = textArea2.Text;

            // Display the textbox for editing text.
            textUpdate1.Visible = true;
            textUpdate2.Visible = true;
            title1.Visible = false;
            textArea2.Visible = false;
        }

        void ButtonUpdate_Click(Object sender,
                           EventArgs e)
        {
            // When the button is clicked,
            // make it invisible, and make other button
            // visible
            Button clickedButton = (Button)sender;
            clickedButton.Visible = false;
            ButtonTest.Visible = true;

            //hide text box for updating text
            textUpdate1.Visible = false;
            textUpdate2.Visible = false;
            title1.Visible = true;
            textArea2.Visible = true;

            //update text of page
            //will change this to a var 
            Session["txtUpdate1"] = textUpdate1.Text;
            Session["txtUpdate2"] = textUpdate2.Text;
            title1.InnerText = textUpdate1.Text;
            textArea2.Text = textUpdate2.Text;
        }


        //This is for the second column on the main page
        void ButtonTest2_Click(Object sender,
                               EventArgs e)
        {
            // When the button is clicked,
            // make it invisible, and make other button
            // visible

            Button clickedButton = (Button)sender;
            clickedButton.Visible = false;
            ButtonUpdate2.Visible = true;
            textUpdate3.Text = title2.InnerText;
            textUpdate4.Text = textArea3.Text;

            // Display the textbox for editing text.
            textUpdate3.Visible = true;
            textUpdate4.Visible = true;
            title2.Visible = false;
            textArea3.Visible = false;
        }

        void ButtonUpdate2_Click(Object sender,
                           EventArgs e)
        {
            // When the button is clicked,
            // make it invisible, and make other button
            // visible
            Button clickedButton = (Button)sender;
            clickedButton.Visible = false;
            ButtonTest2.Visible = true;

            //hide text box for updating text
            textUpdate3.Visible = false;
            textUpdate4.Visible = false;
            title2.Visible = true;
            textArea3.Visible = true;

            //update text of page
            //will change this to a var 
            Session["txtUpdate3"] = textUpdate3.Text;
            Session["txtUpdate4"] = textUpdate4.Text;
            title2.InnerText = textUpdate3.Text;
            textArea3.Text = textUpdate4.Text;
        }

        //This is for the second row / first column on the main page



</script>

    <div class="container">
    <div class="row">
        <div class="col-md-6">
            <h2 runat="server" id="title1">Who are we and what do we do?</h2>
            <asp:Label  id="textArea2" runat="server" Text="Have you been thinking to yourself that the Fort Frances and surrounding areas don't have a club for the outdoors like you have always been 
                looking for? Have you ever wondered what it would be like to work with people who have been in the field for decades, and to see just what 
                they can teach you that a classroom can't? Look no further than the Fort Frances Sportsmen's Club! With a wide range of activities for people 
                of all ages and sexes, you can always be sure that no matter what is going on, there's something for you!">
            </asp:Label>
            <asp:TextBox ID="textUpdate1" runat="server" Visible="false" Width="100%" TextMode="MultiLine" Wrap="true" Rows="3"></asp:TextBox><br />
            <asp:TextBox ID="textUpdate2" runat="server" Visible="false" Width="100%" TextMode="MultiLine" Wrap="true" Rows="10"></asp:TextBox><br />
            <asp:Button id="ButtonUpdate" runat="server"  Text="update" OnClick="ButtonUpdate_Click" Visible="false"/>
            <asp:Button ID="ButtonTest" runat="server" Text="Edit" OnClick="ButtonTest_Click" />
        </div>
        <div class="col-md-6">
            <h2 runat="server" id="title2">What all is there to do?</h2>
            <asp:Label runat="server" id="textArea3" Text="
                What isn't there to do? With a range of activities from archery and hunting, to fishing or beaver damn breaking, and bird house building, there's nothing 
                we won't do if it's outdoors! Many of the members of the club have been actively in this field throughout their entire life, while some others are just getting 
                started! We want everyone to enjoy the great outdoors as much as we do, so you can be sure that if you think you won't fit in, think again! We go out with classrooms 
                from across the district doing snowshoeing, birdhouse building, and many other community activities. There's simply too much to list on this website! So go ahead and 
                contact us if you have more information, and go ahead and see what other fun and engaging activities we can offer you!">
            </asp:Label>
            <asp:TextBox ID="textUpdate3" runat="server" Visible="false" Width="100%" TextMode="MultiLine" Wrap="true" Rows="3"></asp:TextBox><br />
            <asp:TextBox ID="textUpdate4" runat="server" Visible="false" Width="100%" TextMode="MultiLine" Wrap="true" Rows="10"></asp:TextBox><br />
            <asp:Button id="ButtonUpdate2" runat="server"  Text="update" OnClick="ButtonUpdate2_Click" Visible="false"/>
            <asp:Button ID="ButtonTest2" runat="server" Text="Edit" OnClick="ButtonTest2_Click" />
        </div>
    </div>
        </div>

    <div class="container">
        <div class="page-header">
            Recent Activities
        </div>
    </div>

    <div class="container">
    <div class="row">
        <div class="col-md-3">
            <img src="Images/grandad1.JPG" class="img-responsive" alt="Image showcasing a classroom outdoors" />
            <h2>Classroom adventures</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-3">
            <img src="Images/grandad2.jpg" class="img-responsive" alt="Image showcasing more stuff" />
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-3">
            <img src="Images/grandad3.jpg" class="img-responsive" alt="Image showcasing hunting" />
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-3">
            <img src="Images/grandad4.jpg" class="img-responsive" alt="Image showcasing a tree" />
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>
        </div>

    <div class="container">
    <div class="row">
        <div class="col-md-4">
            <h2>Getting started / added words here blah blah</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Getting started / added words here blah blah</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Getting started / added words here blah blah</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
    </div>
        </div>
</asp:Content>
