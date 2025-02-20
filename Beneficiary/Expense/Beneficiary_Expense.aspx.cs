using System;

namespace Award__bd.Beneficiary.Expense
{
    public partial class Beneficiary_Expense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ServiceButton_Click(object sender, EventArgs e)
        {
            ApproveSQL.Update();
            ApproveSQL.Insert();
            Response.Redirect("Beneficiary_List.aspx.aspx");
        }

        protected void EditLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Beneficiary/Edit_Beneficiary.aspx?BeneficiaryID=" + Request.QueryString["BeneficiaryID"]);
        }
    }
}