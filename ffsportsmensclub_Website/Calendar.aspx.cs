using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ffsportsmensclub_Website
{
    public partial class About : Page
    {
        static int EvID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if page is being rendered for the first time
            if (!IsPostBack)
            {
                if (Request.QueryString["EventDescription"] != null)
                    lblDescription.Text = "Description: " + Request.QueryString["EventDescription"];

                //create a datatable for the events
                DataTable dtEvents = new DataTable();
                dtEvents.Columns.Add(new DataColumn("EventID", typeof(System.Int32)));
                dtEvents.Columns.Add(new DataColumn("EventDate", typeof(System.DateTime)));
                dtEvents.Columns.Add(new DataColumn("EventTitle"));
                dtEvents.Columns.Add(new DataColumn("EventDescription"));
                dtEvents.Columns.Add(new DataColumn("UserName"));
                dtEvents.Columns.Add(new DataColumn("UserEmail"));
                dtEvents.Columns.Add(new DataColumn("UserPhone", typeof(System.Double)));

                DataColumn[] key = new DataColumn[1];
                key[0] = dtEvents.Columns[0];
                lblDate.Text = key[0].ToString();
                dtEvents.PrimaryKey = key;

                //sample events forcefully entered
                dtEvents.Rows.Add(EvID+=1, DateTime.Now.AddDays(10), "Lunch Party", "Address: Mitali Restaurent, 10 New eskaton, Dhaka", "James", "james@shaw.ca", 8077009625);
                dtEvents.Rows.Add(EvID+=1, DateTime.Now.AddDays(7), "Dance Party", "Address: Hotel Purbani, 10 New eskaton, Dhaka", "Frank", "frank@gmail.com", 8077777777);
                dtEvents.Rows.Add(EvID+=1, DateTime.Now.AddDays(2), "Dinner Party", "Address: Seraton, 10 New eskaton, Dhaka", "Jenny", "jenny@hotmail.com", 8075555555);

                //Keep the dtEvents datatable saved.
                //ie if the page is reloaded an entered event in dtEvents will persist
                //in this case it will persist until the program shuts down which is why a database would be better.
                ViewState["dtEvents"] = dtEvents;
            }

            //input the event-handler method Selection_Change for the SelectionChanged Event
            cldrEventCalendar.SelectionChanged += new EventHandler(this.Selection_Change);
        }

        protected void cldrEventCalendar_DayRender(object sender, DayRenderEventArgs e)
        {
            //adds special style to whatever day is the current day
            if (e.Day.IsToday)
            {
                e.Cell.BorderColor = System.Drawing.Color.Blue;
                e.Cell.BackColor = System.Drawing.Color.Aquamarine;
                e.Cell.BorderStyle = BorderStyle.Solid;
                e.Cell.BorderWidth = 4;
            }

            //Disables the ability to select any day earlier than 'today'
            //MAYBE DISABLE THE ABILITY TO SELECT TODAY AS WELL AS THAT IS REALLY SHORT NOTICE
            if(e.Day.Date.CompareTo(DateTime.Now.Date) < 0)
            {
                //rather than being a clickable link it becomes just text
                e.Cell.Text = e.Day.DayNumberText;
            }

            //if dtEvents Exists/is in memory
            if (ViewState["dtEvents"] != null)
            {
                //set the datatable to have the info from the dtEvents table in the ViewState
                DataTable dtEvents = (DataTable)ViewState["dtEvents"];
                //do this for every item in every row in the datatable
                foreach (DataRow oItem in dtEvents.Rows)
                {
                    //convert the eventdates to strings formatted to date format, if that equals a date viable to be on the calendar
                    //this makes it so that all event dates get these formatting rules applied
                    if (Convert.ToDateTime(oItem["EventDate"]).ToString("dd-MM-yyyy") == e.Day.Date.ToString("dd-MM-yyyy"))
                    {
                        //make a literal of a line break so that the label (look below) will be placed under the date
                        //basically whitespace formatting
                        Literal ltrl = new Literal();
                        ltrl.Text = "<br />";
                        e.Cell.Controls.Add(ltrl);

                        //cell styling for events
                        e.Cell.BorderColor = System.Drawing.Color.Aqua;
                        e.Cell.BackColor = System.Drawing.Color.Bisque;
                        e.Cell.BorderStyle = BorderStyle.Solid;
                        e.Cell.BorderWidth = 2;

                        //create a literal which will create a link (in html format) which displays as the event title but can link to a description of the event
                        Literal ltrl2 = new Literal();
                        string evDesc = oItem["EventDescription"].ToString();
                        string evTitle = oItem["EventTitle"].ToString();
                        int evid = Convert.ToInt32(oItem["EventID"]);
                        ltrl2.Text = "<br /><a style='font-size:0.9em; color:Blue' href='Calendar.aspx' onclick='RowGrabber()'" + evid + ")'><b>" + evTitle + "</b></a><br />";
                        e.Cell.Controls.Add(ltrl2);
                    }
                }
            }
        }

        //Create new events.  This is called from the create event button
        protected void cmdCreate_Click(object sender, EventArgs e)
        {
            //if dtEvents Exists/is in memory
            if (ViewState["dtEvents"] != null)
            {
                //this updates ensuring the most current version of this table is the one being added to
                DataTable dtEvents = (DataTable)ViewState["dtEvents"];
                //adding of the event
                dtEvents.Rows.Add(EvID += 1, Convert.ToDateTime(txtDate.Text), txtEventTitle.Text, txtEventDescription.Text, txtUserName.Text, txtUserEmail.Text, Convert.ToDouble(txtUserPhone.Text));
                //update the ViewState with the new one to be kept in memory (includes the new event in other words)
                ViewState["dtEvents"] = dtEvents;

                //Test if the events are properly created & stored
                //foreach (DataRow oItem in dtEvents.Rows)
                //{
                //    lblID.Text = EvID.ToString();
                //    lblDate.Text = oItem["EventDate"].ToString();
                //    lblTitle.Text = oItem["EventTitle"].ToString();
                //    lblDescription.Text = oItem["EventDescription"].ToString();
                //    lblName.Text = oItem["UserName"].ToString();
                //    lblEmail.Text = oItem["UserEmail"].ToString();
                //    lblPhone.Text = oItem["UserPhone"].ToString();

                //}
            }
        }

        //Function to find specific row (each row being a separate event) and display it(currently only displays to my test labels
        protected void RowGrabber(int ID)
        {
            DataTable dtEvents = (DataTable)ViewState["dtEvents"];

            int row = 3;
            DataRow foundRow = dtEvents.Rows.Find(row);

            if (foundRow != null)
            {
                lblID.Text = "ID: " + foundRow[0].ToString();
                lblDate.Text = "Date: " + foundRow[1].ToString();
                lblTitle.Text = "Title: " + foundRow[2].ToString();
                lblDescription.Text = "Description: " + foundRow[3].ToString();
                lblName.Text = "Name: " + foundRow[4].ToString();
                lblEmail.Text = "Emai: " + foundRow[5].ToString();
                lblPhone.Text = "Phone Number: " + foundRow[6].ToString();
            }
            else
            {
                lblID.Text = "fuck";
            }
        }

        //function to change the text in the textbox with whatever date gets selected (text box is read only so this is the only way to choose a date
        void Selection_Change(Object sender, EventArgs e)
        {
            txtDate.Text = cldrEventCalendar.SelectedDate.ToShortDateString();
        }

        //void btnTest_Click(object sender, EventArgs e)
        //{
        //    RowGrabber(3);
        //}
    }
}