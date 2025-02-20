<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Donation.aspx.cs" Inherits="Award__bd.Accounts.Collection.Donation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <h3>Donation From 
      <asp:Label ID="NameLabel" runat="server" ForeColor="#009933"></asp:Label></h3>
   <a href="DonatorList.aspx">Back To List</a>

   <div class="row">
      <div class="col-md-3">
         <div class="form-group">
            <label>Benefit Category</label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="BenefitCategory_DropDownList" InitialValue="0" runat="server" ErrorMessage="*" CssClass="EroorStar" ValidationGroup="Sb"></asp:RequiredFieldValidator>
            <asp:DropDownList ID="BenefitCategory_DropDownList" runat="server" CssClass="form-control _Check" DataSourceID="BenefitCategorySQL" DataTextField="CategoryName" DataValueField="BenefitCategoryID" AppendDataBoundItems="True" AutoPostBack="True">
               <asp:ListItem Value="0">[ SELECT ]</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="BenefitCategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Benefit_Category]"></asp:SqlDataSource>
         </div>
      </div>

      <div class="col-md-3">
         <div class="form-group">
            <label>Case No.</label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="CaseNoTextBox" runat="server" ErrorMessage="*" CssClass="EroorStar" ValidationGroup="Sb"></asp:RequiredFieldValidator>
            <label id="Is_Error" class="EroorStar"></label>
            <asp:TextBox ID="CaseNoTextBox" runat="server" CssClass="form-control _Check"></asp:TextBox>
         </div>
      </div>
      <div class="col-md-3">
         <div class="form-group">
            <label>Amount</label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="AmountTextBox" runat="server" ErrorMessage="*" CssClass="EroorStar" ValidationGroup="Sb"></asp:RequiredFieldValidator>
            <asp:TextBox ID="AmountTextBox" runat="server" CssClass="form-control"></asp:TextBox>
         </div>
      </div>
      <div class="col-md-3">
         <div class="form-group">
            <label>&nbsp;Date</label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="ExpenseDateTextBox" runat="server" ErrorMessage="*" CssClass="EroorStar" ValidationGroup="Sb"></asp:RequiredFieldValidator>
            <asp:TextBox ID="ExpenseDateTextBox" runat="server" CssClass="form-control datepicker"></asp:TextBox>
         </div>
      </div>
   </div>

   <div class="row">
      <div class="col-md-12">
         <div class="form-group">
            <label>Donate Details</label>
            <asp:TextBox ID="ExpenseDetailsTextBox" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
         </div>
      </div>
   </div>

   <div class="row">
      <div class="col-md-6">
         <div class="form-group">
            <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SubmitButton_Click" ValidationGroup="Sb" />
            <asp:SqlDataSource ID="DonateSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" InsertCommand="INSERT INTO Donation(RegistrationID, BenefitCategoryID, VolunteerID, Amount, DonationDate, DonationDetails, BeneficiaryID) SELECT @RegistrationID , @BenefitCategoryID, @VolunteerID , @Amount, @DonationDate , @DonationDetails, BeneficiaryID FROM Beneficiary_Info  WHERE (CaseNo = @CaseNo)" SelectCommand="SELECT * FROM [Expense] WHERE  (BeneficiaryID = @BeneficiaryID)">
               <InsertParameters>
                  <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
                  <asp:ControlParameter ControlID="BenefitCategory_DropDownList" Name="BenefitCategoryID" PropertyName="SelectedValue" Type="Int32" />
                  <asp:QueryStringParameter Name="VolunteerID" QueryStringField="VolunteerID" />
                  <asp:ControlParameter ControlID="AmountTextBox" Name="Amount" PropertyName="Text" Type="Double" />
                  <asp:ControlParameter ControlID="ExpenseDateTextBox" Name="DonationDate" PropertyName="Text" />
                  <asp:ControlParameter ControlID="ExpenseDetailsTextBox" Name="DonationDetails" PropertyName="Text" />
                  <asp:ControlParameter ControlID="CaseNoTextBox" Name="CaseNo" PropertyName="Text" />
               </InsertParameters>
               <SelectParameters>
                  <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
               </SelectParameters>
            </asp:SqlDataSource>
         </div>
      </div>
   </div>

   <script type="text/javascript">
      $(function () {
         $('._Check').on('keyup keypress blur focus select drop', function () {
            $.ajax({
               type: "POST",
               url: "Donation.aspx/CheckCaseNo",
               contentType: "application/json; charset=utf-8",
               data: '{"CaseNo":"' + $("#<%=CaseNoTextBox.ClientID%>")[0].value + '","BenefitCategoryID":"' + $("#<%=BenefitCategory_DropDownList.ClientID%>").find('option:selected').val() + '"}',
               dataType: "json",
               success: OnSuccess,
               failure: function (response) { alert(response) }
            });
         });
         function OnSuccess(response) {
            var msg = $("#Is_Error")[0];

            if (response.d == "false") {
               msg.innerHTML = "Invalid Case No.";
               $("[id*=SubmitButton]").prop("disabled", !0).removeClass("btn btn-primary");
            }
            else {
               msg.innerHTML = "";
               $("[id*=SubmitButton]").prop("disabled", !1).addClass("btn btn-primary");

            }
         }



         $('.datepicker').datepicker({
            format: 'dd M yyyy',
            todayHighlight: true,
            autoclose: true
         });
      });

      $('INPUT[type="file"]').change(function () {
         var ext = this.value.match(/\.(.+)$/)[1];
         switch (ext) {
            case 'jpg':
            case 'jpeg':
            case 'png':
               $('[id*=ImageFileUpload]').attr('disabled', false);
               break;
            default:
               alert('This is not an allowed file type.');
               this.value = '';
         }
      });
   </script>
</asp:Content>
