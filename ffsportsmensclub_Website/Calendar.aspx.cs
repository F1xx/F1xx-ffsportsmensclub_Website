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
        protected void Page_Load(object sender, EventArgs e)
        {
            //if page is being rendered for the first time
            if (!IsPostBack)
            {
                //create a datatable for the events
                DataTable dtEvents = new DataTable();
                dtEvents.Columns.Add(new DataColumn("ID", typeof(System.Int32)));
                dtEvents.Columns.Add(new DataColumn("EventDate", typeof(System.DateTime)));
                dtEvents.Columns.Add(new DataColumn("EventTitle"));
                dtEvents.Columns.Add(new DataColumn("EventDescription"));

                //sample events forcefully entered
                dtEvents.Rows.Add(1, DateTime.Now.AddDays(10), "Lunch Party", "Address: Mitali Restaurent, 10 New eskaton, Dhaka");
                dtEvents.Rows.Add(2, DateTime.Now.AddDays(7), "Dance Party", "Address: Hotel Purbani, 10 New eskaton, Dhaka");
                dtEvents.Rows.Add(3, DateTime.Now.AddDays(2), "Dinner Party", "Address: Seraton, 10 New eskaton, Dhaka");

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
                        ltrl.Text = "<BR />";
                        e.Cell.Controls.Add(ltrl);

                        //cell styling for events
                        e.Cell.BorderColor = System.Drawing.Color.Aqua;
                        e.Cell.BackColor = System.Drawing.Color.Bisque;
                        e.Cell.BorderStyle = BorderStyle.Solid;
                        e.Cell.BorderWidth = 2;

                        //Create a label for use in cells where an event is
                        Label b = new Label();
                        b.Font.Size = 8;
                        b.Font.Bold = true;
                        b.ForeColor = System.Drawing.ColorTranslator.FromHtml("#336699");
                        //Set the label text to whatever was entered in the event title
                        b.Text = oItem["EventTitle"].ToString();
                        //Add this control to be used
                        e.Cell.Controls.Add(b);

                        //CHANGE THIS ************************************************************************
                        //Make it so that when you click this you will get to read the event description.  Preferably in popup format.
                        Literal ltrl2 = new Literal();
                        ltrl2.Text = "<BR /><a style='font-size:0.9em' href='Calendar.aspx?EventDescription=" + oItem["EventDescription"].ToString() + "'>View Description</a>";
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
                dtEvents.Rows.Add(Convert.ToInt32(txtEventID.Text), Convert.ToDateTime(txtDate.Text), txtEvent.Text, txtEventDescription.Text);
                //update the ViewState with the new one to be kept in memory (includes the new event in other words)
                ViewState["dtEvents"] = dtEvents;
            }
        }

        //function to change the text in the textbox with whatever date gets selected (text box is read only so this is the only way to choose a date
        void Selection_Change(Object sender, EventArgs e)
        {
            txtDate.Text = cldrEventCalendar.SelectedDate.ToShortDateString();
        }
    }
}