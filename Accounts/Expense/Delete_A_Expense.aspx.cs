using System;
using System.Web.UI;

namespace Award__bd.Accounts.Expense
{
    public partial class Delete_A_Expense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FromDateTextBox.Text = DateTime.UtcNow.AddHours(6).ToString("d MMM yyyy");
                ToDateTextBox.Text = DateTime.UtcNow.AddHours(6).ToString("d MMM yyyy");
            }
        }
    }
}