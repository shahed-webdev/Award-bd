using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Beneficiary.Card
{
    public partial class Student_Card : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["BeneficiaryID"]))
            {
                Response.Redirect("Beneficiary_List.aspx");
            }
        }
    }
}