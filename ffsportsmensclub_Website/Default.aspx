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

            ButtonTest3.Click += new EventHandler(this.ButtonTest3_Click);
            ButtonUpdate3.Click += new EventHandler(this.ButtonUpdate3_Click);

            ButtonTest4.Click += new EventHandler(this.ButtonTest4_Click);
            ButtonUpdate4.Click += new EventHandler(this.ButtonUpdate4_Click);

            ButtonTest5.Click += new EventHandler(this.ButtonTest5_Click);
            ButtonUpdate5.Click += new EventHandler(this.ButtonUpdate5_Click);

            ButtonTest6.Click += new EventHandler(this.ButtonTest6_Click);
            ButtonUpdate6.Click += new EventHandler(this.ButtonUpdate6_Click);

            //All the below ifs will check is if the sessions are null or not
            //if not, will update the text within to what the value is
            //will retain throughout the changing of pages
            //will check later to see if its possible to make it a simplified bit of code
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
            if (Session["txtUpdate5"] != null)
            {
                title3.InnerText = Session["txtUpdate5"].ToString();
            }
            if (Session["txtUpdate6"] != null)
            {
                textArea4.Text = Session["txtUpdate6"].ToString();
            }
            if (Session["txtUpdate7"] != null)
            {
                title4.InnerText = Session["txtUpdate7"].ToString();
            }
            if (Session["txtUpdate8"] != null)
            {
                textArea5.Text = Session["txtUpdate8"].ToString();
            }
            if (Session["txtUpdate9"] != null)
            {
                title5.InnerText = Session["txtUpdate9"].ToString();
            }
            if (Session["txtUpdate10"] != null)
            {
                textArea6.Text = Session["txtUpdate10"].ToString();
            }
            if (Session["txtUpdate11"] != null)
            {
                title6.InnerText = Session["txtUpdate11"].ToString();
            }
            if (Session["txtUpdate12"] != null)
            {
                textArea7.Text = Session["txtUpdate12"].ToString();
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
            //will change sessions, as they can stay within the lifetime of the site being online 
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
            //will change sessions, as they can stay within the lifetime of the site being online
            Session["txtUpdate3"] = textUpdate3.Text;
            Session["txtUpdate4"] = textUpdate4.Text;
            title2.InnerText = textUpdate3.Text;
            textArea3.Text = textUpdate4.Text;
        }

        //This is for the second row / first column on the main page
        void ButtonTest3_Click(Object sender,
                               EventArgs e)
        {
            // When the button is clicked,
            // make it invisible, and make other button
            // visible

            Button clickedButton = (Button)sender;
            clickedButton.Visible = false;
            ButtonUpdate3.Visible = true;
            textUpdate5.Text = title3.InnerText;
            textUpdate6.Text = textArea4.Text;

            // Display the textbox for editing text.
            textUpdate5.Visible = true;
            textUpdate6.Visible = true;
            title3.Visible = false;
            textArea4.Visible = false;
        }

        void ButtonUpdate3_Click(Object sender,
                           EventArgs e)
        {
            // When the button is clicked,
            // make it invisible, and make other button
            // visible
            Button clickedButton = (Button)sender;
            clickedButton.Visible = false;
            ButtonTest3.Visible = true;

            //hide text box for updating text
            textUpdate5.Visible = false;
            textUpdate6.Visible = false;
            title3.Visible = true;
            textArea4.Visible = true;

            //update text of page
            //will change sessions, as they can stay within the lifetime of the site being online
            Session["txtUpdate5"] = textUpdate5.Text;
            Session["txtUpdate6"] = textUpdate6.Text;
            title3.InnerText = textUpdate5.Text;
            textArea4.Text = textUpdate6.Text;
        }
        

        //This is for the second row / second column on the main page
        void ButtonTest4_Click(Object sender,
                               EventArgs e)
        {
            // When the button is clicked,
            // make it invisible, and make other button
            // visible

            Button clickedButton = (Button)sender;
            clickedButton.Visible = false;
            ButtonUpdate3.Visible = true;
            textUpdate7.Text = title4.InnerText;
            textUpdate8.Text = textArea5.Text;

            // Display the textbox for editing text.
            textUpdate7.Visible = true;
            textUpdate8.Visible = true;
            title4.Visible = false;
            textArea5.Visible = false;
        }

        void ButtonUpdate4_Click(Object sender,
                           EventArgs e)
        {
            // When the button is clicked,
            // make it invisible, and make other button
            // visible
            Button clickedButton = (Button)sender;
            clickedButton.Visible = false;
            ButtonTest4.Visible = true;

            //hide text box for updating text
            textUpdate7.Visible = false;
            textUpdate8.Visible = false;
            title4.Visible = true;
            textArea5.Visible = true;

            //update text of page
            //will change sessions, as they can stay within the lifetime of the site being online
            Session["txtUpdate7"] = textUpdate7.Text;
            Session["txtUpdate8"] = textUpdate8.Text;
            title4.InnerText = textUpdate7.Text;
            textArea5.Text = textUpdate8.Text;
        }

        //This is for the second row/third column on the main page
         void ButtonTest5_Click(Object sender,
                               EventArgs e)
        {
            // When the button is clicked,
            // make it invisible, and make other button
            // visible

            Button clickedButton = (Button)sender;
            clickedButton.Visible = false;
            ButtonUpdate5.Visible = true;
            textUpdate9.Text = title5.InnerText;
            textUpdate10.Text = textArea6.Text;

            // Display the textbox for editing text.
            textUpdate9.Visible = true;
            textUpdate10.Visible = true;
            title5.Visible = false;
            textArea6.Visible = false;
        }

        void ButtonUpdate5_Click(Object sender,
                           EventArgs e)
        {
            // When the button is clicked,
            // make it invisible, and make other button
            // visible
            Button clickedButton = (Button)sender;
            clickedButton.Visible = false;
            ButtonTest5.Visible = true;

            //hide text box for updating text
            textUpdate9.Visible = false;
            textUpdate10.Visible = false;
            title5.Visible = true;
            textArea6.Visible = true;

            //update text of page
            //will change sessions, as they can stay within the lifetime of the site being online
            Session["txtUpdate9"] = textUpdate9.Text;
            Session["txtUpdate10"] = textUpdate10.Text;
            title5.InnerText = textUpdate9.Text;
            textArea6.Text = textUpdate10.Text;
        }

        //This is for the second row / fourth column on the main page
        void ButtonTest6_Click(Object sender,
                               EventArgs e)
        {
            // When the button is clicked,
            // make it invisible, and make other button
            // visible

            Button clickedButton = (Button)sender;
            clickedButton.Visible = false;
            ButtonUpdate6.Visible = true;
            textUpdate11.Text = title6.InnerText;
            textUpdate12.Text = textArea7.Text;

            // Display the textbox for editing text.
            textUpdate11.Visible = true;
            textUpdate12.Visible = true;
            title6.Visible = false;
            textArea7.Visible = false;
        }

        void ButtonUpdate6_Click(Object sender,
                           EventArgs e)
        {
            // When the button is clicked,
            // make it invisible, and make other button
            // visible
            Button clickedButton = (Button)sender;
            clickedButton.Visible = false;
            ButtonTest6.Visible = true;

            //hide text box for updating text
            textUpdate11.Visible = false;
            textUpdate12.Visible = false;
            title6.Visible = true;
            textArea7.Visible = true;

            //update text of page
            //will change sessions, as they can stay within the lifetime of the site being online
            Session["txtUpdate11"] = textUpdate11.Text;
            Session["txtUpdate12"] = textUpdate12.Text;
            title6.InnerText = textUpdate11.Text;
            textArea7.Text = textUpdate12.Text;
        }


