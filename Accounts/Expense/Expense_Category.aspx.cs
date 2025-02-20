using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Accounts.Expense
{
    public partial class Expense_Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            CategorySQL.Insert();
            CategoryNameTextBox.Text = "";
        }
    }
}