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
Public Class RotaPlanlama
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (IsPostBack) = False Then
            ROTA_PLANLA_GRIDLE()
        End If
    End Sub
    Public Sub ROTA_PLANLA_GRIDLE()
        Dim cn1 As New SqlConnection
        cn1.ConnectionString = WebConfigurationManager.ConnectionStrings("Con").ToString()
        Dim CMD As New SqlCommand("SELECT floor(SUM(cast(PALET_KG AS numeric(18,4)))/25000) AS TIR_ADET,
                                    right(sum(PALET_KG)/25000 ,6) AS KUSURAT,
                                    SUM(PALET_KG) AS TOPLAM_KG  
                                    FROM 
                                    EXCEL_IMPORT ", cn1)
        CMD.CommandType = CommandType.Text
        Dim DA As New SqlDataAdapter(CMD)
        Dim DT As New DataTable
        DA.Fill(DT)

        Repeater1.DataSource = DT
        Repeater1.DataBind()
    End Sub
End Class