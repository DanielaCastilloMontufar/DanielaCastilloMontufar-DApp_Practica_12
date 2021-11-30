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
using System.Data.SqlClient;

public partial class doctors : System.Web.UI.Page
{
    // Create 
    SqlConnection doctorsConnection = new SqlConnection();
    DataSet doctorsDataSet = new DataSet();
    SqlDataAdapter doctorsSqlDataAdapter = new SqlDataAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            doctorsGridView.DataSource = SqlDataSource1;
            //Bind the GridView to the doctors table.
            doctorsGridView.DataBind();

            ////Bind the list to city field in the doctors table.
            //CreateDataSet();
            //SqlCommand citiesSqlCommand =
            //    new SqlCommand("Select city FROM doctors", doctorsConnection);
            //SqlDataReader citiesSqlDataReader;

            //doctorsConnection.Open();
            //citiesSqlDataReader = citiesSqlCommand.ExecuteReader();
            //citiesList.DataSource = citiesSqlDataReader;
            //citiesList.DataTextField = "city";
            //citiesList.DataBind();
            //citiesSqlDataReader.Close();
            //doctorsConnection.Close();


            //TODO Lab9: Bind the listbox to the getUniqueCities stored procedure.
            CreateDataSet();
            SqlCommand citiesSqlCommand =
            new SqlCommand("getUniqueCities", doctorsConnection);
            citiesSqlCommand.CommandType = CommandType.StoredProcedure;
            SqlDataReader citiesSqlDataReader;
            doctorsConnection.Open();
            citiesSqlDataReader = citiesSqlCommand.ExecuteReader();
            citiesList.DataSource = citiesSqlDataReader;
            citiesList.DataTextField = "City";
            citiesList.DataBind();
            citiesSqlDataReader.Close();
            doctorsConnection.Close();


            //Add the "All" item to the list and select it.
            citiesList.Items.Add("[All]");
            citiesList.SelectedIndex = citiesList.Items.Count - 1;

            //Hide the specialties ListBox.
            specialtiesListBox.Visible = false;
            specialtiesLabel.Visible = false;

        }
    }

    private void CreateDataSet()
    {
        // Fill the doctorsDataSet
        doctorsConnection.ConnectionString =
            SqlDataSource1.ConnectionString;
        doctorsSqlDataAdapter.SelectCommand = new
            SqlCommand(SqlDataSource1.SelectCommand, doctorsConnection);
        doctorsSqlDataAdapter.Fill(doctorsDataSet);
    }


    private void Reset()
    {
		// Reset page index to 0.
		doctorsGridView.PageIndex = 0;

		// Remove the selection from the datagrid.
		doctorsGridView.SelectedIndex = -1;

		// Hide the specialties listbox.
        specialtiesListBox.Visible = false;
        specialtiesLabel.Visible = false;
    }
    protected void doctorsGridView_PageIndexChanged(object sender, EventArgs e)
    {
        // Enable paging with city selection
        CreateDataSet();
        string cityName = citiesList.SelectedItem.Value.Trim();
        if (cityName == "[All]")
        {
            doctorsGridView.DataSource = SqlDataSource1;
        }
        else
        {
            DataView doctorsDataView =
                new DataView(doctorsDataSet.Tables[0]);
            doctorsDataView.RowFilter = "City = '" + cityName + "' ";
            doctorsGridView.DataSource = doctorsDataView;
        }

        doctorsGridView.DataBind();
    }
    protected void doctorsGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        doctorsGridView.PageIndex = e.NewPageIndex;
    }
    protected void submitButton_Click(object sender, EventArgs e)
    {
        // Store the name of the selected doctor and pass it to the medical page
        if (doctorsGridView.SelectedIndex != -1)
        {
        string doctorsName;
        doctorsName =
            doctorsGridView.Rows[doctorsGridView.SelectedIndex]
            .Cells[3].Text.Trim() + " " + 
            doctorsGridView.Rows[doctorsGridView.SelectedIndex]
            .Cells[2].Text.Trim();
        Response.Redirect("medical.aspx?pcp=" + doctorsName);
        }
    }
    protected void citiesList_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Display doctors for the selected city
        CreateDataSet();
        string cityName = citiesList.SelectedItem.Value.Trim();
        if (cityName == "[All]")
        {
            doctorsGridView.DataSource = SqlDataSource1;
        }
        else
        {
            DataView doctorsDataView =
                new DataView(doctorsDataSet.Tables[0]);
            doctorsDataView.RowFilter = "City = '" + cityName + "' ";
            doctorsGridView.DataSource = doctorsDataView;
        }
        Reset();
        doctorsGridView.DataBind();

    }
    protected void doctorsGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        //CreateDataSet();
        //string drID;
        //drID = doctorsGridView.SelectedRow.Cells[1].Text;
        //SqlCommand specialtiesSqlCommand =
        //        new SqlCommand("getDrSpecialty", doctorsConnection);
        //specialtiesSqlCommand.CommandType = CommandType.StoredProcedure;
        //SqlParameter specialtiesParameter = new SqlParameter
        //    ("@dr_id", SqlDbType.Char, 4);
        //specialtiesParameter.Direction = ParameterDirection.Input;
        //specialtiesParameter.Value = drID;
        //specialtiesSqlCommand.Parameters.Add(specialtiesParameter);
        //SqlDataReader specialtiesSqlDataReader;
        //doctorsConnection.Open();
        //specialtiesSqlDataReader = specialtiesSqlCommand.ExecuteReader();
        //specialtiesListBox.DataSource = specialtiesSqlDataReader;
        //specialtiesListBox.DataTextField = "Specialty";
        //specialtiesListBox.DataBind();

        //if (specialtiesSqlDataReader.IsClosed == false)
        //{
        //    specialtiesListBox.Visible = specialtiesSqlDataReader.HasRows;
        //    specialtiesLabel.Visible = specialtiesSqlDataReader.HasRows;

        //}

        //specialtiesSqlDataReader.Close();
        //doctorsConnection.Close();

        // Get the ID of the selected doctor
        string drID;
        drID = doctorsGridView.SelectedRow.Cells[1].Text;

        // Call the getDrSpecialty method and pass the doctor's ID
        DoctorsDataContext doctorsContext = new DoctorsDataContext();
        specialtiesListBox.DataSource = doctorsContext.getDrSpecialty(drID);
        specialtiesListBox.DataTextField = "Specialty";
        specialtiesListBox.DataBind();

        // Display the list box if specialties exist
        if (specialtiesListBox.Items.Count != 0)
        {
            specialtiesListBox.Visible = true;
            specialtiesLabel.Visible = true;
        }

    }
}

