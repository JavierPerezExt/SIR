Imports System.Data
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.Script.Services
Imports System.Web.Services
Imports System.Web.Services.Protocols

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")>
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<ScriptService>
Public Class ConsultaBD
    Inherits System.Web.Services.WebService

    <System.Web.Services.WebMethod>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Function ObtieneDatos(ByVal Consulta As String) As List(Of Catalogo)
        Dim sCnn As String
        Dim OcultaCampo1 As String
        Dim OcultaCampo2 As String
        Dim OcultaCampo3 As String

        Consulta = Replace(Consulta, "==", "'")

        sCnn = ConfigurationManager.ConnectionStrings("CadenaConexion").ConnectionString

        Dim da As SqlDataAdapter
        Dim dt As New DataTable

        da = New SqlDataAdapter(Consulta, sCnn)
        da.Fill(dt)

        Dim Lista = New List(Of Catalogo)

        Dim varCatalogo As Catalogo

        For Each dr In dt.Rows
            varCatalogo = New Catalogo
            OcultaCampo1 = IIf(IsDBNull(dr("OcultaCampo1")), "", dr("OcultaCampo1"))
            OcultaCampo2 = IIf(IsDBNull(dr("OcultaCampo2")), "", dr("OcultaCampo2"))
            OcultaCampo3 = IIf(IsDBNull(dr("OcultaCampo3")), "", dr("OcultaCampo3"))
            varCatalogo.Catalogo(dr("Clave"), dr("Descripcion"), OcultaCampo1, OcultaCampo2, OcultaCampo3)
            Lista.Add(varCatalogo)
        Next
        Return Lista
    End Function

    <WebMethod()>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Function GetFase(ByVal Id As Integer) As String
        Dim ws As New ws_Generales.GeneralesClient
        Dim dtResult As New DataTable
        Dim Salida As String = vbNullString
        Try
            dtResult = Funciones.Lista_A_Datatable(ws.ObtieneCatalogo("Fas", "Where id_fase=" & Id.ToString(), "").ToList)
            If Not dtResult Is Nothing Then
                Salida = dtResult.Rows(0).ItemArray(2).ToString
            End If
        Catch ex As Exception
            Salida = vbNullString
        End Try
        Return Salida
    End Function

    <WebMethod()>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Function GetDeptos(ByVal Id As Integer) As String
        Dim ws As New ws_Generales.GeneralesClient
        Dim dtResult As New DataTable
        Dim Salida As String = vbNullString
        Try
            dtResult = Funciones.Lista_A_Datatable(ws.ObtieneCatalogo("Sec", "Where cod_sector=" & Id, "").ToList)
            If Not dtResult Is Nothing Then
                Salida = dtResult.Rows(0).ItemArray(2).ToString
            End If
        Catch ex As Exception
            Salida = vbNullString
        End Try
        Return Salida
    End Function

    <WebMethod()>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Function GetAsegurado(ByVal prefix As String) As String()
        Dim ws As New ws_Generales.GeneralesClient
        Dim ArrAsegurado As New List(Of String)()
        Dim dtResult As New DataTable
        Try
            dtResult = Funciones.Lista_A_Datatable(ws.ObtieneCatalogo("Ase", prefix, "").ToList)

            For Each row In dtResult.Rows
                ArrAsegurado.Add(String.Format("{0}|{1}", row("Descripcion"), row("Clave")))
            Next

        Catch ex As Exception
            Mensaje.MuestraMensaje("", ex.Message, 2)
        End Try
        Return ArrAsegurado.ToArray()
    End Function

    <WebMethod()>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Function GetProducto(ByVal Id As Integer) As String
        Dim ws As New ws_Generales.GeneralesClient
        Dim dtResult As New DataTable
        Dim Salida As String = vbNullString
        Try
            dtResult = Funciones.Lista_A_Datatable(ws.ObtieneCatalogo("RamU", "AND cod_ramo=" & Id.ToString(), "").ToList)
            If Not dtResult Is Nothing Then
                Salida = dtResult.Rows(0).ItemArray(2).ToString
            End If
        Catch ex As Exception
            Salida = vbNullString
        End Try
        Return Salida
    End Function

    <WebMethod()>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Function GetAclaracion(ByVal id_pv As Integer) As String
        Dim ws As New ws_Generales.GeneralesClient
        Dim Salida As String = vbNullString
        Try
            Salida = ws.ObtieneAclaraciones(id_pv)
        Catch ex As Exception
            Salida = vbNullString
        End Try
        Return Salida
    End Function

End Class