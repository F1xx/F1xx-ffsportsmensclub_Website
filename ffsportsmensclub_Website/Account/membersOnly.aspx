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



    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Here you can update the information on the site!</h1>
                <p>All you have to do to update the information on the site is to take the existing text within the bottom textareas, and set them to whatever the new text 
                    you want to set up is. You can change the images on the page as well! What you can't change here, however, is the layout.
                     Once you have everything done , you can go ahead and select the bottom "Save" button 
                    at the bottom of the page, and that will then make the information appear on the main "Home" page on the site!
                </p>
            </div>
        </div>
    </div>




    <div class="container">
    <div class="row">
        <div class="col-md-6">
            <h2>The club you have been looking for!</h2>
            <textarea style="width:100%" id="content" runat="server">
               <asp:ScriptManager runat="server"></asp:ScriptManager>
                </textarea>
        </div>
        <div class="col-md-6">
            <h2>What all is there to do?</h2>
            <p>
                What isn't there to do? With a range of activities from archery and hunting, to fishing or beaver damn breaking, and bird house building, there's nothing 
                we won't do if it's outdoors! Many of the members of the club have been actively in this field throughout their entire life, while some others are just getting 
                started! We want everyone to enjoy the great outdoors as much as we do, so you can be sure that if you think you won't fit in, think again! We go out with classrooms 
                from across the district doing snowshoeing, birdhouse building, and many other community activities. There's simply too much to list on this website! So go ahead and 
                contact us if you have more information, and go ahead and see what other fun and engaging activities we can offer you!
            </p>
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
