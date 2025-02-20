using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Beneficiary
{
    public partial class Add_Family_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            Beneficiary_FamilySQL.Insert();
        }

        protected void CompleteButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_beneficiary.aspx");
        }
    }
}