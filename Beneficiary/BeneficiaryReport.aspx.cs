using System;

namespace Award__bd.Beneficiary
{
    public partial class BeneficiaryReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void PageDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(PageDropDownList.SelectedValue);
            CategoryGridView.PageSize = page;
            BenefitGridView.PageSize = page;
            DonorGridView.PageSize = page;
            DistrictGridView.PageSize = page;
            AreaGridView.PageSize = page;
        }
    }
}