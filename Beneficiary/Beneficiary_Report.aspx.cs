using System;

namespace Award__bd.Beneficiary
{
    public partial class Beneficiary_Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PageDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(PageDropDownList.SelectedValue);
            DetailsGridView.PageSize = page;
            Volunteer_WiseGridView.PageSize = page;
            Category_WiseGridView.PageSize = page;
        }
    }
}