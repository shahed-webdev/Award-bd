<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Autistic_Card.aspx.cs" Inherits="Award__bd.Beneficiary.Card.Autistic_Card" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Card.css?v=2" rel="stylesheet" />
    <link href="/JS/jq_Profile/css/Profile_jquery-ui-1.8.23.custom.css" rel="stylesheet" />
    <style>
        #Card2 .ReduceMargin { margin-bottom: 10px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="main">
        <ul>
            <li><a href="#Card">Autistic's Card 1</a></li>
            <li><a href="#Card2">Autistic's Card 2</a></li>
        </ul>

        <div id="Card">
            <asp:FormView ID="BeneficiaryFormView" runat="server" DataKeyNames="BeneficiaryID" DataSourceID="Beneficiary_InfoSQL" CssClass="S_Card">
                <ItemTemplate>
                    <div class="col-md-6 col-sm-6 Border">
                        <h4 class="Title">অঙ্গীকার নামা</h4>
                        আমি অঙ্গীকার করছি যে,<br />
                        * বাবা-মা, বড় ভাই বোন ও প্রতিবেশীসহ বড়দের মান্য ও সম্মান করব।<br />
                        * ছোটদের যথাসাধ্য সহযোগিতা করব ও তাদের ভাল উপদেশ দিব।<br />
                        * নিয়মিত নামাজ পড়ব।<br />
                        * মিথ্যা বলা হতে বিরত থাকব।<br />
                        * নিয়মিত লেখা-পড়া করব ও স্কুলে যথাসাধ্য উপস্থিত থাকব।<br />
                        * বাংলাদেশের প্রতি অনুগত থাকব এবং নিজেকে মানবতার কাজে সবসময় মনোনিবেশ করব।<br />
                        * সমাজ ও রাষ্ট্রের বিশৃঙ্খলা সৃষ্টি হয় এমন কাজ হতে বিরত থাকব।<br />
                        * সমাজ ও রাষ্ট্রের গঠনমূলক কাজ করতে সচেষ্ট হব।<br />
                        * এওয়ার্ড কর্তৃক গৃহীত স্পন্সরশীপ এক প্রকার কারয-এ-হাসানা (নমনীয় ঞ্চণ)। আমি স্বাবলম্বী হওয়ার পর উক্ত টাকার সমপরিমাণ/আংশিক এওয়ার্ডকে ফেরৎ দানে বাধ্য থাকব।<br />
                        * এওয়ার্ড-এর অবর্তমানে যে কোন এতিম/ মেধাবী/ দরিদ্র ছাত্র-ছাত্রীর লেখা-পড়ার ব্যয়ভার বহনে নীতিগতভাবে বাধ্য থাকব।
                   <div class="quet">কোন কিছু পরিবর্তন হলে অবশ্যই এওয়ার্ড কর্তৃপক্ষকে জানাতে হবে।</div>

                        <div class="Stud_Sign"><b class="Stud_sign-border">শিক্ষার্থীর স্বাক্ষর</b></div>
                        <br />
                        <img src="CSS/Oil_Pic.JPG" class="OilPic" />
                    </div>

                    <div class="col-md-6 col-sm-6 Border">
                        <div class="row">
                            <div class="col-md-4 col-sm-4  text-center">
                                <img src="CSS/award_logo.JPG" class="Logo" />
                            </div>

                            <div class="col-md-4 col-sm-4 text-center">
                                <div class="Title">AWARD</div>
                                <div class="Year">Since 1986</div>
                                <div class="Barcode"></div>
                            </div>

                            <div class="col-md-4 col-sm-4 pull-right text-center">
                                <img alt="No Image" src="/Handler/Beneficiry_Img.ashx?Img=<%#Eval("BeneficiaryID") %>" class=" img-thumbnail img" />
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col-md-5 col-sm-5 Cate_Case">
                                <b>Categoty:</b>
                                <asp:Label ID="CategotyLabel" runat="server" Text='<%# Bind("Categoty") %>' ForeColor="Red" />
                            </div>

                            <div class="col-md-5 col-sm-5 Cate_Case pull-right">
                                <b>Case No:</b>
                                <asp:Label ID="CaseNoLabel" runat="server" Text='<%# Bind("CaseNo") %>' ForeColor="Red" />
                            </div>
                        </div>

                        <br />
                        <table class="table table-bordered">
                            <tr>
                                <td style="width: 120px"><b>Name:</b>&nbsp;</td>
                                <td>
                                    <asp:Label ID="BeneficiaryNameLabel" runat="server" Text='<%# Bind("BeneficiaryName") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td><b>DOB:</b>&nbsp;</td>
                                <td>
                                    <asp:Label ID="Beneficiary_DOBLabel" runat="server" Text='<%# Bind("Beneficiary_DOB", "{0:d MMM yyyy}") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td><b>NID:</b>&nbsp;</td>
                                <td>
                                    <asp:Label ID="BNIDLabel" runat="server" Text='<%# Bind("Beneficiary_NID") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td><b>Father&#39;s Name:</b>&nbsp;</td>
                                <td>
                                    <asp:Label ID="FatherNameLabel" runat="server" Text='<%# Bind("FatherName") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td><b>Present Address:</b></td>
                                <td>
                                    <asp:Label ID="PresentAddressLabel" runat="server" Text='<%# Bind("PresentAddress") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td><b>Institute:</b></td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("School_College") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td><b>Class:</b>&nbsp;</td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Class_Year") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td><b>Roll No:</b>&nbsp;</td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Roll_No") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td><b>Contact No:</b></td>
                                <td>
                                    <asp:Label ID="ContactNoLabel" runat="server" Text='<%# Bind("ContactNo") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td><b>Validity of Card:</b></td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>

                        <div class="row sign">
                            <div class="col-sm-4">
                                <b class="sign-border">Student's Signature</b>
                            </div>

                            <div class="col-sm-4 text-center">
                                <b class="sign-border">Monitored by</b>
                            </div>

                            <div class="col-sm-4 text-right">
                                <b class="sign-border">Approved By</b>
                            </div>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="Beneficiary_InfoSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Beneficiary_Info] WHERE ([BeneficiaryID] = @BeneficiaryID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <div id="Card2">
            <asp:FormView ID="FormView1" CssClass="S_Card" runat="server" Width="100%" DataKeyNames="BeneficiaryID" DataSourceID="Card2SQL">
                <ItemTemplate>
                    <h4>Case No:
               <asp:Label ID="ssCaseNoLabel2" runat="server" Text='<%# Bind("CaseNo") %>' />&nbsp;/ Name:
               <asp:Label ID="BeneficiaryNameLabel" runat="server" Text='<%# Bind("BeneficiaryName") %>' /></h4>

                    <table class="table table-bordered  ReduceMargin">
                        <tr>
                            <td rowspan="2" class="Page_Head ">GRANT</td>
                            <td rowspan="2" class="Page_Head ">PERCENTAGE%</td>
                            <td colspan="2" class="Page_Head ">AMOUNT (TAKA)</td>
                            <td colspan="2" class="Page_Head ">ANY CHANGE & OBSERVATION</td>
                            <td colspan="2" class="Page_Head ">ANY CHANGE &amp; OBSERVATION</td>
                            <td class="Page_Head ">ANY CHANGE &amp; OBSERVATION</td>
                        </tr>
                        <tr>
                            <td class="Page_Head ">Original Amount</td>
                            <td class="Page_Head ">Payment Amount</td>
                            <td class="Page_Head ">Original Amount</td>
                            <td class="Page_Head ">Payment Amount</td>
                            <td class="Page_Head ">Original Amount</td>
                            <td class="Page_Head ">Payment Amount</td>
                            <td class="Page_Head ">Volunteer Signature</td>
                        </tr>
                        <tr>
                            <td colspan="9">
                                <asp:DataList ID="BExpense_CategoryDataList" runat="server" DataKeyField="ExpenseCategoryID" DataSourceID="BExpense_CategorySQL" Width="100%">
                                    <ItemTemplate>
                                        <asp:HiddenField ID="ExpenseCategoryIDHF" runat="server" Value='<%# Eval("ExpenseCategoryID") %>' />
                                        <table class="table table-bordered Inner-table">
                                            <tr>
                                                <td style="width: 180px">
                                                    <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Eval("CategoryName") %>' />
                                                </td>
                                                <td style="width: 79px">
                                                    <asp:FormView ID="PerFormView" runat="server" DataSourceID="PerQSL" Width="100%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="PersentageLabel" runat="server" Text='<%# Bind("Persentage") %>' />
                                                            %
                                                        </ItemTemplate>
                                                    </asp:FormView>
                                                    <asp:SqlDataSource ID="PerQSL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Persentage FROM Beneficiary_Expense_Category WHERE (BeneficiaryID = @BeneficiaryID) AND (ExpenseCategoryID = @ExpenseCategoryID)">
                                                        <SelectParameters>
                                                            <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
                                                            <asp:ControlParameter ControlID="ExpenseCategoryIDHF" Name="ExpenseCategoryID" PropertyName="Value" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td style="width: 124px"></td>

                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="BExpense_CategorySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT        Expense_Category.CategoryName, Expense_Category.ExpenseCategoryID
