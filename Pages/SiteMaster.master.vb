Imports System.Data
Imports Mensaje
Imports System.Data.SqlClient

Partial Class Pages_SiteMaster
    Inherits System.Web.UI.MasterPage
    Private dt_Datos As DataTable
    Private config_poliza() As String
    Private dtPolizas As DataTable
    Private DetalleUsuario() As String



    Public Property Menu() As String
        Get
            Return menu_principal.InnerHtml
        End Get
        Set(ByVal value As String)
            menu_principal.InnerHtml = value
        End Set
    End Property

    Public Property cod_usuario() As String
        Get
            Return hid_codUsuario.Value
        End Get
        Set(ByVal value As String)
            hid_codUsuario.Value = value
        End Set
    End Property

    Public Property usuario() As String
        Get
            Return lbl_Usuario.Text
        End Get
        Set(ByVal value As String)
            lbl_Usuario.Text = value
        End Set
    End Property

    Public Property cod_suc() As Integer
        Get
            Return hid_codSuc.Value
        End Get
        Set(ByVal value As Integer)
            hid_codSuc.Value = value
        End Set
    End Property

    Public Property sucursal() As String
        Get
            Return lbl_Sucursal.Text
        End Get
        Set(ByVal value As String)
            lbl_Sucursal.Text = value
        End Set
    End Property

    Public Property cod_sector() As Integer
        Get
            Return hid_codSector.Value
        End Get
        Set(ByVal value As Integer)
            hid_codSector.Value = value
        End Set
    End Property

    Public Property sector() As String
        Get
            Return lbl_Sector.Text
        End Get
        Set(ByVal value As String)
            lbl_Sector.Text = value
        End Set
    End Property

    Private Sub Pages_SiteMaster_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargaRowOculto()
            menu_principal.InnerHtml = Session("Menu")
        End If
        DetalleUsuario = Split(Context.User.Identity.Name, "|")
        If DetalleUsuario.Count > 1 Then
            hid_codUsuario.Value = DetalleUsuario(0)
            lbl_Usuario.Text = DetalleUsuario(1)
            hid_codSuc.Value = DetalleUsuario(2)
            lbl_Sucursal.Text = DetalleUsuario(3)
            hid_codSector.Value = DetalleUsuario(4)
            lbl_Sector.Text = DetalleUsuario(5)
            hid_mail.Value = DetalleUsuario(6)
        End If
    End Sub

    Private Sub CargaRowOculto()
        Dim dummy As New DataTable()
        dummy.Columns.Add("Clave")
        dummy.Columns.Add("Descripcion")

        dummy.Rows.Add()
        gvd_Catalogo.DataSource = dummy
        gvd_Catalogo.DataBind()
    End Sub

    'Evento que evalua los elementos seleccionados en el Catalogo
    Private Sub btn_Aceptar_Catalogo_Click(sender As Object, e As EventArgs) Handles btn_Aceptar_Catalogo.Click
        Try
            Dim Datos() As String
            Dim Seleccionados As String = hid_Seleccion.Value
            Dim lbl_Oculta1 As Label
            Dim lbl_Oculta2 As Label
            Dim lbl_Oculta3 As Label

            If Len(Seleccionados) > 0 Then

                Dim gvd_Control As GridView = DirectCast(cph_principal.FindControl(hid_Control.Value), GridView)

                Dim Prefijo As String = hid_Prefijo.Value
                Datos = Split(Seleccionados.Substring(0, Seleccionados.Length - 1), "|")

                If Not gvd_Control Is Nothing Then

                    dt_Datos = New DataTable
                    dt_Datos.Columns.Add("Clave")
                    dt_Datos.Columns.Add("Descripcion")
                    dt_Datos.Columns.Add("OcultaCampo1")
                    dt_Datos.Columns.Add("OcultaCampo2")
                    dt_Datos.Columns.Add("OcultaCampo3")

                    For Each row As GridViewRow In gvd_Control.Rows
                        Dim Elemento = DirectCast(row.FindControl("chk_Sel" & Prefijo), HiddenField)
                        If Elemento.Value <> "true" Then
                            Dim Fila As DataRow = dt_Datos.NewRow()
                            Fila("Clave") = DirectCast(row.FindControl("lbl_Clave" & Prefijo), Label).Text
                            Fila("Descripcion") = DirectCast(row.FindControl("lbl_Desc"), Label).Text
                            Fila("OcultaCampo1") = ""
                            Fila("OcultaCampo2") = ""
                            Fila("OcultaCampo3") = ""

                            lbl_Oculta1 = DirectCast(row.FindControl("lbl_Oculta1"), Label)
                            If Not lbl_Oculta1 Is Nothing Then
                                Fila("OcultaCampo1") = lbl_Oculta1.Text
                            End If

                            lbl_Oculta2 = DirectCast(row.FindControl("lbl_Oculta2"), Label)
                            If Not lbl_Oculta2 Is Nothing Then
                                Fila("OcultaCampo2") = lbl_Oculta2.Text
                            End If

                            lbl_Oculta3 = DirectCast(row.FindControl("lbl_Oculta3"), Label)
                            If Not lbl_Oculta3 Is Nothing Then
                                Fila("OcultaCampo3") = lbl_Oculta3.Text
                            End If

                            dt_Datos.Rows.Add(Fila)
                        End If
                    Next

                    For Each dato In Datos
                        Dim Fila As DataRow = dt_Datos.NewRow()
                        Fila("Clave") = Split(dato, "~")(0)
                        Fila("Descripcion") = Split(dato, "~")(1)
                        Fila("OcultaCampo1") = Split(dato, "~")(2)
                        Fila("OcultaCampo2") = Split(dato, "~")(3)
                        Fila("OcultaCampo3") = Split(dato, "~")(4)
                        dt_Datos.Rows.Add(Fila)
                    Next

                    gvd_Control.DataSource = dt_Datos
                    gvd_Control.DataBind()
                Else
                    If Len(hid_Control.Value) > 0 Then
                        Dim Controles() As String = Split(hid_Control.Value, "|")

                        Select Case Controles.Count
                            Case 1
                                Dim txt_Clave As TextBox = DirectCast(cph_principal.FindControl(Controles(0)), TextBox)
                                If txt_Clave Is Nothing Then
                                    txt_Clave = DirectCast(frmMaster.FindControl(Controles(0)), TextBox)
                                End If
                                txt_Clave.Text = Split(Datos(0), "~")(0)

                            Case 2
                                Dim txt_Clave As TextBox = DirectCast(cph_principal.FindControl(Controles(0)), TextBox)
                                Dim txt_Descripcion As TextBox = DirectCast(cph_principal.FindControl(Controles(1)), TextBox)
                                If txt_Clave Is Nothing And txt_Descripcion Is Nothing Then
                                    txt_Clave = DirectCast(frmMaster.FindControl(Controles(0)), TextBox)
                                    txt_Descripcion = DirectCast(frmMaster.FindControl(Controles(1)), TextBox)
                                End If

                                txt_Clave.Text = Split(Datos(0), "~")(0)
                                txt_Descripcion.Text = Split(Datos(0), "~")(1)

                            Case 3
                                Dim txt_Clave As TextBox = DirectCast(cph_principal.FindControl(Controles(0)), TextBox)
                                Dim txt_Descripcion As TextBox = DirectCast(cph_principal.FindControl(Controles(1)), TextBox)
                                Dim gvd_GridView As GridView = DirectCast(cph_principal.FindControl(Controles(2)), GridView)

                                If txt_Clave Is Nothing And txt_Descripcion Is Nothing And gvd_GridView Is Nothing Then
                                    txt_Clave = DirectCast(frmMaster.FindControl(Controles(0)), TextBox)
                                    txt_Descripcion = DirectCast(frmMaster.FindControl(Controles(1)), TextBox)
                                    gvd_GridView = DirectCast(frmMaster.FindControl(Controles(2)), GridView)
                                End If

                                txt_Clave.Text = Split(Datos(0), "~")(0)
                                txt_Descripcion.Text = Split(Datos(0), "~")(1)
                                gvd_GridView.DataSource = Nothing
                                gvd_GridView.DataBind()
                        End Select
                    End If

                End If

            Else
                Mensaje.MuestraMensaje("Catálogo", "No seleccionó ningún elemento", TipoMsg.Advertencia)
            End If

            Funciones.CerrarModal("#Catalogo")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Master Page", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Public Sub CancelaPolizas()
        Funciones.LlenaGrid(gvd_GrupoPolizas, Nothing)
        Session("dtPolizas") = Nothing
        ddl_SucursalPol.Enabled = True
        txtClaveRam.Enabled = True
        txt_NoPoliza.Enabled = True
        btn_Busca_Endoso.Visible = True
        btn_Cancela_Endoso.Visible = False
        chk_Vencidas.Enabled = True
        chk_Vencidas_CheckedChanged(Nothing, Nothing)
    End Sub

    Private Sub btn_Busca_Endoso_Click(sender As Object, e As EventArgs) Handles btn_Busca_Endoso.Click
        Try
            Dim Polizas As String = "'-1'"
            Dim dtResultado As New DataTable
            Dim ws As New ws_Generales.GeneralesClient

            Dim gvd_Control As GridView = DirectCast(cph_principal.FindControl(hid_Control_Pol.Value), GridView)
            If Not gvd_Control Is Nothing Then
                For Each row In gvd_Control.Rows
                    If DirectCast(row.FindControl("chk_SelPol"), HiddenField).Value <> "true" Then
                        Polizas = Polizas & ",'" & DirectCast(row.FindControl("lbl_ClavePol"), Label).Text & "'"
                    End If
                Next
            End If

            dtResultado = Funciones.Lista_A_Datatable(ws.ObtienePolizas(ddl_SucursalPol.SelectedValue, txtClaveRam.Text,
                                                                        txt_NoPoliza.Text, Polizas, chk_Vencidas.Checked,
                                                                        txt_FechaIni.Text, txt_FechaFin.Text,
                                                                        IIf(gvd_GrupoPolizas.Columns(6).Visible = True, 1, 0)).ToList)

            Session("dtPolizas") = dtResultado

            If dtResultado.Rows.Count > 0 Then
                Funciones.LlenaGrid(gvd_GrupoPolizas, dtResultado)
                chk_Vencidas.Enabled = False
                txt_FechaIni.Enabled = False
                txt_FechaFin.Enabled = False
                ddl_SucursalPol.Enabled = False
                txtClaveRam.Enabled = False
                txt_NoPoliza.Enabled = False
                btn_Busca_Endoso.Visible = False
                btn_Cancela_Endoso.Visible = True
                gvd_GrupoPolizas.PageIndex = 0
            Else
                Funciones.LlenaGrid(gvd_GrupoPolizas, Nothing)
                btn_Cancela_Endoso_Click(Me, Nothing)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Master Page", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Cancela_Endoso_Click(sender As Object, e As EventArgs) Handles btn_Cancela_Endoso.Click
        Try
            CancelaPolizas()
        Catch ex As Exception
            Mensaje.MuestraMensaje("Master Page", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub chk_Vencidas_CheckedChanged(sender As Object, e As EventArgs) Handles chk_Vencidas.CheckedChanged
        Try
            If chk_Vencidas.Checked = True Then
                ddl_SucursalPol.Enabled = False
                txtClaveRam.Enabled = False
                txt_NoPoliza.Enabled = False
            Else
                ddl_SucursalPol.Enabled = True
                txtClaveRam.Enabled = True
                txt_NoPoliza.Enabled = True
            End If

            If chk_Vencidas.Checked = True Then
                txt_FechaIni.Enabled = True
                txt_FechaFin.Enabled = True
            Else
                txt_FechaIni.Enabled = False
                txt_FechaFin.Enabled = False
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Master Page", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Public Sub MuestraPolizario(ByVal Control As String, Optional ByVal sn_garantias As Boolean = True,
                                Optional ByVal sn_ajuste As Boolean = True, Optional ByVal sn_aclaraciones As Boolean = True,
                                Optional ByVal sn_cobranzas As Boolean = True, Optional ByVal sn_descarta_endoso As Boolean = True)
        Funciones.LlenaCatDDL(ddl_SucursalPol, "Suc")

        hid_Control_Pol.Value = Control
        chk_Vencidas.Visible = sn_garantias
        txt_FechaIni.Visible = sn_garantias
        txt_FechaFin.Visible = sn_garantias
        lbl_fechaDe.Visible = sn_garantias
        lbl_fechaA.Visible = sn_garantias

        gvd_GrupoPolizas.Columns(6).Visible = sn_ajuste
        gvd_GrupoPolizas.Columns(7).Visible = sn_aclaraciones
        gvd_GrupoPolizas.Columns(8).Visible = sn_cobranzas
        gvd_GrupoPolizas.Columns(9).Visible = sn_descarta_endoso

        If btn_Busca_Endoso.Visible = False Then
            btn_Busca_Endoso_Click(Me, Nothing)
        End If

        Funciones.AbrirModal("#Poliza")
    End Sub

    Private Sub btn_Aceptar_Endoso_Click(sender As Object, e As EventArgs) Handles btn_Aceptar_Endoso.Click
        Try
            dt_Datos = New DataTable
            dt_Datos.Columns.Add("Clave")
            dt_Datos.Columns.Add("Descripcion")
            dt_Datos.Columns.Add("id_pv")


            Dim gvd_Control As GridView = DirectCast(cph_principal.FindControl(hid_Control_Pol.Value), GridView)

            For Each row As GridViewRow In gvd_Control.Rows
                Dim Elemento = DirectCast(row.FindControl("chk_SelPol"), HiddenField)
                If Elemento.Value <> "true" Then
                    Dim Fila As DataRow = dt_Datos.NewRow()
                    Fila("Clave") = DirectCast(row.FindControl("lbl_ClavePol"), Label).Text
                    Fila("Descripcion") = DirectCast(row.FindControl("lbl_DescripcionPol"), Label).Text
                    dt_Datos.Rows.Add(Fila)
                End If
            Next

            For Each row As GridViewRow In gvd_GrupoPolizas.Rows
                Dim NewRow As DataRow = dt_Datos.NewRow()
                Dim chk_SelPol As CheckBox = DirectCast(row.FindControl("chk_SelPol"), CheckBox)

                If chk_SelPol.Checked = True Then
                    Dim vId_pv = gvd_GrupoPolizas.DataKeys(row.RowIndex)("id_pv")
                    Dim txt_Sucursal As Label = DirectCast(row.FindControl("txt_Sucursal"), Label)
                    Dim txt_Ramo As Label = DirectCast(row.FindControl("txt_Ramo"), Label)
                    Dim txt_Poliza As Label = DirectCast(row.FindControl("txt_Poliza"), Label)
                    Dim txt_Sufijo As Label = DirectCast(row.FindControl("txt_Sufijo"), Label)
                    Dim txt_Endoso As Label = DirectCast(row.FindControl("txt_Endoso"), Label)
                    Dim txt_Ajuste As Label = DirectCast(row.FindControl("txt_Ajuste"), Label)
                    Dim lbl_GrupoEndoso As Label = DirectCast(row.FindControl("lbl_GrupoEndoso"), Label)

                    NewRow("Clave") = txt_Sucursal.Text & "-" & txt_Ramo.Text & "-" & txt_Poliza.Text & "-" &
                                      txt_Sufijo.Text & "-" & txt_Endoso.Text &
                                      IIf(gvd_GrupoPolizas.Columns(6).Visible = True, " Aj:" & txt_Ajuste.Text, "")
                    NewRow("Descripcion") = lbl_GrupoEndoso.Text
                    NewRow("id_pv") = vId_pv
                    dt_Datos.Rows.Add(NewRow)
                End If
            Next

            gvd_Control.DataSource = dt_Datos
            gvd_Control.DataBind()

            btn_Busca_Endoso_Click(Me, Nothing)

        Catch ex As Exception
            Mensaje.MuestraMensaje("Master Page", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_GrupoPolizas_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvd_GrupoPolizas.RowDataBound
        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                Dim cod_grupo_endo As Integer = sender.DataKeys(e.Row.RowIndex)("cod_grupo_endo")

                Dim txt_Sufijo As Label = TryCast(e.Row.FindControl("txt_Sufijo"), Label)
                Dim txt_Endoso As Label = TryCast(e.Row.FindControl("txt_Endoso"), Label)
                Dim lbl_Desde As Label = TryCast(e.Row.FindControl("lbl_Desde"), Label)
                Dim lbl_Hasta As Label = TryCast(e.Row.FindControl("lbl_Hasta"), Label)
                Dim lbl_GrupoEndoso As Label = TryCast(e.Row.FindControl("lbl_GrupoEndoso"), Label)
                Dim lbl_GrupoTipoEndoso As Label = TryCast(e.Row.FindControl("lbl_GrupoTipoEndoso"), Label)
                Dim lbl_PrimaEmitida As Label = TryCast(e.Row.FindControl("lbl_PrimaEmitida"), Label)
                Dim lbl_PrimaAplicada As Label = TryCast(e.Row.FindControl("lbl_PrimaAplicada"), Label)
                Dim lbl_PrimaPagada As Label = TryCast(e.Row.FindControl("lbl_PrimaPagada"), Label)
                Dim lbl_Asegurado As Label = TryCast(e.Row.FindControl("lbl_Asegurado"), Label)
                Dim lbl_Emisor As Label = TryCast(e.Row.FindControl("lbl_Emisor"), Label)
                Dim lbl_Suscriptor As Label = TryCast(e.Row.FindControl("lbl_Suscriptor"), Label)
                Dim div_Ajuste As HtmlGenericControl = TryCast(e.Row.FindControl("div_Ajuste"), HtmlGenericControl)
                Dim txt_Ajuste As Label = TryCast(e.Row.FindControl("txt_Ajuste"), Label)

                If cod_grupo_endo = 3 Or cod_grupo_endo = 15 Or cod_grupo_endo = 19 Then
                    txt_Sufijo.BackColor = Drawing.Color.Orange
                    txt_Endoso.BackColor = Drawing.Color.Orange
                    lbl_Desde.BackColor = Drawing.Color.Orange
                    lbl_Hasta.BackColor = Drawing.Color.Orange
                    lbl_GrupoEndoso.BackColor = Drawing.Color.Orange
                    lbl_GrupoTipoEndoso.BackColor = Drawing.Color.Orange
                    lbl_PrimaEmitida.BackColor = Drawing.Color.Orange
                    lbl_PrimaAplicada.BackColor = Drawing.Color.Orange
                    lbl_PrimaPagada.BackColor = Drawing.Color.Orange
                    lbl_Asegurado.BackColor = Drawing.Color.Orange
                    lbl_Emisor.BackColor = Drawing.Color.Orange
                    lbl_Suscriptor.BackColor = Drawing.Color.Orange
                    txt_Ajuste.BackColor = Drawing.Color.Orange
                ElseIf cod_grupo_endo = 1 Or cod_grupo_endo = 4 Then
                    txt_Sufijo.BackColor = Drawing.Color.LightGreen
                    txt_Endoso.BackColor = Drawing.Color.LightGreen
                    lbl_Desde.BackColor = Drawing.Color.LightGreen
                    lbl_Hasta.BackColor = Drawing.Color.LightGreen
                    lbl_GrupoEndoso.BackColor = Drawing.Color.LightGreen
                    lbl_GrupoTipoEndoso.BackColor = Drawing.Color.LightGreen
                    lbl_PrimaEmitida.BackColor = Drawing.Color.LightGreen
                    lbl_PrimaAplicada.BackColor = Drawing.Color.LightGreen
                    lbl_PrimaPagada.BackColor = Drawing.Color.LightGreen
                    lbl_Asegurado.BackColor = Drawing.Color.LightGreen
                    lbl_Emisor.BackColor = Drawing.Color.LightGreen
                    lbl_Suscriptor.BackColor = Drawing.Color.LightGreen
                    txt_Ajuste.BackColor = Drawing.Color.LightGreen
                End If
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Master Page", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_GrupoPolizas_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gvd_GrupoPolizas.PageIndexChanging
        Try
            Dim myRow() As Data.DataRow

            dtPolizas = New DataTable
            dtPolizas = Session("dtPolizas")
            For Each Row In gvd_GrupoPolizas.Rows
                Dim chk_SelPol As CheckBox = DirectCast(Row.FindControl("chk_SelPol"), CheckBox)
                Dim chk_NoPago As CheckBox = DirectCast(Row.FindControl("chk_NoPago"), CheckBox)
                Dim id_pv As Integer = gvd_GrupoPolizas.DataKeys(Row.RowIndex)("id_pv")

                myRow = dtPolizas.Select("id_pv ='" & id_pv & "'")
                myRow(0)("tSEL_Val") = chk_SelPol.Checked
                myRow(0)("sn_NoPago") = chk_NoPago.Checked
            Next

            gvd_GrupoPolizas.PageIndex = e.NewPageIndex
            gvd_GrupoPolizas.DataSource = dtPolizas
            gvd_GrupoPolizas.DataBind()
        Catch ex As Exception
            Mensaje.MuestraMensaje("Master Page", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_GrupoPolizas_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_GrupoPolizas.RowCommand
        Try
            If e.CommandName.Equals("Cobranzas") Then
                Dim Index As Integer = e.CommandSource.NamingContainer.RowIndex
                Dim id_pv As Integer = gvd_GrupoPolizas.DataKeys(Index)("id_pv")

                Dim cod_suc As Integer = gvd_GrupoPolizas.DataKeys(Index)("cod_suc")
                Dim cod_ramo As Integer = gvd_GrupoPolizas.DataKeys(Index)("cod_ramo")
                Dim nro_pol As Integer = gvd_GrupoPolizas.DataKeys(Index)("nro_pol")
                Dim aaaa_endoso As Integer = gvd_GrupoPolizas.DataKeys(Index)("aaaa_endoso")
                Dim nro_endoso As Integer = gvd_GrupoPolizas.DataKeys(Index)("nro_endoso")

                DetalleCobranzas(id_pv, cod_suc & "-" & cod_ramo & "-" & nro_pol & "-" & aaaa_endoso, nro_endoso)

                Funciones.AbrirModal("#CobranzasModal")
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Master Page", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub DetalleCobranzas(ByVal id_pv As Integer, ByVal Poliza As String, ByVal nro_endoso As Integer)
        Dim ws As New ws_Generales.GeneralesClient

        hid_Poliza.Value = Poliza

        lbl_PolizaCobranzas.Text = "Detalle Cobranzas >> " & Poliza & "-"

        ddl_Endoso.DataValueField = "id_pv"
        ddl_Endoso.DataTextField = "nro_endoso"

        ddl_Endoso.DataSource = ws.ObtieneEndosos("'" & Poliza & "'", "")
        ddl_Endoso.DataBind()
        ddl_Endoso.SelectedValue = id_pv

        gvd_Pagadores.DataSource = ws.ObtienePagador(id_pv)
        gvd_Pagadores.DataBind()

        Dim cod_aseg As Integer = gvd_Pagadores.DataKeys(0)("cod_aseg")
        Dim ind_pagador As Integer = gvd_Pagadores.DataKeys(0)("cod_ind_pagador")

        lbl_DetPagador.Text = "Cuotas Pagador >> " & cod_aseg
        gvd_PagadorCuota.DataSource = ws.ObtienePagadorCuotas(id_pv, ind_pagador, cod_aseg)
        gvd_PagadorCuota.DataBind()

        Dim nro_cuota As Integer = gvd_PagadorCuota.DataKeys(0)("nro_cuota")

        lbl_DetCuota.Text = "Pagos Cuota >> " & nro_cuota
        gvd_DetCuotaPagador.DataSource = ws.ObtieneDetallePagoCuota(id_pv, cod_aseg, ind_pagador, nro_cuota)
        gvd_DetCuotaPagador.DataBind()
    End Sub

    Private Sub gvd_Pagadores_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_Pagadores.RowCommand
        Try
            If e.CommandName.Equals("DetallePagador") Then
                Dim ws As New ws_Generales.GeneralesClient

                Dim Index As Integer = e.CommandSource.NamingContainer.RowIndex
                Dim id_pv As Integer = gvd_Pagadores.DataKeys(Index)("id_pv")
                Dim cod_aseg As Integer = gvd_Pagadores.DataKeys(Index)("cod_aseg")
                Dim ind_pagador As Integer = gvd_Pagadores.DataKeys(Index)("cod_ind_pagador")

                lbl_DetPagador.Text = "Cuotas Pagador >> " & cod_aseg
                gvd_PagadorCuota.DataSource = ws.ObtienePagadorCuotas(id_pv, ind_pagador, cod_aseg)
                gvd_PagadorCuota.DataBind()

                Dim nro_cuota As Integer = gvd_PagadorCuota.DataKeys(0)("nro_cuota")

                lbl_DetCuota.Text = "Pagos Cuota >> " & nro_cuota
                gvd_DetCuotaPagador.DataSource = ws.ObtieneDetallePagoCuota(id_pv, cod_aseg, ind_pagador, nro_cuota)
                gvd_DetCuotaPagador.DataBind()

            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Master Page", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_PagadorCuota_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_PagadorCuota.RowCommand
        Try
            If e.CommandName.Equals("DetalleCuotaPagador") Then
                Dim ws As New ws_Generales.GeneralesClient

                Dim Index As Integer = e.CommandSource.NamingContainer.RowIndex

                Dim id_pv As Integer = gvd_PagadorCuota.DataKeys(Index)("id_pv")
                Dim cod_aseg As Integer = gvd_PagadorCuota.DataKeys(Index)("cod_aseg")
                Dim ind_pagador As Integer = gvd_PagadorCuota.DataKeys(Index)("cod_ind_pagador")
                Dim nro_cuota As Integer = gvd_PagadorCuota.DataKeys(Index)("nro_cuota")

                lbl_DetCuota.Text = "Pagos Cuota >> " & nro_cuota
                gvd_DetCuotaPagador.DataSource = ws.ObtieneDetallePagoCuota(id_pv, cod_aseg, ind_pagador, nro_cuota)
                gvd_DetCuotaPagador.DataBind()
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Master Page", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub ddl_Endoso_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_Endoso.SelectedIndexChanged
        Try
            DetalleCobranzas(ddl_Endoso.SelectedValue, hid_Poliza.Value, ddl_Endoso.Text)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Master Page", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Protected Sub chk_NoPago_CheckedChanged(sender As Object, e As EventArgs)
        Try
            Dim ws As New ws_OrdenPago.OrdenPagoClient

            Dim gr As GridViewRow = DirectCast(DirectCast(DirectCast(sender, CheckBox).Parent, DataControlFieldCell).Parent, GridViewRow)
            Dim id_pv As Integer = gvd_GrupoPolizas.DataKeys(gr.RowIndex)("id_pv")

            If sender.checked = True Then
                ws.InsertaPolNoPago(id_pv, "")
            Else
                ws.EliminaPolNoPago(id_pv)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Master Page", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub lnk_CerrarSesion_Click(sender As Object, e As EventArgs) Handles lnk_CerrarSesion.Click
        Try
            FormsAuthentication.SignOut()
            Response.Redirect("Pages/Login.aspx")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Master Page", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_Autorizar_Click(sender As Object, e As EventArgs) Handles btn_Autorizar.Click
        Try
            If Funciones.AutenticaUsuario(txt_usuario.Text, txt_contraseña.Text) = True Then
                Funciones.EjecutaFuncion("fn_Repuesta_Autoriza();")
            Else
                Mensaje.MuestraMensaje("Master Page", "Usuario y/o Contraseña incorrecto(s)", TipoMsg.Falla)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Master Page", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
End Class

