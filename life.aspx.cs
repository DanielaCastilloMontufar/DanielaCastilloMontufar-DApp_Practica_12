using System;
using System.Collections;
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

public partial class life : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Trace.Warn("2310", "Beginning of life Page_Load");
    }
    protected void saveButton_Click(object sender, EventArgs e)
    {
        // Display a message if the page is valid
        if (Page.IsValid)
        {
            messageLabel.Text = "The page is valid";
        }

    }
}
