using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Accounts.Collection.Loan
{
    public partial class Collected_Loan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["BeneficiaryID"]))
            {
                NameLabel.Text = " For " + Request.QueryString["N"].ToString();
            }
            else
            {
                Response.Redirect("~/Accounts/Collection/DonatorList.aspx");
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            LoanSQL.Insert();
            LoanSQL.Update();
            AmountTextBox.Text = "";
            ExpenseDateTextBox.Text = "";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Insert Successfully!')", true);
        }
    }
}