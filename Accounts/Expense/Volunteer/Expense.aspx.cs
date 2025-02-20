using System;
using System.Web.UI;

namespace Award__bd.Accounts.Expense.Volunteer
{
    public partial class Expense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["VolunteerID"]))
            {
                NameLabel.Text = Request.QueryString["N"].ToString();
            }
            else
            {
                Response.Redirect("List.aspx");
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            ExpenseSQL.Insert();
            Imge_HF.Value = "";

            AmountTextBox.Text = "";
            ExpenseDetailsTextBox.Text = "";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Insert Successfully!')", true);
        }
    }
}