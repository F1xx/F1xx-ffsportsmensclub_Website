using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ffsportsmensclub_Website.Account
{
    public partial class membersOnly : System.Web.UI.Page
    {
 
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        void Button1_Click(object sender, EventArgs e)
        {
            Session["testing"] = content.Text;
        }

        //public void updateMainInfo(Object sender, CommandEventArgs e)
        //{
        //    Session["textChange1"] = content.InnerText;
        //    //The stuff below was from my initial attempts

        //    //TextBox myFirstText = (TextBox)LoginView2.FindControl(e.CommandName);
        //    //adminValue1 = myFirstText.Text;

        //}
    }
}