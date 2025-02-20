using System;
using System.Web.UI;

namespace Award__bd.Beneficiary.FoodToken
{
    public partial class PaymemtRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FromDateTextBox.Text = DateTime.UtcNow.AddHours(6).ToString("d MMM yyyy");
                ToDateTextBox.Text = DateTime.UtcNow.AddHours(6).ToString("d MMM yyyy");
            }
        }
        protected void PageDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(PageDropDownList.SelectedValue);
            PaidGridView.PageSize = page;
            DueGridView.PageSize = page;
        }
    }
}