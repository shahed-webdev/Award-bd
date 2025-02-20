<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Award__bd.Beneficiary.ServiceOff.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
      #B_Details ul { margin: 0; padding: 0; }
         #B_Details ul li { border-bottom: 1px solid #ddd; font-size: 16px; line-height: 30px; list-style: outside none none; padding-bottom: 4px; }
      .img { border: 1px solid #ddd; width: 100px; height: 100px; }
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="B_Details">
        <h3>Beneficiary Details
         <asp:LinkButton ID="EditLinkButton" Text="Edit Info" CssClass="btn btn-link pull-right" runat="server" OnClick="EditLinkButton_Click" /></h3>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="BeneficiaryID" DataSourceID="Beneficiary_InfoSQL" Width="100%">
            <ItemTemplate>
                <img alt="No Image" src="/Handler/Beneficiry_Img.ashx?Img=<%#Eval("BeneficiaryID") %>" class="img-circle img-responsive img" />
                <ul>
                    <li><b>Case No:</b>
                        <asp:Label ID="CaseNoLabel" runat="server" Text='<%# Bind("CaseNo") %>' />
                    </li>
                    <li>
                        <b>Beneficiary Name:</b>
                        <asp:Label ID="BeneficiaryNameLabel" runat="server" Text='<%# Bind("BeneficiaryName") %>' />
                    </li>
                    <li><b>Beneficiary DOB:</b>
                        <asp:Label ID="Beneficiary_DOBLabel" runat="server" Text='<%# Bind("Beneficiary_DOB", "{0:d MMM yyyy}") %>' />
                    </li>
                    <li><b>Beneficiary NID:</b>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Beneficiary_NID") %>' />
                    </li>
                    <li><b>Father's Name:</b>
                        <asp:Label ID="FatherNameLabel" runat="server" Text='<%# Bind("FatherName") %>' />
                    </li>
                    <li><b>Father DOB:</b>
                        <asp:Label ID="Father_DOBLabel" runat="server" Text='<%# Bind("Father_DOB", "{0:d MMM yyyy}") %>' />
                    </li>
                    <li><b>Father NID:</b>
                        <asp:Label ID="Father_NIDLabel" runat="server" Text='<%# Bind("Father_NID") %>' />
                    </li>
                    <li><b>Mother's Name:</b>
                        <asp:Label ID="MotherNameLabel" runat="server" Text='<%# Bind("MotherName") %>' />
                    </li>
                    <li><b>Mother DOB:</b>
                        <asp:Label ID="Mother_DOBLabel" runat="server" Text='<%# Bind("Mother_DOB", "{0:d MMM yyyy}") %>' />
                    </li>
                    <li><b>Mother NID:</b>
                        <asp:Label ID="Mother_NIDLabel" runat="server" Text='<%# Bind("Mother_NID") %>' />
                    </li>
                    <li><b>Guardian's Name:</b>
                        <asp:Label ID="GuardianNameLabel" runat="server" Text='<%# Bind("GuardianName") %>' />
                    </li>
                    <li><b>Guardian DOB:</b>
                        <asp:Label ID="Guardian_DOBLabel" runat="server" Text='<%# Bind("Guardian_DOB", "{0:d MMM yyyy}") %>' />
                    </li>
                    <li><b>Guardian NID:</b>
                        <asp:Label ID="Guardian_NIDLabel" runat="server" Text='<%# Bind("Guardian_NID") %>' />
                    </li>
                    <li><b>Present Address:</b>
                        <asp:Label ID="PresentAddressLabel" runat="server" Text='<%# Bind("PresentAddress") %>' />
                    </li>
                    <li><b>Contact No:</b>
                        <asp:Label ID="ContactNoLabel" runat="server" Text='<%# Bind("ContactNo") %>' />
                    </li>
                    <li><b>Permanent Address:</b>
                        <asp:Label ID="PermanentAddressLabel" runat="server" Text='<%# Bind("PermanentAddress") %>' />
                    </li>
                    <li><b>Entry Date:</b>
                        <asp:Label ID="EntryDateLabel" runat="server" Text='<%# Bind("EntryDate", "{0:d MMM yyyy}") %>' />
                    </li>
                    <li><b>Categoty:</b>
                        <asp:Label ID="CategotyLabel" runat="server" Text='<%# Bind("Categoty") %>' />
                    </li>
                    <li><b>Reference:</b>
                        <asp:Label ID="ReferenceLabel" runat="server" Text='<%# Bind("Reference") %>' />
                    </li>

                    <li><b>Working Person in Family:</b>
                        <asp:Label ID="WorkingPerson_in_FamilyLabel" runat="server" Text='<%# Bind("WorkingPerson_in_Family") %>' />
                    </li>
                    <li><b>Monthly Income in Family:</b>
                        <asp:Label ID="Monthly_Income_in_FamilyLabel" runat="server" Text='<%# Bind("Monthly_Income_in_Family") %>' />
                    </li>
                    <li><b>Total Student in Family:</b>
                        <asp:Label ID="Total_Stu_in_FamilyLabel" runat="server" Text='<%# Bind("Total_Stu_in_Family") %>' />
                    </li>
                    <li><b>FastinMember:</b>
                        <asp:Label ID="FastingMemberLabel" runat="server" Text='<%# Bind("FastingMember") %>' />
                    </li>
                    <li><b>Other Benefit:</b>
                        <asp:Label ID="Other_BenefitLabel" runat="server" Text='<%# Bind("Other_Benefit") %>' />
                    </li>
                    <li><b>Approved:</b>
                        <asp:CheckBox ID="Is_ApprovedCheckBox" runat="server" Checked='<%# Bind("Is_Approved") %>' Enabled="false" />
                    </li>
                    <li><b>Observation:</b>
                        <asp:Label ID="ObservationLabel" runat="server" Text='<%# Bind("Observation") %>' />
                    </li>
                </ul>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="Beneficiary_InfoSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Beneficiary_Info] WHERE ([BeneficiaryID] = @BeneficiaryID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <%if (FamilyGridView.Rows.Count > 0)
            {%>
        <br />
        <h5>Family Details</h5>
        <asp:GridView ID="FamilyGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="BeneficiaryFamilyID" DataSourceID="Beneficiary_FamilySQL">
            <Columns>
                <asp:BoundField DataField="PersonName" HeaderText="Person Name" SortExpression="PersonName" />
                <asp:BoundField DataField="Person_DOB" DataFormatString="{0:d MMM yyyy}" HeaderText="Person DOB" SortExpression="Person_DOB" />
                <asp:BoundField DataField="Relationship" HeaderText="Relationship" SortExpression="Relationship" />
                <asp:BoundField DataField="Living_Together" HeaderText="Living Together or Not" SortExpression="Living_Together" />
                <asp:BoundField DataField="Marital_Status" HeaderText="Marital Status" SortExpression="Marital_Status" />
                <asp:BoundField DataField="Occupation" HeaderText="Occupation" SortExpression="Occupation" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Beneficiary_FamilySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Beneficiary_Family] WHERE (BeneficiaryID = @BeneficiaryID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%} %>

        <%if (BenefitCategoryGridView.Rows.Count > 0)
            {%>
        <br />
        <h5>Benefit Category(s)</h5>
        <asp:GridView ID="BenefitCategoryGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="BenefitCategorySQL">
            <Columns>
                <asp:BoundField DataField="CategoryName" HeaderText="Category Name" SortExpression="CategoryName" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="BenefitCategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT  Benefit_Category.CategoryName FROM Beneficiary_BenefitCategory INNER JOIN Benefit_Category ON Beneficiary_BenefitCategory.BenefitCategoryID = Benefit_Category.BenefitCategoryID WHERE (Beneficiary_BenefitCategory.BeneficiaryID = @BeneficiaryID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%} %>

        <%if (ExpenseGridView.Rows.Count > 0)
            {%>
        <br />
        <h5>Expense Category(s)</h5>
        <asp:GridView ID="ExpenseGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="ExpenseCategorySQL">
            <Columns>
                <asp:BoundField DataField="CategoryName" HeaderText="Expense Category" SortExpression="CategoryName" />
                <asp:BoundField DataField="Persentage" HeaderText="%" SortExpression="Persentage" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="ExpenseCategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Expense_Category.CategoryName, Beneficiary_Expense_Category.Persentage FROM Expense_Category INNER JOIN Beneficiary_Expense_Category ON Expense_Category.ExpenseCategoryID = Beneficiary_Expense_Category.ExpenseCategoryID WHERE (Beneficiary_Expense_Category.BeneficiaryID = @BeneficiaryID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%} %>

        <br /><h5>Service Off Reason</h5>
        <asp:GridView ID="Off_Reason_GridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="Off_ReasonSQL">
            <Columns>
                <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" />
                <asp:BoundField DataField="Service_date" HeaderText="Date" SortExpression="Service_date" DataFormatString="{0:d MMM yyyy}" />
                <asp:BoundField DataField="Service_Status" HeaderText="Status" SortExpression="Service_Status" />
            </Columns>
            <EmptyDataTemplate>
                No Data
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="Off_ReasonSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Service_Status, Service_date, Details FROM Beneficiary_Service_History WHERE (BeneficiaryID = @BeneficiaryID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
            </SelectParameters>
        </asp:SqlDataSource>

        <br />
        <asp:Button ID="ServiceButton" runat="server" Text="Service On" CssClass="btn btn-primary" OnClick="ServiceButton_Click" />
        <asp:SqlDataSource ID="ApproveSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Beneficiary_Info] WHERE  (BeneficiaryID = @BeneficiaryID)" UpdateCommand="UPDATE Beneficiary_Info SET  Is_Service_On = 1 WHERE (BeneficiaryID = @BeneficiaryID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>

