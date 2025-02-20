using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Beneficiary.FoodToken
{
    public partial class Food_Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void PageDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(PageDropDownList.SelectedValue);
            PaidGridView.PageSize = page;
        }
        protected void PayButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString());
            SqlCommand BenefitCategoryIDcmd = new SqlCommand("SELECT BenefitCategoryID FROM Benefit_Category WHERE CategoryName = 'Neuro'", con);
            SqlCommand ExpenseCategoryID_Cmd = new SqlCommand("SELECT ExpenseCategoryID FROM Expense_Category WHERE CategoryName = 'Food Token'", con);

            con.Open();
            object O_BenefitCategoryID = BenefitCategoryIDcmd.ExecuteScalar().ToString();
            object O_ExpenseCategoryID = ExpenseCategoryID_Cmd.ExecuteScalar();
            con.Close();

            if (O_BenefitCategoryID != null && O_ExpenseCategoryID != null)
            {
                double Total_Amount = 0;
                foreach (GridViewRow row in Food_AssignGridView.Rows)
                {
                    CheckBox SelectCheckBox = row.FindControl("SelectCheckBox") as CheckBox;
                    if (SelectCheckBox.Checked)
                    {
                        Label Amount_Label = row.FindControl("Amount_Label") as Label;

                        Food_AssignSQL.UpdateParameters["Food_Schedule_AssignID"].DefaultValue = Food_AssignGridView.DataKeys[row.DataItemIndex]["Food_Schedule_AssignID"].ToString();
                        Food_AssignSQL.Update();
                        Total_Amount += Convert.ToDouble(Amount_Label.Text);
                    }
                }

                ExpenseSQL.InsertParameters["Amount"].DefaultValue = Total_Amount.ToString();
                ExpenseSQL.InsertParameters["BenefitCategoryID"].DefaultValue = O_BenefitCategoryID.ToString();
                ExpenseSQL.InsertParameters["ExpenseCategoryID"].DefaultValue = O_ExpenseCategoryID.ToString();
                ExpenseSQL.Insert();

                Food_AssignGridView.DataBind();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Expense Inserted Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Benefit Category & Expense Category not found')", true);
            }
        }
    }
}