<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CareersUserControl.ascx.cs" Inherits="SEDA.Careers.WebParts.Careers.CareersUserControl" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=19.1.0.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<link rel="stylesheet" href="/Style%20Library/ar-sa/Core%20Styles/DatePicker/jquery.calendars.picker.css" />




                <asp:Panel runat="server" ID="pnlMessage" Visible="false">
                    <div class="contact-form">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Panel runat="server" ID="pnlMsgError" Visible="false">
                                    <div class="select-notification red-notification w-100 d-inline-block mb-3">
                                        <h6>
                                            <asp:Literal runat="server" ID="lblMsgError"></asp:Literal>
                                        </h6>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlMsgSuccess" Visible="false">
                                    <div class="select-notification green-notification w-100 d-inline-block mb-3">
                                        <h6>
                                            <asp:Literal runat="server" ID="lblMsgSuccess"></asp:Literal>
                                        </h6>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

    <asp:Panel runat="server" ID="pnlMainForm">

                         <%--personal information--%>
                                <div class="form-accordion">
                                    <div id="first">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5 class="mb-0" data-toggle="collapse" data-target="#divFirst" aria-expanded="false" aria-controls="divFirst">
                                                    <asp:Label runat="server" Text="<%$Resources:SEDA_Careers,PersonalInformation%>"></asp:Label>
                                                </h5>
                                            </div>
                                            <div id="divFirst" class="collapse" aria-labelledby="divFirst" data-parent="#first">
                                                <div class="card-body">
                                                    <div class="row">

                                                        <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,FirstName%>" />:
                                                                <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:TextBox runat="server" MaxLength="255" ID="txtFirstName" CssClass="form-input"></asp:TextBox>
                                                            <asp:RequiredFieldValidator  runat="server" ID="RequiredtxtFirstName" ControlToValidate="txtFirstName" CssClass="error" Display="Dynamic" ValidationGroup="vgCareers"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>

                                                        <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,LastName%>" />:
                                                                <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:TextBox runat="server" MaxLength="255" ID="txtLastName" CssClass="form-input"></asp:TextBox>
                                                            <asp:RequiredFieldValidator  runat="server" ID="RequiredtxtLastName" ControlToValidate="txtLastName" CssClass="error" Display="Dynamic" ValidationGroup="vgCareers"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>

                                                  <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,Nationality%>" />:  
                                                <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:RadioButtonList runat="server" ID="RblNationality" RepeatDirection="Horizontal" CssClass="custom-radiobutton" ValidationGroup="vgCareers">
                                                                <asp:ListItem Text="<%$Resources:SEDA_Careers,RblSaudi%>" value="Saudi" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="<%$Resources:SEDA_Careers,RblNonSaudi%>" value="NonSaud"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </div>

                                                         <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,Gender%>" />:  
                                                <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:RadioButtonList runat="server" ID="RblGender" RepeatDirection="Horizontal" CssClass="custom-radiobutton" ValidationGroup="vgCareers">
                                                                <asp:ListItem Text="<%$Resources:SEDA_Careers,RblMale%>" value="Male" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="<%$Resources:SEDA_Careers,RblFemale%>" value="Female"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </div>

                                                        <div class="col-lg-6 position-relative">
                                                                <label class="position-absolute dash-label">
                                                                    <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,DateOfBirth%>" />:
                                                    <span class="required-indicator">*</span>
                                                                </label>
                                                                <asp:TextBox runat="server" ID="txtDateOfBirth" AutoPostBack="false" onkeydown="return (event.keyCode!=13);" CssClass="form-input datePicker" ValidationGroup="vgCareers"></asp:TextBox>
                                                                <asp:RequiredFieldValidator runat="server" ID="RequiredtxtDateOfBirth" ControlToValidate="txtDateOfBirth" CssClass="error" ValidationGroup="vgCareers" Display="Dynamic"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                            </div>

                                                         <div class="col-lg-6 position-relative">
                                                             <label class="position-absolute dash-label">
                                                                    <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,PhoneNumber%>" />:
                                                    <span class="required-indicator">*</span>
                                                                </label>
                                                              <asp:TextBox runat="server" ID="txtPhone" MaxLength="255" CssClass="form-input" ValidationGroup="vgCareers"></asp:TextBox>
                                                              <asp:RequiredFieldValidator runat="server" ID="RequiredtxtPhone" ControlToValidate="txtPhone" CssClass="error" Display="Dynamic" ValidationGroup="vgCareers" ><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                              <asp:RegularExpressionValidator runat="server" ID="RegulartxtPhone" ControlToValidate="txtPhone" CssClass="error" Display="Dynamic" ValidationGroup="vgCareers"  ValidationExpression="\+?\d{10,15}"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldInvalidPhone%>" /></asp:RegularExpressionValidator>
                                                         </div>

                                                        <div class="col-lg-6 position-relative">
                                                             <label class="position-absolute dash-label">
                                                                    <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,AnotherPhoneNumber%>" />:
                                                                </label>
                                                              <asp:TextBox runat="server" ID="txtAnotherPhone" MaxLength="255" CssClass="form-input" ValidationGroup="vgCareers"></asp:TextBox>
                                                              <asp:RegularExpressionValidator runat="server" ID="RegulartxtAnotherPhone" ControlToValidate="txtAnotherPhone" CssClass="error" Display="Dynamic" ValidationGroup="vgCareers"  ValidationExpression="\+?\d{10,15}"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldInvalidPhone%>" /></asp:RegularExpressionValidator>
                                                         </div>

                                                         <div class="col-lg-6 position-relative">
                                                             <label class="position-absolute dash-label">
                                                                    <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,Email%>" />:
                                                                 <span class="required-indicator">*</span>
                                                                </label>
                                                              <asp:TextBox runat="server" ID="txtEmail" CssClass="form-input" MaxLength="255" ValidationGroup="vgCareers"></asp:TextBox>
                                                              <asp:RequiredFieldValidator runat="server" ID="RequiredtxtEmail" ControlToValidate="txtEmail" CssClass="error" Display="Dynamic" ValidationGroup="vgCareers" ><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                              <asp:RegularExpressionValidator runat="server" ID="RegulartxtEmail" ControlToValidate="txtEmail" CssClass="error" ValidationGroup="vgCareers" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldInvalidEmail%>"/></asp:RegularExpressionValidator>
                                                         </div>

                                                         <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">    
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,Location%>" />: 
                                                    <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:DropDownList CssClass="form-input" runat="server" ID="ddlLocationPer" ValidationGroup="vgCareers">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator runat="server" ID="RequiredddlLocationPer" ControlToValidate="ddlLocationPer" CssClass="error" ValidationGroup="vgCareers" Display="Dynamic" InitialValue=""><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>

                                                        <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,LastMonthlySalary%>" />:
                                                                <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:TextBox runat="server" MaxLength="255" ID="txtLastSalary" CssClass="form-input"></asp:TextBox>
                                                            <asp:RequiredFieldValidator  runat="server" ID="RequiredtxtLastSalary" ControlToValidate="txtLastSalary" CssClass="error" Display="Dynamic" ValidationGroup="vgCareers"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>"/></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegulartxtLastSalary" runat="server" ControlToValidate="txtLastSalary" CssClass="error" ValidationExpression="^[0-9]*$" ValidationGroup="vgCareers" Display="Dynamic"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldInvalidSalary%>" /></asp:RegularExpressionValidator>
                                                        </div>

                                                         <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,TargetMonthlySalary%>" />:
                                                                <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:TextBox runat="server" MaxLength="255" ID="txtTargetSalary" CssClass="form-input"></asp:TextBox>
                                                            <asp:RequiredFieldValidator  runat="server" ID="RequiredtxtTargetSalary" ControlToValidate="txtTargetSalary" CssClass="error" Display="Dynamic" ValidationGroup="vgCareers"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>"/></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegulartxtTargetSalary" runat="server" ControlToValidate="txtTargetSalary" CssClass="error" ValidationExpression="^[0-9]*$" ValidationGroup="vgCareers" Display="Dynamic"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldInvalidSalary%>" /></asp:RegularExpressionValidator>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%--Education--%>

                          <div class="form-accordion">
                                    <div id="second">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5 class="mb-0" data-toggle="collapse" data-target="#divSecond" aria-expanded="false" aria-controls="divSecond">
                                                    <asp:Label runat="server" Text="<%$Resources:SEDA_Careers,Education%>"></asp:Label>
                                                </h5>
                                            </div>
                                            <asp:UpdateProgress runat="server" ID="updateProgress2" AssociatedUpdatePanelID="PanelEduction"></asp:UpdateProgress>
                                              <asp:UpdatePanel ID="PanelEduction" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                                              <ContentTemplate>
                                            <div id="divSecond" class="collapse" aria-labelledby="divSecond" data-parent="#second">
                                                <div class="card-body">
                                                    <div class="row">

                                                          <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">    
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,Degree%>" />: 
                                                    <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:DropDownList CssClass="form-input" runat="server" ID="ddlDegree" ValidationGroup="vgEducation">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator runat="server" ID="RequiredddlDegree" ControlToValidate="ddlDegree" CssClass="error" ValidationGroup="vgEducation" Display="Dynamic" InitialValue=""><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>

                                                    <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">    
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,Country%>" />: 
                                                    <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:DropDownList CssClass="form-input" runat="server" ID="ddlCountry" ValidationGroup="vgEducation">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator runat="server" ID="RequiredddlCountry" ControlToValidate="ddlCountry" CssClass="error" ValidationGroup="vgEducation" Display="Dynamic" InitialValue=""><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>
    
                                                        <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,City%>" />:
                                                                <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:TextBox runat="server" MaxLength="255" ID="txtCityEdu" CssClass="form-input"></asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" ID="RequiredtxtCityEdu" ControlToValidate="txtCityEdu" CssClass="error" Display="Dynamic" ValidationGroup="vgEducation"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>

                                                         <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,University%>" />:
                                                                <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:TextBox runat="server" MaxLength="255" ID="txtUniversity" CssClass="form-input"></asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" ID="RequiredtxtUniversity" ControlToValidate="txtUniversity" CssClass="error" Display="Dynamic" ValidationGroup="vgEducation"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>

                                                        <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,Major%>" />:
                                                                <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:TextBox runat="server" MaxLength="255" ID="txtMajor" CssClass="form-input"></asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" ID="RequiredtxtMajor" ControlToValidate="txtMajor" CssClass="error" Display="Dynamic" ValidationGroup="vgEducation"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>

                                                        <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,GPANum%>" />:
                                                                <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:TextBox runat="server" MaxLength="255" ID="txtGPANum" CssClass="form-input"></asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" ID="RequiredtxtGPANum" ControlToValidate="txtGPANum" CssClass="error" Display="Dynamic" ValidationGroup="vgEducation"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>
 
                                                        <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,GPA%>" />: 
                                                    <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:DropDownList CssClass="form-input" runat="server" ID="ddlGPA" ValidationGroup="vgEducation">
                                                                     <asp:listitem text="4" value="4"></asp:listitem>
                                                                     <asp:listitem text="5" value="5"></asp:listitem>
                                                                     <asp:listitem text="%" value="%"></asp:listitem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator runat="server" ID="RequiredddlGPA" ControlToValidate="ddlGPA" CssClass="error" ValidationGroup="vgEducation" Display="Dynamic" InitialValue=""><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>                  

                                                        <div class="col-lg-6 position-relative">
                                                                <label class="position-absolute dash-label">
                                                                    <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,GraduationDate%>" />:
                                                    <span class="required-indicator">*</span>
                                                                </label>
                                                                <asp:TextBox runat="server" ID="txtGraduationDate" AutoPostBack="false" onkeydown="return (event.keyCode!=13);" CssClass="form-input datePicker" ValidationGroup="vgEducation"></asp:TextBox>
                                                                <asp:RequiredFieldValidator runat="server" ID="RequiredtxtGraduationDate" ControlToValidate="txtGraduationDate" CssClass="error" ValidationGroup="vgEducation" Display="Dynamic"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                            </div>

                                                <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,Description%>" />:
                                                                <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:TextBox runat="server" ID="txtDescription" CssClass="form-input" TextMode="MultiLine" Rows="10" Columns="30"></asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" ID="RequiredtxtDescription" ControlToValidate="txtDescription" CssClass="error" Display="Dynamic" ValidationGroup="vgEducation"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>
                                             
                                                    </div>
                                                       <div class="col-lg-12 position-relative">
                                                              <asp:GridView runat="server" ID="gveductions" CssClass="table" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                                                    <Columns>
                                                         <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,Degree%>" DataField="DegreeTitle"  />
                                                         <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,Country%>" DataField="CounrtyTitle" />   
                                                         <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,City%>" DataField="WorkCity"  />
                                                         <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,University%>" DataField="University" /> 
                                                         <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,Major%>" DataField="Major"  />
                                                         <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,GPANum%>" DataField="GPANum" />   
                                                         <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,GPA%>" DataField="GPA"  />
                                                         <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,GraduationDate%>" DataField="GraduationDate" />
                                                         <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,Description%>" DataField="Description" />
                                                        <asp:TemplateField HeaderStyle-CssClass="width-100">
                                                          <ItemTemplate>
                                                           <div class="iconbtn delebtn">
                                                             <asp:LinkButton runat="server" ID="lnkSupplierDelete" CssClass="greenColor fright RiconBG gridDelete" Text="<%$Resources:SEDA_Careers,Delete%>" CommandName="GuranteeDelete"  CommandArgument='<%#Bind("RowIndex") %>'  OnClick="EducationsDelete_Click" OnClientClick="return ConfirmDelete()"></asp:LinkButton>
                                                       </div>
                                                         </ItemTemplate>
                                                         </asp:TemplateField>
                                                      </Columns>
                                                     <EmptyDataTemplate>
                                                             <asp:Literal ID="empty" runat="server" Text="<%$Resources:SEDA_Careers,lblNoData%>"></asp:Literal>
                                                    </EmptyDataTemplate>
                                                        </asp:GridView>
                                                  </div>
                                                    <div class="row">
                                                             <asp:LinkButton runat="server" ID="btnSaveEducation" Text="<%$Resources:SEDA_Careers,AddEducation%>" CssClass="subscribe-btn  green-btn shadow-sm mr-2" OnClick="btnSaveEducation_Click" ValidationGroup="vgEducation" />              
                                                </div>
                                                    </div>
                                            </div>
                                                </div>
                                         </ContentTemplate>
                                                  </asp:UpdatePanel>
                                        </div>
                                    </div>
                              </div>
                                

                                <%--Experiences--%>

                             <div class="form-accordion">
                                    <div id="third">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5 class="mb-0" data-toggle="collapse" data-target="#divThird" aria-expanded="false" aria-controls="divThird">
                                                    <asp:Label runat="server" Text="<%$Resources:SEDA_Careers,Experiences%>"></asp:Label>
                                                </h5>
                                            </div>
                                            <div id="divThird" class="collapse" aria-labelledby="divThird" data-parent="#third">
                                                <div class="card-body">
                                             <asp:UpdateProgress runat="server" ID="updateProgressBraft" AssociatedUpdatePanelID="UpdatePaneSaveDraft"></asp:UpdateProgress>
                                              <asp:UpdatePanel ID="UpdatePaneSaveDraft" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                                              <ContentTemplate>
                                                    <div class="row">

                                                              <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,HaveExperience%>" />:  
                                                <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:RadioButtonList runat="server" AutoPostBack="true" ID="RblHaveExperience" OnSelectedIndexChanged="RblHaveExperience_SelectedIndexChanged"  RepeatDirection="Horizontal" CssClass="custom-radiobutton" ValidationGroup="vgExperience">
                                                                <asp:ListItem Text="<%$Resources:SEDA_Careers,RblYes%>" ></asp:ListItem>
                                                                <asp:ListItem Text="<%$Resources:SEDA_Careers,RblNo%>"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </div>
                                                        </div>

                                                        <div class="row" runat="server" visible="false" id="haveExper">

                                                         <div class="col-lg-6 position-relative">
                                                                <label class="position-absolute dash-label">
                                                                    <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,StartDate%>" />:
                                                    <span class="required-indicator">*</span>
                                                                </label>
                                                                <asp:TextBox runat="server" ID="txtStartDate" AutoPostBack="false" onkeydown="return (event.keyCode!=13);" CssClass="form-input datePicker" ValidationGroup="vgExperience"></asp:TextBox>
                                                                <asp:RequiredFieldValidator runat="server" ID="RequiredtxtStartDate" ControlToValidate="txtStartDate" CssClass="error" ValidationGroup="vgExperience" Display="Dynamic"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                            </div>

                                                         <div class="col-lg-6 position-relative">
                                                                <label class="position-absolute dash-label">
                                                                    <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,EndDate%>" />:
                                                    <span class="required-indicator">*</span>
                                                                </label>
                                                                <asp:TextBox runat="server" ID="txtEndDate" AutoPostBack="false" onkeydown="return (event.keyCode!=13);" CssClass="form-input datePicker" ValidationGroup="vgExperience"></asp:TextBox>
                                                                <asp:RequiredFieldValidator runat="server" ID="RequiredtxtEndDate" ControlToValidate="txtEndDate" CssClass="error" ValidationGroup="vgExperience" Display="Dynamic"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                            </div>

                                                         <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">    
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,Location%>" />: 
                                                    <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:DropDownList CssClass="form-input" runat="server" ID="ddlLocationExp" ValidationGroup="vgExperience">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator runat="server" ID="RequiredddlLocationExp" ControlToValidate="ddlLocationExp" CssClass="error" ValidationGroup="vgExperience" Display="Dynamic" InitialValue=""><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>

                                                        <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,City%>" />:
                                                                <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:TextBox runat="server" MaxLength="255" ID="txtCityExp" CssClass="form-input"></asp:TextBox>
                                                            <asp:RequiredFieldValidator  runat="server" ID="RequiredtxtCityExp" ControlToValidate="txtCityExp" CssClass="error" Display="Dynamic" ValidationGroup="vgExperience"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>

                                                         <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,CompanyName %>" />:
                                                                <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:TextBox runat="server" MaxLength="255" ID="txtCompanyName" CssClass="form-input"></asp:TextBox>
                                                            <asp:RequiredFieldValidator  runat="server" ID="RequiredtxtCompanyName" ControlToValidate="txtCompanyName" CssClass="error" Display="Dynamic" ValidationGroup="vgExperience"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>

                                                        <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,JobTitle %>" />:
                                                                <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:TextBox runat="server" MaxLength="255" ID="txtJobTitle" CssClass="form-input"></asp:TextBox>
                                                            <asp:RequiredFieldValidator  runat="server" ID="RequiredJobTitle" ControlToValidate="txtJobTitle" CssClass="error" Display="Dynamic" ValidationGroup="vgExperience"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>             

                                                <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,JobDescription%>" />:
                                                                <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:TextBox runat="server" ID="txtJobDescription" CssClass="form-input" TextMode="MultiLine" Rows="10"  Columns="30"></asp:TextBox>
                                                            <asp:RequiredFieldValidator  runat="server" ID="RequiredJobDescription" ControlToValidate="txtJobDescription" CssClass="error" Display="Dynamic" ValidationGroup="vgExperience"><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>
                                                      

                                                   <div class="col-lg-12 position-relative">
                                                  <asp:GridView runat="server" ID="gvexperienes" CssClass="table" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                                                    <Columns>
                                                         <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,CompanyName%>" DataField="CompanyName" /> 
                                                        <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,JobTitle%>" DataField="JobTitle"  />
                                                         <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,JobDescription%>" DataField="JobDescription" />
                                                         <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,Location%>" DataField="LocationTitle" /> 
                                                         <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,City%>" DataField="City"  />     
                                                         <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,StartDate%>" DataField="StartDate" />   
                                                         <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,EndDate%>" DataField="EndDate"  />
                                   <asp:TemplateField HeaderStyle-CssClass="width-100">
                                                          <ItemTemplate>
                                                           <div class="iconbtn delebtn">
                                                             <asp:LinkButton runat="server" ID="lnkSupplierDelete" CssClass="greenColor fright RiconBG gridDelete" Text="<%$Resources:SEDA_Careers,Delete%>" CommandName="GuranteeDelete"  CommandArgument='<%#Bind("RowIndex") %>'  OnClick="ExperienesDelete_Click" OnClientClick="return ConfirmDelete()"></asp:LinkButton>
                                                       </div>
                                                         </ItemTemplate>
                                                         </asp:TemplateField>
                                                      </Columns>
                                                     <EmptyDataTemplate>
                                                             <asp:Literal ID="empty" runat="server" Text="<%$Resources:SEDA_Careers,lblNoData%>"></asp:Literal>
                                                    </EmptyDataTemplate>
                                                        </asp:GridView>
                                                       </div>
                                                      
                                                   <asp:LinkButton runat="server" ID="btnSaveExperiences" Text="<%$Resources:SEDA_Careers,AddExperiences%>" CssClass="subscribe-btn  green-btn shadow-sm mr-2" OnClick="btnSaveExperiences_Click" ValidationGroup="vgExperience" />
                                                             </div>
                                                  </ContentTemplate>
                                                  </asp:UpdatePanel>
                                                    </div>                           
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%--Languages--%>

                                 <div class="form-accordion">
                                    <div id="fourth">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5 class="mb-0" data-toggle="collapse" data-target="#divFourth" aria-expanded="false" aria-controls="divFourth">
                                                    <asp:Label runat="server" Text="<%$Resources:SEDA_Careers,Languages%>"></asp:Label>
                                                </h5>
                                            </div>
                                     <asp:UpdateProgress runat="server" ID="updateProgress1" AssociatedUpdatePanelID="Panellangauges"></asp:UpdateProgress>
                                      <asp:UpdatePanel ID="Panellangauges" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                                              <ContentTemplate>
                                            <div id="divFourth" class="collapse" aria-labelledby="divFourth" data-parent="#fourth">
                                                <div class="card-body">
                                                    <div class="row">
    
                                                         <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">    
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,Languages%>" />: 
                                                    <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:DropDownList CssClass="form-input" runat="server" ID="ddlLanguages" ValidationGroup="vgLanguage">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator runat="server" ID="RequiredddlLanguages" ControlToValidate="ddlLanguages" CssClass="error" ValidationGroup="vgLanguage" Display="Dynamic" InitialValue=""><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>

                                                        <div class="col-lg-6 position-relative">
                                                            <label class="position-absolute dash-label">    
                                                                <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,Proficiency%>" />: 
                                                    <span class="required-indicator">*</span>
                                                            </label>
                                                            <asp:DropDownList CssClass="form-input" runat="server" ID="ddlProficiency" ValidationGroup="vgLanguage">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator runat="server" ID="RequiredddlProficiency" ControlToValidate="ddlProficiency" CssClass="error" ValidationGroup="vgLanguage" Display="Dynamic" InitialValue=""><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                        </div>
                                                         <div class="col-lg-12 position-relative">
                                                         <asp:GridView runat="server" ID="gvLanguages" CssClass="table" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                                                    <Columns>
                                                         <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,Languages%>" DataField="LanguageTitle"  />
                                                         <asp:BoundField HeaderText="<%$Resources:SEDA_Careers,Proficiency%>" DataField="ProficienyTitle" />               
                                                        <asp:TemplateField HeaderStyle-CssClass="width-100">
                                                          <ItemTemplate>
                                                           <div class="iconbtn delebtn">
                                                             <asp:LinkButton runat="server" ID="LanguagesDelete" CssClass="greenColor fright RiconBG gridDelete" Text="<%$Resources:SEDA_Careers,Delete%>" CommandName="GuranteeDelete"  CommandArgument='<%#Bind("RowIndex") %>'  OnClick="LanguagesDelete_Click" OnClientClick="return ConfirmDelete()"></asp:LinkButton>
                                                       </div>
                                                         </ItemTemplate>
                                                         </asp:TemplateField>
                                                      </Columns>
                                                     <EmptyDataTemplate>
                                                             <asp:Literal ID="empty" runat="server" Text="<%$Resources:SEDA_Careers,lblNoData%>"></asp:Literal>
                                                    </EmptyDataTemplate>
                                                        </asp:GridView>
                                                             </div>
                                                         <asp:LinkButton runat="server" ID="btnSaveLanguages" Text="<%$Resources:SEDA_Careers,AddLanguages%>" CssClass="subscribe-btn  green-btn shadow-sm mr-2" OnClick="btnSaveLanguages_Click" ValidationGroup="vgLanguage" />
                                                     </div>
                                                </div>
                                                </div>
                                              </ContentTemplate>
                                             </asp:UpdatePanel>
                                            </div>
                                                 </div>
                                             </div>
                             
                                <%--Upload CV--%>

                             <div class="form-accordion">
                                    <div id="sixth">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5 class="mb-0" data-toggle="collapse" data-target="#divsixth" aria-expanded="false" aria-controls="divsixth">
                                                    <asp:Label runat="server" Text="<%$Resources:SEDA_Careers,CV%>"></asp:Label>
                                                </h5>
                                            </div>
                                            <asp:UpdateProgress runat="server" ID="updatecv" AssociatedUpdatePanelID="Panelcv"></asp:UpdateProgress>
                                              <asp:UpdatePanel ID="Panelcv" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                                              <ContentTemplate>
                                            <div id="divsixth" class="collapse" aria-labelledby="divsixth" data-parent="#sixth">
                                                <div class="card-body">
                                                    <div class="row">
    
                                                    <div class="col-lg-6 position-relative">
                                                                <label for="<%=fuCV.ClientID%>" class="download-btn register-upload file-upload">
                                                                    <i class="fa fa-upload" aria-hidden="true"></i>
                                                                    <asp:FileUpload runat="server" ID="fuCV" ClientIDMode="Static" hidden="" />
                                                                    <span class="file-name d-inline-block">
                                                                        <em class="d-flex align-items-center">
                                                                            <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,AddCV%>" />
                                                                            <span class="required-indicator">*</span>
                                                                        </em>
                                                                    </span>
                                                                </label>
                                                                <asp:Panel runat="server" ID="pnlCV" Visible="false">
                                                                    <asp:HyperLink runat="server" ID="lnkCV" Text="<%$Resources:SEDA_Careers,ShowUploadedFile%>"></asp:HyperLink>
                                                                    | 
                                                                 <a href="#?">
                                                                 <label for="<%=fuCV.ClientID%>">
                                                                 <asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,ChangeFile%>" /></label></a>
                                                                </asp:Panel>
                                                                <asp:RequiredFieldValidator runat="server" ID="RequiredAddCV" ControlToValidate="fuCV" CssClass="error" ValidationGroup="vgCareers" Display="Dynamic" InitialValue=""><asp:Literal runat="server" Text="<%$Resources:SEDA_Careers,VldRequired%>" /></asp:RequiredFieldValidator>
                                                            </div>
                                                     </div>
                                                </div>
                                                </div> 
                                             </ContentTemplate>
                                             </asp:UpdatePanel>
                                                    </div>
                                                 </div>
                                             </div>

                                            <div class="row">                                
                                                <div class="d-inline-block w-100 contact-footer mt-2">                                       
                                                    <asp:LinkButton runat="server" ID="btnSave" Text="<%$Resources:SEDA_Careers,Save%>" CssClass="subscribe-btn green-btn shadow-sm marg-r-8" OnClick="btnSave_Click" ValidationGroup="vgCareers"  onclientclick="ValidateTab();" causesvalidation="true" />
                                                </div>
                                                </div>

    </asp:Panel>

