using System;

namespace Award__bd.Beneficiary
{
    public partial class Beneficiary_Details_Approved : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["BeneficiaryID"]))
            Response.Redirect("Beneficiary_Details_Approved.aspx");
            
        }

        protected void ApproveButton_Click(object sender, EventArgs e)
        {
            ApproveSQL.Update();
            Response.Redirect("Approved_Beneficiary.aspx");
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            ApproveSQL.Delete();
            Response.Redirect("Approved_Beneficiary.aspx");
        }

        protected void EditLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Beneficiary/Edit_Beneficiary.aspx?BeneficiaryID=" + Request.QueryString["BeneficiaryID"]);
        }
    }
}