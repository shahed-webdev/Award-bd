using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Award__bd.Accounts.Expense.Beneficiry
{
    public partial class Expense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["BeneficiaryID"]))
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
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());

            SqlCommand Persentage_cmd = new SqlCommand("SELECT Persentage FROM Beneficiary_Expense_Category WHERE (ExpenseCategoryID = @ExpenseCategoryID) AND (BeneficiaryID = @BeneficiaryID)", con);
            Persentage_cmd.Parameters.AddWithValue("@ExpenseCategoryID", ExpenseCategoryDropDownList.SelectedValue);
            Persentage_cmd.Parameters.AddWithValue("@BeneficiaryID", Request.QueryString["BeneficiaryID"]);

            con.Open();
            double Persentage = Convert.ToDouble(Persentage_cmd.ExecuteScalar());
            con.Close();

            double Amount = Convert.ToDouble(AmountTextBox.Text);

            ExpenseSQL.InsertParameters["Persentage"].DefaultValue = Persentage.ToString();
            ExpenseSQL.InsertParameters["Amount"].DefaultValue = (Amount * (Persentage / 100)).ToString();
            ExpenseSQL.Insert();
            Imge_HF.Value = "";

            AmountTextBox.Text = "";
            ExpenseDetailsTextBox.Text = "";

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Insert Successfully!')", true);
        }
    }
}