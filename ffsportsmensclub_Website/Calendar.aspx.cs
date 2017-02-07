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
            if (!IsPostBack)
            {
                DataTable dtEvents = new DataTable();
                dtEvents.Columns.Add(new DataColumn("ID", typeof(System.Int32)));
                dtEvents.Columns.Add(new DataColumn("EventDate", typeof(System.DateTime)));
                dtEvents.Columns.Add(new DataColumn("EventTitle"));
                dtEvents.Columns.Add(new DataColumn("EventDescription"));

                dtEvents.Rows.Add(1, DateTime.Now.AddDays(10), "Lunch Party", "Address: Mitali Restaurent, 10 New eskaton, Dhaka");
                dtEvents.Rows.Add(2, DateTime.Now.AddDays(7), "Dance Party", "Address: Hotel Purbani, 10 New eskaton, Dhaka");
                dtEvents.Rows.Add(3, DateTime.Now.AddDays(2), "Dinner Party", "Address: Seraton, 10 New eskaton, Dhaka");

                ViewState["dtEvents"] = dtEvents;
            }
        }

        protected void cldrEventCalendar_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsToday)
            {
                e.Cell.BorderColor = System.Drawing.Color.Silver;
                e.Cell.BackColor = System.Drawing.Color.Bisque;
                e.Cell.BorderStyle = BorderStyle.Solid;
                e.Cell.BorderWidth = 2;
            }

            if (ViewState["dtEvents"] != null)
            {
                DataTable dtEvents = (DataTable)ViewState["dtEvents"];
                foreach (DataRow oItem in dtEvents.Rows)
                {
                    if (Convert.ToDateTime(oItem["EventDate"]).ToString("dd-MM-yyyy") == e.Day.Date.ToString("dd-MM-yyyy"))
                    {
                        Literal ltrl = new Literal();
                        ltrl.Text = "<BR />";
                        e.Cell.Controls.Add(ltrl);

                        e.Cell.BorderColor = System.Drawing.Color.Aqua;
                        e.Cell.BackColor = System.Drawing.Color.Bisque;
                        e.Cell.BorderStyle = BorderStyle.Solid;
                        e.Cell.BorderWidth = 2;

                        Label b = new Label();
                        b.Font.Size = 8;
                        b.Font.Bold = true;
                        b.ForeColor = System.Drawing.ColorTranslator.FromHtml("#336699");
                        b.Text = oItem["EventTitle"].ToString();
                        e.Cell.Controls.Add(b);

                        Literal ltrl2 = new Literal();
                        ltrl2.Text = "<BR /><a style='font-size:0.9em' href='About.aspx?ID=" + oItem["ID"].ToString() + "'>View Address</a>";
                        e.Cell.Controls.Add(ltrl2);
                    }
                }
            }
        }

        protected void cmdCreate_Click(object sender, EventArgs e)
        {
            if (ViewState["dtEvents"] != null)
            {
                DataTable dtEvents = (DataTable)ViewState["dtEvents"];
                dtEvents.Rows.Add(Convert.ToInt32(txtEventID.Text), Convert.ToDateTime(txtDate.Text), txtEvent.Text, txtEventDescription.Text);
                ViewState["dtEvents"] = dtEvents;
            }
        }
    }
}