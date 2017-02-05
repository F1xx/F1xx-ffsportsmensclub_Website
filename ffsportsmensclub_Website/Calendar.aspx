<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="ffsportsmensclub_Website.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Fort Frances Men&#39;s Club</h1>
        <p class="lead">This is the website for the Outdoorsmen's Club. We have a variety of activities for people of all ages. Keep reading to learn more!</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div>
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
    <div class="col-md-12">
            <h2>Put the calendar in here</h2>
        </div>
    </div>

    <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>
</asp:Content>
