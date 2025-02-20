using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Beneficiary.Expense
{
    public partial class Beneficiary_Allarea_List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BeneficiarySQL_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            CountLabel.Text = "(Total: " + e.AffectedRows.ToString() + ")";
        }

        protected void DistrictDropDownList_DataBound(object sender, EventArgs e)
        {
            DistrictDropDownList.Items.Insert(0, new ListItem("[ ALL District ]", "%"));
        }

        protected void FindButton_Click(object sender, EventArgs e)
        {
            string All_Area = "";
            foreach (GridViewRow rows in AreaGridView.Rows)
            {
                CheckBox SelectCheckBox = (CheckBox)rows.FindControl("SelectCheckBox");

                if (SelectCheckBox.Checked)
                {
                    All_Area += rows.Cells[1].Text+",";
                }
            }

            BeneficiarySQL.SelectParameters["Area"].DefaultValue = All_Area;
            BeneficiaryGridView.DataBind();
        }

        protected void BeneficiaryGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (BeneficiaryGridView.Rows.Count > 0)
            {
                BeneficiaryGridView.UseAccessibleHeader = true;
                BeneficiaryGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}