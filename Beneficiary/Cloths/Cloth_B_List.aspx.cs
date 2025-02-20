using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Beneficiary.Cloths
{
    public partial class Cloth_B_List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void PageDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(PageDropDownList.SelectedValue);
            BeneficiaryGridView.PageSize = page;
            AssignRecordGridView.PageSize = page;
        }

        protected void AssignButton_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in BeneficiaryGridView.Rows)
            {
                CheckBox SelectCheckBox = row.FindControl("SelectCheckBox") as CheckBox;

                if (SelectCheckBox.Checked)
                {
                    BeneficiarySQL.InsertParameters["BeneficiaryID"].DefaultValue = BeneficiaryGridView.DataKeys[row.DataItemIndex % BeneficiaryGridView.PageSize]["BeneficiaryID"].ToString();
                    BeneficiarySQL.InsertParameters["BenefitCategoryID"].DefaultValue = BeneficiaryGridView.DataKeys[row.DataItemIndex % BeneficiaryGridView.PageSize]["BenefitCategoryID"].ToString();
                    BeneficiarySQL.Insert();
                }
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Assign Successfully')", true);
        }
    }
}