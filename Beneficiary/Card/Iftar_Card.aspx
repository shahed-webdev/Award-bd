<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Iftar_Card.aspx.cs" Inherits="Award__bd.Beneficiary.Card.Iftar_Card" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Iftar.css?v=3" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Iftar Card</h3>
    <div id="container">
        <asp:Repeater ID="IftarCardRepeater" runat="server" DataSourceID="IftarCardSQL">
            <ItemTemplate>
                <div>
                    <div class="C-header">
                        <div>
                            <img src="CSS/award_logo.JPG" />
                        </div>
                        <div>
                            <h5>AWARD-RG-<%#DateTime.Now.Year %>- <b style="color: #FF6600"><%# Eval("CaseNo") %></b></h5>
                        </div>
                        <div>
                            <img alt="No Image" src="/Handler/Beneficiry_Img.ashx?Img=<%#Eval("BeneficiaryID") %>" />
                        </div>
                    </div>

                    <h4 class="text-center" style="font-size:15px;"><%# Eval("BeneficiaryName") %></h4>
                    <div class="clearfix" style="margin:0 10px">
                        <canvas class="Barcode pull-left"></canvas>
                        <div class="QRcode pull-right"></div>
                        <input class="bar-CaseNo" type="hidden" value='<%#Eval("CaseNo") %>' />
                    </div>

                    <div class="info">
                        <table>
                            <tr>
                                <td>Father's Name</td>
                                <td>:</td>
                                <td><%# Eval("FatherName") %> </td>
                            </tr>
                            <tr>
                                <td>Care Of</td>
                                <td>:</td>
                                <td><%# Eval("Reference") %></td>
                            </tr>
                            <tr>
                                <td>Contact</td>
                                <td>:</td>
                                <td><%# Eval("ContactNo") %></td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td>:</td>
                                <td><%# Eval("PresentAddress") %></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <a class="NoPrint" onclick="window.print();">Print This Page</a>
    <asp:SqlDataSource ID="IftarCardSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Beneficiary_Info.BeneficiaryID, Beneficiary_Info.RegistrationID, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.Beneficiary_DOB, Beneficiary_Info.Beneficiary_NID, Beneficiary_Info.FatherName, Beneficiary_Info.Father_DOB, Beneficiary_Info.Father_NID, Beneficiary_Info.MotherName, Beneficiary_Info.Mother_DOB, Beneficiary_Info.Mother_NID, Beneficiary_Info.GuardianName, Beneficiary_Info.Guardian_DOB, Beneficiary_Info.Guardian_NID, Beneficiary_Info.PresentAddress, Beneficiary_Info.ContactNo, Beneficiary_Info.PermanentAddress, Beneficiary_Info.EntryDate, Beneficiary_Info.Categoty, Beneficiary_Info.Reference, CAST(Beneficiary_Info.CaseNo AS nvarchar(50)) AS CaseNo, Beneficiary_Info.WorkingPerson_in_Family, Beneficiary_Info.Monthly_Income_in_Family, Beneficiary_Info.Total_Stu_in_Family, Beneficiary_Info.FastingMember, Beneficiary_Info.Other_Benefit, Beneficiary_Info.Is_Approved, Beneficiary_Info.ApprovedBy_ID, Beneficiary_Info.VolunteerID, Beneficiary_Info.Observation, Beneficiary_Info.InsertDate FROM Benefit_Category INNER JOIN Beneficiary_BenefitCategory ON Benefit_Category.BenefitCategoryID = Beneficiary_BenefitCategory.BenefitCategoryID RIGHT OUTER JOIN Beneficiary_Info ON Beneficiary_BenefitCategory.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE  (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1) AND (Benefit_Category.CategoryName = N'Iftar')"></asp:SqlDataSource>

    <script src="/JS/Barcode/CODE128.js?v=1"></script>
    <script src="/JS/jquery-qrcode.min.js"></script>
    <script>
        $(function () {
            $(".bar-CaseNo").each(function () {
                var Code = $(this).val();

                $($(this).parent().find(".Barcode")).JsBarcode(Code, {
                    width: 1,
                    height: 30,
                    format: "CODE128",
                    displayValue: false
                });


                $($(this).parent().find(".QRcode")).qrcode({
                    text: Code,
                    render: 'image', // 'canvas', 'image' or 'div'
                    size: 40// size in pixels
                });
            });
        });
    </script>
</asp:Content>
