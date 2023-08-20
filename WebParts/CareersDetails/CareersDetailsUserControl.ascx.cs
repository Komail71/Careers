using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities;
using System;
using System.Configuration;
using System.IO;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using SEDA.Careers.Entities;
using System.Net.Mail;

namespace SEDA.Careers.WebParts.CareersDetails
{
    public partial class CareersDetailsUserControl : UserControl
    {
        protected bool isArabic;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                isArabic = SPContext.Current.Web.Language == 1025 ? true : false;
                LoadCareers();
            }

        }
        private void LoadCareers()
        {
            try
            {

                if (!string.IsNullOrEmpty(Page.Request.QueryString["careerId"]))
                {
                    SPSecurity.RunWithElevatedPrivileges(delegate ()
                    {
                        using (SPSite site = new SPSite(SPContext.Current.Site.ID))
                        {
                            using (SPWeb web = site.OpenWeb("/ar/careers"))
                            {
                                SPList CareersDetaisList = web.GetList(web.ServerRelativeUrl + "/Lists/CareersDetaisList");

                                SPListItem item = CareersDetaisList.GetItemById(Convert.ToInt32(Page.Request.QueryString["careerId"]));

                                if (item != null)
                                {

                                    litDescription.Text = isArabic ? item["Description1"] + "" : item["EnglishDescription"] + "";

                                }
                            }
                        }
                    });
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}
