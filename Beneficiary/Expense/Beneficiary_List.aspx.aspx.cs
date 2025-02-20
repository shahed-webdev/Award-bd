using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Beneficiary.Expense
{
    public partial class Beneficiary_List_aspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BeneficiarySQL_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
           CountLabel.Text ="(Total " + e.AffectedRows.ToString() +")";
        }

        protected void CategoryDropDownList_DataBound(object sender, EventArgs e)
        {
            CategoryDropDownList.Items.Insert(0, new ListItem("[ ALL Category ]", "%"));
        }

        protected void AreaDropDownList_DataBound(object sender, EventArgs e)
        {
            AreaDropDownList.Items.Insert(0, new ListItem("[ ALL Area ]", "%"));
        }

        protected void DistrictDropDownList_DataBound(object sender, EventArgs e)
        {
            DistrictDropDownList.Items.Insert(0, new ListItem("[ ALL District ]", "%"));
        }

        protected void BeneficiaryGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (BeneficiaryGridView.Rows.Count > 0)
            {
                BeneficiaryGridView.UseAccessibleHeader = true;
                BeneficiaryGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void ClassDropDownList_DataBound(object sender, EventArgs e)
        {
            ClassDropDownList.Items.Insert(0, new ListItem("[ ALL Class ]", "%"));
        }
    }
}