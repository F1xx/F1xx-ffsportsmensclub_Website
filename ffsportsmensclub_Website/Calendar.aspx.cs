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
using System.Globalization;
using System.Text.RegularExpressions;

namespace ffsportsmensclub_Website
{
    public partial class About : Page
    {
        //add these as local global things so that they can be created and populated on pageload but accessed afterwards without being remade everytime.
        ArrayList IDList = new ArrayList();
        ArrayList ApprovedList = new ArrayList();
        ArrayList DateList = new ArrayList();
        ArrayList TitleList = new ArrayList();
        ArrayList DescList = new ArrayList();
        ArrayList NameList = new ArrayList();
        ArrayList EmailList = new ArrayList();
        ArrayList PhoneList = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
            //loads the lists with the correct data
            ListInstantiator();

            //TEST to see what is in the array/how many times it actually ran
            foreach (Object id in IDList)
            {
                lblID.Visible = true;
                lblID.Text += id.ToString();
            }
            //if page is being rendered for the first time
            if (!IsPostBack)
            {
                

            }

            //input the event-handler methods
            cldrEventCalendar.SelectionChanged += new EventHandler(this.Selection_Change);
        }

        protected void ListInstantiator()
        {
            //Query in string format
            string sqlString = "SELECT [ID], [Approved], [Date], [Title], [Description], [Name], [Email], [Phone] FROM [Events]";
            //but using 'using' the end curly bracket terminates the connection
            using (SqlConnection Conn = new SqlConnection("Data Source=sportsmensclub.database.windows.net; uid=Fixx; pwd=CP440Database;database=FFSportsmensClub;"))
            {
                SqlCommand sqlComm = new SqlCommand(sqlString, Conn);

                //open the connection
                Conn.Open();
                //create the reader inside this connection
                SqlDataReader reader = sqlComm.ExecuteReader();

                //loop runs while the connection is open.  Will loop through each column of each row of the table in the query and assign the relative values to lists
                //Troy said to use a 2D array but they are not as good a fit for dynamic data resizing, may use them down the line, idk
                while (reader.Read())
                {
                    IDList.Add(reader["ID"].ToString());
                    ApprovedList.Add(reader["Approved"].ToString());
                    DateList.Add(reader["Date"].ToString());
                    TitleList.Add(reader["Title"].ToString());
                    DescList.Add(reader["Description"].ToString());
                    NameList.Add(reader["Name"].ToString());
                    EmailList.Add(reader["Email"].ToString());
                    PhoneList.Add(reader["Phone"].ToString());
                }
                reader.Close();
            }
        }
        protected bool IsAllValid()
        {
            bool valid = false;

            bool validName = false;
            bool validDate = false;
            bool validTitle = false;
            bool validDescription = false;
            bool validEmail = false;
            bool validPhone = false;

            //Check Name
            if (!string.IsNullOrWhiteSpace(txtUserName.Text))
                {
                validName = true;
                lblName.ForeColor = System.Drawing.Color.Black;
                nameWarning.Visible = false;
            }
            else
            {
                nameWarning.ForeColor = System.Drawing.Color.Red;
                lblName.ForeColor = System.Drawing.Color.Red;
                nameWarning.Visible = true;
            }

            //Check Date
            if (!string.IsNullOrWhiteSpace(txtDate.Text))
            {
                validDate = true;
                lblDate.ForeColor = System.Drawing.Color.Black;
                dateWarning.Visible = false;
            }
            else
            {
                dateWarning.ForeColor = System.Drawing.Color.Red;
                lblDate.ForeColor = System.Drawing.Color.Red;
                dateWarning.Visible = true;
            }

            //Check Title
            if (!string.IsNullOrWhiteSpace(txtEventTitle.Text))
            {
            validTitle = true;
            lblTitle.ForeColor = System.Drawing.Color.Black;
            titleWarning.Visible = false;
            }
            else
            {
                titleWarning.ForeColor = System.Drawing.Color.Red;
                lblTitle.ForeColor = System.Drawing.Color.Red;
                titleWarning.Visible = true;
            }

            //Check Description
            if (!string.IsNullOrWhiteSpace(txtEventDescription.Text))
            {
                validDescription = true;
                lblDesc.ForeColor = System.Drawing.Color.Black;
                descWarning.Visible = false;
            }
            else
            {
                descWarning.ForeColor = System.Drawing.Color.Red;
                lblDesc.ForeColor = System.Drawing.Color.Red;
                descWarning.Visible = true;
            }

            //Check Email
            if (IsValidEmail(txtUserEmail.Text.ToString()))
            {
                validEmail = true;
                lblEmail.ForeColor = System.Drawing.Color.Black;
                emailWarning.Visible = false;
            }
            else
            {
                emailWarning.ForeColor = System.Drawing.Color.Red;
                lblEmail.ForeColor = System.Drawing.Color.Red;
                emailWarning.Visible = true;
            }

            //Check Phone
            if (!string.IsNullOrWhiteSpace(txtUserPhone.Text))
            {
                validDescription = true;
                lblPhone.ForeColor = System.Drawing.Color.Black;
                phoneWarning.Visible = false;
            }
            else
            {
                phoneWarning.ForeColor = System.Drawing.Color.Red;
                lblPhone.ForeColor = System.Drawing.Color.Red;
                phoneWarning.Visible = true;
            }
            foreach (char c in txtUserPhone.Text)
            {
                if (c < '0' || c > '9')
                {
                    validPhone = false;
                    phoneWarning.ForeColor = System.Drawing.Color.Red;
                    lblPhone.ForeColor = System.Drawing.Color.Red;
                    phoneWarning.Visible = true;
                }
                else
                {
                    validPhone = true;
                    lblPhone.ForeColor = System.Drawing.Color.Black;
                    phoneWarning.Visible = false;
                }
            }

            //if every textbox is valid then this function will return valid
            if (validName && validDate && validTitle && validDescription && validEmail && validPhone)
            { valid = true; }

            return valid;
        }
        protected void cldrEventCalendar_DayRender(object sender, DayRenderEventArgs e)
        {
            //Disables the ability to select any day earlier than 'today'
            //MAYBE DISABLE THE ABILITY TO SELECT TODAY AS WELL AS THAT IS REALLY SHORT NOTICE
            if (e.Day.Date.CompareTo(DateTime.Now.Date) < 0)
            {
                //rather than being a clickable link it becomes just text
                e.Cell.Text = e.Day.DayNumberText;
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
                        //Literal ltrl = new Literal();
                        //ltrl.Text = "<br />";
                        //e.Cell.Controls.Add(ltrl);

                        //cell styling for events
                        e.Cell.BackColor = System.Drawing.Color.LightBlue;
                        e.Cell.Font.Bold=true;
                        e.Cell.Font.Italic = true;
                        e.Cell.BorderWidth = 3;

                        //create a literal which will create a label of the event name and its ID.
                        //I want to make this work as a link but no luck

                        Literal ltrl2 = new Literal();
                        string evTitle = TitleList[count].ToString();
                        int evid = Convert.ToInt32(IDList[count]);
                        //Remove the evID at the end for release, right now its for testing.
                        //Creates a new control which is a link to display the information for the event.  At some point this should redirect to the event page and highlight the corresponding event
                        ltrl2.Text = "<br /><a href='Calendar.aspx?ID=" + evid + "' runat='server' style='font-size:0.9em; color:Blue'><b>" + evTitle + "</b>ID: " + evid + "</a>";
                        e.Cell.Controls.Add(ltrl2);
                    }
                }
                count++;
            }
        }

        //Create new events.  This is called from the create event button
        protected void cmdCreate_Click(object sender, EventArgs e)
        {
            //does an if to a function I made that ensuers all fields are filled and valid (some just need to not be empty to be valid)
            if (IsAllValid())
            {
                //a try just in case we still somehow get a database error
                try
                {
                    //set the string that will insert into the table, all values inserted are parameters
                    string queryString = "INSERT INTO Events (Approved, Date, Title, Description, Name, Email, Phone) VALUES(0, @date, @title, @description, @name, @email, @phone);";
                    //set the connection with the proper destination
                    SqlConnection connection = new SqlConnection("Data Source=sportsmensclub.database.windows.net; uid=Fixx; pwd=CP440Database;database=FFSportsmensClub;");
                    //create the command objects
                    SqlCommand command = new SqlCommand();
                    //make the required parameters, seen used above in the query
                    command.Parameters.Add("@date", SqlDbType.DateTime).Value = Convert.ToDateTime(txtDate.Text);
                    command.Parameters.Add("@title", SqlDbType.NVarChar).Value = txtEventTitle.Text.ToString();
                    command.Parameters.Add("@description", SqlDbType.NVarChar).Value = txtEventDescription.Text.ToString();
                    command.Parameters.Add("@name", SqlDbType.NVarChar).Value = txtUserName.Text.ToString();
                    command.Parameters.Add("@email", SqlDbType.NVarChar).Value = txtUserEmail.Text.ToString();
                    command.Parameters.Add("@phone", SqlDbType.NVarChar).Value = txtUserPhone.Text.ToString();
                    //set the properties of command
                    command.CommandType = CommandType.Text;
                    command.CommandText = queryString;
                    command.Connection = connection;

                    //open the connection to the table/DB, execute the query which has no return needed and then close the connection to avoid holding up the database.
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    //clear fields once entry is made
                    txtUserName.Text = "";
                    txtDate.Text = "";
                    txtEventTitle.Text = "";
                    txtEventDescription.Text = "";
                    txtUserEmail.Text = "";
                    txtUserPhone.Text = "";
                }
                //not sure what to do here so right now it does pretty much nothing
                catch
                { lblSearch.Text = "ERROR, ERROR"; }
            }
            else
            {
                //if something is not valid in one of the textboxes this code runs
                lblID.Text = "Not valid input";
                lblID.Visible = true;
            }
        }

        //EMAIL VALIDATION TESTS, GREATFULLY TAKEN FROM MSDN: https://msdn.microsoft.com/en-us/library/01escwtf(v=vs.110).aspx
        bool invalid = false;
        public bool IsValidEmail(string strIn)
        {
            invalid = false;
            if (String.IsNullOrEmpty(strIn))
                return false;

            // Use IdnMapping class to convert Unicode domain names.
            try
            {
                strIn = Regex.Replace(strIn, @"(@)(.+)$", DomainMapper, RegexOptions.None, TimeSpan.FromMilliseconds(200));
            }
            catch (RegexMatchTimeoutException)
            {
                return false;
            }

            if (invalid)
                return false;

            // Return true if strIn is in valid e-mail format.
            try
            {
                return Regex.IsMatch(strIn,
                      @"^(?("")("".+?(?<!\\)""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" +
                      @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9][\-a-z0-9]{0,22}[a-z0-9]))$",
                      RegexOptions.IgnoreCase, TimeSpan.FromMilliseconds(250));
            }
            catch (RegexMatchTimeoutException)
            {
                return false;
            }
        }

        //Also taken from the above link and required for email validation
        private string DomainMapper(Match match)
        {
            // IdnMapping class with default property values.
            IdnMapping idn = new IdnMapping();

            string domainName = match.Groups[2].Value;
            try
            {
                domainName = idn.GetAscii(domainName);
            }
            catch (ArgumentException)
            {
                invalid = true;
            }
            return match.Groups[1].Value + domainName;
        }

        //function to change the text in the textbox with whatever date gets selected (text box is read only so this is the only way to choose a date
        void Selection_Change(Object sender, EventArgs e)
        {
            //Sets the Date box to the date selected in datetime format
            txtDate.Text = cldrEventCalendar.SelectedDate.ToString();
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            //currently also searches unapproved events but I want it to for testing purposes.
            try
            {
                Response.Redirect("Calendar.aspx?ID=" + Convert.ToInt32(txtSQLSearch.Text));
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