<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Collected_Loan.aspx.cs" Inherits="Award__bd.Accounts.Collection.Loan.Collected_Loan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
   <h3>Loan Collection
      <asp:Label ID="NameLabel" runat="server"></asp:Label></h3>
   <a href="Loan_Recevier_List.aspx">Back To List</a>

   <div class="row">
      <div class="col-md-3">
         <div class="form-group">
            <label>Amount</label>
            <asp:TextBox ID="AmountTextBox" runat="server" CssClass="form-control"></asp:TextBox>
         </div>
      </div>
      <div class="col-md-3">
         <div class="form-group">
            <label>&nbsp;Date</label>
            <asp:TextBox ID="ExpenseDateTextBox" runat="server" CssClass="form-control datepicker"></asp:TextBox>
         </div>
      </div>
   </div>


   <div class="row">
      <div class="col-md-6">
         <div class="form-group">
            <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SubmitButton_Click" />
            <asp:SqlDataSource ID="LoanSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" InsertCommand="INSERT INTO Loan_ReturnRecord(LoanID, RegistrationID, Amount, ReturnDate, BeneficiaryID) VALUES (@LoanID, @RegistrationID, @Amount, @ReturnDate, @BeneficiaryID)" SelectCommand="SELECT ReturnDate, Amount FROM Loan_ReturnRecord WHERE (LoanID = @LoanID)" UpdateCommand="UPDATE       Loan
SET                ReturnAmount = ReturnAmount + @ReturnAmount
WHERE        (LoanID = @LoanID)">
               <InsertParameters>
                  <asp:QueryStringParameter Name="LoanID" QueryStringField="LoanID" />
                  <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
                  <asp:ControlParameter ControlID="AmountTextBox" Name="Amount" PropertyName="Text" Type="Double" />
                  <asp:ControlParameter ControlID="ExpenseDateTextBox" Name="ReturnDate" PropertyName="Text" />
                  <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
               </InsertParameters>
               <SelectParameters>
                  <asp:QueryStringParameter Name="LoanID" QueryStringField="LoanID" />
               </SelectParameters>
               <UpdateParameters>
                  <asp:ControlParameter ControlID="AmountTextBox" Name="ReturnAmount" PropertyName="Text" />
                  <asp:QueryStringParameter Name="LoanID" QueryStringField="LoanID" />
               </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="LoanGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="LoanSQL">
      <Columns>
            <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" SortExpression="ReturnDate" DataFormatString="{0:d MMM yyyy}" />
         <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
      </Columns>
   </asp:GridView>
         </div>
      </div>
   </div>

   <script type="text/javascript">
      $(function () {
         $('.datepicker').datepicker({
            todayHighlight: true,
            autoclose: true,
            format: 'dd M yyyy'
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
