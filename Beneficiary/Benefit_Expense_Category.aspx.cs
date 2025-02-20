using System;

namespace Award__bd.Beneficiary
{
    public partial class Benefit_Expense_Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            Benefit_Expense_CategorySQL.Insert();
        }
    }
}