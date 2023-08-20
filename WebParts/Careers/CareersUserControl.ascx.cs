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

namespace SEDA.Careers.WebParts.Careers
{
    public partial class CareersUserControl : UserControl
    {
        List<Language> languages = new List<Language>();
        List<Education> educations = new List<Education>();
        List<Experience> experiences = new List<Experience>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    Session["Languages"] = null;
                    Session["Education"] = null;
                    Session["Experiences"] = null;
                    FillLookups();
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void FillLookups()
        {
            try
            {
                using (SPSite site = new SPSite(SPContext.Current.Site.ID))
                {
                    using (SPWeb web = site.OpenWeb("/ar/careers"))
                    {
                        string textField = SPUtility.GetLocalizedString("$Resources:SEDA_Careers,DataTextField;", "SEDA_Careers", SPContext.Current.Web.Language);
                        string valueField = "ID";

                        SPList locationsList = web.GetList(web.ServerRelativeUrl + "/Lists/Location");
                        ddlLocationPer.DataValueField = valueField;
                        ddlLocationPer.DataTextField = textField;
                        ddlLocationPer.AppendDataBoundItems = true;
                        ddlLocationPer.DataSource = locationsList.GetItems().GetDataTable();
                        ddlLocationPer.DataBind();
                        ddlLocationPer.Items.Insert(0, SPUtility.GetLocalizedString("$Resources:SEDA_Careers,SelectLocation;", "SEDA_Careers", SPContext.Current.Web.Language));

                        SPList degreeList = web.GetList(web.ServerRelativeUrl + "/Lists/Degree");
                        ddlDegree.DataValueField = valueField;
                        ddlDegree.DataTextField = textField;
                        ddlDegree.AppendDataBoundItems = true;
                        ddlDegree.DataSource = degreeList.GetItems().GetDataTable();
                        ddlDegree.DataBind();
                        ddlDegree.Items.Insert(0, SPUtility.GetLocalizedString("$Resources:SEDA_Careers,SelectDegree;", "SEDA_Careers", SPContext.Current.Web.Language));

                        SPList countryList = web.GetList(web.ServerRelativeUrl + "/Lists/CounrtyList");
                        ddlCountry.DataValueField = valueField;
                        ddlCountry.DataTextField = textField;
                        ddlCountry.AppendDataBoundItems = true;
                        ddlCountry.DataSource = countryList.GetItems().GetDataTable();
                        ddlCountry.DataBind();
                        ddlCountry.Items.Insert(0, SPUtility.GetLocalizedString("$Resources:SEDA_Careers,SelectCounrty;", "SEDA_Careers", SPContext.Current.Web.Language));

                        SPList languagesList = web.GetList(web.ServerRelativeUrl + "/Lists/Languages");
                        ddlLanguages.DataValueField = valueField;
                        ddlLanguages.DataTextField = textField;
                        ddlLanguages.AppendDataBoundItems = true;
                        ddlLanguages.DataSource = languagesList.GetItems().GetDataTable();
                        ddlLanguages.DataBind();
                        ddlLanguages.Items.Insert(0, SPUtility.GetLocalizedString("$Resources:SEDA_Careers,SelectLanguages;", "SEDA_Careers", SPContext.Current.Web.Language));

                        SPList proficiencyList = web.GetList(web.ServerRelativeUrl + "/Lists/Proficiency");
                        ddlProficiency.DataValueField = valueField;
                        ddlProficiency.DataTextField = textField;
                        ddlProficiency.AppendDataBoundItems = true;
                        ddlProficiency.DataSource = proficiencyList.GetItems().GetDataTable();
                        ddlProficiency.DataBind();
                        ddlProficiency.Items.Insert(0, SPUtility.GetLocalizedString("$Resources:SEDA_Careers,SelectProficiency;", "SEDA_Careers", SPContext.Current.Web.Language));

                        SPList locationExList = web.GetList(web.ServerRelativeUrl + "/Lists/CounrtyList");
                        ddlLocationExp.DataValueField = valueField;
                        ddlLocationExp.DataTextField = textField;
                        ddlLocationExp.AppendDataBoundItems = true;
                        ddlLocationExp.DataSource = locationExList.GetItems().GetDataTable();
                        ddlLocationExp.DataBind();
                        ddlLocationExp.Items.Insert(0, SPUtility.GetLocalizedString("$Resources:SEDA_Careers,SelectLocation;", "SEDA_Careers", SPContext.Current.Web.Language));

                        LoadLanguages();
                    }
                }

            }
            catch (Exception ex)
            {

            }
        }

