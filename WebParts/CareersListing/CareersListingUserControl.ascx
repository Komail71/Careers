<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CareersListingUserControl.ascx.cs" Inherits="SEDA.Careers.WebParts.CareersListing.CareersListingUserControl" %>


<!--New Design-->
<asp:ListView ID="lvCareers" runat="server" OnPagePropertiesChanging="lvCareers_PagePropertiesChanging" OnDataBound="lvCareers_DataBound">
    <ItemTemplate>
        <div class="inner-events-container shadow-sm bg-white rounded margB10 list-Card">
            <div class="d-inline-block w-100">
                <h3 class="events-title" title='<%#((SPListItem)Container.DataItem)[SPUtility.GetLocalizedString("$Resources:SEDA_Careers,WSFieldTitleName;", "SEDA_Careers", SPContext.Current.Web.Language)]%>'><%# HttpUtility.HtmlEncode(GetStringTrimmed(((SPListItem)Container.DataItem)[SPUtility.GetLocalizedString("$Resources:SEDA_Careers,WSFieldTitleName;", "SEDA_Careers", SPContext.Current.Web.Language)],35)) %></h3>
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