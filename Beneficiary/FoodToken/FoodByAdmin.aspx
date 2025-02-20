<%@ Page Title="" Language="C#" MasterPageFile="~/Inside.Master" AutoEventWireup="true" CodeBehind="FoodByAdmin.aspx.cs" Inherits="Award__bd.Beneficiary.FoodToken.FoodByAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Img_Warp .img-responsive { margin: 0 auto; }
        .img { height:150px; width:150px; border:1px solid #ddd; margin-bottom: 13px;}
        .well { background-color: #fff; }
        #Info h4 { color:#23cb02; font-size:24px;}
        #Info ul { margin:0; padding:0;}
        #Info ul li { border-bottom: 1px solid #a2a2a2; color: #5d5d5d; font-size: 20px; list-style: outside none none; padding: 6px 0; }
        #Main-Contain { min-height: 750px; }
       .Error { font-size:24px; color:#ff6a00; display:none;}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
        <h3>Provide Food By Admin</h3>

        <div class="form-inline">
        <div class="form-group">
            <asp:DropDownList ID="VolunteerDropDownList" runat="server" CssClass="form-control" DataSourceID="VolunteerSQL" DataTextField="Name" DataValueField="RegistrationID" AppendDataBoundItems="True">
                <asp:ListItem Value="0">[ FOOD PROVIDER ]</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="VolunteerSQL" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT Volunteer.VolunteerID, Registration.RegistrationID, Registration.Name, Registration.UserName FROM Registration INNER JOIN Volunteer ON Registration.RegistrationID = Volunteer.Volunteer_RegistrationID" CancelSelectOnNullParameter="False"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="VolunteerDropDownList" CssClass="EroorStar" InitialValue="0" ValidationGroup="1" />
        </div>
        <div class="form-group">
            <asp:TextBox ID="IDTextBox" placeholder="Case No" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Button ID="FindButton" runat="server" Text="Find" CssClass="btn btn-primary" ValidationGroup="S" />
        </div>
        </div>

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
                <asp:ControlParameter ControlID="IDTextBox" Name="CaseNo" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="VolunteerDropDownList" Name="UseBy_RegistrationID" PropertyName="SelectedValue" />
                <asp:Parameter Name="Food_Schedule_AssignID" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:Button ID="GivenButton" runat="server" Visible="false" CssClass="btn-lg btn-primary" Text="Given" OnClick="GivenButton_Click" ValidationGroup="1" />

</asp:Content>
