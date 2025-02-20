using System;
using System.Data;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Award__bd.Accounts.Expense
{
    public partial class Category_Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FindButton_Click(object sender, EventArgs e)
        {
            string selectedValue = "";
            double All_Category_Total = 0;
            double All_Category_PrevTotal = 0;
            double V_Category = 0;

            foreach (ListItem item in CategoryCheckBoxList.Items)
            {
                if (item.Selected)
                {
                    selectedValue += item.Value + ',';
                }
            }

            CultureInfo enUS = new CultureInfo("en-US");
            DateTime fDate;
            DateTime eDate;
            DateTime prveFromDate;
            DateTime prveToDate;
            if (DateTime.TryParseExact(FromDateTextBox.Text, "d MMM yyyy", enUS, DateTimeStyles.None, out fDate) &&
                DateTime.TryParseExact(ToDateTextBox.Text, "d MMM yyyy", enUS, DateTimeStyles.None, out eDate))
            {
                var days = (eDate - fDate).Days;

                prveToDate = fDate.AddDays(-1);
                prveFromDate = prveToDate.AddDays(-days);


                Previous_C_WiseSQL.SelectParameters["PrevFrom_Date"].DefaultValue = prveFromDate.ToString("d MMM yyyy");
                Previous_C_WiseSQL.SelectParameters["PrevTo_Date"].DefaultValue = prveToDate.ToString("d MMM yyyy");
            }

            Previous_C_WiseSQL.SelectParameters["BenefitCategoryID"].DefaultValue = selectedValue;
            Previous_C_WiseGridView.DataBind();


            foreach (GridViewRow rows in Previous_C_WiseGridView.Rows)
            {
                var PreviousAmountLabel = rows.FindControl("PreviousAmountLabel") as Label;
                var AmountLabel = rows.FindControl("AmountLabel") as Label;

                All_Category_PrevTotal += Convert.ToDouble(PreviousAmountLabel.Text);
                All_Category_Total += Convert.ToDouble(AmountLabel.Text);
            }

            if (Previous_C_WiseGridView.Rows.Count > 0)
            {
                var TotalPrevAmount = Previous_C_WiseGridView.FooterRow.FindControl("TotalPrevAmount") as Label;
                var TotalAmount = Previous_C_WiseGridView.FooterRow.FindControl("TotalAmount") as Label;

                TotalPrevAmount.Text = All_Category_PrevTotal.ToString("0,0.00") + "/-";
                TotalAmount.Text = All_Category_Total.ToString("0,0.00") + "/-";
            }

            V_SQL.SelectParameters["BenefitCategoryID"].DefaultValue = selectedValue;

            DataTable V_Table = new DataTable();
            DataView V_SQL_DV = (DataView)V_SQL.Select(DataSourceSelectArguments.Empty);

            if (V_SQL_DV.Count > 0)
            {
                V_Table.Columns.Add("Expense Category");
                for (int i = 0; i < V_SQL_DV.Count; i++)
                {
                    V_Table.Columns.Add(V_SQL_DV.Table.Rows[i]["Name"].ToString());
                }
                V_Table.Columns.Add("Grand Total");

                V_C_SQL.SelectParameters["BenefitCategoryID"].DefaultValue = selectedValue;

                V_wiseC_SQL.SelectParameters["BenefitCategoryID"].DefaultValue = selectedValue;

                DataView V_C_DV = (DataView)V_C_SQL.Select(DataSourceSelectArguments.Empty);


                for (int Ci = 0; Ci < V_C_DV.Count; Ci++)
                {
                    DataRow dr = V_Table.NewRow();
                    dr["Expense Category"] = V_C_DV.Table.Rows[Ci]["CategoryName"].ToString();


                    V_wiseC_SQL.SelectParameters["ExpenseCategoryID"].DefaultValue = V_C_DV.Table.Rows[Ci]["ExpenseCategoryID"].ToString();
                    DataView V_wiseC_DV = (DataView)V_wiseC_SQL.Select(DataSourceSelectArguments.Empty);

                    for (int i = 0; i < V_wiseC_DV.Count; i++)
                    {
                        dr[V_wiseC_DV.Table.Rows[i]["Name"].ToString()] = string.Format("{0:N2}", V_wiseC_DV.Table.Rows[i]["Amount"]);
                    }

                    dr["Grand Total"] = string.Format("{0:N2}", V_C_DV.Table.Rows[Ci]["Amount"]);
                    V_Table.Rows.Add(dr);

                }

                DataRow G_dr = V_Table.NewRow();
                G_dr["Expense Category"] = "Grand Total";

                for (int i = 0; i < V_SQL_DV.Count; i++)
                {
                    G_dr[V_SQL_DV.Table.Rows[i]["Name"].ToString()] = string.Format("{0:N2}", V_SQL_DV.Table.Rows[i]["Amount"]);
                    V_Category += Convert.ToDouble(V_SQL_DV.Table.Rows[i]["Amount"]);
                }

                V_Table.Rows.Add(G_dr);
            }

            V_GridView.DataSource = V_Table;
            V_GridView.DataBind();
            if (V_Category > 0)
            {
                V_Category_Label.Text = " Total : " + V_Category.ToString("0,0.00") + " TK.";
            }
            else
            {
                V_Category_Label.Text = "";
            }
        }

        protected void V_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                for (int i = 0; i < V_GridView.HeaderRow.Cells.Count; i++)
                {
                    string cabecera = V_GridView.HeaderRow.Cells[i].Text;

                    if (cabecera.Equals("Grand Total"))
                    {
                        e.Row.Cells[i].CssClass = "Grandtotal";
                        break;
                    }
                }

                if (e.Row.Cells[0].Text == "Grand Total")
                {
                    e.Row.CssClass = "Grandtotal";
                }
            }
        }
    }
}