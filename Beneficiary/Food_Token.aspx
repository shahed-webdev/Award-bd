<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="Food_Token.aspx.cs" Inherits="Award__bd.Beneficiary.Food_Token" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/JS/jq_Profile/css/Profile_jquery-ui-1.8.23.custom.css" rel="stylesheet" />
    <style>
        @page { margin: 0.8cm 0.5cm; }

        @media print {
            .headerBack, .ui-tabs .ui-tabs-nav { display: none; }
            #Unprovide, #Provided { border: none; padding: 0; }
            .Re { margin-bottom: 10px; font-size: 21px; text-align: center; }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3 class="Re">Food Token / Medicine at Neuro Sciences Hospital from AWARD</h3>
    <div class="form-inline">
        <div class="form-group">
            <asp:DropDownList ID="PageDropDownList" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="PageDropDownList_SelectedIndexChanged">
                <asp:ListItem Value="10">View 10 Records</asp:ListItem>
                <asp:ListItem Value="50">View 50 Records</asp:ListItem>
                <asp:ListItem Value="100">View 100 Records</asp:ListItem>
                <asp:ListItem Value="150">View 150 Records</asp:ListItem>
                <asp:ListItem Value="10000">View All Records</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>

    <div id="main">
        <ul>
            <li><a href="#Unprovide">Unprovided Food Token</a></li>
            <li><a href="#Provided">Provided Food Token</a></li>
        </ul>

        <div id="Unprovide" class="table-responsive">
            <div class="form-inline NoPrint">
                <div class="form-group">
                    <asp:TextBox ID="Find_TextBox" runat="server" CssClass="form-control" placeholder="name,mobile,Case No"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="Find_Button" runat="server" CssClass="btn btn-primary" Text="Find" />
                </div>
            </div>
            <br />
            <asp:GridView ID="BeneficiaryGridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="BeneficiaryID" DataSourceID="BeneficiarySQL" AllowSorting="True" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="CaseNo" HeaderText="Case No." ReadOnly="True" SortExpression="CaseNo" />
                    <asp:BoundField DataField="BeneficiaryName" HeaderText="Name" SortExpression="BeneficiaryName" />
                    <asp:BoundField DataField="FatherName" HeaderText="Father Name" SortExpression="FatherName" />
                    <asp:BoundField DataField="ContactNo" HeaderText="Contact" SortExpression="ContactNo" />
                    <asp:TemplateField HeaderText="Word No">
                        <ItemTemplate>
                            <asp:TextBox ID="WordTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bed No">
                        <ItemTemplate>
                            <asp:TextBox ID="BedTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Amount">
                        <ItemTemplate>
                            <asp:TextBox ID="AmountTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    No Records
                </EmptyDataTemplate>
                <PagerStyle CssClass="pgr" />
            </asp:GridView>
            <asp:SqlDataSource ID="BeneficiarySQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Beneficiary_Info.BeneficiaryID, Beneficiary_Info.RegistrationID, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.FatherName, Beneficiary_Info.ContactNo, Beneficiary_Info.CaseNo AS C_SN,CAST(Beneficiary_Info.CaseNo AS nvarchar(50)) AS CaseNo FROM FoodToken RIGHT OUTER JOIN Beneficiary_Info ON FoodToken.BeneficiaryID = Beneficiary_Info.BeneficiaryID LEFT OUTER JOIN Benefit_Category INNER JOIN Beneficiary_BenefitCategory ON Benefit_Category.BenefitCategoryID = Beneficiary_BenefitCategory.BenefitCategoryID ON Beneficiary_Info.BeneficiaryID = Beneficiary_BenefitCategory.BeneficiaryID WHERE (Beneficiary_Info.Is_Approved = 1) AND (Beneficiary_Info.Is_Service_On = 1) AND (Benefit_Category.CategoryName = N'Neuro') AND (FoodToken.Amount IS NULL) ORDER BY C_SN"
                FilterExpression="BeneficiaryName LIKE '{0}%' or ContactNo LIKE '{0}%' or CaseNo LIKE '{0}%'" CancelSelectOnNullParameter="False" InsertCommand="IF NOT EXISTS(SELECT  BeneficiaryID FROM  FoodToken WHERE (BeneficiaryID = @BeneficiaryID))
INSERT INTO FoodToken(RegistrationID, BeneficiaryID, Amount, Word, Bed) VALUES (@RegistrationID, @BeneficiaryID, @Amount, @Word, @Bed)">
                <FilterParameters>
                    <asp:ControlParameter ControlID="Find_TextBox" Name="Find" PropertyName="Text" />
                </FilterParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="RegistrationID" SessionField="RegistrationID" />
                    <asp:Parameter Name="BeneficiaryID" />
                    <asp:Parameter Name="Amount" />
                    <asp:Parameter Name="Word" />
                    <asp:Parameter Name="Bed" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="SUbmit_Button" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="SUbmit_Button_Click" />
        </div>

        <div id="Provided" class="table-responsive">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="form-inline NoPrint">
                        <div class="form-group">
                            <asp:CheckBox ID="HideColCheckBox" runat="server" Text="Show Column" Checked="True" />
                        </div>
                        <div class="form-group pull-right">
                            <a title="Print" class="NoPrint" onclick="window.print();"><span class="glyphicon glyphicon-print"></span></a>
                        </div>
                    </div>

                    <asp:GridView ID="Provided_GridView" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="ProvidedSQL" DataKeyNames="FoodTokenID" AllowSorting="True" OnRowDataBound="Provided_GridView_RowDataBound" AllowPaging="True">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True">
                                <HeaderStyle CssClass="NoPrint" />
                                <ItemStyle CssClass="NoPrint" />
                            </asp:CommandField>
                            <asp:TemplateField HeaderText="SN.">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CaseNo" HeaderText="Case No" SortExpression="CaseNo" />
                            <asp:BoundField DataField="BeneficiaryName" HeaderText="Name" SortExpression="BeneficiaryName" />
                            <asp:BoundField DataField="Word" HeaderText="Word" SortExpression="Word" />
                            <asp:BoundField DataField="Bed" HeaderText="Bed" SortExpression="Bed" />
                            <asp:BoundField DataField="ContactNo" HeaderText="Mobile No" SortExpression="ContactNo" />
                            <asp:BoundField DataField="Amount" SortExpression="Amount" />
                            <asp:BoundField DataField="Amount" SortExpression="Amount" />
                            <asp:BoundField DataField="Amount" SortExpression="Amount" />
                            <asp:BoundField DataField="Amount" SortExpression="Amount" HeaderText="  " />
                            <asp:TemplateField HeaderText="Signature"></asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pgr" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="ProvidedSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT FoodToken.Amount, FoodToken.Word, FoodToken.Bed, Beneficiary_Info.CaseNo, Beneficiary_Info.BeneficiaryName, Beneficiary_Info.ContactNo, FoodToken.FoodTokenID FROM FoodToken INNER JOIN Beneficiary_Info ON FoodToken.BeneficiaryID = Beneficiary_Info.BeneficiaryID WHERE (Beneficiary_Info.Is_Service_On = 1) AND (Beneficiary_Info.Is_Approved = 1)" DeleteCommand="DELETE FROM FoodToken WHERE (FoodTokenID = @FoodTokenID)">
                        <DeleteParameters>
                            <asp:Parameter Name="FoodTokenID" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <asp:UpdateProgress ID="UpdateProgress" runat="server">
        <ProgressTemplate>
            <div id="progress_BG"></div>
            <div id="progress">
                <b>Loading...</b>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <script src="/JS/jq_Profile/jquery-ui-1.8.23.custom.min.js"></script>
    <script type="text/javascript">

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        function BeginRequestHandler(sender, args) { var oControl = args.get_postBackElement(); oControl.disabled = true; }

        $(function () {
            $('#main').tabs();

            $("[id*=HideColCheckBox]").click(function () {
                var isChecked = $(this).is(":checked");
                var th = $("[id*=Provided_GridView] th:contains('  ')"); //=== Two Space
                th.css("display", isChecked ? "" : "none");

                $("[id*=Provided_GridView] tr").each(function () {
                    $(this).find("td").eq(th.index()).css("display", isChecked ? "" : "none");
                });
            });
        });

        //For Update pannel
        var prm = Sys.WebForms.PageRequestManager.getInstance(); prm.add_endRequest(function () {
            $("[id*=HideColCheckBox]").click(function () {
                var isChecked = $(this).is(":checked");
                var th = $("[id*=Provided_GridView] th:contains('  ')"); //=== Two Space
                th.css("display", isChecked ? "" : "none");

                $("[id*=Provided_GridView] tr").each(function () {
                    $(this).find("td").eq(th.index()).css("display", isChecked ? "" : "none");
                });
            });
        });

    </script>
</asp:Content>
