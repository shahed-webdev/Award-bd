<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Delete_A_Expense.aspx.cs" Inherits="Award__bd.Accounts.Expense.Delete_A_Expense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style>
      #Tab { margin-top:20px;}
      #Tab .nav-pills > li > a { border-radius: 4px 4px 0 0; border:1px solid #ddd; border-bottom:none;}
      #Tab .tab-content { padding: 5px 15px; border: 1px solid #ddd;border-radius: 4px; }
   </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <div id="main">
      <div class="form-inline NoPrint">
         <div class="form-group">
            <asp:TextBox ID="FromDateTextBox" placeholder="From Date" runat="server" CssClass="form-control datepicker"></asp:TextBox>
         </div>
         <div class="form-group">
            <asp:TextBox ID="ToDateTextBox" placeholder="To Date" runat="server" CssClass="form-control datepicker"></asp:TextBox>
         </div>
         <div class="form-group">
            <asp:Button ID="FindButton" runat="server" Text="Find" CssClass="btn btn-primary" />
         </div>
      </div>

      <div id="Tab">
         <ul class="nav nav-pills">
            <li class="active"><a href="#Beneficiary" data-toggle="tab">Beneficiary Expense</a></li>
            <li><a href="#Volunteer" data-toggle="tab">Volunteer Expense</a></li>
         </ul>

         <div class="tab-content clearfix">
            <div class="tab-pane active" id="Beneficiary">
               <asp:Repeater ID="CategoryRepeater" runat="server" DataSourceID="CategorySQL">
                  <ItemTemplate>
                      <h4><%# Eval("CategoryName") %></h4>
                     <asp:HiddenField ID="BenefitCategoryIDHF" runat="server" Value='<%# Eval("BenefitCategoryID") %>' />
                     <asp:GridView ID="ExpenseGridView" runat="server" AutoGenerateColumns="False" DataSourceID="ExpenseSQL" CssClass="mGrid" AllowSorting="True" AllowPaging="True" PageSize="10" PagerStyle-CssClass="pgr">
                        <Columns>
                           <asp:BoundField DataField="UserName" HeaderText="Inserted By" SortExpression="UserName" />
                           <asp:BoundField DataField="CaseNo" HeaderText="Case No" SortExpression="CaseNo" />
                           <asp:BoundField DataField="BeneficiaryName" HeaderText="Beneficiary Name" SortExpression="BeneficiaryName" />
                           <asp:BoundField DataField="CategoryName" HeaderText="Expense Category" SortExpression="CategoryName" />
                           <asp:BoundField DataField="ExpenseDetails" HeaderText="Details" SortExpression="ExpenseDetails" />
                           <asp:BoundField DataField="ExpenseDate" DataFormatString="{0:d MMM yyyy}" HeaderText="Date" SortExpression="ExpenseDate" />
                           <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                           <asp:HyperLinkField DataNavigateUrlFields="ExpenseID" HeaderText="View" Text="View"
                              DataNavigateUrlFormatString="Beneficiry/Delete_B_Ex.aspx?ExpenseID={0}" />
                        </Columns>
                     </asp:GridView>
                     <asp:SqlDataSource ID="ExpenseSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Registration.UserName, Beneficiary_Info.CaseNo, Beneficiary_Info.BeneficiaryName, Expense_Category.CategoryName, Expense.ExpenseDetails, Expense.ExpenseDate, Expense.Amount, Expense.ExpenseID FROM Expense INNER JOIN Expense_Category ON Expense.ExpenseCategoryID = Expense_Category.ExpenseCategoryID INNER JOIN Registration ON Expense.RegistrationID = Registration.RegistrationID INNER JOIN Beneficiary_Info ON Expense.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (Expense.BenefitCategoryID = @BenefitCategoryID)AND (Expense.Is_Approved = 1) and (Expense.ExpenseDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000'))" CancelSelectOnNullParameter="False">
                        <SelectParameters>
                           <asp:ControlParameter ControlID="BenefitCategoryIDHF" Name="BenefitCategoryID" PropertyName="Value" />
                           <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
                           <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
                        </SelectParameters>
                     </asp:SqlDataSource>
                     <br />
                  </ItemTemplate>
               </asp:Repeater>
               <asp:SqlDataSource ID="CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Benefit_Category.CategoryName, Benefit_Category.BenefitCategoryID FROM Expense INNER JOIN Benefit_Category ON Expense.BenefitCategoryID = Benefit_Category.BenefitCategoryID INNER JOIN Beneficiary_Info ON Expense.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (Expense.Is_Approved = 1) and (Expense.ExpenseDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000'))" CancelSelectOnNullParameter="False">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
                     <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
                  </SelectParameters>
               </asp:SqlDataSource>
            </div>

            <div class="tab-pane" id="Volunteer">
               <asp:Repeater ID="VCategoryRepeater" runat="server" DataSourceID="VCategorySQL">
                  <ItemTemplate>
                     <h4><%# Eval("CategoryName") %></h4>
                     <asp:HiddenField ID="BenefitCategoryIDHF" runat="server" Value='<%# Eval("BenefitCategoryID") %>' />

                     <asp:GridView ID="ExpenseGridView" runat="server" AutoGenerateColumns="False" DataSourceID="ExpenseSQL" CssClass="mGrid" AllowSorting="True" AllowPaging="True" PageSize="10" PagerStyle-CssClass="pgr">
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
                              DataNavigateUrlFormatString="Volunteer/Delete_V_Ex.aspx?ExpenseID={0}" />
                        </Columns>
                     </asp:GridView>

                     <asp:SqlDataSource ID="ExpenseSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Registration.UserName, Expense_Category.CategoryName, Expense.ExpenseDetails, Expense.ExpenseDate, Expense.Amount, Volunteer.Volunteer_SN, V_Registration.Name, V_Registration.Phone, Expense.ExpenseID FROM Expense INNER JOIN Expense_Category ON Expense.ExpenseCategoryID = Expense_Category.ExpenseCategoryID INNER JOIN Registration ON Expense.RegistrationID = Registration.RegistrationID INNER JOIN Volunteer ON Expense.VolunteerID = Volunteer.VolunteerID INNER JOIN Registration AS V_Registration ON Volunteer.Volunteer_RegistrationID = V_Registration.RegistrationID WHERE (Expense.BenefitCategoryID = @BenefitCategoryID) AND (Expense.Is_Approved = 1) and (Expense.ExpenseDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000'))" CancelSelectOnNullParameter="False">
                        <SelectParameters>
                           <asp:ControlParameter ControlID="BenefitCategoryIDHF" Name="BenefitCategoryID" PropertyName="Value" />
                           <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
                           <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
                        </SelectParameters>
                     </asp:SqlDataSource>
                     <br />
                  </ItemTemplate>
               </asp:Repeater>
               <asp:SqlDataSource ID="VCategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Benefit_Category.CategoryName, Benefit_Category.BenefitCategoryID FROM Expense INNER JOIN Volunteer ON Expense.VolunteerID = Volunteer.VolunteerID LEFT OUTER JOIN Benefit_Category ON Expense.BenefitCategoryID = Benefit_Category.BenefitCategoryID WHERE (Expense.Is_Approved = 1) and (Expense.ExpenseDate BETWEEN ISNULL(@From_Date, '1-1-1000') AND ISNULL(@To_Date, '1-1-3000'))" CancelSelectOnNullParameter="False">
                  <SelectParameters>
                     <asp:ControlParameter ControlID="FromDateTextBox" Name="From_Date" PropertyName="Text" />
                     <asp:ControlParameter ControlID="ToDateTextBox" Name="To_Date" PropertyName="Text" />
                  </SelectParameters>
               </asp:SqlDataSource>
            </div>
         </div>
      </div>
   </div>


   <script type="text/javascript">
      $(function () {
         $('.datepicker').datepicker({
            format: 'dd M yyyy',
            todayHighlight: true,
            autoclose: true
         });
      });
   </script>


</asp:Content>
