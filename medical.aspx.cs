using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class medical : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //  Display the name of the selected doctor that was passed
        //  from the doctors.aspx page
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["pcp"] != "")
            {
                doctorTextBox.Text = Request.QueryString["pcp"];
            }
        }

    }
    protected void saveButton_Click(object sender, EventArgs e)
    {
        // Output the name and birth date values into a label
        Label2.Text = nameDate1.EmpName + " born on " +
       nameDate1.EmpDOB.ToLongDateString();
    }
}
