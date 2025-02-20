<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Food_IDCard.aspx.cs" Inherits="Award__bd.Beneficiary.FoodToken.Food_IDCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/IDCard.css?v=3" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>AWARD-ID CARD</h3>

    <div class="form-inline hidden-print">
        <div class="form-group">
            <asp:TextBox ID="IDTextBox" placeholder="case No with comma" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="Find_Button" runat="server" Text="Find" CssClass="btn btn-primary" />
        </div>
    </div>

    <div id="container">
        <asp:Repeater ID="FoodTokenRepeater" runat="server" DataSourceID="IftarCardSQL">
            <ItemTemplate>
                <asp:HiddenField ID="BeneficiaryID_HF" runat="server" Value='<%# Eval("BeneficiaryID") %>' />
                <div>
                    <div class="C-header">
                        <div>
                            <img src="../Card/CSS/award_logo.JPG" class="ALogo" />
                        </div>
                        <div>
                            <h5>পরিশোধিত খাবার টোকেন</h5>
                            <h5>AWARD-ID CARD-<%# Eval("CaseNo") %></h5>
                        </div>
                        <div>
                            <img alt="No Image" src="/Handler/Beneficiry_Img.ashx?Img=<%#Eval("BeneficiaryID") %>" class="img-circle" />
                        </div>
                    </div>

                    <div class="Info-bcode">
                        <h4 style="margin: 0"><%# Eval("BeneficiaryName") %></h4>
                        <span>Care Of: <%# Eval("Reference") %>, <%# Eval("ContactNo") %></span>
                    </div>

                    <div class="clearfix" style="margin: 0 10px">
                        <canvas class="Barcode pull-left"></canvas>
                        <div class="QRcode pull-right"></div>
                        <input class="bar-CaseNo" type="hidden" value='<%#Eval("CaseNo") %>' />
                    </div>

                    <div class="Foods_Time">
                        <asp:Repeater ID="FoodtimeRepeater" runat="server" DataSourceID="FoodSQL">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td><%# Eval("ScheduleName") %></td>
                                        <td><%# Eval("StartTime") %>-<%# Eval("EndTime") %></td>
                                        <td><%# Eval("Amount") %> /- Tk</td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <asp:SqlDataSource ID="FoodSQL" runat="server" ConnectionString="<%$ ConnectionStrings:Award_bdConnectionString %>" SelectCommand="SELECT DISTINCT Food_Schedule.ScheduleName, Food_Schedule.Amount, CONVERT (varchar(15), Food_Schedule.StartTime, 100) AS StartTime, CONVERT (varchar(15), Food_Schedule.EndTime, 100) AS EndTime
FROM            Food_Schedule_Assign INNER JOIN
                         Food_Schedule ON Food_Schedule_Assign.Food_ScheduleID = Food_Schedule.Food_ScheduleID
WHERE        (Food_Schedule_Assign.Is_Used = 0) AND (Food_Schedule_Assign.ActiveDate &gt;= CAST(dateadd(hour,6,getutcdate()) AS Date)) AND (Food_Schedule_Assign.BeneficiaryID = @BeneficiaryID)
ORDER BY StartTime">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BeneficiaryID_HF" Name="BeneficiaryID" PropertyName="Value" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <div class="Hospital_Name">
                        ক্যান্টিন (২য় তালা), ন্যাশনাল ইনস্টিটিউশন অফ নিউরো সাইন্সেস হাসপাতাল
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <a class="NoPrint" onclick="window.print();">Print This Page</a>
    <asp:SqlDataSource ID="IftarCardSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT DISTINCT Beneficiary_Info.BeneficiaryID, Beneficiary_Info.RegistrationID, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.Beneficiary_DOB, Beneficiary_Info.Beneficiary_NID, Beneficiary_Info.FatherName, Beneficiary_Info.Father_DOB, Beneficiary_Info.Father_NID, Beneficiary_Info.MotherName, Beneficiary_Info.Mother_DOB, Beneficiary_Info.Mother_NID, Beneficiary_Info.GuardianName, Beneficiary_Info.Guardian_DOB, Beneficiary_Info.Guardian_NID, Beneficiary_Info.PresentAddress, Beneficiary_Info.ContactNo, Beneficiary_Info.PermanentAddress, Beneficiary_Info.EntryDate, Beneficiary_Info.Categoty, Beneficiary_Info.Reference, CAST(Beneficiary_Info.CaseNo AS nvarchar(50)) AS CaseNo, Beneficiary_Info.WorkingPerson_in_Family, Beneficiary_Info.Monthly_Income_in_Family, Beneficiary_Info.Total_Stu_in_Family, Beneficiary_Info.FastingMember, Beneficiary_Info.Other_Benefit, Beneficiary_Info.Is_Approved, Beneficiary_Info.ApprovedBy_ID, Beneficiary_Info.VolunteerID, Beneficiary_Info.Observation, Beneficiary_Info.InsertDate FROM Food_Schedule_Assign INNER JOIN Beneficiary_Info ON Food_Schedule_Assign.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1) AND (Food_Schedule_Assign.Is_Used = 0) AND (Food_Schedule_Assign.ActiveDate &gt;= CAST(dateadd(hour,6,getutcdate()) AS Date))"></asp:SqlDataSource>

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
