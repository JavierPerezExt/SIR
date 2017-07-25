Imports Mensaje
Imports Funciones
Imports System.Data

Partial Class Recordatorios_RecSiniestrosAdmin_
    Inherits System.Web.UI.Page

    Private Sub btn_Cancela_Click(sender As Object, e As EventArgs) Handles btn_Cancela.Click
        txt_descripcion.Text = vbNullString
        Funciones.CerrarModal("#GuardaFaseModal")
    End Sub

    Private Sub btn_Guardar_Click(sender As Object, e As EventArgs) Handles btn_Guardar.Click
        Dim ws As New ws_RecSiniestros.RecSiniestrosClient
        Dim Resultado As IList = Nothing
        Try
            If Not hid_Actual.Value = vbNullString Then
                Resultado = ws.ActualizaFaseRecup(hid_Actual.Value, txt_descripcion.Text).ToList
            Else
                Resultado = ws.InsertaFaseRecup(Trim(txt_descripcion.Text)).ToList
            End If

            Funciones.CerrarModal("#GuardaFaseModal")
            If Resultado(0) = "0" Then
                txt_descripcion.Text = vbNullString
                hid_Actual.Value = Nothing
                RefrescaGrid(gvd_Fase, "Clave", "Fas", "id_fase")
                MuestraMensaje("Aviso", "Se guardo correctamente el registro", TipoMsg.Confirma)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Nueva Fase", "Ocurrio un Error al guardar el registro", TipoMsg.Falla)
        End Try

    End Sub

    Private Sub gvd_Fase_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_Fase.RowCommand
        Dim Resultado As IList = Nothing
        Dim valor As Label = TryCast(gvd_Fase.Rows(CInt(hid_Clave.Value - 1)).FindControl("lbl_ClaveFas"), Label)
        Dim Descrip As Label = TryCast(gvd_Fase.Rows(CInt(hid_Clave.Value - 1)).FindControl("lbl_Desc"), Label)
        Dim ws As New ws_RecSiniestros.RecSiniestrosClient
        If e.CommandName = "Delete" Then


            Try
                Resultado = ws.EliminaFaseRecup(CInt(valor.Text)).ToList
                If Resultado(0) = "0" Then
                    RefrescaGrid(gvd_Fase, "Clave", "Fas", "id_fase")
                    MuestraMensaje("Fases", "El registro se eliminó satisfactoriamente", TipoMsg.Confirma)

                End If
            Catch ex As Exception
                Mensaje.MuestraMensaje("Eliminar Fase", "Ocurrio un Error al eliminar el registro", TipoMsg.Falla)
            End Try



        ElseIf e.CommandName = "Editar" Then
            txt_descripcion.Text = ""
            txt_descripcion.Text = Descrip.Text
            hid_Actual.Value = CInt(valor.Text)
            Try
                Funciones.AbrirModal("#GuardaFaseModal")
            Catch ex As Exception
                Mensaje.MuestraMensaje("Actualizar Fase", "Ocurrio un Error al actualizar el registro", TipoMsg.Falla)
            End Try

        End If
    End Sub
    Private Sub RefrescaGrid(grid As GridView, DataKey As String, Prefijo As String, CampoCondicion As String)
        Dim Condicion As String = "-1"
        For Each item In grid.Rows
            Condicion = Condicion & "," & grid.DataKeys(item.rowIndex)(DataKey)
        Next
        LlenaCatGrid(grid, Prefijo, " Where " & CampoCondicion & " in (" & Condicion & ")")
    End Sub

    Private Sub gvd_Estatus_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_Estatus.RowCommand
        Dim Resultado As IList = Nothing
        Dim valor As Label = TryCast(gvd_Estatus.Rows(CInt(hid_Clave.Value - 1)).FindControl("lbl_ClaveSts"), Label)
        Dim Descrip As Label = TryCast(gvd_Estatus.Rows(CInt(hid_Clave.Value - 1)).FindControl("lbl_Desc"), Label)
        Dim ws As New ws_RecSiniestros.RecSiniestrosClient

        If e.CommandName = "Delete" Then
            Try
                Resultado = ws.EliminaEstatusStro(valor.Text).ToList
                If Resultado(0) = "0" Then
                    RefrescaGrid(gvd_Estatus, "Clave", "Sts", "id_Estatus")
                    MuestraMensaje("Estatus", "El registro se eliminó satisfactoriamente", TipoMsg.Confirma)

                End If
            Catch ex As Exception
                Mensaje.MuestraMensaje("Eliminar Estatus", "Ocurrio un Error al eliminar el registro", TipoMsg.Falla)
            End Try

        ElseIf e.CommandName = "Editar" Then
            txtDescripSts.Text = ""
            txtDescripSts.Text = Descrip.Text
            hid_Actual.Value = CInt(valor.Text)
            Try
                LlenaCatDDL(ddl_Fase, "Fas",,,,, txtClaveFas.Text)
                Funciones.AbrirModal("#GuardaEstatusModal")

            Catch ex As Exception
                Mensaje.MuestraMensaje("Actualizar Fase", "Ocurrio un Error al actualizar el registro", TipoMsg.Falla)
            End Try

        End If

    End Sub

    Private Sub btn_NuevoEst_Click(sender As Object, e As EventArgs) Handles btn_NuevoEst.Click
        txtDescripSts.Text = ""
        Try
            LlenaCatDDL(ddl_Fase, "Fas")
            Funciones.AbrirModal("#GuardaEstatusModal")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Actualizar Fase", "Ocurrio un Error al actualizar el registro", TipoMsg.Falla)
        End Try

    End Sub
    Private Sub btn_NuevoAvU_Click(sender As Object, e As EventArgs) Handles btn_NuevoAvU.Click

        Try
            LlenaCatDDL(ddlSector, "Sec")
            ddlUsuario.Enabled = True
            LlenaCatDDL(ddlUsuario, "Usu")
            LlenaCatDDL(ddlNivel, "Niv")
            Funciones.AbrirModal("#GuardaUsuariosModal")
        Catch ex As Exception
            Mensaje.MuestraMensaje("Actualizar Usuarios", "Ocurrio un Error al actualizar el registro", TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_GuardarSts_Click(sender As Object, e As EventArgs) Handles btn_GuardarSts.Click
        Dim ws As New ws_RecSiniestros.RecSiniestrosClient
        Dim Resultado As IList = Nothing
        Try
            If Not hid_Actual.Value = vbNullString Then
                Resultado = ws.ActualizaEstatusStro(hid_Actual.Value, txtDescripSts.Text, ddl_Fase.SelectedItem.Value).ToList
            Else
                Resultado = ws.InsertaEstatusStro(Trim(txtDescripSts.Text), ddl_Fase.SelectedItem.Value).ToList
            End If

            Funciones.CerrarModal("#GuardaEstatusModal")
            If Resultado(0) = "0" Then
                txtDescripSts.Text = vbNullString
                RefrescaGrid(gvd_Estatus, "Clave", "Sts", "id_Estatus")
                hid_Actual.Value = Nothing

                MuestraMensaje("Aviso", "Se guardo correctamente el registro", TipoMsg.Confirma)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Estatus", "Ocurrio un Error al guardar el registro", TipoMsg.Falla)
        End Try

    End Sub


    Private Sub gvd_Nivel_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_Nivel.RowCommand
        Dim Resultado As IList = Nothing
        Dim valor As Label = TryCast(gvd_Nivel.Rows(CInt(hid_Clave.Value - 1)).FindControl("lbl_ClaveNiv"), Label)
        Dim Descrip As Label = TryCast(gvd_Nivel.Rows(CInt(hid_Clave.Value - 1)).FindControl("lbl_Desc"), Label)
        Dim Dias As Label = TryCast(gvd_Nivel.Rows(CInt(hid_Clave.Value - 1)).FindControl("lbl_Oculta1"), Label)
        Dim ws As New ws_RecSiniestros.RecSiniestrosClient

        If e.CommandName = "Delete" Then
            Try
                Resultado = ws.EliminaNivel(CInt(valor.Text)).ToList
                If Resultado(0) = "0" Then
                    RefrescaGrid(gvd_Nivel, "Clave", "Niv", "id_Nivel")
                    MuestraMensaje("Niveles", "El registro se eliminó satisfactoriamente", TipoMsg.Confirma)

                End If
            Catch ex As Exception
                Mensaje.MuestraMensaje("Eliminar Nivel", "Ocurrio un Error al eliminar el registro", TipoMsg.Falla)
            End Try

        ElseIf e.CommandName = "Editar" Then
            txtDescripNivel.Text = ""
            txtDescripNivel.Text = Descrip.Text
            ddlDiasTol.SelectedValue = CInt(Dias.Text)
            hid_Actual.Value = CInt(valor.Text)
            Try
                Funciones.AbrirModal("#GuardaNivelModal")
            Catch ex As Exception
                Mensaje.MuestraMensaje("Actualizar Nivel", "Ocurrio un Error al actualizar el registro", TipoMsg.Falla)
            End Try

        End If
    End Sub

    Private Sub btn_GuardarNivel_Click(sender As Object, e As EventArgs) Handles btn_GuardarNivel.Click
        Dim ws As New ws_RecSiniestros.RecSiniestrosClient
        Dim Resultado As IList = Nothing
        Try
            If Not hid_Actual.Value = vbNullString Then
                Resultado = ws.ActualizaNivel(hid_Actual.Value, txtDescripNivel.Text, ddlDiasTol.SelectedItem.Value).ToList
            Else
                Resultado = ws.InsertaNivel(Trim(txtDescripNivel.Text), ddlDiasTol.SelectedItem.Value).ToList
            End If

            Funciones.CerrarModal("#GuardaNivelModal")
            If Resultado(0) = "0" Then
                txtDescripNivel.Text = vbNullString
                hid_Actual.Value = Nothing
                RefrescaGrid(gvd_Nivel, "Clave", "Niv", "id_Nivel")
                MuestraMensaje("Aviso", "Se guardo correctamente el registro", TipoMsg.Confirma)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Niveles", "Ocurrio un Error al guardar el registro", TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btn_CancelarNivel_Click(sender As Object, e As EventArgs) Handles btn_CancelarNivel.Click
        txtDescripNivel.Text = vbNullString
        Funciones.CerrarModal("#GuardaNivelModal")
    End Sub

    Private Sub btn_CancelarSts_Click(sender As Object, e As EventArgs) Handles btn_CancelarSts.Click
        txtDescripSts.Text = vbNullString
        Funciones.CerrarModal("#GuardaEstatusModal")
    End Sub
    Private Sub btn_CancelaAvU_Click(sender As Object, e As EventArgs) Handles btn_CancelaAvU.Click
        Funciones.CerrarModal("#GuardaUsuariosModal")
    End Sub

    Private Sub gvd_Usuarios_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvd_Usuarios.RowCommand
        Dim Resultado As IList = Nothing
        Dim ClaveIdav As Label = TryCast(gvd_Usuarios.Rows(CInt(hid_Clave.Value - 1)).FindControl("lbl_Oculta3"), Label)
        Dim ClaveUsu As Label = TryCast(gvd_Usuarios.Rows(CInt(hid_Clave.Value - 1)).FindControl("lbl_ClaveAvU"), Label)
        Dim Usuario As Label = TryCast(gvd_Usuarios.Rows(CInt(hid_Clave.Value - 1)).FindControl("lbl_Desc"), Label)
        Dim Nivel As Label = TryCast(gvd_Usuarios.Rows(CInt(hid_Clave.Value - 1)).FindControl("lbl_Oculta1"), Label)
        Dim ws As New ws_RecSiniestros.RecSiniestrosClient

        If e.CommandName = "Delete" Then
            Try
                Resultado = ws.EliminaAvUsuario(CInt(ClaveIdav.Text)).ToList
                If Resultado(0) = "0" Then
                    RefrescaGrid(gvd_Usuarios, "OcultaCampo3", "AvU", "idav")
                    MuestraMensaje("Usuarios", "El registro se eliminó satisfactoriamente", TipoMsg.Confirma)
                End If
            Catch ex As Exception
                Mensaje.MuestraMensaje("Eliminar Usuario", "Ocurrio un Error al eliminar el registro", TipoMsg.Falla)
            End Try

        ElseIf e.CommandName = "Editar" Then
            LlenaCatDDL(ddlSector, "Sec")
            LlenaCatDDL(ddlUsuario, "Usu")
            LlenaCatDDL(ddlNivel, "Niv")
            ddlSector.SelectedValue = CInt(txtClaveSec.Text)
            ddlUsuario.SelectedValue = ClaveUsu.Text
            ddlUsuario.Enabled = False
            ddlNivel.SelectedValue = Nivel.Text
            hid_Actual.Value = CInt(ClaveIdav.Text)
            Try
                Funciones.AbrirModal("#GuardaUsuariosModal")
            Catch ex As Exception
                Mensaje.MuestraMensaje("Actualizar Usuario", "Ocurrio un Error al actualizar el registro", TipoMsg.Falla)
            End Try

        End If
    End Sub
    Private Sub btn_GuardarAvU_Click(sender As Object, e As EventArgs) Handles btn_GuardarAvU.Click
        Dim ws As New ws_RecSiniestros.RecSiniestrosClient
        Dim Resultado As IList = Nothing
        Try
            If Not hid_Actual.Value = vbNullString Then
                Resultado = ws.ActualizaAvUsuario(ddlUsuario.SelectedItem.Value, ddlSector.SelectedItem.Value, hid_Actual.Value, ddlNivel.SelectedItem.Value).ToList
            Else
                Resultado = ws.InsertaAvUsuario(ddlUsuario.SelectedItem.Value, ddlSector.SelectedItem.Value, ddlNivel.SelectedItem.Value).ToList
            End If

            Funciones.CerrarModal("#GuardaUsuariosModal")
            If Resultado(0) = "0" Then
                txtDescripSts.Text = vbNullString
                RefrescaGrid(gvd_Usuarios, "OcultaCampo3", "AvU", "idav")
                hid_Actual.Value = Nothing

                MuestraMensaje("Aviso", "Se guardo correctamente el registro", TipoMsg.Confirma)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Estatus", "Ocurrio un Error al guardar el registro", TipoMsg.Falla)
        End Try
    End Sub

    Private Sub gvd_Fase_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gvd_Fase.RowDeleting

    End Sub

    Private Sub gvd_Estatus_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gvd_Estatus.RowDeleting

    End Sub

    Private Sub gvd_Nivel_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gvd_Nivel.RowDeleting

    End Sub

    Private Sub gvd_Usuarios_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gvd_Usuarios.RowDeleting

    End Sub


    Protected Sub btn_Switch_Click(sender As Object, e As ImageClickEventArgs)
        If lbl_StatusJob.Text = "DESACTIVADO" Then
            btn_Switch.ImageUrl = "../Images/on2.png"
            lbl_StatusJob.Text = "ACTIVADO"
        Else
            btn_Switch.ImageUrl = "../Images/off2.png"
            lbl_StatusJob.Text = "DESACTIVADO"
        End If
    End Sub

    Private Sub Recordatorios_RecSiniestrosAdmin__Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargaHR()
        End If

    End Sub

    Private Sub CargaHR()
        Dim ws As New ws_Generales.GeneralesClient
        Try
            Dim Hr As String = ws.ObtieneParametro(1)
            Dim StatusJob As String = ws.ObtieneParametro(2)
            If StatusJob = "0" Then
                lbl_StatusJob.Text = "DESACTIVADO"
                btn_Switch.ImageUrl = "../Images/off2.png"
            Else
                lbl_StatusJob.Text = "ACTIVADO"
                btn_Switch.ImageUrl = "../Images/on2.png"
            End If

            hid_hora.Value = Hr
        Catch ex As Exception
            Mensaje.MuestraMensaje("Horario", "Ocurrio un Error al cargar el horario", TipoMsg.Falla)
        End Try

    End Sub

    Private Sub btn_GuardarHora_Click(sender As Object, e As EventArgs) Handles btn_GuardarHora.Click
        Dim hora As String = hid_hora.Value
        Dim ws As New ws_RecSiniestros.RecSiniestrosClient
        Try
            ws.ActualizaJobParam(hora, IIf(lbl_StatusJob.Text = "DESACTIVADO", 0, 1))
            MuestraMensaje("Horario", "Se guardo correctamente el horario", TipoMsg.Confirma)

        Catch ex As Exception
            Mensaje.MuestraMensaje("Estatus", "Ocurrio un Error al guardar el horario", TipoMsg.Falla)
        End Try

    End Sub
    Protected Sub txt_hora_TextChanged(sender As Object, e As EventArgs)
        hid_hora.Value = Convert.ToDateTime(txt_hora.Text).ToString("HH:mm")
    End Sub


End Class
