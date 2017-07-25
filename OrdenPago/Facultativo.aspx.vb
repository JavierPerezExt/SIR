Imports Mensaje
Partial Class OrdenPago_Facultativo
    Inherits System.Web.UI.Page

    Private Sub btn_AddPol_Click(sender As Object, e As EventArgs) Handles btn_AddPol.Click
        Try
            Master.MuestraPolizario("gvd_Poliza",, optAjuste.SelectedValue)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Facultativo", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub optAjuste_SelectedIndexChanged(sender As Object, e As EventArgs) Handles optAjuste.SelectedIndexChanged
        Try
            Master.CancelaPolizas()
            Funciones.LlenaGrid(gvd_Poliza, Nothing)
        Catch ex As Exception
            Mensaje.MuestraMensaje("Facultativos", ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub OrdenPago_Facultativo_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
