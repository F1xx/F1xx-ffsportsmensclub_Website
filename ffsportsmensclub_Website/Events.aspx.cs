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
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FFCP440Student"].ConnectionString);
                string strSQL = "Select [ID], [Date], [Title], [Description], [Name] from Events where [Approved]=1";
                SqlDataAdapter dt = new SqlDataAdapter(strSQL, con);
                DataSet ds = new DataSet();
                dt.Fill(ds, "UserDetail");
                con.Close();
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
            }
        }

        //Function to allow a logged in user to Delete submitted events
        protected void Delete_Click(object sender, EventArgs e)
        {
            GridView gv = (GridView)LoginView1.FindControl("GridView1");
            Queryer("DELETE FROM Events WHERE ID = @id", gv);
        }

        //Function to allow a logged in user to approve submitted events and add them to the events page and calendar
        protected void Approve_Click(object sender, EventArgs e)
        {
            GridView gv = (GridView)LoginView1.FindControl("GridView1");
            Queryer("UPDATE Events SET Approved = '1' WHERE ID = @id", gv);
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            GridView gv = (GridView)LoginView1.FindControl("GridView2");
            Queryer("UPDATE Events SET Approved = '0' WHERE ID = @id", gv);
        }

        //Main query function.  This will check the checkboxes on the gridview and apply a query to the database involving the checked rows.
        //It only has to be sent in a query which is what will be applied to the database for each selected row.
        private void Queryer(String query, GridView gv)
        {
            foreach (GridViewRow row in gv.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as CheckBox);
                    if (chkRow.Checked)
                    {
                        try
                        {
                            //set the connection with the proper destination
                            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["FFCP440Student"].ConnectionString);
                            //create the command objects
                            SqlCommand command = new SqlCommand();

                            //using the passed argument here
                            command.CommandText = query;

                            //make the required parameters, seen used above in the query
                            command.Parameters.AddWithValue("@id", Convert.ToInt32(row.Cells[1].Text));
                            //set the properties of command
                            command.CommandType = CommandType.Text;
                            command.Connection = connection;

                            //open the connection to the table/DB, execute the query which has no return needed and then close the connection to avoid holding up the database.
                            connection.Open();
                            command.ExecuteNonQuery();
                            connection.Close();

                            //reload the page so you can see the changes
                            Response.Redirect("Events.aspx");
                        }
                        //not sure what to do here so right now it does pretty much nothing
                        catch
                        { }
                    }
                }
            }
        }
    }
}