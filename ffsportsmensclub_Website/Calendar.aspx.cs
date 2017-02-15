using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//required for the datatables
using System.Data;

namespace ffsportsmensclub_Website
{
    public partial class About : Page
    {
        //create a static in so that it can be used by all functions and all of them update the same number.
        //This makes it so that no matter what creates a new event or deletes an event the number will be the same
        //deleting an event may prove annoying
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
                dtEvents.Columns.Add(new DataColumn("Approved", typeof(System.Boolean)));
                dtEvents.Columns.Add(new DataColumn("EventDate", typeof(System.DateTime)));
                dtEvents.Columns.Add(new DataColumn("EventTitle"));
                dtEvents.Columns.Add(new DataColumn("EventDescription"));
                dtEvents.Columns.Add(new DataColumn("UserName"));
                dtEvents.Columns.Add(new DataColumn("UserEmail"));
                dtEvents.Columns.Add(new DataColumn("UserPhone", typeof(System.Double)));

                //create the Primary keys for the dtEvents table, the primary Key being their IDs
                DataColumn[] keys = new DataColumn[2];
                keys[0] = dtEvents.Columns[0];
                keys[1] = dtEvents.Columns[1];
                //lblDate.Text = keys[0].ToString();
                dtEvents.PrimaryKey = keys;

                //sample events forcefully entered
                dtEvents.Rows.Add(EvID+=1, true, DateTime.Now.AddDays(10), "Lunch Party", "Address: Mitali Restaurent, 10 New eskaton, Dhaka", "James", "james@shaw.ca", 8077009625);
                dtEvents.Rows.Add(EvID+=1, true, DateTime.Now.AddDays(7), "Dance Party", "Address: Hotel Purbani, 10 New eskaton, Dhaka", "Frank", "frank@gmail.com", 8077777777);
                dtEvents.Rows.Add(EvID+=1, true, DateTime.Now.AddDays(2), "Dinner Party", "Address: Seraton, 10 New eskaton, Dhaka", "Jenny", "jenny@hotmail.com", 8075555555);

                //Keep the dtEvents datatable saved.
                //ie if the page is reloaded an entered event in dtEvents will persist
                //in this case it will persist until the program shuts down which is why a database would be better.
                ViewState["dtEvents"] = dtEvents;
            }

            //input the event-handler methods
            cldrEventCalendar.SelectionChanged += new EventHandler(this.Selection_Change);
            EventSearch.Click += new EventHandler(this.EventSearch_Click);
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
                        //only applies display stuff to events that have been approved ie. Non-approved events are invisible
                        if (Convert.ToBoolean(oItem["Approved"]))
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

                            //create a literal which will create a label of the event name and its ID.
                            //I want to make this work as a link but no luck
                        
                            Literal ltrl2 = new Literal();
                            string evDesc = oItem["EventDescription"].ToString();
                            string evTitle = oItem["EventTitle"].ToString();
                            int evid = Convert.ToInt32(oItem["EventID"]);
                            ltrl2.Text = "<br /><label runat='server' style='font-size:0.9em; color:Blue' href='#' onClick='RowGrabber_Click'><b>" + evTitle + "</b><br />ID: " + evid + "</label><br />";
                            e.Cell.Controls.Add(ltrl2);
                        }
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
                dtEvents.Rows.Add(EvID += 1, false, Convert.ToDateTime(txtDate.Text), txtEventTitle.Text, txtEventDescription.Text, txtUserName.Text, txtUserEmail.Text, Convert.ToDouble(txtUserPhone.Text));
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
            //Make sure the ID being tried is within existing event IDs
            if (ID <= EvID && ID >= 1)
            {
                //loading the Table
                DataTable dtEvents = (DataTable)ViewState["dtEvents"];

                //checks if the searched event is approved yet.  If it isn't you geta message saying so, else it will actually do the search.
                object[] rowcheck = new object[2];
                rowcheck[0] = ID;
                rowcheck[1] = false;
                DataRow foundRowCheck = dtEvents.Rows.Find(rowcheck);
                if (foundRowCheck != null)
                {
                    lblID.Text = "That Event is pending approval.  Please check back later.";
                    lblID.Visible = true;
                    lblApproved.Visible = false;
                    lblDate.Visible = false;
                    lblTitle.Visible = false;
                    lblDescription.Visible = false;
                    lblName.Visible = false;
                    lblEmail.Visible = false;
                    lblPhone.Visible = false;
                }
                else
                {
                    object[] row = new object[2];
                    row[0] = ID;
                    row[1] = true;

                    //This is the search.  If the Find Method can find the value in 'row' within the table's Primary Key then it will return the row
                    DataRow foundRow = dtEvents.Rows.Find(row);

                    //this if just checks if the find succeeded.  If the find fails then foundRow is null otherwise it contains all of the columns of that row
                    if (foundRow != null)
                    {
                        //Assign the columns to the appropriate Labels (Not super liking this form as it can be ruined if the column order Changes but it works for now)
                        lblID.Text = "ID: " + foundRow[0].ToString();
                        lblID.Visible = true;
                        lblApproved.Text = "Approved: " + foundRow[1].ToString();
                        lblApproved.Visible = true;
                        lblDate.Text = "Date: " + foundRow[2].ToString();
                        lblDate.Visible = true;
                        lblTitle.Text = "Title: " + foundRow[3].ToString();
                        lblTitle.Visible = true;
                        lblDescription.Text = "Description: " + foundRow[4].ToString();
                        lblDescription.Visible = true;
                        lblName.Text = "Name: " + foundRow[5].ToString();
                        lblName.Visible = true;
                        lblEmail.Text = "Emai: " + foundRow[6].ToString();
                        lblEmail.Visible = true;
                        lblPhone.Text = "Phone Number: " + foundRow[7].ToString();
                        lblPhone.Visible = true;
                    }
                    else
                    {
                        //This shouldnever be triggered due to the if outside of this if
                        lblID.Text = "Sorry, something must have gone wrong.  Please Try Again";
                        lblID.Visible = true;
                        lblApproved.Visible = false;
                        lblDate.Visible = false;
                        lblTitle.Visible = false;
                        lblDescription.Visible = false;
                        lblName.Visible = false;
                        lblEmail.Visible = false;
                        lblPhone.Visible = false;
                    }
                }
                
            }
            else
            {
                //if they try to enter an ID that is either more than the largest ID or less than the smallest they hit this
                lblID.Text = "The Event ID you entered is invalid.  Please Try Again";
                lblID.Visible = true;
                lblApproved.Visible = false;
                lblDate.Visible = false;
                lblTitle.Visible = false;
                lblDescription.Visible = false;
                lblName.Visible = false;
                lblEmail.Visible = false;
                lblPhone.Visible = false;
            }
        }

        //function to change the text in the textbox with whatever date gets selected (text box is read only so this is the only way to choose a date
        void Selection_Change(Object sender, EventArgs e)
        {
            txtDate.Text = cldrEventCalendar.SelectedDate.ToShortDateString();
        }

        //Event handler fired when the search Button is clicked
        protected void EventSearch_Click(object sender, EventArgs e)
        {
            //this try makes sure they enter an integer, if not they get an error message instead of crashing everything
            try
            {
                int x = Convert.ToInt32(txtRequestedID.Text);
                RowGrabber(x);
            }
            catch
            {
                lblID.Text = "Please enter an Integer";
                lblID.Visible = true;
            }
        }
    }
}