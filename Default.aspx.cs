using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Trace.Warn("2310", "Beginning of Page_Load");
        // Trace.Warn("2310", "IsPostBack=" + Page.IsPostBack);
        // Add items from the Benefits component to the listBenefitsCheckBoxList
        if (!Page.IsPostBack)
        {

            Benefits benefitsList = new Benefits();
            foreach (Benefits.BenefitInfo benefit in
              benefitsList.GetBenefitsList())
            {
                listBenefitsCheckBoxList.Items.Add("<a href=" +
            benefit.benefitPage + ">" + benefit.benefitName + "</a>");
            }
        }

    }
    protected void submitButton_Click(object sender, EventArgs e)
    {
        // Add each selected item in the CheckBoxList to the label
        selectionsLabel.Text = "Selected items: ";
        foreach (ListItem item in listBenefitsCheckBoxList.Items)
        {
            if (item.Selected)
            {
                selectionsLabel.Text += " | " + item.Value;
            }
        }

    }
}
