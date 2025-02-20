<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="FoodBarCode.aspx.cs" Inherits="Award__bd.Beneficiary.FoodToken.FoodBarCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Hide { display: none; }
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
    <div class="container">
        <div class="text-center">
            <input id="QRcodeScan" class="btn btn-success" value="QR Code Scanner" type="button" onfocus="popup.open(event,1);" />
        </div>

        <h1 class="text-center">Provide Food</h1>

        <asp:FormView ID="InfoFormView" runat="server" DataSourceID="FoodSQL" Width="100%" DataKeyNames="Food_Schedule_AssignID" OnDataBound="InfoFormView_DataBound">
            <EmptyDataTemplate>
                <div class="text-center">
                    <label class="Error">Empty</label>
                </div>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div class="well" id="Info">
                    <div class="Img_Warp">
                        <img alt="No Image" src="/Handler/Beneficiry_Img.ashx?Img=<%#Eval("BeneficiaryID") %>" class="img-responsive img" />
                    </div>

                    <div class="text-center">
                        <h2 style="text-align: center;">AWARD-ID CARD-<%# Eval("CaseNo") %></h2>
                        <h4><%# Eval("ScheduleName") %></h4>
                        <h4>Amount: <%# Eval("Amount") %> Tk</h4>
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
        <asp:SqlDataSource ID="FoodSQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT Food_Schedule_Assign.BeneficiaryID, Food_Schedule.StartTime, Food_Schedule.EndTime, Food_Schedule_Assign.Is_Used, Food_Schedule_Assign.ActiveDate, Beneficiary_Info.CaseNo, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.FatherName, Beneficiary_Info.Reference, Beneficiary_Info.ContactNo, Beneficiary_Info.PresentAddress, Food_Schedule_Assign.Amount, Food_Schedule_Assign.Food_Schedule_AssignID, Food_Schedule.ScheduleName FROM Food_Schedule_Assign INNER JOIN Food_Schedule ON Food_Schedule_Assign.Food_ScheduleID = Food_Schedule.Food_ScheduleID INNER JOIN Beneficiary_Info ON Food_Schedule_Assign.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (Food_Schedule_Assign.Is_Used = 0) AND (Food_Schedule_Assign.ActiveDate = CAST(dateadd(hour,6,getutcdate()) AS DATE)) AND (CONVERT (TIME(7), dateadd(hour,6,getutcdate())) BETWEEN Food_Schedule.StartTime AND Food_Schedule.EndTime) AND (CAST(Beneficiary_Info.CaseNo AS varchar(50)) = @CaseNo)" UpdateCommand="UPDATE Food_Schedule_Assign SET UseBy_RegistrationID = @UseBy_RegistrationID, Is_Used = 1, UseTime = dateadd(hour,6,getutcdate()) WHERE (Food_Schedule_AssignID = @Food_Schedule_AssignID)">
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
        <asp:Button ID="GivenButton" runat="server" Visible="false" CssClass="btn-lg btn-primary" Text="Given" OnClick="GivenButton_Click" />
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

        //Barcode Scnner
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

        $(function () {
            if ($("[id$=CaseNoHF]").val() != "") {
                $(".Error").show();
            }
        });
    </script>
</asp:Content>
