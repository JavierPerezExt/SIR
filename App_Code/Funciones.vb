Imports System.ComponentModel
Imports System.Data
Imports Mensaje
Imports Microsoft.VisualBasic

Public Class Funciones
    'Validación de Active Directory
    Public Shared Function AutenticaUsuario(ByVal Usuario As String, ByVal Contraseña As String) As Boolean
        Dim ws As New ws_Generales.GeneralesClient
        Return ws.IsAuthenticated("GMX.COM.MX", Usuario, Contraseña)
    End Function

    Public Shared Function EjecutaFuncion(ByVal funcion As String) As Boolean
        Dim page As Page = HttpContext.Current.CurrentHandler
        ScriptManager.RegisterClientScriptBlock(page, GetType(Page), "Funcion", funcion, True)
        Return True
    End Function


    Public Shared Function AbrirModal(ByVal modal As String) As Boolean
        Dim page As Page = HttpContext.Current.CurrentHandler
        ScriptManager.RegisterClientScriptBlock(page, GetType(Page), "Abrir", "fn_AbrirModal('" & modal & "');", True)
        Return True
    End Function

    Public Shared Function CerrarModal(ByVal modal As String) As Boolean
        Dim page As Page = HttpContext.Current.CurrentHandler
        ScriptManager.RegisterClientScriptBlock(page, GetType(Page), "Cerrar", "fn_CerrarModal('" & modal & "');", True)
        Return True
    End Function

    Public Shared Function Lista_A_Datatable(Of T)(iList As List(Of T)) As DataTable
        Dim dataTable As New DataTable()
        Dim propertyDescriptorCollection As PropertyDescriptorCollection = TypeDescriptor.GetProperties(GetType(T))
        For i As Integer = 0 To propertyDescriptorCollection.Count - 1
            Dim propertyDescriptor As PropertyDescriptor = propertyDescriptorCollection(i)
            Dim type As Type = propertyDescriptor.PropertyType

            If type.IsGenericType AndAlso type.GetGenericTypeDefinition() = GetType(Nullable(Of )) Then
                type = Nullable.GetUnderlyingType(type)
            End If

            dataTable.Columns.Add(propertyDescriptor.Name, type)
        Next
        Dim values As Object() = New Object(propertyDescriptorCollection.Count - 1) {}
        For Each iListItem As T In iList
            For i As Integer = 0 To values.Length - 1
                values(i) = propertyDescriptorCollection(i).GetValue(iListItem)
            Next
            dataTable.Rows.Add(values)
        Next
        Return dataTable
    End Function

    Public Shared Sub LlenaCatDDL(DDL As DropDownList, Prefijo As String, Optional Condicion As String = "", Optional Sel As String = "",
                                  Optional DataValue As String = "Clave", Optional DataText As String = "Descripcion", Optional SelCurrent As Integer = 0)
        Dim Resultado As New DataTable
        Try
            Dim ws As New ws_Generales.GeneralesClient
            Resultado = Funciones.Lista_A_Datatable(ws.ObtieneCatalogo(Prefijo, Condicion, Sel).ToList)
            If Not Resultado Is Nothing Then
                DDL.DataValueField = DataValue
                DDL.DataTextField = DataText
                DDL.DataSource = Resultado
                DDL.DataBind()
                If SelCurrent <> 0 Then
                    DDL.SelectedValue = SelCurrent
                End If
            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Carga DDL", "Ocurrio un Error llenar DDL", TipoMsg.Falla)
        End Try
    End Sub
    Public Shared Sub LlenaCatGrid(ByRef Grid As GridView, Prefijo As String, Optional Condicion As String = "", Optional Sel As String = "")
        Dim Resultado As IList = Nothing
        Try
            Dim ws As New ws_Generales.GeneralesClient
            Resultado = ws.ObtieneCatalogo(Prefijo, Condicion, Sel).ToList
            If Not Resultado Is Nothing Then
                Grid.DataSource = Resultado
                Grid.DataBind()

            End If
        Catch ex As Exception
            Mensaje.MuestraMensaje("Carga Grid", "Ocurrio un Error llenar Grid", TipoMsg.Falla)
        End Try
    End Sub

    Public Shared Sub LlenaGrid(ByRef gvd_Control As GridView, ByRef dtDatos As DataTable)
        gvd_Control.DataSource = dtDatos
        gvd_Control.DataBind()
    End Sub

    Public Shared Function ObtieneElementos(ByRef Gvd As GridView, ByVal Catalogo As String, ByVal blnTexto As Boolean, Optional PolxIdpv As Boolean = False) As String
        Dim strDatos As String = ""
        For Each row As GridViewRow In Gvd.Rows
            Dim Elemento = DirectCast(row.FindControl("chk_Sel" & Catalogo), HiddenField)
            If Elemento.Value <> "true" Then
                If PolxIdpv = True And Catalogo = "Pol" Then
                    strDatos = strDatos & IIf(blnTexto, ",'", ",") & DirectCast(row.FindControl("lbl_idpv"), Label).Text & IIf(blnTexto, "'", "")
                Else
                    strDatos = strDatos & IIf(blnTexto, ",'", ",") & DirectCast(row.FindControl("lbl_Clave" & Catalogo), Label).Text & IIf(blnTexto, "'", "")
                End If

            End If
        Next

        If Len(strDatos) > 0 Then
            strDatos = Mid(strDatos, 2, Len(strDatos) - 1)
        End If

        Return strDatos
    End Function

End Class
