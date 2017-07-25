
Imports System.Data


Partial Class Recordatorios_ConsultaFacultativos
    Inherits System.Web.UI.Page

    Private Sub btn_AddPol_Click(sender As Object, e As EventArgs) Handles btn_AddPol.Click
        Master.MuestraPolizario("gvd_Poliza", False, False, False, False, False)
    End Sub

    Private Sub btn_AgregarAse_Click(sender As Object, e As EventArgs) Handles btn_AgregarAse.Click
        Dim dt As New DataTable
        Dim dw As DataRow
        dt.Columns.Add("Clave")
        dt.Columns.Add("Descripcion")

        'Checa los que ya estan agregados
        If gvd_Asegurado.Rows.Count > 0 Then
            For Each row In gvd_Asegurado.Rows
                Dim Elemento = DirectCast(row.FindControl("chk_SelAse"), HiddenField)
                If Elemento.Value <> "true" Then
                    dw = dt.NewRow()
                    dw("Clave") = gvd_Asegurado.DataKeys(row.rowIndex)("Clave")
                    dw("Descripcion") = gvd_Asegurado.DataKeys(row.rowIndex)("Descripcion")
                    dt.Rows.Add(dw)
                End If
            Next
            dw = dt.NewRow()
            dw("Clave") = hidClaveAse.Value.ToString.Trim()
            dw("Descripcion") = txtSearchAse.Text.Trim()
            dt.Rows.Add(dw)
        Else
            dw = dt.NewRow()
            dw("Clave") = hidClaveAse.Value.ToString.Trim()
            dw("Descripcion") = txtSearchAse.Text.Trim()
            dt.Rows.Add(dw)
        End If
        gvd_Asegurado.DataSource = dt
        gvd_Asegurado.DataBind()

    End Sub

    Private Sub btn_Buscar_Click(sender As Object, e As EventArgs) Handles btn_Buscar.Click
        Dim FiltroBro As String = ""
        Dim FiltroCia As String = ""
        Dim FiltroPol As String = ""
        Dim FiltroRamoCont As String = ""
        Dim FiltroSiniestro As String = ""
        Dim FiltroAsegurado As String = ""
        Dim Elementos As String = ""
        Dim TipoMov As Integer
        Try

            Elementos = Funciones.ObtieneElementos(gvd_Broker, "Bro", False)
            If Elementos <> "" Then
                FiltroBro = Elementos
                Elementos = ""
            End If

            Elementos = Funciones.ObtieneElementos(gvd_Compañia, "Cia", False)
            If Elementos <> "" Then
                FiltroCia = Elementos
                Elementos = ""
            End If

            Elementos = Funciones.ObtieneElementos(gvd_Poliza, "Pol", True, True)
            If Elementos <> "" Then
                FiltroPol = Elementos
            End If

            Elementos = Funciones.ObtieneElementos(gvd_RamoContable, "RamC", False)
            If Elementos <> "" Then
                FiltroRamoCont = Elementos
            End If

            Elementos = Funciones.ObtieneElementos(gvd_Asegurado, "Ase", False)
            If Elementos <> "" Then
                FiltroAsegurado = Elementos
            End If

            If txt_NoSiniestro.Text <> "" Then
                FiltroSiniestro = txt_NoSiniestro.Text
            End If

            Dim strSQL As String
            Dim strFiltros As String
            Dim ws As New ws_Generales.GeneralesClient
            Dim wsO As New ws_Reporteador.ReporteadorClient
            strFiltros = "&FiltroBroker=" & FiltroBro
            strFiltros = strFiltros & "&FiltroCia=" & FiltroCia
            strFiltros = strFiltros & "&FiltroPol=" & Strings.Replace(FiltroPol, "'", "")
            strFiltros = strFiltros & "&FiltroRamoCont=" & FiltroRamoCont
            strFiltros = strFiltros & "&FiltroAse=" & FiltroAsegurado
            strFiltros = strFiltros & "&FiltroNoSin=" & FiltroSiniestro

            If opcFac.Checked Then
                strSQL = "Sps_mov_facul_Espe 1,'" & FiltroBro & "','" & FiltroCia & "','" & Strings.Replace(FiltroPol, "'", "") & "','" & FiltroRamoCont & "'," & FiltroSiniestro
                ws.ActualizaParametro(5, strSQL)
                wsO.InsertaVersionReporte(16, 41, 3, Master.cod_usuario, "CONSULTA FACULTATIVOS", strFiltros, "NAV", 0)
            Else
                strSQL = "Sps_mov_facul_Espe 2,'" & FiltroBro & "','" & FiltroCia & "','" & FiltroPol & "','" & FiltroRamoCont & "'," & FiltroSiniestro
                ws.ActualizaParametro(6, strSQL)
                wsO.InsertaVersionReporte(16, 41, 3, Master.cod_usuario, "CONSULTA ESPECIALES", strFiltros, "NAV", 0)
            End If



        Catch ex As Exception
            Mensaje.MuestraMensaje("", "", 1)
        End Try
    End Sub

    Private Sub btn_CancelaFac_Click(sender As Object, e As EventArgs) Handles btn_CancelaFac.Click
        Limpiar()
    End Sub
    Private Sub Limpiar()
        gvd_Asegurado.DataSource = Nothing
        gvd_Asegurado.DataBind()
        txtSearchAse.Text = ""
        txt_NoSiniestro.Text = ""
    End Sub

    Protected Sub opcFac_CheckedChanged(sender As Object, e As EventArgs)
        opcEsp.Checked = False
    End Sub
    Protected Sub opcEsp_CheckedChanged(sender As Object, e As EventArgs)
        opcFac.Checked = False
    End Sub

End Class
