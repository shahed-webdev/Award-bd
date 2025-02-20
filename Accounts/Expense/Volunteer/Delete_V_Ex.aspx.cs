using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Accounts.Expense.Volunteer
{
    public partial class Delete_V_Ex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            ExpenseSQL.Delete();
            Response.Redirect("~/Accounts/Expense/Delete_A_Expense.aspx");
        }
    }
}