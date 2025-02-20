using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Volunteer
{
    public partial class Volunteer_ExpenseDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            TextBox DetailsTextBox = (TextBox)EAFormView.FindControl("DetailsTextBox");
            TextBox MainAmountTextBox = (TextBox)EAFormView.FindControl("MainAmountTextBox");
            TextBox ExpenseDateTextBox = (TextBox)EAFormView.FindControl("ExpenseDateTextBox");
            double Amount = 0;

            double.TryParse(MainAmountTextBox.Text.Trim(), out Amount);
            if (Amount > 0)
            {
                ExpenseSQL.UpdateParameters["ExpenseDetails"].DefaultValue = DetailsTextBox.Text;
                ExpenseSQL.UpdateParameters["Amount"].DefaultValue = MainAmountTextBox.Text;
                ExpenseSQL.UpdateParameters["ExpenseDate"].DefaultValue = ExpenseDateTextBox.Text;

                ExpenseSQL.Update();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "alert('Successfully Updated');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "alert('Amount will be more then 0');", true);
            }
        }
    }
}