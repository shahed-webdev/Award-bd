<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Beneficiary_Allarea_List.aspx.cs" Inherits="Award__bd.Beneficiary.Expense.Beneficiary_Allarea_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .selected { background-color:#8ac8f5}
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
        
        <div class="form-group pull-right">
            <button type="button" class="btn btn-default btn-sm" onclick="window.print();">
                <span class="glyphicon glyphicon-print"></span>
                Print
            </button>
        </div>
    </div>

    <div class="NoPrint" style="margin:15px 0">
        <asp:GridView ID="AreaGridView" runat="server" AutoGenerateColumns="False" DataSourceID="AreaSQL" CssClass="mGrid">
            <Columns>
                <asp:TemplateField HeaderText="Select">
                    <HeaderTemplate>
                        <asp:CheckBox ID="SelectAllCheckBox" runat="server" Text=" " />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="SelectCheckBox" runat="server" Text=" " />
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:BoundField DataField="PresentArea" HeaderText="Area" SortExpression="PresentArea" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="AreaSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Beneficiary_Info.PresentArea
FROM            Beneficiary_Info LEFT OUTER JOIN
                         Beneficiary_BenefitCategory ON Beneficiary_Info.BeneficiaryID = Beneficiary_BenefitCategory.BeneficiaryID
WHERE        (Beneficiary_BenefitCategory.BenefitCategoryID = @BenefitCategoryID) AND (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1) AND (Beneficiary_Info.PresentDistrict LIKE @PresentDistrict)
ORDER BY Beneficiary_Info.PresentArea">
            <SelectParameters>
                <asp:ControlParameter ControlID="BenefitCategory_DropDownList" Name="BenefitCategoryID" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DistrictDropDownList" Name="PresentDistrict" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <div class="form-group">
            <asp:Button ID="FindButton" runat="server" Text="Find" CssClass="btn btn-primary" OnClick="FindButton_Click" />
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
            <asp:BoundField DataField="FatherName" HeaderText="Father's Name" SortExpression="FatherName" />
            <asp:BoundField DataField="MotherName" HeaderText="Mother's Name" SortExpression="MotherName" />
            <asp:BoundField DataField="PresentAddress" HeaderText="Present Address" SortExpression="PresentAddress" />
            <asp:BoundField DataField="ContactNo" HeaderText="Contact No" SortExpression="ContactNo" />
            <asp:BoundField DataField="Categoty" HeaderText="Categoty" SortExpression="Categoty" />
            <asp:BoundField DataField="Reference" HeaderText="Reference" SortExpression="Reference" />
            <asp:BoundField DataField="EntryDate" DataFormatString="{0:d MMM yyyy}" HeaderText="Entry Date" SortExpression="EntryDate" />
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
                         Beneficiary_Info.PresentArea
FROM            Beneficiary_Info LEFT OUTER JOIN
                         Beneficiary_BenefitCategory ON Beneficiary_Info.BeneficiaryID = Beneficiary_BenefitCategory.BeneficiaryID
WHERE        (Beneficiary_BenefitCategory.BenefitCategoryID = @BenefitCategoryID) AND (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1) AND 
                         (Beneficiary_Info.PresentArea IN (SELECT id FROM dbo.In_Function_Parameter(@Area) AS In_Function_Parameter_1)) AND (Beneficiary_Info.PresentDistrict LIKE @District)
                       
ORDER BY C_SN" CancelSelectOnNullParameter="False" OnSelected="BeneficiarySQL_Selected">
         <SelectParameters>
            <asp:ControlParameter ControlID="BenefitCategory_DropDownList" Name="BenefitCategoryID" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DistrictDropDownList" Name="District" PropertyName="SelectedValue" />
             <asp:Parameter Name="Area" />
         </SelectParameters>
      </asp:SqlDataSource>
   </div>

   <script>
       $("[id*=SelectAllCheckBox]").live("click", function () {
           var a = $(this), b = $(this).closest("table");
           $("input[type=checkbox]", b).each(function () {
               a.is(":checked") ? ($(this).attr("checked", "checked"), $("td", $(this).closest("tr")).addClass("selected")) : ($(this).removeAttr("checked"), $("td", $(this).closest("tr")).removeClass("selected"));
           });
       });
       $("[id*=SelectCheckBox]").live("click", function () {
           var a = $(this).closest("table"), b = $("[id*=chkHeader]", a);
           $(this).is(":checked") ? ($("td", $(this).closest("tr")).addClass("selected"), $("[id*=chkRow]", a).length == $("[id*=chkRow]:checked", a).length && b.attr("checked", "checked")) : ($("td", $(this).closest("tr")).removeClass("selected"), b.removeAttr("checked"));
       });


      $(function () {
          var BenefitCategory = "";
          var Category = "";
          var Area = "";
          var District = "";

         if ($("#<%=BenefitCategory_DropDownList.ClientID%>").find('option:selected').index() > 0) {
               BenefitCategory = "Benefit Category: " + $("#<%=BenefitCategory_DropDownList.ClientID%>").find('option:selected').text();
            }

           if ($("#<%=DistrictDropDownList.ClientID%>").find('option:selected').index() > 0) {
               District = ". District: " + $("#<%=DistrictDropDownList.ClientID%>").find('option:selected').text();
            }

           $("#Filter").text(BenefitCategory + Category + Area + District);
        });
   </script>
</asp:Content>
