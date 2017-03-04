<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ffsportsmensclub_Website._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="jumbotron">
            <h1>Fort Frances Men&#39;s Club</h1>
             <p class="lead">Welcome to the Fort Frances Sportsmen's Club!</p>
             <p><a href="ClubProfile.aspx" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
            </div>
    </div>        

    

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
            
        </div>
        <div class="col-md-3">
            <img src="Images/grandad2.jpg" class="img-responsive" alt="Image showcasing more stuff" />
            <h2 runat="server" id="title4">Dam Busting</h2>
            <asp:Label runat="server" ID="textArea5" Text="
                Here is an image depicting the Sportsmen's Club participating in a beaver dam break. We do this frequently, as it helps maintain a safe water level throughout the area, and
                 helps to maintain population of various wildlife species as well. The beavers will build again, and this will need to occur again. It is safe for the beavers and for 
                everyone else involved as well.">
            </asp:Label>
            
        </div>
        <div class="col-md-3">
            <img src="Images/grandad3.jpg" class="img-responsive" alt="Image showcasing hunting" />
            <h2 runat="server" id="title5">Birdhouse Building</h2>
            <asp:Label runat="server" ID="textArea6" Text="
                Here you can see a class from J.W. Walker School hanging birdhouses across our areas to help maintain the bird populations. We build many different types of birdhouses for classes, 
                and encourage them to come out with use and hang them up, so when they drive by and see birds in them, they can know that had a positive impact on the bird population within our 
                area. Most birds that we look for are Blue Jays.">
            </asp:Label>
            
        </div>
        <div class="col-md-3">
            <img src="Images/grandad4.jpg" class="img-responsive" alt="Image showcasing a tree" />
            <h2 runat="server" id="title6">Fun All Year Round!</h2>
            <asp:Label runat="server" ID="textArea7" Text="
                Our activities range from summer birdhouses to winter snowshoeing, and more! But this isn't only limited to just our members, oh no! We encourage you to bring out the whole family 
                when you're a part of the club. We want to get to know the whole family, not just yourself. And we make sure everyone has something to do, even the most little ones you may have 
                growing up! That's why we like having an annual snow ride, just to have a fun day out. ">
            </asp:Label>
            

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