        protected void RblHaveExperience_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (RblHaveExperience.SelectedIndex == 0)
                {
                    haveExper.Visible = true;
                    LoadExperiences();
                }
                else
                {
                    haveExper.Visible = false;
                }
            }
            catch (Exception ex)
            {

            }


        }

        protected void LanguagesDelete_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton LanguagesDelete = (LinkButton)sender;
                if (LanguagesDelete.CommandArgument != null)

                {
                    var rowIndex = int.Parse(LanguagesDelete.CommandArgument);
                    languages = (List<Language>)Session["Languages"];
                    Language language = new Language();

                    var indexDelete = languages.FindIndex(x => x.RowIndex == rowIndex);
                    //var indexExist = languages.FindIndex(x => x.RowIndex == rowIndex);

                    if (indexDelete > -1)
                    {
                        languages.RemoveAt(indexDelete);

                    }
                    Session["Languages"] = languages;
                    LoadLanguages();
                    ScriptManager.RegisterStartupScript(Panellangauges, Panellangauges.GetType(), "openAccordian", "$(document).ready(function(){openAccordian('#fourth .mb-0');});", true);
                    Panellangauges.Update();
                }
            }
            catch (Exception ex)
            {

            }
        }


        protected void btnSaveLanguages_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["Languages"] != null)
                {
                    languages = (List<Language>)Session["Languages"];
                }
                Language language = new Language();
                language.LanguageID = Convert.ToInt32(ddlLanguages.SelectedValue);
                language.LanguageTitle = ddlLanguages.SelectedItem.Text;
                language.ProficienyId = int.Parse(ddlProficiency.SelectedValue);
                language.ProficienyTitle = ddlProficiency.SelectedItem.Text;
                language.RowIndex = languages.Count;

                languages.Add(language);
                Session["Languages"] = languages;
                ResetLanguage();
                LoadLanguages();
                ScriptManager.RegisterStartupScript(Panellangauges, Panellangauges.GetType(), "openAccordian", "$(document).ready(function(){openAccordian('#fourth .mb-0');});", true);
                Panellangauges.Update();
                //ScriptManager.RegisterStartupScript(Panellangauges, Panellangauges.GetType(), "openAccordian", "openAccordian('#fourth .mb-0')", false);
            }
            catch (Exception ex)
            {
                pnlMessage.Visible = true;
                pnlMsgError.Visible = true;
                lblMsgError.Text = SPUtility.GetLocalizedString("$Resources:SEDA_Branding,MsgGenericError;", "SEDA_Branding", SPContext.Current.Web.Language);
            }



        }

        private void LoadLanguages()
        {
            try
            {
                List<Language> alllanguage = Session["Languages"] != null ? (List<Language>)Session["Languages"] : languages;
                gvLanguages.DataSource = alllanguage;
                gvLanguages.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        private void ResetLanguage()
        {

            try
            {
                ddlLanguages.SelectedIndex = 0;
                ddlProficiency.SelectedIndex = 0;

            }
            catch (Exception ex)
            {


            }

        }

        protected void btnSaveExperiences_Click(object sender, EventArgs e)
        {
            try
            {
                if (RblHaveExperience.SelectedIndex == 0)
                {
                    if (Session["Experiences"] != null)
                    {
                        experiences = (List<Experience>)Session["Experiences"];
                    }
                    Experience experience = new Experience();
                    experience.City = txtCityExp.Text;
                    experience.CompanyName = txtCompanyName.Text;
                    experience.JobDescription = txtJobDescription.Text;
                    experience.JobTitle = txtJobTitle.Text;
                    experience.LocationId = int.Parse(ddlLocationExp.SelectedValue);
                    experience.LocationTitle = ddlLocationExp.SelectedItem.Text;
                    experience.StartDate = txtStartDate.Text;
                    experience.EndDate = txtEndDate.Text;
                    experience.RowIndex = experiences.Count + 1;

                    experiences.Add(experience);

                    Session["Experiences"] = experiences;


                    ResetExperienes();

                    LoadExperiences();
                    //ScriptManager.RegisterStartupScript(UpdatePaneSaveDraft, UpdatePaneSaveDraft.GetType(), "openAccordian", "$(document).ready(function(){openAccordian('#third .mb-0');});", true);
                    UpdatePaneSaveDraft.Update();
                    //ScriptManager.RegisterStartupScript(UpdatePaneSaveDraft, UpdatePaneSaveDraft.GetType(), "openAccordian", "openAccordian('#third .mb-0')", false);
                }

            }
            catch (Exception ex)
            {

            }
        }

        private void LoadExperiences()
        {

            try
            {

                gvexperienes.DataSource = Session["Experiences"] != null ? (List<Experience>)Session["Experiences"] : experiences;
                gvexperienes.DataBind();
            }
            catch (Exception ex)
            {


            }
        }

        private void ResetExperienes()
        {
            try
            {
                ddlLocationExp.SelectedIndex = 0;
                txtCityExp.Text = "";
                txtCompanyName.Text = "";
                txtJobDescription.Text = "";
                txtJobTitle.Text = "";
                txtStartDate.Text = "";
                txtEndDate.Text = "";

            }
            catch (Exception ex)
            {


            }

        }

        protected void ExperienesDelete_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton ExperienesDelete = (LinkButton)sender;
                if (ExperienesDelete.CommandArgument != null)

                {
                    var rowIndex = int.Parse(ExperienesDelete.CommandArgument);
                    experiences = (List<Experience>)Session["Experiences"];
                    Experience experience = new Experience();

                    var indexDelete = experiences.FindIndex(x => x.RowIndex == rowIndex);
                    //var indexExist = languages.FindIndex(x => x.RowIndex == rowIndex);

                    if (indexDelete > -1)
                    {
                        experiences.RemoveAt(indexDelete);

                    }
                    Session["Experiences"] = experiences;
                    LoadExperiences();
                    //ScriptManager.RegisterStartupScript(UpdatePaneSaveDraft, UpdatePaneSaveDraft.GetType(), "openAccordian", "$(document).ready(function(){openAccordian('#third .mb-0');});", true);
                    UpdatePaneSaveDraft.Update();
                    //ScriptManager.RegisterStartupScript(UpdatePaneSaveDraft, UpdatePaneSaveDraft.GetType(), "openAccordian", "openAccordian('#third .mb-0')", false);
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnSaveEducation_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["Education"] != null)
                {
                    educations = Session["Education"] != null ? (List<Education>)Session["Education"] : educations;
                }
                Education education = new Education();


                education.CounrtyId = int.Parse(ddlCountry.SelectedValue);
                education.CounrtyTitle = ddlCountry.SelectedItem.Text;
                education.DegreeId = int.Parse(ddlDegree.SelectedValue);
                education.DegreeTitle = ddlDegree.SelectedItem.Text;
                education.Description = txtDescription.Text;
                education.WorkCity = txtCityEdu.Text;
                education.University = txtUniversity.Text;
                education.GPA = ddlGPA.SelectedItem.Value;
                education.GPAnum = txtGPANum.Text;
                education.GraduationDate = txtGraduationDate.Text;
                education.Major = txtMajor.Text;
                education.RowIndex = educations.Count + 1;

                educations.Add(education);

                Session["Education"] = educations;
                ResetEducations();
                LoadEducations();

                ScriptManager.RegisterStartupScript(PanelEduction, PanelEduction.GetType(), "openAccordian", "$(document).ready(function(){openAccordian('#second .mb-0');});", true);
                PanelEduction.Update();
                //ScriptManager.RegisterStartupScript(PanelEduction, PanelEduction.GetType(), "openAccordian", "openAccordian('#second .mb-0')", false);

            }
            catch (Exception ex)
            {

            }
        }

        private void LoadEducations()
        {
            try
            {
                gveductions.DataSource = Session["Education"] != null ? (List<Education>)Session["Education"] : educations;
                gveductions.DataBind();

            }
            catch (Exception ex)
            {

            }

        }

        private void ResetEducations()
        {
            try
            {
                ddlCountry.SelectedIndex = 0;
                ddlDegree.SelectedIndex = 0;
                txtDescription.Text = "";
                txtCityEdu.Text = "";
                txtUniversity.Text = "";
                ddlGPA.SelectedIndex = 0;
                txtGPANum.Text = "";
                txtGraduationDate.Text = "";
                txtMajor.Text = "";

            }
            catch (Exception ex)
            {


            }

        }
        protected void EducationsDelete_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton EducationsDelete = (LinkButton)sender;
                if (EducationsDelete.CommandArgument != null)

                {
                    var rowIndex = int.Parse(EducationsDelete.CommandArgument);
                    educations = Session["Education"] != null ? (List<Education>)Session["Education"] : educations;
                    Education education = new Education();

                    var indexDelete = educations.FindIndex(x => x.RowIndex == rowIndex);

                    if (indexDelete > -1)
                    {
                        educations.RemoveAt(indexDelete);

                    }
                    Session["Education"] = educations;
                    LoadEducations();

                    ScriptManager.RegisterStartupScript(PanelEduction, PanelEduction.GetType(), "openAccordian", "$(document).ready(function(){openAccordian('#second .mb-0');});", true);
                    PanelEduction.Update();
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SPSecurity.RunWithElevatedPrivileges(delegate ()
                {
                    using (SPSite site = new SPSite(SPContext.Current.Site.ID))
                    {
                        using (SPWeb web = site.OpenWeb("/ar/careers"))
                        {
                            SPList PersonalInformationList = web.GetList(web.ServerRelativeUrl + "/Lists/PersonalInformationList");
                            SPList LanguagesMainList = web.GetList(web.ServerRelativeUrl + "/Lists/LanguagesMainList");
                            List<Language> alllanguage = Session["Languages"] != null ? (List<Language>)Session["Languages"] : languages;
                            SPList ExperiencesList = web.GetList(web.ServerRelativeUrl + "/Lists/ExperiencesList");
                            experiences = Session["Experiences"] != null ? (List<Experience>)Session["Experiences"] : experiences;
                            SPList EducationList = web.GetList(web.ServerRelativeUrl + "/Lists/EducationList");
                            educations = Session["Education"] != null ? (List<Education>)Session["Education"] : educations;

                            if (PersonalInformationList != null)
                            {

                                web.AllowUnsafeUpdates = true;

                                SPListItem item = PersonalInformationList.AddItem();

                                item["Title"] = txtFirstName.Text + " " + txtLastName.Text;
                                item["Nationality"] = RblNationality.SelectedValue;
                                item["PhoneNumber"] = txtPhone.Text;
                                item["AnotherPhonenumber"] = txtAnotherPhone.Text;
                                item["Email"] = txtEmail.Text;
                                item["Personallocation"] = new SPFieldLookupValue(int.Parse(ddlLocationPer.SelectedValue), ddlLocationPer.SelectedItem.Text);
                                item["LastMonthlySalary"] = txtLastSalary.Text;
                                item["TargetMonthlySalary"] = txtTargetSalary.Text;
                                item["Gender"] = RblGender.SelectedValue;
                                item["DateofBirth"] = Convert.ToDateTime(txtDateOfBirth.Text);
                                item["FirstName"] = txtFirstName.Text;
                                item["LastName"] = txtLastName.Text;

                                item.Attachments.Add(fuCV.FileName, fuCV.FileBytes);



                                PersonalInformationReset();
                                item.Update();


                                foreach (Language lang in alllanguage)
                                {
                                    if (LanguagesMainList != null)
                                    {
                                        SPListItem Language = LanguagesMainList.AddItem();
                                        Language["Languages"] = new SPFieldLookupValue(lang.LanguageID, lang.LanguageTitle);
                                        Language["Proficiency"] = new SPFieldLookupValue(lang.ProficienyId, lang.ProficienyTitle);
                                        Language["LanguageDetailes"] = new SPFieldLookupValue(item.ID, item.Title);

                                        UpdatePaneSaveDraft.Update();
                                        ResetLanguage();
                                        Language.Update();


                                    }
                                }


                                foreach (Education edu in educations)
                                {
                                    if (EducationList != null)
                                    {
                                        SPListItem Education = EducationList.AddItem();
                                        Education["Degree"] = new SPFieldLookupValue(edu.DegreeId, edu.DegreeTitle);
                                        Education["Counrty"] = new SPFieldLookupValue(edu.CounrtyId, edu.CounrtyTitle);
                                        Education["University"] = edu.University;
                                        Education["Major"] = edu.Major;
                                        Education["GPA"] = edu.GPA;
                                        Education["GPAnum"] = edu.GPAnum;
                                        Education["GraduationDate"] = Convert.ToDateTime(edu.GraduationDate);
                                        Education["WorkCity"] = edu.WorkCity;
                                        Education["Description"] = edu.Description;
                                        Education["EducationDetailes"] = new SPFieldLookupValue(item.ID, item.Title);

                                        ScriptManager.RegisterStartupScript(PanelEduction, PanelEduction.GetType(), "openAccordian", "$(document).ready(function(){openAccordian('#second .mb-0');});", true);
                                        PanelEduction.Update();
                                        ResetEducations();
                                        Education.Update();


                                    }
                                }


                                foreach (Experience exp in experiences)
                                {
                                    if (ExperiencesList != null)
                                    {
                                        SPListItem Experience = ExperiencesList.AddItem();
                                        Experience["HaveExperience"] = RblHaveExperience.SelectedValue;
                                        Experience["Location"] = new SPFieldLookupValue(exp.LocationId, exp.LocationTitle);
                                        Experience["CompanyName"] = exp.CompanyName;
                                        Experience["JobDescription"] = exp.JobDescription;
                                        Experience["StartDate"] = Convert.ToDateTime(exp.StartDate);
                                        Experience["EndDate"] = Convert.ToDateTime(exp.EndDate);
                                        Experience["City"] = exp.City;
                                        Experience["JobTitle"] = exp.JobTitle;
                                        Experience["ExperienceDetailes"] = new SPFieldLookupValue(item.ID, item.Title);

                                        UpdatePaneSaveDraft.Update();
                                        ResetExperienes();
                                        Experience.Update();


                                    }
                                }

                                pnlMainForm.Visible = false;
                                pnlMessage.Visible = true;
                                pnlMsgSuccess.Visible = true;
                                lblMsgSuccess.Text = SPUtility.GetLocalizedString("$Resources:SEDA_Careers,MsgCareerSubmitted;", "SEDA_Careers", SPContext.Current.Web.Language);

                                web.AllowUnsafeUpdates = false;

                            }
                        }
                    }
                });

            }

            catch (Exception ex)
            {

            }
        }

        private void PersonalInformationReset()
        {
            try
            {
                RblNationality.SelectedIndex = 0;
                ddlLocationPer.SelectedIndex = 0;
                txtPhone.Text = "";
                txtAnotherPhone.Text = "";
                txtEmail.Text = "";
                RblGender.SelectedIndex = 0;
                txtLastSalary.Text = "";
                txtTargetSalary.Text = "";
                txtDateOfBirth.Text = "";
                txtFirstName.Text = "";
                txtLastName.Text = "";

            }
            catch (Exception ex)
            {


            }

        }
    }
}