<script type="text/javascript" src="/Style%20Library/ar-sa/Core%20Styles/DatePicker/jquery.calendars.min.js"></script>
<script type="text/javascript" src="/Style%20Library/ar-sa/Core%20Styles/DatePicker/jquery.calendars.plus.min.js"></script>
<script type="text/javascript" src="/Style%20Library/ar-sa/Core%20Styles/DatePicker/jquery.plugin.min.js"></script>
<script type="text/javascript" src="/Style%20Library/ar-sa/Core%20Styles/DatePicker/jquery.calendars.picker-<asp:Literal runat='server' Text='<%$Resources:SEDA_Branding,RootWebUrl%>'/>.min.js"></script>
<script type="text/javascript" src="/Style%20Library/ar-sa/Core%20Styles/DatePicker/jquery.calendars.ummalqura.min.js"></script>
<script type="text/javascript" src="/Style%20Library/ar-sa/Core%20Styles/DatePicker/jquery.calendars.ummalqura-ar.js"></script>
<script type="text/javascript" src="/Style%20Library/ar-sa/Core%20Styles/DatePicker/jquery.calendars.islamic.min.js"></script>
<script type="text/javascript" src="/Style%20Library/ar-sa/Core%20Styles/DatePicker/jquery.calendars.islamic-ar.js"></script>
<script type="text/javascript" src="/Style Library/ar-sa/Core Styles/js/jquery.maskedinput.js"></script>
<link rel="stylesheet" href="/Style%20Library/ar-sa/Core%20Styles/select2/select2.css" />
<script type="text/javascript" src="/Style%20Library/ar-sa/Core%20Styles/select2/select2.js"></script>
<script type="text/javascript">
    function pageLoad(sender, args) {
        $('.datePicker').calendarsPicker({ calendar: $.calendars.instance("Islamic", "<asp:Literal runat='server' Text='<%$Resources:SEDA_Branding,RootWebUrl%>'/>"), yearRange: '-60:+60',/* minDate: -365,*/ dateFormat: 'dd/mm/yyyy' });

        var url = window.location.href;
    }

    $('input[type="file"]').each(function () {
        var inputUpload = $(this).attr('id');
        $(this).closest('.file-upload').attr("for", inputUpload);
        if (inputUpload.indexOf('fuProductImages') > 0) {
            $(this).attr('multiple', true);
        }
    })

    $('input[type=file]').each(function () {
        $(this).change(function () {
            var filename = '';// $(this).val().replace(/C:\\fakepath\\/i, '');
            for (var i = 0; i < this.files.length; i++) {
                if (this.files.length == 1)
                    filename += this.files[i].name;
                else
                    filename += this.files[i].name + ",";
            }
            $(this).parent().parent().parent().find('.file-name').html(filename);
        });
    });

    function openAccordian(id) {
        $(id).click();
    }
</script>