</script>

    <div class="container">
        <%-- First row of text and functions for updating, completed for now --%>
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
    <%-- Second row of text and functions, beginning work now --%>
    <%-- Updated content and functions and whatnot --%>
    <div class="container">
    <div class="row">
        <div class="col-md-3">
            <img src="Images/grandad1.JPG" class="img-responsive" alt="Image showcasing a classroom outdoors" />
            <h2 runat="server" id="title3">Classroom adventures</h2>
            <asp:Label runat="server" ID="textArea4" Text="
                Pictured here is a class of Mrs. Bonervicker's Grade 8 class going on a field trip throughout the districts surrounding Fort Frances, On., with Henry Miller leading them.
                 The students were taught about 
                various different forms of plants throughout our area of the world, how to determine what berries are safe for eating, how to build a safe camp fire,
                 and just generally got to enjoy a nice day out in 
                the sun!">
            </asp:Label>
            <asp:TextBox ID="textUpdate5" runat="server" Visible="false" Width="100%" TextMode="MultiLine" Wrap="true" Rows="3"></asp:TextBox><br />
            <asp:TextBox ID="textUpdate6" runat="server" Visible="false" Width="100%" TextMode="MultiLine" Wrap="true" Rows="10"></asp:TextBox><br />
            <asp:Button id="ButtonUpdate3" runat="server"  Text="update" OnClick="ButtonUpdate3_Click" Visible="false"/>
            <asp:Button ID="ButtonTest3" runat="server" Text="Edit" OnClick="ButtonTest3_Click" />
        </div>
        <div class="col-md-3">
            <img src="Images/grandad2.jpg" class="img-responsive" alt="Image showcasing more stuff" />
            <h2 runat="server" id="title4">Dam Busting</h2>
            <asp:Label runat="server" ID="textArea5" Text="
                Here is an image depicting the Sportsmen's Club participating in a beaver dam break. We do this frequently, as it helps maintain a safe water level throughout the area, and
                 helps to maintain population of various wildlife species as well. The beavers will build again, and this will need to occur again. It is safe for the beavers and for 
                everyone else involved as well.">
            </asp:Label>
            <asp:TextBox ID="textUpdate7" runat="server" Visible="false" Width="100%" TextMode="MultiLine" Wrap="true" Rows="3"></asp:TextBox><br />
            <asp:TextBox ID="textUpdate8" runat="server" Visible="false" Width="100%" TextMode="MultiLine" Wrap="true" Rows="10"></asp:TextBox><br />
            <asp:Button id="ButtonUpdate4" runat="server"  Text="update" OnClick="ButtonUpdate4_Click" Visible="false"/>
            <asp:Button ID="ButtonTest4" runat="server" Text="Edit" OnClick="ButtonTest4_Click" />
        </div>
        <div class="col-md-3">
            <img src="Images/grandad3.jpg" class="img-responsive" alt="Image showcasing hunting" />
            <h2 runat="server" id="title5">Birdhouse Building</h2>
            <asp:Label runat="server" ID="textArea6" Text="
                Here you can see a class from J.W. Walker School hanging birdhouses across our areas to help maintain the bird populations. We build many different types of birdhouses for classes, 
                and encourage them to come out with use and hang them up, so when they drive by and see birds in them, they can know that had a positive impact on the bird population within our 
                area. Most birds that we look for are Blue Jays.">
            </asp:Label>
            <asp:TextBox ID="textUpdate9" runat="server" Visible="false" Width="100%" TextMode="MultiLine" Wrap="true" Rows="3"></asp:TextBox><br />
            <asp:TextBox ID="textUpdate10" runat="server" Visible="false" Width="100%" TextMode="MultiLine" Wrap="true" Rows="10"></asp:TextBox><br />
            <asp:Button id="ButtonUpdate5" runat="server"  Text="update" OnClick="ButtonUpdate5_Click" Visible="false"/>
            <asp:Button ID="ButtonTest5" runat="server" Text="Edit" OnClick="ButtonTest5_Click" />
        </div>
        <div class="col-md-3">
            <img src="Images/grandad4.jpg" class="img-responsive" alt="Image showcasing a tree" />
            <h2 runat="server" id="title6">Fun All Year Round!</h2>
            <asp:Label runat="server" ID="textArea7" Text="
                Our activities range from summer birdhouses to winter snowshoeing, and more! But this isn't only limited to just our members, oh no! We encourage you to bring out the whole family 
                when you're a part of the club. We want to get to know the whole family, not just yourself. And we make sure everyone has something to do, even the most little ones you may have 
                growing up! That's why we like having an annual snow ride, just to have a fun day out. ">
            </asp:Label>
            <asp:TextBox ID="textUpdate11" runat="server" Visible="false" Width="100%" TextMode="MultiLine" Wrap="true" Rows="3"></asp:TextBox><br />
            <asp:TextBox ID="textUpdate12" runat="server" Visible="false" Width="100%" TextMode="MultiLine" Wrap="true" Rows="10"></asp:TextBox><br />
            <asp:Button id="ButtonUpdate6" runat="server"  Text="update" OnClick="ButtonUpdate6_Click" Visible="false"/>
            <asp:Button ID="ButtonTest6" runat="server" Text="Edit" OnClick="ButtonTest6_Click" />

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
