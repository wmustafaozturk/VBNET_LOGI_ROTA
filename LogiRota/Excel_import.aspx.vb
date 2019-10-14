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
Public Class Excel_import
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (IsPostBack) = False Then
            EXCEL_GRIDLE()
        End If
    End Sub

    Public Sub EXCEL_GRIDLE()
        Dim cn1 As New SqlConnection
        cn1.ConnectionString = WebConfigurationManager.ConnectionStrings("Con").ToString()
        Dim CMD As New SqlCommand("SELECT * FROM LOGI_DATA.DBO.EXCEL_IMPORT ORDER BY FIRMA_ADI ASC", cn1)
        CMD.CommandType = CommandType.Text
        Dim DA As New SqlDataAdapter(CMD)
        Dim DT As New DataTable
        DA.Fill(DT)

        GridView1.DataSource = DT
        GridView1.DataBind()
    End Sub
    Private Sub BTN_EXCEL_ARA_Click(sender As Object, e As EventArgs) Handles BTN_EXCEL_ARA.Click
        Dim cn1 As New SqlConnection
        cn1.ConnectionString = WebConfigurationManager.ConnectionStrings("Con").ToString()
        Dim CMD As New SqlCommand("SELECT * FROM LOGI_DATA.DBO.EXCEL_IMPORT where FIRMA_ADI like '%" + TXT_ARA.Text + "%'", cn1)
        CMD.CommandType = CommandType.Text
        Dim DA As New SqlDataAdapter(CMD)
        Dim DT As New DataTable
        DA.Fill(DT)

        GridView1.DataSource = DT
        GridView1.DataBind()
        If DT.Rows.Count = 0 Then
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "MSG_URUN_ARA();", True)
        End If
    End Sub
    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataBind()
        EXCEL_GRIDLE()
    End Sub
    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        'mouse üzerine gelice satır renklendirmek için
        If e.Row.RowType = System.Web.UI.WebControls.DataControlRowType.DataRow Then
            ' when mouse is over the row, save original color to new attribute, and change it to highlight color
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#AFAFAF'")
            ' when mouse leaves the row, change the bg color to its original value  
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;")
        End If

        '//////gridview kolon gizleme//////
        If e.Row.RowType = DataControlRowType.DataRow Or e.Row.RowType = DataControlRowType.Header Then
            For i As Integer = 0 To e.Row.Cells.Count - 1
                'e.Row.Cells(2).Visible = False
                'e.Row.Cells(3).Visible = False
            Next
        End If
        '//////gridview kolon gizleme//////
    End Sub
    Protected Sub secilenirenklendir(sender As Object, e As EventArgs)
        For Each row As GridViewRow In GridView1.Rows
            If row.RowIndex = GridView1.SelectedIndex Then
                row.BackColor = ColorTranslator.FromHtml("#A1DCF2")
            Else
                row.BackColor = ColorTranslator.FromHtml("#FFFFFF")
            End If
        Next
    End Sub

    Private Sub BTN_ExcelImport_ServerClick(sender As Object, e As EventArgs) Handles BTN_ExcelImport.ServerClick
        Dim excelConnectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\IT\vb_net\LogiRota\LogiRota\dd.xls;Extended Properties=""Excel 8.0;HDR=YES;"""
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
    End Sub
End Class