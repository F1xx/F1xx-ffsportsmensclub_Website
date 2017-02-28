using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//required for the datatables
using System.Data;
using System.Configuration;
using System.Data.OleDb;
using System.Data.SqlClient;

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

            }

            //input the event-handler methods
            cldrEventCalendar.SelectionChanged += new EventHandler(this.Selection_Change);
            //EventSearch.Click += new EventHandler(this.EventSearch_Click);
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
            if (e.Day.Date.CompareTo(DateTime.Now.Date) < 0)
            {
                //rather than being a clickable link it becomes just text
                e.Cell.Text = e.Day.DayNumberText;
            }

            ArrayList IDList = new ArrayList();
            ArrayList ApprovedList = new ArrayList();
            ArrayList DateList = new ArrayList();
            ArrayList TitleList = new ArrayList();
            ArrayList DescList = new ArrayList();
            ArrayList NameList = new ArrayList();
            ArrayList EmailList = new ArrayList();
            ArrayList PhoneList = new ArrayList();

            string sqlString = "SELECT [ID], [Approved], [Date], [Title], [Description], [Name], [Email], [Phone] FROM [Events]";
            string connString = ConfigurationManager.ConnectionStrings["FFSportsmensClubConnectionString"].ConnectionString;
            SqlConnection sqlConn = new SqlConnection(connString);
            SqlCommand sqlComm = new SqlCommand(sqlString, sqlConn);

            sqlConn.Open();
            SqlDataReader reader = sqlComm.ExecuteReader();

            for (int i = 0; i < 3; i++)
            {
                reader.Read();
                IDList.Add(reader["ID"].ToString());
                ApprovedList.Add(reader["Approved"].ToString());
                DateList.Add(reader["Date"].ToString());
                TitleList.Add(reader["Title"].ToString());
                DescList.Add(reader["Description"].ToString());
                NameList.Add(reader["Name"].ToString());
                EmailList.Add(reader["Email"].ToString());
                PhoneList.Add(reader["Phone"].ToString());
            }

            int count = 0;
            foreach (Object id in IDList)
            {
                if (Convert.ToDateTime(DateList[count]).ToString("dd-MM-yyyy") == e.Day.Date.ToString("dd-MM-yyyy"))
                {
                    if (Convert.ToBoolean(ApprovedList[count]))
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
                        string evTitle = TitleList[count].ToString();
                        int evid = Convert.ToInt32(IDList[count]);
                        ltrl2.Text = "<br /><label runat='server' style='font-size:0.9em; color:Blue'><b>" + evTitle + "</b><br />ID: " + evid + "</label><br />";
                        e.Cell.Controls.Add(ltrl2);
                    }
                }
                count++;
            }
            reader.Close();
            sqlConn.Close();
        }

        //Create new events.  This is called from the create event button
        protected void cmdCreate_Click(object sender, EventArgs e)
        {
            //INSERT BIG INSERT QUERY HERE
        }

        //function to change the text in the textbox with whatever date gets selected (text box is read only so this is the only way to choose a date
        void Selection_Change(Object sender, EventArgs e)
        {
            txtDate.Text = cldrEventCalendar.SelectedDate.ToShortDateString();
        }

        protected void Test_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Calendar.aspx?ID=" + Convert.ToInt32(txtSQLTest.Text));
                AzureSportsmen.SelectCommand = "SELECT [ID], [Approved], [Date], [Title], [Description], [Name], [Email], [Phone] FROM [Events] WHERE ([ID] = @id)";
            }
            catch
            {
                lblID.Text = "Please enter an Integer";
                lblID.Visible = true;
            }
        }
    }
}