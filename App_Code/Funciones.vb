﻿Imports System.ComponentModel
Imports System.Data
Imports Mensaje
Imports Microsoft.VisualBasic

Public Class Funciones
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
                                  Optional DataValue As String = "Clave", Optional DataText As String = "Descrip", Optional SelCurrent As Integer = 0)
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
End Class
