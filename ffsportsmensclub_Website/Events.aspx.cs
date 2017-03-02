using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//required for the datatables
using System.Data;
using System.Configuration;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Collections;

namespace ffsportsmensclub_Website
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                show();
            }
        }

        private void show()
        {
            {
                //opens the connection, binds it to the eventView
                //Selects all the rows that have approved equaling one (or approved)
                SqlConnection con = new SqlConnection("Data Source=sportsmensclub.database.windows.net; uid=Fixx; pwd=CP440Database;database=FFSportsmensClub;");
                string strSQL = "Select [Date], [Title], [Description], [Name] from Events where [Approved]=1";
                SqlDataAdapter dt = new SqlDataAdapter(strSQL, con);
                DataSet ds = new DataSet();
                dt.Fill(ds, "UserDetail");
                con.Close();
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
            }
        }
    }
}