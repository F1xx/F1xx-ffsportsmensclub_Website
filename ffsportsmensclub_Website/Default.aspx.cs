﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ffsportsmensclub_Website
{
    public partial class _Default : Page 
    {
        

        //trying to get the value from the ASPX page to come here, ideally
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["testing"] != null)
            {
                string field1 = (string)(Session["testing"]);
                textArea1.Text = field1;
            }
        }

        //Attempted with log in view, was causing way too many headaches to continue doing it this way

        //public void updateMainInfo(Object sender, CommandEventArgs e)
        //{

        //    TextBox myFirstText = (TextBox)LoginView2.FindControl(e.CommandName);
        //    adminValue1 = myFirstText.Text;

        //}
    }
}