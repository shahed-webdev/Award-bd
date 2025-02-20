<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Approved_Expense.aspx.cs" Inherits="Award__bd.Accounts.Expense.Approved_Expense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link href="/JS/jq_Profile/css/Profile_jquery-ui-1.8.23.custom.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <div id="main">
      <ul>
         <li><a href="#Beneficiary">Beneficiary Expense</a></li>
         <li><a href="#Volunteer">Volunteer Expense</a></li>
      </ul>

      <div id="Beneficiary">
         <h3>Beneficiary Expense</h3>
         <asp:DataList ID="CategoryDataList" runat="server" DataKeyField="BenefitCategoryID" DataSourceID="CategorySQL" Width="100%">
            <ItemTemplate>
               <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Eval("CategoryName") %>' />
               <asp:HiddenField ID="BenefitCategoryIDHF" runat="server" Value='<%# Eval("BenefitCategoryID") %>' />
               <asp:GridView ID="ExpenseGridView"  AllowSorting="true" runat="server" AutoGenerateColumns="False" DataSourceID="ExpenseSQL" CssClass="mGrid">
                  <Columns>
                     <asp:BoundField DataField="UserName" HeaderText="Inserted By" SortExpression="UserName" />
                     <asp:BoundField DataField="CaseNo" HeaderText="Case No" SortExpression="CaseNo" />
                     <asp:BoundField DataField="BeneficiaryName" HeaderText="Beneficiary Name" SortExpression="BeneficiaryName" />
                     <asp:BoundField DataField="CategoryName" HeaderText="Expense Category" SortExpression="CategoryName" />
                     <asp:BoundField DataField="ExpenseDetails" HeaderText="Details" SortExpression="ExpenseDetails" />
                     <asp:BoundField DataField="ExpenseDate" DataFormatString="{0:d MMM yyyy}" HeaderText="Date" SortExpression="ExpenseDate" />
                     <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                     <asp:HyperLinkField DataNavigateUrlFields="ExpenseID" HeaderText="View" Text="View"
                        DataNavigateUrlFormatString="Beneficiry/Approve_Expense.aspx?ExpenseID={0}" />
                  </Columns>
               </asp:GridView>
               
               <asp:SqlDataSource ID="ExpenseSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Registration.UserName, Beneficiary_Info.CaseNo, Beneficiary_Info.BeneficiaryName, Expense_Category.CategoryName, Expense.ExpenseDetails, Expense.ExpenseDate, Expense.Amount, Expense.ExpenseID FROM Expense INNER JOIN Expense_Category ON Expense.ExpenseCategoryID = Expense_Category.ExpenseCategoryID INNER JOIN Registration ON Expense.RegistrationID = Registration.RegistrationID INNER JOIN Beneficiary_Info ON Expense.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (Expense.Is_Approved = 0) AND (Expense.BenefitCategoryID = @BenefitCategoryID) order by ExpenseDate">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="BenefitCategoryIDHF" Name="BenefitCategoryID" PropertyName="Value" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <br />
            </ItemTemplate>
         </asp:DataList>
         <asp:SqlDataSource ID="CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Benefit_Category.CategoryName, Benefit_Category.BenefitCategoryID FROM Expense INNER JOIN Benefit_Category ON Expense.BenefitCategoryID = Benefit_Category.BenefitCategoryID INNER JOIN Beneficiary_Info ON Expense.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (Expense.Is_Approved = 0)"></asp:SqlDataSource>
      </div>

      <div id="Volunteer">
         <h3>Volunteer Expense</h3>
         <asp:DataList ID="VCategoryDataList" runat="server" DataKeyField="BenefitCategoryID" DataSourceID="VCategorySQL" Width="100%">
            <ItemTemplate>
               <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Eval("CategoryName") %>' />
               <asp:HiddenField ID="BenefitCategoryIDHF" runat="server" Value='<%# Eval("BenefitCategoryID") %>' />

               <asp:GridView ID="ExpenseGridView" AllowSorting="true" runat="server" AutoGenerateColumns="False" DataSourceID="ExpenseSQL" CssClass="mGrid">
                  <Columns>
                     <asp:BoundField DataField="UserName" HeaderText="Inserted By" SortExpression="UserName" />
                     <asp:BoundField DataField="Volunteer_SN" HeaderText="V. SN" SortExpression="Volunteer_SN" />
                     <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                     <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                     <asp:BoundField DataField="CategoryName" HeaderText="Expense Category" SortExpression="CategoryName" />
                     <asp:BoundField DataField="ExpenseDetails" HeaderText="Details" SortExpression="ExpenseDetails" />
                     <asp:BoundField DataField="ExpenseDate" DataFormatString="{0:d MMM yyyy}" HeaderText="Date" SortExpression="ExpenseDate" />
                     <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                     <asp:HyperLinkField DataNavigateUrlFields="ExpenseID" HeaderText="View" Text="View"
                        DataNavigateUrlFormatString="Volunteer/Approve_Expense.aspx?ExpenseID={0}" />
                  </Columns>
               </asp:GridView>

               <asp:SqlDataSource ID="ExpenseSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Registration.UserName, Expense_Category.CategoryName, Expense.ExpenseDetails, Expense.ExpenseDate, Expense.Amount, Volunteer.Volunteer_SN, V_Registration.Name, V_Registration.Phone, Expense.ExpenseID FROM Expense INNER JOIN Expense_Category ON Expense.ExpenseCategoryID = Expense_Category.ExpenseCategoryID INNER JOIN Registration ON Expense.RegistrationID = Registration.RegistrationID INNER JOIN Volunteer ON Expense.VolunteerID = Volunteer.VolunteerID INNER JOIN Registration AS V_Registration ON Volunteer.Volunteer_RegistrationID = V_Registration.RegistrationID WHERE (Expense.Is_Approved = 0) AND (Expense.BenefitCategoryID = @BenefitCategoryID) order by ExpenseDate">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="BenefitCategoryIDHF" Name="BenefitCategoryID" PropertyName="Value" />
                  </SelectParameters>
               </asp:SqlDataSource>
               <br />
            </ItemTemplate>
         </asp:DataList>
         <asp:SqlDataSource ID="VCategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Benefit_Category.CategoryName, Benefit_Category.BenefitCategoryID FROM Expense INNER JOIN Volunteer ON Expense.VolunteerID = Volunteer.VolunteerID LEFT OUTER JOIN Benefit_Category ON Expense.BenefitCategoryID = Benefit_Category.BenefitCategoryID WHERE (Expense.Is_Approved = 0)"></asp:SqlDataSource>
      </div>
   </div>

   <script src="/JS/jq_Profile/jquery-ui-1.8.23.custom.min.js"></script>
   <script type="text/javascript">
      $(function () { $('#main').tabs(); });
   </script>
</asp:Content>
