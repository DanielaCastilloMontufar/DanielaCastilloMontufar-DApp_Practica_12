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

public partial class nameDate : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    // Property to read and write the text property of the nameTextBox control
    public string EmpName
    {
        get
        {
            return nameTextBox.Text;
        }
        set
        {
            nameTextBox.Text = value;
        }
    }

    // Property to read and write the text property of the birthTextBox control
    public DateTime EmpDOB
    {
        get
        {
            return Convert.ToDateTime(birthTextBox.Text);
        }
        set
        {
            birthTextBox.Text = value.ToString();
        }
    }


}
