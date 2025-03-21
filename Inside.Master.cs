﻿using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace Award__bd
{
    public partial class Inside : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated | Session["RegistrationID"] == null)
            {
                string[] myCookies = Request.Cookies.AllKeys;
                foreach (string cookie in myCookies)
                {
                    Response.Cookies[cookie].Expires = DateTime.Now;
                }

                Roles.DeleteCookie();
                Session.Clear();
                FormsAuthentication.SignOut();
                Response.Redirect("~/Default.aspx");
            }

            try
            {
                if (!this.IsPostBack)
                {
                    if (Roles.IsUserInRole(HttpContext.Current.User.Identity.Name, "Admin"))
                    {
                        DataTable dt = this.GetData("SELECT DISTINCT Category, LinkCategoryID, Ascending FROM  Link_Category ORDER BY Ascending");
                        CategoryTreeView(dt, null);
                    }
                    else
                    {
                        DataTable dt = this.GetData("SELECT DISTINCT Link_Category.Category, Link_Category.LinkCategoryID, Link_Users.RegistrationID,Link_Category.Ascending FROM Link_Users INNER JOIN Link_Pages ON Link_Users.LinkID = Link_Pages.LinkID INNER JOIN Link_Category ON Link_Pages.LinkCategoryID = Link_Category.LinkCategoryID WHERE (Link_Users.RegistrationID = " + Session["RegistrationID"].ToString() + ") ORDER BY Link_Category.Ascending");
                        CategoryTreeView(dt, null);
                    }
                }
            }
            catch { }
        }
        private void CategoryTreeView(DataTable dtParent, TreeNode treeNode)
        {
            foreach (DataRow row in dtParent.Rows)
            {
                TreeNode child = new TreeNode();

                child.Text = row["Category"].ToString();
                child.Value = row["LinkCategoryID"].ToString();
                child.CollapseAll();
                child.SelectAction = TreeNodeSelectAction.Expand;


                if (Roles.IsUserInRole(HttpContext.Current.User.Identity.Name, "Admin"))
                {
                    LinkTreeView.Nodes.Add(child);
                    DataTable dtChild = GetData("SELECT DISTINCT Link_SubCategory.* FROM Link_Pages INNER JOIN Link_SubCategory ON Link_Pages.SubCategoryID = Link_SubCategory.SubCategoryID WHERE (Link_SubCategory.LinkCategoryID =" + child.Value + ") ORDER BY Link_SubCategory.Ascending");
                    SubCategoryTreeView(dtChild, child, child.Value);

                    DataTable dtttChild = GetData("SELECT * FROM   Link_Pages WHERE  (SubCategoryID IS NULL) AND (LinkCategoryID = " + child.Value + ") ORDER BY Ascending");
                    ClickLinkTreeView(dtttChild, child);
                }
                else
                {

                    LinkTreeView.Nodes.Add(child);
                    DataTable dtChild = GetData("SELECT DISTINCT Link_SubCategory.* FROM Link_Users INNER JOIN Link_Pages ON Link_Users.LinkID = Link_Pages.LinkID INNER JOIN Link_SubCategory ON Link_Pages.SubCategoryID = Link_SubCategory.SubCategoryID WHERE (Link_Users.RegistrationID = " + Session["RegistrationID"].ToString() + ") AND (Link_SubCategory.LinkCategoryID = " + child.Value + ") ORDER BY Link_SubCategory.Ascending");
                    SubCategoryTreeView(dtChild, child, child.Value);

                    DataTable dtttChild = GetData("SELECT DISTINCT Link_Pages.* FROM Link_Users INNER JOIN  Link_Pages ON Link_Users.LinkID = Link_Pages.LinkID WHERE  (Link_Users.RegistrationID = " + Session["RegistrationID"].ToString() + ") AND (Link_Pages.SubCategoryID IS NULL) AND (Link_Pages.LinkCategoryID = " + child.Value + ") ORDER BY Link_Pages.Ascending");
                    ClickLinkTreeView(dtttChild, child);
                }

            }
        }
        private void SubCategoryTreeView(DataTable dtParent, TreeNode treeNode, string LinkCategoryID)
        {
            foreach (DataRow row in dtParent.Rows)
            {
                TreeNode child = new TreeNode();

                child.Text = row["SubCategory"].ToString();
                child.CollapseAll();
                child.SelectAction = TreeNodeSelectAction.Expand;

                if (Roles.IsUserInRole(HttpContext.Current.User.Identity.Name, "Admin"))
                {
                    if (child.Text != "")
                    {
                        treeNode.ChildNodes.Add(child);
                        DataTable dtChild = GetData("SELECT DISTINCT * FROM  Link_Pages WHERE   (SubCategoryID =" + row["SubCategoryID"].ToString() + ") AND (LinkCategoryID =  " + LinkCategoryID + ") ORDER BY Ascending");
                        ClickLinkTreeView(dtChild, child);
                    }
                }
                else
                {

                    if (child.Text != "")
                    {
                        treeNode.ChildNodes.Add(child);
                        DataTable dtChild = GetData("SELECT DISTINCT Link_Pages.* FROM Link_Users INNER JOIN  Link_Pages ON Link_Users.LinkID = Link_Pages.LinkID WHERE  (Link_Users.RegistrationID = " + Session["RegistrationID"].ToString() + ") AND (Link_Pages.SubCategoryID =" + row["SubCategoryID"].ToString() + ") AND (Link_Pages.LinkCategoryID =  " + LinkCategoryID + ") ORDER BY Link_Pages.Ascending");
                        ClickLinkTreeView(dtChild, child);
                    }
                }
            }
        }

        private void ClickLinkTreeView(DataTable dtParent, TreeNode treeNode)
        {
            foreach (DataRow row in dtParent.Rows)
            {
                TreeNode child = new TreeNode();

                child.Text = row["PageTitle"].ToString();
                child.NavigateUrl = row["PageURL"].ToString();
                treeNode.ChildNodes.Add(child);
                string CurrentPage = "~" + Request.CurrentExecutionFilePath;
                if (CurrentPage == child.NavigateUrl)
                {
                    child.Select();
                    treeNode.Expand();

                    if (treeNode.Parent != null)
                        treeNode.Parent.Expand();
                }
            }
        }
        private DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                    }
                }
                return dt;
            }
        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            string[] myCookies = Request.Cookies.AllKeys;
            foreach (string cookie in myCookies)
            {
                Response.Cookies[cookie].Expires = DateTime.Now;
            }

            Roles.DeleteCookie();
            Session.Clear();
        }
    }
}