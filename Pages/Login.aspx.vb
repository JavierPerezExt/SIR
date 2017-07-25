Imports Mensaje
Imports System.Data
Imports System.Data.SqlClient
Partial Class Pages_Login
    Inherits System.Web.UI.Page

    Private Function ArmaMenu(ByVal dtMenu As DataTable) As String
        Dim nivel As Integer = 0
        Dim blnBase As Boolean = False
        Dim separador As String = "<li> <img Class=""separador"" /></li>"
        ArmaMenu = "<ul id = ""menu"" >" &
                        "<li><ul><div id=""casita"">" &
                                    "<a href=""../Pages/Inicio.aspx"">" &
                                    "<img class=""home"" src=""../Images/menu_home-up.png"" width=""26"" height=""22"" border=""0"" id=""home"" onmouseout=""MM_swapImgRestore()"" onmouseover=""MM_swapImage('home','','../Images/menu_home-over.png',1)"" onmousedown=""MM_swapImage('home','','../Images/menu_home-down.png',1)""></a>" &
                                 "</div>"

        For Each row In dtMenu.Rows
            If nivel <> row("nivel") Then
                nivel = row("nivel")
                If blnBase = True Then
                    ArmaMenu = ArmaMenu & "</ul></li>"
                End If
                ArmaMenu = ArmaMenu & "</ul></li>" & separador & "<li>" & row("descripcion") & "<ul>"
                blnBase = False
            Else
                If Len(row("ubicacion")) > 0 Then
                    ArmaMenu = ArmaMenu & "<li><a href=""" & row("ubicacion") & """>" & row("descripcion") & "</a></li> "
                Else
                    If blnBase = True Then
                        ArmaMenu = ArmaMenu & "</ul></li>"
                    End If
                    ArmaMenu = ArmaMenu & "<li>" & row("descripcion") & "<ul>"
                    blnBase = True
                End If
            End If
        Next

        If blnBase = True Then
            ArmaMenu = ArmaMenu & "</ul></li>"
        End If

        ArmaMenu = ArmaMenu & "</ul></li>" & "</ul>"
    End Function

    Private Sub btn_Aceptar_Click(sender As Object, e As EventArgs) Handles btn_Aceptar.Click
        Try
            Dim ws As New ws_Generales.GeneralesClient
            Dim dtUsuario As New DataTable

            'Validadción en Active Directory
            If Funciones.AutenticaUsuario(txt_usuario.Text, txt_contraseña.Text) = True Then
                'Validadción en SII
                dtUsuario = Funciones.Lista_A_Datatable(ws.ObtieneUsuario(txt_usuario.Text).ToList)
                If dtUsuario.Rows.Count > 0 Then

                    Session.Add("Menu", ArmaMenu(Funciones.Lista_A_Datatable(ws.ObtieneMenu(dtUsuario.Rows(0)("cod_usuario"), 16).ToList)))

                    Dim authTicket As FormsAuthenticationTicket
                    authTicket = New FormsAuthenticationTicket(dtUsuario.Rows(0)("cod_usuario") & "|" & dtUsuario.Rows(0)("usuario") & "|" &
                                                               dtUsuario.Rows(0)("cod_suc") & "|" & dtUsuario.Rows(0)("sucursal") & "|" &
                                                               dtUsuario.Rows(0)("cod_sector") & "|" & dtUsuario.Rows(0)("sector") & "|" &
                                                               dtUsuario.Rows(0)("mail"), True, 60)

                    Dim encryptedTicket As String = FormsAuthentication.Encrypt(authTicket)
                    Dim authCookie As HttpCookie
                    authCookie = New HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket)

                    Response.Cookies.Add(authCookie)

                    Response.Redirect("Inicio.aspx", False)
                Else
                    Mensaje.MuestraMensaje("Login", "No cuenta con permisos para ingresar a SII", TipoMsg.Falla)
                End If
            Else
                Mensaje.MuestraMensaje("Login", "Usuario y/o Contraseña incorrectos", TipoMsg.Falla)
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Login", ex.Message, TipoMsg.Falla)
        End Try
    End Sub
End Class
