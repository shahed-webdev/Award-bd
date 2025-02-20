using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Accounts.Collection
{
    public partial class DonationReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["VID"]))
            {
                Response.Redirect("DonatorList.aspx");
            }
        }
    }
}