FROM            Benefit_Category INNER JOIN
                         Benefit_Expense_Category ON Benefit_Category.BenefitCategoryID = Benefit_Expense_Category.BenefitCategoryID INNER JOIN
                         Expense_Category ON Benefit_Expense_Category.ExpenseCategoryID = Expense_Category.ExpenseCategoryID
WHERE        (Benefit_Category.CategoryName = N'Autistic')"></asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>

                    <h5>Monthly Payment Schedule</h5>
                    <table class="table table-bordered  ReduceMargin">
                        <tr>
                            <td class="Page_Head">Month</td>
                            <td class="Page_Head">1st Week</td>
                            <td class="Page_Head">2nd Week</td>
                            <td class="Page_Head">3rd Week</td>
                            <td class="Page_Head">4th Week</td>
                            <td class="Page_Head">5th Week</td>
                            <td class="Page_Head">Signature</td>

                        </tr>
                        <tr>
                            <td>January</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>February</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>March</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>April</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>May</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>June</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>July</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>August</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>September</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>October</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>November</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>December</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>

                    <div class="row">
                        <div class="col-sm-6">
                            <table class="table table-bordered ReduceMargin">
                                <tr>
                                    <td colspan="2" class="Page_Head"><i>Other&nbsp; Details</i></td>
                                </tr>
                                <tr>
                                    <td>1)&nbsp; Family Members</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>2) Source of Income</i></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>3) Type of job</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>4) Monthly income Tk</td>
                                    <td>
                                        <asp:Label ID="Monthly_Income_in_FamilyLabel" runat="server" Text='<%# Bind("Monthly_Income_in_Family") %>' />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-sm-6">
                            Observation:
                     <asp:Label ID="ObservationLabel" runat="server" Text='<%# Bind("Observation") %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="Card2SQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Beneficiary_Info] WHERE ([BeneficiaryID] = @BeneficiaryID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="BeneficiaryID" QueryStringField="BeneficiaryID" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>

    <a onclick="window.print();" class="NoPrint">Print This Page</a>

    <script src="/JS/jq_Profile/jquery-ui-1.8.23.custom.min.js"></script>
    <script src="/JS/Barcode/jquery-barcode.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#main').tabs();

            var settings = {
                output: 'css',
                barWidth: 2,
                barHeight: 40,
            };
            var Code = $("[id*=CaseNoLabel]").text();
            $(".Barcode").barcode(Code, "code128", settings);
        });
    </script>
</asp:Content>
