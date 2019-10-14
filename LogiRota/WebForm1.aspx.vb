Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Text
Imports System.Configuration
Imports System.Web
Imports System.Web.UI
Imports System.Web.Configuration
Imports System.Xml
Imports System.Xml.Linq
Imports System.Web.Services.Description
Imports System.Drawing
Imports System.Globalization
Imports System.IO
Imports System.Data.OleDb
Imports System.Data.Common
Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindGridview()
        End If
    End Sub

    Private Sub BindGridview()
        'Dim cmd As SqlCommand = New SqlCommand("spGetAllEmployee", con)
        'cmd.CommandType = CommandType.StoredProcedure
        'con.Open()
        'GridView1.DataSource = cmd.ExecuteReader()
        'GridView1.DataBind()
        'If cn1.State = ConnectionState.Closed Then cn1.Open()
        Dim cn1 As New SqlConnection
        cn1.ConnectionString = WebConfigurationManager.ConnectionStrings("Con").ToString()
        Dim CMD As New SqlCommand("SELECT * FROM EXCEL_IMPORT ", cn1)
        CMD.CommandType = CommandType.Text
        Dim DA As New SqlDataAdapter(CMD)
        Dim DT As New DataTable
        DA.Fill(DT)

        GridView1.DataSource = DT
        GridView1.DataBind()
        
    End Sub

    Protected Sub btnUpload_Click(ByVal sender As Object, ByVal e As EventArgs)
        If FileUpload1.PostedFile IsNot Nothing Then
            Try
                Dim path As String = String.Concat(Server.MapPath("~/FILES/" & FileUpload1.FileName))
                FileUpload1.SaveAs(path)
                Dim excelConnectionString As String = String.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path)
                Using connection As System.Data.OleDb.OleDbConnection = New System.Data.OleDb.OleDbConnection(excelConnectionString)
                    Dim mynum As Integer = 1
                    Dim command As System.Data.OleDb.OleDbCommand = New System.Data.OleDb.OleDbCommand("Select FIRMA_ADI,SEHIR,ILCE,URUN_ADI,IRSALIYE_NO,PALET_KG,URUN_TESLIM_ALINAN_TARIH,FIRMA_DEPO_TESLIM_TARIHI,PALET_SAYISI, " & mynum & "  FROM [IRSALIYE$]", connection)
                    connection.Open()
                    Using dr As System.Data.OleDb.OleDbDataReader = command.ExecuteReader()
                        Dim sqlConnectionString As String = ConfigurationManager.ConnectionStrings("con").ToString()
                        Using bulkCopy As System.Data.SqlClient.SqlBulkCopy = New System.Data.SqlClient.SqlBulkCopy(sqlConnectionString)
                            bulkCopy.DestinationTableName = "EXCEL_IMPORT"
                            bulkCopy.ColumnMappings.Add("FIRMA_ADI", "FIRMA_ADI")
                            bulkCopy.ColumnMappings.Add("SEHIR", "SEHIR")
                            bulkCopy.ColumnMappings.Add("ILCE", "ILCE")
                            bulkCopy.ColumnMappings.Add("URUN_ADI", "URUN_ADI")
                            bulkCopy.ColumnMappings.Add("IRSALIYE_NO", "IRSALIYE_NO")
                            bulkCopy.ColumnMappings.Add("PALET_KG", "PALET_KG")
                            bulkCopy.ColumnMappings.Add("URUN_TESLIM_ALINAN_TARIH", "URUN_TESLIM_ALINAN_TARIH")
                            bulkCopy.ColumnMappings.Add("FIRMA_DEPO_TESLIM_TARIHI", "FIRMA_DEPO_TESLIM_TARIHI")
                            bulkCopy.ColumnMappings.Add("PALET_SAYISI", "PALET_SAYISI")
                            bulkCopy.WriteToServer(dr)
                        End Using
                    End Using
                End Using
            Catch __unusedException1__ As Exception
                lblMessage.Text = "Your file not uploaded"
                lblMessage.ForeColor = System.Drawing.Color.Red
            End Try
        End If
    End Sub
End Class
