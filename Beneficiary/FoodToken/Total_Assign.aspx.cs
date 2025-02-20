using System;
using System.Web.UI.WebControls;

namespace Award__bd.Beneficiary.FoodToken
{
    public partial class Total_Assign : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Food_AssignSQL_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            CountLabel.Text = "(Total " + e.AffectedRows.ToString() + ")";
        }
        protected void PageDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(PageDropDownList.SelectedValue);
            Food_AssignGridView.PageSize = page;
        }
    }

}