<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Beneficiary_List.aspx.aspx.cs" Inherits="Award__bd.Beneficiary.Expense.Beneficiary_List_aspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-inline .form-group { margin-bottom: 15px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Beneficiary List 
      <asp:Label ID="CountLabel" runat="server"></asp:Label>
    </h3>

    <div class="form-inline NoPrint">
        <div class="form-group">
            <asp:DropDownList ID="BenefitCategory_DropDownList" runat="server" CssClass="form-control" DataSourceID="BenefitCategorySQL" DataTextField="CategoryName" DataValueField="BenefitCategoryID" AppendDataBoundItems="True" AutoPostBack="True">
                <asp:ListItem Value="0">[ Benefit Category ]</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="BenefitCategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Benefit_Category.CategoryName, Beneficiary_BenefitCategory.BenefitCategoryID
FROM            Benefit_Category INNER JOIN
                         Beneficiary_BenefitCategory ON Benefit_Category.BenefitCategoryID = Beneficiary_BenefitCategory.BenefitCategoryID INNER JOIN
                         Beneficiary_Info ON Beneficiary_BenefitCategory.BeneficiaryID = Beneficiary_Info.BeneficiaryID
WHERE        (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1)
ORDER BY Beneficiary_BenefitCategory.BenefitCategoryID"></asp:SqlDataSource>
        </div>
        <div class="form-group">
            <asp:DropDownList ID="CategoryDropDownList" runat="server" CssClass="form-control" DataSourceID="CategorySQL" DataTextField="Categoty" DataValueField="Categoty" AutoPostBack="True" OnDataBound="CategoryDropDownList_DataBound">
            </asp:DropDownList>
            <asp:SqlDataSource ID="CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Beneficiary_Info.Categoty
FROM            Beneficiary_Info LEFT OUTER JOIN
                         Beneficiary_BenefitCategory ON Beneficiary_Info.BeneficiaryID = Beneficiary_BenefitCategory.BeneficiaryID
WHERE        (Beneficiary_BenefitCategory.BenefitCategoryID = @BenefitCategoryID) AND (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1)
ORDER BY Beneficiary_Info.Categoty">
                <SelectParameters>
                    <asp:ControlParameter ControlID="BenefitCategory_DropDownList" Name="BenefitCategoryID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="form-group">
            <asp:DropDownList ID="AreaDropDownList" runat="server" CssClass="form-control" DataSourceID="AreaSQL" DataTextField="PresentArea" DataValueField="PresentArea" AutoPostBack="True" OnDataBound="AreaDropDownList_DataBound">
            </asp:DropDownList>
            <asp:SqlDataSource ID="AreaSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Beneficiary_Info.PresentArea
FROM            Beneficiary_Info LEFT OUTER JOIN
                         Beneficiary_BenefitCategory ON Beneficiary_Info.BeneficiaryID = Beneficiary_BenefitCategory.BeneficiaryID
WHERE        (Beneficiary_BenefitCategory.BenefitCategoryID = @BenefitCategoryID) AND (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1)
ORDER BY Beneficiary_Info.PresentArea">
                <SelectParameters>
                    <asp:ControlParameter ControlID="BenefitCategory_DropDownList" Name="BenefitCategoryID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="form-group">
            <asp:DropDownList ID="DistrictDropDownList" runat="server" CssClass="form-control" DataSourceID="DistrictSQL" DataTextField="PresentDistrict" DataValueField="PresentDistrict" AutoPostBack="True" OnDataBound="DistrictDropDownList_DataBound">
            </asp:DropDownList>
            <asp:SqlDataSource ID="DistrictSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Beneficiary_Info.PresentDistrict
FROM            Beneficiary_Info LEFT OUTER JOIN
                         Beneficiary_BenefitCategory ON Beneficiary_Info.BeneficiaryID = Beneficiary_BenefitCategory.BeneficiaryID
WHERE        (Beneficiary_BenefitCategory.BenefitCategoryID = @BenefitCategoryID) AND (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1)
ORDER BY Beneficiary_Info.PresentDistrict">
                <SelectParameters>
                    <asp:ControlParameter ControlID="BenefitCategory_DropDownList" Name="BenefitCategoryID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="form-group">
            <asp:DropDownList ID="Inserted_By_DropDownList" CssClass="form-control" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="InsertBySQL" DataTextField="Name" DataValueField="RegistrationID">
                <asp:ListItem Value="%">[ ALL USER ]</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="InsertBySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Registration.Name + ' (' + Registration.UserName + ')' AS Name, Beneficiary_Info.RegistrationID FROM Beneficiary_Info INNER JOIN Registration ON Beneficiary_Info.RegistrationID = Registration.RegistrationID WHERE (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1) ORDER BY Name"></asp:SqlDataSource>
        </div>
        <div class="form-group">
            <asp:DropDownList ID="ReferenceDropDownList" CssClass="form-control" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="ReferenceSQL" DataTextField="Reference" DataValueField="Reference">
                <asp:ListItem Value="%">[ ALL Reference ]</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="ReferenceSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Reference FROM Beneficiary_Info WHERE (Is_Approved = 1) AND (Is_Service_On = 1) ORDER BY Reference"></asp:SqlDataSource>
        </div>
        <div class="form-group">
            <asp:DropDownList ID="DonorDropDownList" CssClass="form-control" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="DonorSQL" DataTextField="Name" DataValueField="Donator_VolunteerID">
                <asp:ListItem Value="%">[ ALL Donor ]</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="DonorSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Registration.Name + ' (' + Registration.UserName + ')' AS Name, Beneficiary_Info.Donator_VolunteerID FROM Beneficiary_Info INNER JOIN Volunteer ON Beneficiary_Info.Donator_VolunteerID = Volunteer.VolunteerID INNER JOIN Registration ON Registration.RegistrationID = Volunteer.Volunteer_RegistrationID WHERE (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1) ORDER BY Name"></asp:SqlDataSource>
        </div>
        <div class="form-group">
            <asp:DropDownList ID="ClassDropDownList" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="ClassSQL" DataTextField="Class_Year" DataValueField="Class_Year" OnDataBound="ClassDropDownList_DataBound">
            </asp:DropDownList>
            <asp:SqlDataSource ID="ClassSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Beneficiary_Info.Class_Year
FROM            Beneficiary_Info LEFT OUTER JOIN
                         Beneficiary_BenefitCategory ON Beneficiary_Info.BeneficiaryID = Beneficiary_BenefitCategory.BeneficiaryID
WHERE        (Beneficiary_BenefitCategory.BenefitCategoryID = @BenefitCategoryID) AND (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1)
ORDER BY Beneficiary_Info.Class_Year">
                <SelectParameters>
                    <asp:ControlParameter ControlID="BenefitCategory_DropDownList" Name="BenefitCategoryID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="form-group">
            <asp:TextBox ID="FindTextBox" runat="server" CssClass="form-control" placeholder="Name,Contact No,Case No,NID"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="FindButton" runat="server" Text="Find" CssClass="btn btn-primary" />
        </div>
        <div class="form-group pull-right">
            <a title="Print" class="NoPrint" onclick="window.print();"><span class="glyphicon glyphicon-print"></span></a>
        </div>
    </div>

    <div class="SA">
        <label id="Filter"></label>
    </div>

    <div class="table-responsive">
        <asp:GridView ID="BeneficiaryGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="BeneficiaryID" DataSourceID="BeneficiarySQL" AllowSorting="True" PageSize="100" OnRowDataBound="BeneficiaryGridView_RowDataBound">
            <Columns>
                <asp:BoundField DataField="CaseNo" HeaderText="Case No" SortExpression="C_SN" />
                <asp:HyperLinkField DataNavigateUrlFields="BeneficiaryID,BeneficiaryName,BenefitCategoryID" HeaderText="Name" DataTextField="BeneficiaryName"
                    DataNavigateUrlFormatString="Beneficiary_Expense.aspx?BeneficiaryID={0}&N={1}&Category={2}" />
                <asp:BoundField DataField="Class_Year" HeaderText="Class" SortExpression="Class_Year" />
                <asp:BoundField DataField="FatherName" HeaderText="Father's Name" SortExpression="FatherName" />
                <asp:BoundField DataField="MotherName" HeaderText="Mother's Name" SortExpression="MotherName" />
                <asp:BoundField DataField="PresentAddress" HeaderText="Present Address" SortExpression="PresentAddress" />
                <asp:BoundField DataField="ContactNo" HeaderText="Contact No" SortExpression="ContactNo" />
                <asp:BoundField DataField="Categoty" HeaderText="Categoty" SortExpression="Categoty" />
                <asp:BoundField DataField="Reference" HeaderText="Reference" SortExpression="Reference" />
                <asp:BoundField DataField="EntryDate" DataFormatString="{0:d MMM yyyy}" HeaderText="Entry Date" SortExpression="EntryDate" />
                <asp:HyperLinkField DataNavigateUrlFields="BeneficiaryID" HeaderText="Card" Text="Card" DataNavigateUrlFormatString="../Card/Autistic_Card.aspx?BeneficiaryID={0}" />
            </Columns>
            <EmptyDataTemplate>
                No Records
            </EmptyDataTemplate>
            <PagerStyle CssClass="pgr" />
        </asp:GridView>
        <asp:SqlDataSource ID="BeneficiarySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT        Beneficiary_Info.BeneficiaryID, Beneficiary_Info.RegistrationID, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.Beneficiary_DOB, Beneficiary_Info.Beneficiary_NID, Beneficiary_Info.FatherName, 
                         Beneficiary_Info.Father_DOB, Beneficiary_Info.Father_NID, Beneficiary_Info.MotherName, Beneficiary_Info.Mother_DOB, Beneficiary_Info.Mother_NID, Beneficiary_Info.GuardianName, 
                         Beneficiary_Info.Guardian_DOB, Beneficiary_Info.Guardian_NID, Beneficiary_Info.PresentAddress, Beneficiary_Info.ContactNo, Beneficiary_Info.PermanentAddress, Beneficiary_Info.EntryDate, 
                         Beneficiary_Info.Categoty, Beneficiary_Info.Reference, Beneficiary_Info.CaseNo AS C_SN, CAST(Beneficiary_Info.CaseNo AS nvarchar(50)) AS CaseNo, Beneficiary_Info.WorkingPerson_in_Family, 
                         Beneficiary_Info.Monthly_Income_in_Family, Beneficiary_Info.Total_Stu_in_Family, Beneficiary_Info.FastingMember, Beneficiary_Info.Other_Benefit, Beneficiary_Info.Is_Approved, 
                         Beneficiary_Info.ApprovedBy_ID, Beneficiary_Info.VolunteerID, Beneficiary_Info.Observation, Beneficiary_Info.InsertDate, Beneficiary_BenefitCategory.BenefitCategoryID, Beneficiary_Info.PresentDistrict, 
                         Beneficiary_Info.PresentArea,Beneficiary_Info.Class_Year
FROM            Beneficiary_Info LEFT OUTER JOIN
                         Beneficiary_BenefitCategory ON Beneficiary_Info.BeneficiaryID = Beneficiary_BenefitCategory.BeneficiaryID
WHERE        (Beneficiary_BenefitCategory.BenefitCategoryID = @BenefitCategoryID) AND (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1) AND (Beneficiary_Info.Categoty LIKE @Categoty) AND 
                         (Beneficiary_Info.PresentArea LIKE @Area) AND (Beneficiary_Info.PresentDistrict LIKE @District) AND (Beneficiary_Info.RegistrationID LIKE @RegistrationID) AND 
                         (ISNULL(Beneficiary_Info.Reference, 0) LIKE @Reference) AND (ISNULL(Beneficiary_Info.Donator_VolunteerID, 0) LIKE @Donator_VolunteerID) AND (Beneficiary_Info.Class_Year LIKE @Class)
ORDER BY C_SN"
            FilterExpression="BeneficiaryName LIKE '{0}%' or ContactNo LIKE '{0}%' or CaseNo LIKE '{0}%' or Beneficiary_NID LIKE '{0}%'" CancelSelectOnNullParameter="False" OnSelected="BeneficiarySQL_Selected">
            <FilterParameters>
                <asp:ControlParameter ControlID="FindTextBox" Name="find" PropertyName="Text" />
            </FilterParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="BenefitCategory_DropDownList" Name="BenefitCategoryID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="CategoryDropDownList" Name="Categoty" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="AreaDropDownList" Name="Area" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DistrictDropDownList" Name="District" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="Inserted_By_DropDownList" Name="RegistrationID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ReferenceDropDownList" Name="Reference" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DonorDropDownList" Name="Donator_VolunteerID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ClassDropDownList" Name="Class" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>




    <script>
        $(function () {
            var BenefitCategory = "";
            if ($("#<%=BenefitCategory_DropDownList.ClientID%>").find('option:selected').index() > 0) {
             BenefitCategory = "Benefit Category: " + $("#<%=BenefitCategory_DropDownList.ClientID%>").find('option:selected').text();
         }

          var Category = "";
          if ($("#<%=CategoryDropDownList.ClientID%>").find('option:selected').index() > 0) {
               Category = ". Category: " + $("#<%=CategoryDropDownList.ClientID%>").find('option:selected').text();
           }

          var Area = "";
          if ($("#<%=AreaDropDownList.ClientID%>").find('option:selected').index() > 0) {
               Area = ". Area: " + $("#<%=AreaDropDownList.ClientID%>").find('option:selected').text();
           }

          var District = "";
          if ($("#<%=DistrictDropDownList.ClientID%>").find('option:selected').index() > 0) {
               District = ". District: " + $("#<%=DistrictDropDownList.ClientID%>").find('option:selected').text();
           }


          $("#Filter").text(BenefitCategory + Category + Area + District);
      });
    </script>



</asp:Content>
