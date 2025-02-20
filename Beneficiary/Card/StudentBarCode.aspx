<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="StudentBarCode.aspx.cs" Inherits="Award__bd.Beneficiary.Card.StudentBarCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Hide { display: none; }
        .Img_Warp .img-responsive { margin: 0 auto; }
        .img { height: 150px; width: 150px; border: 1px solid #ddd; margin-bottom: 13px; }
        .well { background-color: #fff; }
        #Info h4 { color: #23cb02; font-size: 20px; }
        #Info ul { margin: 0; padding: 0; }
        #Info ul li { border-bottom: 1px solid #a2a2a2; color: #5d5d5d; font-size: 18px; list-style: outside none none; padding: 6px 0; }
        #Main-Contain { min-height: 750px; }
        .Error { font-size: 24px; color: #ff6a00; display: none; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="text-center">
            <input id="QRcodeScan" class="btn btn-success" value="QR Code Scanner" type="button" onfocus="popup.open(event,1);" />
        </div>

        <h1 class="text-center">Student Payment</h1>

        <asp:FormView ID="InfoFormView" runat="server" DataSourceID="StudnetSQL" Width="100%">
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
        <asp:SqlDataSource ID="StudnetSQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT Beneficiary_Info.CaseNo, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.FatherName, Beneficiary_Info.Reference, Beneficiary_Info.ContactNo, Beneficiary_Info.PresentAddress, Beneficiary_Info.BeneficiaryID FROM Benefit_Category INNER JOIN Beneficiary_BenefitCategory ON Benefit_Category.BenefitCategoryID = Beneficiary_BenefitCategory.BenefitCategoryID INNER JOIN Beneficiary_Info ON Beneficiary_BenefitCategory.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (CAST(Beneficiary_Info.CaseNo AS varchar(50)) = @CaseNo) AND (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1) AND (Benefit_Category.CategoryName = N'Student')" UpdateCommand="UPDATE Food_Schedule_Assign SET UseBy_RegistrationID = @UseBy_RegistrationID, Is_Used = 1, UseTime = dateadd(hour,6,getutcdate()) WHERE (Food_Schedule_AssignID = @Food_Schedule_AssignID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="CaseNoHF" Name="CaseNo" PropertyName="Value" />
            </SelectParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="UseBy_RegistrationID" SessionField="RegistrationID" />
                <asp:Parameter Name="Food_Schedule_AssignID" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="Hide" />
        <asp:HiddenField ID="CaseNoHF" runat="server" />

        <%if (InfoFormView.DataItemCount > 0)
            {%>
        <asp:GridView ID="GenerateGridView" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="GenerateSQL" DataKeyNames="Stu_PayOrderID,Persentage,ExpenseCategoryID,BenefitCategoryID,BeneficiaryID,ExpenseDetails">
            <Columns>
                <asp:BoundField DataField="Benefit Category" HeaderText="Benefit Category" SortExpression="Benefit Category" />
                <asp:BoundField DataField="Expense Category" HeaderText="Expense Category" SortExpression="Expense Category" />
                <asp:BoundField DataField="ExpenseDetails" HeaderText="Details" SortExpression="ExpenseDetails" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:TextBox ID="AmountTextBox" runat="server" CssClass="form-control" onkeypress="return isNumberKey(event)" autocomplete="off" onDrop="blur();return false;"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                No Pay order
            </EmptyDataTemplate>
        </asp:GridView>
        <div class="form-group">
            <label>Document</label>
            <input name="photo" type="file" required="required" />
            <asp:HiddenField ID="Imge_HF" runat="server" />
        </div>
        <asp:SqlDataSource ID="GenerateSQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" DeleteCommand="DELETE FROM [Beneficiary_Stu_PayOrder] WHERE [Stu_PayOrderID] = @Stu_PayOrderID" SelectCommand="SELECT Beneficiary_Stu_PayOrder.Stu_PayOrderID, Beneficiary_Stu_PayOrder.RegistrationID, Beneficiary_Stu_PayOrder.ExpenseCategoryID, Beneficiary_Stu_PayOrder.BenefitCategoryID, Beneficiary_Stu_PayOrder.BeneficiaryID, Beneficiary_Stu_PayOrder.ExpenseDetails, Beneficiary_Stu_PayOrder.Insert_Date, Beneficiary_Info.CaseNo, Beneficiary_Info.BeneficiaryName, Benefit_Category.CategoryName AS [Benefit Category], Expense_Category.CategoryName AS [Expense Category], Beneficiary_Expense_Category.Persentage FROM Beneficiary_Stu_PayOrder INNER JOIN Beneficiary_Info ON Beneficiary_Stu_PayOrder.BeneficiaryID = Beneficiary_Info.BeneficiaryID INNER JOIN Expense_Category ON Beneficiary_Stu_PayOrder.ExpenseCategoryID = Expense_Category.ExpenseCategoryID INNER JOIN Benefit_Category ON Beneficiary_Stu_PayOrder.BenefitCategoryID = Benefit_Category.BenefitCategoryID INNER JOIN Beneficiary_Expense_Category ON Beneficiary_Stu_PayOrder.BeneficiaryID = Beneficiary_Expense_Category.BeneficiaryID AND Beneficiary_Stu_PayOrder.ExpenseCategoryID = Beneficiary_Expense_Category.ExpenseCategoryID WHERE (Beneficiary_Info.CaseNo = @CaseNo)">
            <DeleteParameters>
                <asp:Parameter Name="Stu_PayOrderID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="CaseNoHF" Name="CaseNo" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="ExpenseSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Expense] WHERE [ExpenseID] = @ExpenseID" InsertCommand="INSERT INTO Expense(RegistrationID, ExpenseCategoryID, BenefitCategoryID, BeneficiaryID, Amount, ExpenseDate, Persentage, Amount_Without_Per, ExpenseDetails,Expense_Document) VALUES (@RegistrationID, @ExpenseCategoryID, @BenefitCategoryID, @BeneficiaryID, @Amount, dateadd(hour,6,getutcdate()), @Persentage, @Amount_Without_Per, @ExpenseDetails,CAST(N'' AS xml).value('xs:base64Binary(sql:variable(&quot;@Expense_Document&quot;))', 'varbinary(max)'))" SelectCommand="SELECT * FROM [Expense] WHERE  (BeneficiaryID = @BeneficiaryID)" UpdateCommand="UPDATE Expense SET Amount = @Amount, ExpenseDate = @ExpenseDate, ExpenseDetails = @ExpenseDetails WHERE (ExpenseID = @ExpenseID)">
            <DeleteParameters>
                <asp:Parameter Name="ExpenseID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" Type="Int32" />
                <asp:Parameter Name="BeneficiaryID" Type="Int32" />
                <asp:Parameter Name="ExpenseCategoryID" Type="Int32" />
                <asp:Parameter Name="BenefitCategoryID" Type="Int32" />
                <asp:Parameter Name="Persentage" />
                <asp:Parameter Name="Amount_Without_Per" />
                <asp:Parameter Name="Amount" Type="Double" />
                <asp:Parameter Name="ExpenseDetails" />
                <asp:ControlParameter ControlID="Imge_HF" Name="Expense_Document" PropertyName="Value" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Amount" Type="Double" />
                <asp:Parameter DbType="Date" Name="ExpenseDate" />
                <asp:Parameter Name="ExpenseDetails" Type="String" />
                <asp:Parameter Name="ExpenseID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <%} %>
        <br />
        <%if (GenerateGridView.Rows.Count > 0)
            { %>
        <asp:Button ID="PayButton" runat="server" CssClass="btn btn-primary" Text="Pay" OnClick="PaidButton_Click" />
        <input type="button" value="Reset" id="btnReset" class="btn btn-danger"/>
        <%}%>
    </div>


    <script src="/JS/QRcode/js/qrcodelib.js?v=1.3"></script>
    <script src="/JS/QRcode/js/webcodecamjs.js?v=1.3"></script>
    <script src="/JS/QRcode/js/decoderpopup.js?v=1.3"></script>

    <script>
        //QR code scaner
        function isValidURL(str) {
            var urlregex = /^(http|https):\/\/(([a-zA-Z0-9$\-_.+!*'(),;:&=]|%[0-9a-fA-F]{2})+@)?(((25[0-5]|2[0-4][0-9]|[0-1][0-9][0-9]|[1-9][0-9]|[0-9])(\.(25[0-5]|2[0-4][0-9]|[0-1][0-9][0-9]|[1-9][0-9]|[0-9])){3})|localhost|([a-zA-Z0-9\-\u00C0-\u017F]+\.)+([a-zA-Z]{2,}))(:[0-9]+)?(\/(([a-zA-Z0-9$\-_.+!*'(),;:@&=]|%[0-9a-fA-F]{2})*(\/([a-zA-Z0-9$\-_.+!*'(),;:@&=]|%[0-9a-fA-F]{2})*)*)?(\?([a-zA-Z0-9$\-_.+!*'(),;:@&=\/?]|%[0-9a-fA-F]{2})*)?(\#([a-zA-Z0-9$\-_.+!*'(),;:@&=\/?]|%[0-9a-fA-F]{2})*)?)?$/;
            return urlregex.test(str.toLocaleLowerCase().split("?")[0]);
        }
        var handler = function (popup, decoder) {
            decoder.options.decodeQRCodeRate = 5;
            decoder.options.decodeBarCodeRate = false;
            decoder.options.resultFunction = function (result) {
                if ($.isNumeric(result.code)) {
                    $("[id$=CaseNoHF]").val(result.code);
                    $("[id$=SubmitButton]").click();
                }
            }
        }
        var popup = new DecoderPopup(handler);
        popup.init();

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

        //Barcode scaner
        var pressed = false;
        var chars = [];
        $(window).keypress(function (e) {
            chars.push(String.fromCharCode(e.which));
            if (pressed == false) {
                setTimeout(function () {
                    if (chars.length >= 1) {
                        var barcode = chars.join("");
                        $("[id$=CaseNoHF]").val(barcode.trim());
                        $("[id$=SubmitButton]").click();
                    }

                    chars = [];
                    pressed = false;
                }, 500);
            }
            pressed = true;
        });

        //prevent submit on keypress textbox
        $(function () {
            $('input[type="text"]').keypress(function (e) {
                $("[id*=SubmitButton]").prop('disabled', true);
            });

            $('#btnReset').click(function () {
                window.location.href = window.location.href
            });
        });

        function isNumberKey(a) { a = a.which ? a.which : event.keyCode; return 46 != a && 31 < a && (48 > a || 57 < a) ? !1 : !0 };
    </script>
</asp:Content>
