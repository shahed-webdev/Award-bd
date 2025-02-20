using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Volunteer
{
    public partial class Volunteer_Expense1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            ExpenseSQL.Insert();
            Imge_HF.Value = "";

            AmountTextBox.Text = "";
            ExpenseDetailsTextBox.Text = "";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Insert Successfully!')", true);
        }

        protected void BenefitCategory_DropDownList_DataBound(object sender, EventArgs e)
        {

        }

    }
}