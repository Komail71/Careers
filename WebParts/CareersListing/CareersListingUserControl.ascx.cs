using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Linq;
using System.Data;

namespace SEDA.Careers.WebParts.CareersListing
{
    public partial class CareersListingUserControl : UserControl
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadCareers();
            }

        }
        private void LoadCareers()
        {
            try
            {
                using (SPSite site = new SPSite(SPContext.Current.Site.ID))
                {
                    using (SPWeb web = site.OpenWeb("/ar/careers"))
                    {
                        SPList CareersList = web.GetList("/Lists/CareersDetaisList");
                        SPQuery query = new SPQuery
                        {
                            Query = "<Where><Eq><FieldRef Name=\"Publish\"></FieldRef><Value Type=\"Boolean\">1</Value></Eq></Where><OrderBy><FieldRef Name=\"Career\"/></OrderBy>"
                        };
                        var Careers = (from SPListItem itm in CareersList.GetItems(query)
                                      select new
                                      {
                                          ID = itm.ID,
                                          Title = SPContext.Current.Web.Language == 1033 ? Convert.ToString(itm["English Title"]) : itm.Title
                                      }).ToList();
                        LvCareers.DataSource = Careers;//.GetDataTable();
                        LvCareers.DataBind();



                    }
                }
            }
            catch (Exception ex)
            {
                pnlMainForm.Visible = false;
            }
        }

    }
}
