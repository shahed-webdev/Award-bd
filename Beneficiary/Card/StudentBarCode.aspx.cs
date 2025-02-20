using System;
using System.Web.UI.WebControls;

namespace Award__bd.Beneficiary.Card
{
    public partial class StudentBarCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PaidButton_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GenerateGridView.Rows)
            {
                TextBox AmountTextBox = row.FindControl("AmountTextBox") as TextBox;
                if (AmountTextBox.Text != "")
                {
                    Label Amount_Label = row.FindControl("Amount_Label") as Label;

                    double Amount = Convert.ToDouble(AmountTextBox.Text);
                    double Persentage = Convert.ToDouble(GenerateGridView.DataKeys[row.DataItemIndex]["Persentage"].ToString());
                    ExpenseSQL.InsertParameters["Persentage"].DefaultValue = Persentage.ToString();
                    ExpenseSQL.InsertParameters["Amount"].DefaultValue = (Amount * (Persentage / 100)).ToString();
                    ExpenseSQL.InsertParameters["BeneficiaryID"].DefaultValue = GenerateGridView.DataKeys[row.DataItemIndex]["BeneficiaryID"].ToString();
                    ExpenseSQL.InsertParameters["ExpenseCategoryID"].DefaultValue = GenerateGridView.DataKeys[row.DataItemIndex]["ExpenseCategoryID"].ToString();
                    ExpenseSQL.InsertParameters["BenefitCategoryID"].DefaultValue = GenerateGridView.DataKeys[row.DataItemIndex]["BenefitCategoryID"].ToString();
                    ExpenseSQL.InsertParameters["ExpenseDetails"].DefaultValue = GenerateGridView.DataKeys[row.DataItemIndex]["ExpenseDetails"].ToString();
                    ExpenseSQL.InsertParameters["Amount_Without_Per"].DefaultValue = Amount.ToString();
                    ExpenseSQL.Insert();

                    GenerateSQL.DeleteParameters["Stu_PayOrderID"].DefaultValue = GenerateGridView.DataKeys[row.DataItemIndex]["Stu_PayOrderID"].ToString();
                    GenerateSQL.Delete();

                }
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}