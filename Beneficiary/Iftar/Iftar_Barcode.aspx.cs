using System;

namespace Award__bd.Beneficiary.Iftar
{
    public partial class Iftar_Barcode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void PaidButton_Click(object sender, EventArgs e)
        {
            ExpenseSQL.InsertParameters["BeneficiaryID"].DefaultValue = InfoFormView.DataKey["BeneficiaryID"].ToString();
            ExpenseSQL.InsertParameters["BenefitCategoryID"].DefaultValue = InfoFormView.DataKey["BenefitCategoryID"].ToString();
            ExpenseSQL.Insert();

            ExpenseSQL.UpdateParameters["Ifter_AssignID"].DefaultValue = InfoFormView.DataKey["Ifter_AssignID"].ToString();
            ExpenseSQL.Update();

            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void InfoFormView_DataBound(object sender, EventArgs e)
        {
            if (InfoFormView.DataItemCount > 0)
            {
                Expense_CategorySQL.SelectParameters["BeneficiaryID"].DefaultValue = InfoFormView.DataKey["BeneficiaryID"].ToString();
                Expense_CategorySQL.SelectParameters["BenefitCategoryID"].DefaultValue = InfoFormView.DataKey["BenefitCategoryID"].ToString();
            }
        }
    }
}