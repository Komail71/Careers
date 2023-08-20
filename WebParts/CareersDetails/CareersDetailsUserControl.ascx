<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CareersDetailsUserControl.ascx.cs" Inherits="SEDA.Careers.WebParts.CareersDetails.CareersDetailsUserControl" %>


<asp:ListView ID="lvEvents" runat="server" OnPagePropertiesChanging="lvEvents_PagePropertiesChanging" OnDataBound="lvEvents_DataBound">
    <ItemTemplate>
        <div class="inner-events-container shadow-sm bg-white rounded margB10 list-Card">
                <h3 class="events-title" title='<%#((SPListItem)Container.DataItem)[SPUtility.GetLocalizedString("$Resources:SEDA_EventsAndMissions,WSFieldName;", "SEDA_EventsAndMissions", SPContext.Current.Web.Language)]%>'><%# HttpUtility.HtmlEncode(GetStringTrimmed(((SPListItem)Container.DataItem)[SPUtility.GetLocalizedString("$Resources:SEDA_EventsAndMissions,WSFieldName;", "SEDA_EventsAndMissions", SPContext.Current.Web.Language)],35)) %></h3>
                <span class="location"><i class="fa fa-map-marker" aria-hidden="true"></i><%# ((SPListItem)Container.DataItem)[SPUtility.GetLocalizedString("$Resources:SEDA_EventsAndMissions,WSFieldCityName;", "SEDA_EventsAndMissions", SPContext.Current.Web.Language)] %>, <%# ((SPListItem)Container.DataItem)[SPUtility.GetLocalizedString("$Resources:SEDA_EventsAndMissions,WSFieldCountryNameSP;", "SEDA_EventsAndMissions", SPContext.Current.Web.Language)] %></span>
                <span class="maindate"><i class="fa fa-calendar" aria-hidden="true"></i><%# DisplayEventDuration(((SPListItem)Container.DataItem)["StartDate"],((SPListItem)Container.DataItem)["EndDate"]) %></span>
                 <span class="register-icon"><i class="fa fa-sign-in" aria-hidden="true"></i><%# !string.IsNullOrEmpty(Convert.ToString(((SPListItem)Container.DataItem)["RegistrationStatus"]))? SPUtility.GetLocalizedString("$Resources:SEDA_EventsAndMissions,"+((SPListItem)Container.DataItem)["RegistrationStatus"]+";", "SEDA_EventsAndMissions", SPContext.Current.Web.Language) :SPUtility.GetLocalizedString("$Resources: SEDA_EventsAndMissions,RegistrationClosed; ", "SEDA_EventsAndMissions", SPContext.Current.Web.Language)%></span>
                <p class="maindescription"><%# HttpUtility.HtmlEncode(StripHTML(GetStringTrimmed(((SPListItem)Container.DataItem)[SPUtility.GetLocalizedString("$Resources:SEDA_EventsAndMissions,WSFieldDescription;", "SEDA_EventsAndMissions", SPContext.Current.Web.Language)],140))) %></p>
                <a class="read-more" href="<%# GetDetailsPageUrl(((SPListItem)Container.DataItem)["CareerId"]) %>">
                    <asp:Literal runat='server' Text='<%$Resources:SEDA_EventsAndMissions,Details%>' /></a>
            </div>
        </div>
    </ItemTemplate>
                <EmptyDataTemplate>
                <div class="d-inline-block w-100 no-items"><asp:Literal runat="server" Text="<%$Resources:SEDA_EventsAndMissions,NoUpcomingEvents%>" /></div>
            </EmptyDataTemplate>
</asp:ListView>
<div class="d-inline-block text-center w-100">
    <a id="loadMore">
        <asp:Literal runat='server' Text='<%$Resources:SEDA_EventsAndMissions,LoadMoreEvents%>'></asp:Literal></a>
</div>



<script type="text/javascript">
    $(document).ready(function () {
        if ($(".list-Card:hidden").length <= 10) {
            $("#loadMore").css('display', 'none');
        }
        $(".list-Card").slice(0, 10).show();

        $("#loadMore").on("click", function (e) {
            e.preventDefault();
            $(".list-Card:hidden").slice(0, 10).slideDown();
            if ($(".list-Card:hidden").length == 0) {
                $("#loadMore").css('display', 'none');
            }
        });
    });
</script>
