<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Cloth_Payment.aspx.cs" Inherits="Award__bd.Beneficiary.Cloths.Cloth_Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Img_Warp .img-responsive { margin: 0 auto; }
        .img { height: 150px; width: 150px; border: 1px solid #ddd; margin-bottom: 13px; }
        .well { background-color: #fff; }

        #Info h4 { color: #23cb02; font-size: 24px; }
        #Info ul { margin: 0; padding: 0; }
            #Info ul li { border-bottom: 1px solid #a2a2a2; color: #5d5d5d; font-size: 20px; list-style: outside none none; padding: 6px 0; }
        #Main-Contain { min-height: 750px; }
        .Error { font-size: 24px; color: #ff6a00; display: none; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Cloth Payment</h3>

    <div class="form-inline">
        <div class="form-group">
            <asp:TextBox ID="CaseNoTextBox" placeholder="Case No" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="FindButton" runat="server" Text="Find" CssClass="btn btn-default" />
        </div>
    </div>

    <asp:FormView ID="InfoFormView" runat="server" DataSourceID="StudnetSQL" Width="100%" DataKeyNames="BeneficiaryID,BenefitCategoryID,Cloth_AssignID" OnDataBound="InfoFormView_DataBound">
        <EmptyDataTemplate>
            <div class="text-center">
                <label class="Error"></label>
            </div>
        </EmptyDataTemplate>
        <ItemTemplate>
            <div class="well" id="Info">
                <div class="Img_Warp">
                    <img alt="No Image" src="/Handler/Beneficiry_Img.ashx?Img=<%#Eval("BeneficiaryID") %>" class="img-responsive img" />
                </div>

                <div class="text-center">
                    <h2 style="text-align: center;">AWARD-ID CARD-<%# Eval("CaseNo") %></h2>
                </div>
                <ul>
                    <li>Name: <%# Eval("BeneficiaryName") %></li>
                    <li>Father's Name: <%# Eval("FatherName") %></li>
                    <li>Address: <%# Eval("PresentAddress") %></li>
                    <li>Care Of: <%# Eval("Reference") %></li>
                    <li>Contact: <%# Eval("ContactNo") %></li>
                </ul>
            </div>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="StudnetSQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT Beneficiary_Info.CaseNo, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.FatherName, Beneficiary_Info.Reference, Beneficiary_Info.ContactNo, Beneficiary_Info.PresentAddress, Beneficiary_Info.BeneficiaryID, Beneficiary_ClothAssign.Cloth_AssignID, Beneficiary_ClothAssign.BenefitCategoryID FROM Beneficiary_Info INNER JOIN Beneficiary_ClothAssign ON Beneficiary_Info.BeneficiaryID = Beneficiary_ClothAssign.BeneficiaryID WHERE (CAST(Beneficiary_Info.CaseNo AS varchar(50)) = @CaseNo) AND (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1) AND (Beneficiary_ClothAssign.IsUsed = 0)" UpdateCommand="UPDATE Food_Schedule_Assign SET UseBy_RegistrationID = @UseBy_RegistrationID, Is_Used = 1, UseTime = dateadd(hour,6,getutcdate()) WHERE (Food_Schedule_AssignID = @Food_Schedule_AssignID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="CaseNoTextBox" Name="CaseNo" PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:SessionParameter Name="UseBy_RegistrationID" SessionField="RegistrationID" />
            <asp:Parameter Name="Food_Schedule_AssignID" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <%if (InfoFormView.DataItemCount > 0)
        {%>
    <div class="form-group">
        <label>Expense Category</label>
        <asp:DropDownList ID="ExpenseCategoryDropDownList" runat="server" CssClass="form-control" DataSourceID="Expense_CategorySQL" DataTextField="Expense Category" DataValueField="ExpenseCategoryID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Expense_CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Expense_Category.CategoryName AS [Expense Category], Expense_Category.ExpenseCategoryID FROM Benefit_Expense_Category INNER JOIN Expense_Category ON Benefit_Expense_Category.ExpenseCategoryID = Expense_Category.ExpenseCategoryID INNER JOIN Beneficiary_Expense_Category ON Expense_Category.ExpenseCategoryID = Beneficiary_Expense_Category.ExpenseCategoryID WHERE (Benefit_Expense_Category.BenefitCategoryID = @BenefitCategoryID) AND (Beneficiary_Expense_Category.BeneficiaryID = @BeneficiaryID)">
            <SelectParameters>
                <asp:Parameter Name="BeneficiaryID" />
                <asp:Parameter Name="BenefitCategoryID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="form-group">
        <label>Amount<asp:RequiredFieldValidator ControlToValidate="AmountTextBox" ValidationGroup="S" ID="R1" runat="server" ErrorMessage="Required" CssClass="EroorStar"></asp:RequiredFieldValidator></label>
        <asp:TextBox ID="AmountTextBox" runat="server" CssClass="form-control" onkeypress="return isNumberKey(event)" autocomplete="off" onDrop="blur();return false;"></asp:TextBox>
    </div>
    <div class="form-group">
        <label>Description</label>
        <asp:TextBox ID="DescriptionTextBox" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="form-group">
            <label>Document</label>
            <input name="photo" type="file" required="" />
             <asp:HiddenField ID="Imge_HF" runat="server" />
         </div>
    <div class="form-group">
        <asp:Button ID="PayButton" ValidationGroup="S" runat="server" CssClass="btn btn-primary" Text="Pay" OnClick="PaidButton_Click" />

        <asp:SqlDataSource ID="ExpenseSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" InsertCommand="INSERT INTO Expense(RegistrationID, ExpenseCategoryID, BenefitCategoryID, BeneficiaryID, Amount, ExpenseDate, Persentage, Amount_Without_Per, ExpenseDetails, Expense_Document) VALUES (@RegistrationID, @ExpenseCategoryID, @BenefitCategoryID, @BeneficiaryID, @Amount, dateadd(hour,6,getutcdate()), @Persentage, @Amount_Without_Per, @ExpenseDetails,CAST(N'' AS xml).value('xs:base64Binary(sql:variable(&quot;@Expense_Document&quot;))', 'varbinary(max)'))" SelectCommand="SELECT * FROM [Expense]" UpdateCommand="UPDATE Beneficiary_ClothAssign SET IsUsed = 1, UsedDate = dateadd(hour,6,getutcdate()) WHERE (Cloth_AssignID = @Cloth_AssignID)">
            <InsertParameters>
                <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
                <asp:ControlParameter ControlID="ExpenseCategoryDropDownList" Name="ExpenseCategoryID" PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter Name="BenefitCategoryID" Type="Int32" />
                <asp:Parameter Name="BeneficiaryID" Type="Int32" />
                <asp:ControlParameter ControlID="AmountTextBox" Name="Amount" PropertyName="Text" Type="Double" />
                <asp:Parameter Name="Persentage" DefaultValue="100" />
                <asp:ControlParameter ControlID="AmountTextBox" DefaultValue="" Name="Amount_Without_Per" PropertyName="Text" />
                <asp:ControlParameter ControlID="DescriptionTextBox" Name="ExpenseDetails" PropertyName="Text" />
                <asp:ControlParameter ControlID="Imge_HF" Name="Expense_Document" PropertyName="Value" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Cloth_AssignID" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <%} %>


    <script>
        $('input[name=photo]').change(function (e) {
            var file = e.target.files[0];
            canvasResize(file, {
                width: 900,
                height: 0,
                crop: false,
                quality: 8,
                callback: function (data) {
                    data.split(",")[1]
                    $("[id*=Imge_HF]").val(data.split(",")[1]);
                }
            });
        });
        function isNumberKey(a) { a = a.which ? a.which : event.keyCode; return 46 != a && 31 < a && (48 > a || 57 < a) ? !1 : !0 };
    </script>
</asp:Content>
