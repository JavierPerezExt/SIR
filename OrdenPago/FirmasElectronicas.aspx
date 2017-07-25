<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="FirmasElectronicas.aspx.vb" Inherits="OrdenPago_FirmasElectronicas" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <script src="../Scripts/FirmasElectronicas.js"></script>
    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|0|0|1|" />
    
    <div style="width:1000px; min-width:1000px; overflow-x:hidden">
        <div class="cuadro-titulo panel-encabezado">
            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana0" class="contraer"  />
            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana0" class="expandir"  />
            Filtros
        </div>

        <div class="panel-contenido ventana0" >
            <asp:UpdatePanel runat="server" ID="upFiltros">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-6">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Orden Pago</asp:label>
                            <asp:TextBox runat="server" ID="txt_NroOP" CssClass="estandar-control nro_pol Centro" Width="110px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="clear padding5"></div>

                    <div class="row">
                        <div class="col-md-3">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Moneda</asp:label>
                            <asp:DropDownList runat="server" ID="ddl_Moneda" CssClass="estandar-control" Width="110px" ></asp:DropDownList>
                        </div>
                        <div class="col-md-3">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="85px">Asegurado</asp:label>
                            <asp:HiddenField runat="server" ID="hidClaveAse" Value="" />
                            <asp:textbox runat="server" ID="txtSearchAse" CssClass="estandar-control" Width="130px" ></asp:textbox>
                        </div>

                        <div class="col-md-3">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Fecha Genera</asp:label>
                            <asp:TextBox runat="server" ID="txtFecGeneraDe" CssClass="estandar-control Fecha Centro" Width="110px" ></asp:TextBox>
                        </div>
                        <div class="col-sm-1">
                            <asp:label runat="server" class="etiqueta-control">A</asp:label>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox runat="server" ID="txtFecGeneraA" CssClass="estandar-control Fecha Centro" Width="110px" ></asp:TextBox>
                        </div>
                    </div>

                    <div class="clear padding5"></div>

                    <div class="row">
                        <div class="col-md-3">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Monto</asp:label>
                            <asp:TextBox runat="server" ID="txt_MontoDe" CssClass="estandar-control Monto Derecha" Width="110px" ></asp:TextBox>
                        </div>
                        <div class="col-sm-1">
                            <asp:label runat="server" class="etiqueta-control">A</asp:label>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox runat="server" ID="txt_MontoA" CssClass="estandar-control Monto Derecha" Width="130px" ></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Fecha Pago</asp:label>
                            <asp:TextBox runat="server" ID="txtFecPagoDe" CssClass="estandar-control Fecha Centro" Width="110px" ></asp:TextBox>
                        </div>
                        <div class="col-sm-1">
                            <asp:label runat="server" class="etiqueta-control">A</asp:label>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox runat="server" ID="txtFecPagoA" CssClass="estandar-control Fecha Centro" Width="110px" ></asp:TextBox>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            <div class="clear padding5"></div>

            <div class="row">
                <div class="col-md-6">
                    <div class="cuadro-subtitulo">
                        Usuario Solicitante
                    </div>
                    <div class="panel-subcontenido">
                        <asp:UpdatePanel runat="server" ID="upSolicitante">
                           <ContentTemplate>
                               <asp:Panel runat="server" ID="pnlUsuario" Width="100%" Height="100px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Usuario" AutoGenerateColumns="false" 
                                                   CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                   GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelUsu" value="false"/>
                                                </ItemTemplate>
                                            </asp:TemplateField >
                                            <asp:TemplateField HeaderText="Clave">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_ClaveUsu" Text='<%# Eval("Clave") %>' Width="100px" ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Descripción">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="310px"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:imagebutton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Delete" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                               </asp:Panel>
                               <div style="width:100%;  text-align:right">
                                    <asp:LinkButton id="btn_AddUsuario" runat="server" class="btn botones AgregaUsuario" data-toggle="modal" data-target="#EsperaModal">
                                        <span>
                                            <img class="btn-añadir"/>
                                            Añadir
                                        </span>
                                    </asp:LinkButton>
                                </div>
                           </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="cuadro-subtitulo">
                        Estatus Orden Pago
                    </div>
                    <div class="panel-subcontenido">
                        <asp:UpdatePanel runat="server" ID="upEstatus">
                           <ContentTemplate>
                               <asp:Panel runat="server" ID="pnlEstatus" Width="100%" Height="100px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Estatus" AutoGenerateColumns="false" 
                                                  CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                  GridLines ="Horizontal"  ShowHeaderWhenEmpty="true" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelEst" value="false"/>
                                                </ItemTemplate>
                                            </asp:TemplateField >
                                            <asp:TemplateField HeaderText="Clave">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_ClaveEst" Text='<%# Eval("Clave") %>' Width="60px" Font-Size="10px" ></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Descripción">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="350px" Font-Size="10px"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:imagebutton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Delete" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                               </asp:Panel>
                               <div style="width:100%;  text-align:right">
                                    <asp:LinkButton id="btn_AddEstatus" runat="server" class="btn botones AgregaEstatus" data-toggle="modal" data-target="#EsperaModal">
                                        <span>
                                            <img class="btn-añadir"/>
                                            Añadir
                                        </span>
                                    </asp:LinkButton>
                                </div>
                           </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div class="clear padding5"></div>
            <div class="row">
                <div class="col-md-6">
                    <div class="cuadro-subtitulo">
                        Broker
                    </div>
                    <div class="panel-subcontenido">
                            <asp:UpdatePanel runat="server" ID="upBroker">
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnlBroker" Width="100%" Height="100px" ScrollBars="Both">
                                            <asp:GridView runat="server" ID="gvd_Broker" AutoGenerateColumns="false" 
                                                            CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                            GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                                <Columns>
                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="chk_SelBro" value="false"/>
                                                        </ItemTemplate>
                                                    </asp:TemplateField >
                                                    <asp:TemplateField HeaderText="Clave">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_ClaveBro" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Descripción">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="360px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:imagebutton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Delete" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                        <div style="width:100%;  text-align:right">
                                            <asp:LinkButton id="btn_AddBroker" runat="server" class="btn botones AgregaBroker" data-toggle="modal" data-target="#EsperaModal">
                                                <span>
                                                    <img class="btn-añadir"/>
                                                    Añadir
                                                </span>
                                            </asp:LinkButton>
                                        </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="cuadro-subtitulo">
                        Reasegurador
                    </div>
                    <div class="panel-subcontenido">
                            <asp:UpdatePanel runat="server" ID="upCompañia">
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnlCompañia" Width="100%" Height="100px" ScrollBars="Both">
                                            <asp:GridView runat="server" ID="gvd_Compañia" AutoGenerateColumns="false" 
                                                            CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                            GridLines="Horizontal"  ShowHeaderWhenEmpty="true">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="" ItemStyle-CssClass="SelCia">
                                                        <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="chk_SelCia" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Clave" ItemStyle-CssClass="ClaveCia">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_ClaveCia" Text='<%# Eval("Clave") %>' Width="50px" ></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="DescripcionCia">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="360px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:imagebutton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Delete" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                        <div style="width:100%;  text-align:right">
                                            <asp:LinkButton id="btn_AddCia" runat="server" class="btn botones AgregaCia" data-toggle="modal" data-target="#EsperaModal">
                                                <span>
                                                    <img class="btn-añadir"/>
                                                    Añadir
                                                </span>
                                            </asp:LinkButton>
                                        </div>
                                </ContentTemplate>
                            </asp:UpdatePanel> 
                    </div>
                </div>
            </div>
            <div class="clear padding5"></div>
            <div class="row">
                <div class="col-md-6">
                    <div class="cuadro-subtitulo">
                        Póliza
                    </div>
                    <div class="panel-subcontenido">
                            <asp:UpdatePanel runat="server" ID="upPoliza">
                                <ContentTemplate>
                                    <asp:HiddenField runat="server" ID="hid_HTML" Value="" />
                                    <div class="clear padding5"></div>

                                    <asp:Panel runat="server" ID="pnlPoliza" Width="100%" Height="100px" ScrollBars="Both">
                                            <asp:GridView runat="server" ID="gvd_Poliza" AutoGenerateColumns="false" 
                                                            CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                            GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                                <Columns>
                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="chk_SelPol" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Clave">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbl_ClavePol" Text='<%# Eval("Clave") %>' Width="100px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Grupo Endoso">
                                                        <ItemTemplate>
                                                            <asp:label runat="server" ID="lbl_DescripcionPol" Enabled="false" Text='<%# Eval("Descripcion")   %>' Width="310px"></asp:label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:imagebutton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Delete" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                        <div style="width:100%;  text-align:right">
                                            <asp:LinkButton id="btn_AddPol" runat="server" class="btn botones">
                                                <span>
                                                    <img class="btn-añadir"/>
                                                    Añadir
                                                </span>
                                            </asp:LinkButton>
                                        </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>       
                    </div>   
                </div>
                <div class="col-md-6">
                    <div class="cuadro-subtitulo">
                        Ramo Contable
                    </div>
                    <div class="panel-subcontenido">
                            <asp:UpdatePanel runat="server" ID="upRamoContable">
                            <ContentTemplate>
                                    <asp:Panel runat="server" ID="pn_RamoContable" Width="100%" Height="100px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_RamoContable" AutoGenerateColumns="false" 
                                                    CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                    GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelRamC" value="false"/>
                                                </ItemTemplate>
                                            </asp:TemplateField >
                                            <asp:TemplateField HeaderText="Clave">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_ClaveRamC" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Descripción">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="360px"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:imagebutton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Delete" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                                <div style="width:100%;  text-align:right">
                                    <asp:LinkButton id="btn_AddRamoContable" runat="server" class="btn botones AgregaRamoCont" data-toggle="modal" data-target="#EsperaModal">
                                        <span>
                                            <img class="btn-añadir"/>
                                            Añadir
                                        </span>
                                    </asp:LinkButton>
                                </div>
                            </ContentTemplate>
                            </asp:UpdatePanel>
                    </div>
                </div>
            </div>

            <div class="clear padding5"></div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="cuadro-subtitulo">
                        Naturaleza de Orden de Pago
                    </div>
                    <div class="panel-subcontenido">
                        <asp:UpdatePanel ID="upNaturaleza" runat="server">
                            <ContentTemplate>

                                <div class="col-md-4">
                                    <asp:CheckBox runat="server" ID="chk_Devolucion" Text="Devolución de Impuestos a Reasegurador" CssClass="etiqueta-control" />
                                </div>
                                <div class="col-md-4">
                                    <asp:CheckBox runat="server" ID="chk_ConISR" Text="Con Retención de Impuestos a Reasegurador" CssClass="etiqueta-control" />
                                </div>
                                <div class="col-md-4">
                                    <asp:CheckBox runat="server" ID="chk_SinISR" Text="Sin Retención de Impuestos a Reasegurador" CssClass="etiqueta-control" />
                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>

            <div class="clear padding5"></div>

            <div class="row">
                <asp:UpdatePanel ID="up_Firmas" runat="server">
                    <ContentTemplate>
                        <div class="col-md-12">
                            <div class="cuadro-subtitulo">
                                <asp:CheckBox runat="server" ID="chk_Firmas" AutoPostBack="true"  Text="Firmas Electrónicas" CssClass="etiqueta-control" />
                            </div>
                            <div class="panel-subcontenido">

                                    <div class="col-md-2">
                                        <asp:CheckBox runat="server" ID="chk_Solicitante" Enabled="false"  Text="Solicitante" CssClass="etiqueta-control" />
                                    </div>
                                    <div class="col-md-3">
                                        <asp:CheckBox runat="server" ID="chk_JefeDirecto" Enabled="false"  Text="Jefe Directo" CssClass="etiqueta-control" />
                                    </div>
                                    <div class="col-md-3">
                                        <asp:CheckBox runat="server" ID="chk_Director" Enabled="false"  Text="Director de Area" CssClass="etiqueta-control" />
                                    </div>
                                    <div class="col-md-2">
                                        <asp:CheckBox runat="server" ID="chk_SubDirector" Enabled="false"  Text="SubDirector" CssClass="etiqueta-control" />
                                    </div>
                                    <div class="col-md-2">
                                        <asp:CheckBox runat="server" ID="chk_Contabilidad" Enabled="false"   Text="Contabilidad" CssClass="etiqueta-control" />
                                    </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>


        <div class="clear padding5"></div>

        <div style="width:100%; text-align:right; border-top-style:inset; border-width:1px; border-color:#003A5D">
            <asp:UpdatePanel runat="server" ID="upBusqueda">
                <ContentTemplate>
                    <asp:LinkButton id="btn_BuscaOP" runat="server" class="btn botones">
                        <span>
                            <img class="btn-buscar"/>
                            Orden
                        </span>
                    </asp:LinkButton>

                    <asp:LinkButton id="btn_Limpiar" runat="server" class="btn botones">
                        <span>
                            <img class="btn-cancelar"/>
                            Limpiar
                        </span>
                    </asp:LinkButton>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div class="clear padding5"></div>

        <div class="cuadro-titulo panel-encabezado">
            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana1" class="contraer"  />
            <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana1" class="expandir"  />
            Listado Ordenes de Pago
        </div>
        <div class="panel-contenido ventana1" >
            <asp:UpdatePanel runat="server" ID="upOrdenes">
              <ContentTemplate>
                    <asp:Panel runat="server" id="pnlOrdenP" width="100%">
                        <asp:GridView runat="server" ID="gvd_LstOrdenPago" AutoGenerateColumns="false"  ShowHeader="false"
                                      CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                      GridLines="Horizontal"  ShowHeaderWhenEmpty="true" AllowPaging="true" PageSize="10" 
                                      DataKeyNames="nro_op,fec_estim_pago,SucEmision,cod_sector,Sector,
                                                    Moneda,imp_cambio,Monto,Impuesto,
                                                    id_imputacion,nro_recibo,fec_baja,txt_cheque_a_nom,
                                                    Solicitante,Tesoreria,Contabilidad,Baja,cod_concepto_anulacion,
                                                    id_cuenta_bancaria,nro_cuenta_transferencia,cod_banco_transferencia,Banco,
                                                    fec_generacion,fec_autoriz_sector,fec_autoriz_contab,fec_pago,
                                                    cod_estatus_op,estatus,Texto,sn_devolucion,sn_Solicita,sn_Solicita_Aux,
                                                    cod_usuario_solicita,sn_JefeDirecto,sn_JefeDirecto_Aux,cod_usuario_jefe,sn_DireccionArea,
                                                    sn_DireccionArea_Aux,cod_usuario_director,sn_SubDirector,sn_Subdirector_Aux,cod_usuario_subdir,
                                                    sn_Contabilidad,sn_Contabilidad_Aux,cod_usuario_contabilidad,GeneraOp_Solicitante,
                                                    Autoriza_JefeInmediato,Autoriza_DirArea,Autoriza_Subdirector,Autoriza_Conta,PathFirma,id_pv">
                            <Columns>
                                <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                            <asp:CheckBox runat="server"  Width="0px" ID="chk_SelOp" Checked='<%# Eval("tSEl_Val") %>' Visible="false" />
                                    </ItemTemplate>
                                </asp:TemplateField >
                                <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                            <asp:CheckBox runat="server" Width="20px" ID="chk_Impresion" Checked='<%# Eval("sn_impresion") %>'/>
                                            <asp:Image runat="server" ID="imgPrint" ImageUrl="../Images/icono-impresion_mini.png" ToolTip="Selecciona para Imprimir OP" />
                                    </ItemTemplate>
                                </asp:TemplateField >
                                <asp:TemplateField HeaderText="Nro Op">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server"  CommandName="OrdenPago" ID="lbl_OrdenPago" Text='<%# Eval("nro_op")%>' Font-Size="12px" Font-Bold="true" Width="45px" CssClass="OrdenPago Centro"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                            
                                <asp:TemplateField HeaderText="" >
                                    <ItemTemplate>      
                                        <div class="cuadro-subtitulo-grid">
                                            FIRMAS
                                        </div>                                                                                
                                        <div id="div_Firmas" style="text-align:left;height:180px; width:200px" runat="server" class="masterTooltip">
                                            <asp:CheckBox runat="server" Text=" Solicitante"  Width="130px"  ID="chk_FirmaSol" Checked='<%# Eval("sn_Solicita") %>' Enabled='<%# Eval("GeneraOp_Solicitante") %>' OnCheckedChanged="chk_FirmaSol_CheckedChanged" AutoPostBack="true"/>
                                            <asp:CheckBox runat="server" Text=" Jefe Inmediato" Width="130px"  ID="chk_FirmaJefe" Checked='<%# Eval("sn_JefeDirecto") %>' Enabled='<%# Eval("Autoriza_JefeInmediato") %>' OnCheckedChanged="chk_FirmaJefe_CheckedChanged" AutoPostBack =" true"/>
                                            <asp:LinkButton runat="server" ID="lnk_SelJefe" Text="Cambiar"  Width="10px"  OnClick="lnk_SelJefe_Click"></asp:LinkButton>
                                            <asp:CheckBox runat="server" Text=" Director Area" Width="130px" ID="chk_FirmaDir" Checked='<%# Eval("sn_DireccionArea") %>' Enabled='<%# Eval("Autoriza_DirArea") %>' OnCheckedChanged="chk_FirmaDir_CheckedChanged" AutoPostBack="true" />
                                            <asp:LinkButton runat="server" ID="lnk_SelDir" Text="Cambiar" Width="10px"  OnClick="lnk_SelDir_Click"></asp:LinkButton>
                                            <asp:CheckBox runat="server" Text=" SubDirección" Width="130px"  ID="chk_SubDir" Checked='<%# Eval("sn_Subdirector") %>' Enabled='<%# Eval("Autoriza_Subdirector") %>' OnCheckedChanged="chk_SubDir_CheckedChanged" AutoPostBack="true" />
                                            <asp:LinkButton runat="server" ID="lnk_SelSubDir" Text="Cambiar" Width="10px"  OnClick="lnk_SelSubDir_Click"></asp:LinkButton>
                                            <asp:CheckBox runat="server" Text=" Contabilidad" Width="130px"  ID="chk_FirmaCon" Checked='<%# Eval("sn_Contabilidad") %>' Enabled='<%# Eval("Autoriza_Conta") %>' OnCheckedChanged="chk_FirmaCon_CheckedChanged" AutoPostBack="true"/>
                                            <asp:LinkButton runat="server" ID="lnk_SelConta" Text="Cambiar"  Width="10px"  OnClick="lnk_SelConta_Click"></asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <div class="cuadro-subtitulo-grid">
                                            DETALLE
                                        </div>
                                                                                               
                                        <div id="div_Detalle" style="text-align:left;height:180px;width:700px" runat="server" class="masterTooltip" >
                                            <asp:Label runat="server" CssClass="col-md-1" Width="120px" Text="Asegurado:" Font-Bold="true"></asp:Label>
                                            <asp:Label runat="server" ID="lbl_Asegurado" Text='<%# Eval("Asegurado")%>' Width="530px"></asp:Label>

                                            <div class="clear padding5"></div>

                                            <asp:Label runat="server" CssClass="col-md-1" Width="120px" Text="Ramos Contables:" Font-Bold="true"></asp:Label>
                                            <asp:DropDownList ID="ddl_RamosContables"  Width="480px" runat="server" CssClass="estandar-control-grid"></asp:DropDownList>
                                            <asp:Label ID="lbl_RamosContables" Text='<%# DataBinder.Eval(Container.DataItem, "Ramos") %>' Visible="false" runat="server"/>
                                            
                                            <div class="clear padding5"></div>
                                            
                                            <asp:Label runat="server" CssClass="col-md-1" Width="120px" Text="Broker/Compañia:" Font-Bold="true"></asp:Label>
                                            <asp:Label runat="server" ID="lbl_BroCia" Text='<%# Eval("txt_otros") %>' Width="530px" ></asp:Label>
                                            
                                            <div class="clear padding5"></div>

                                            <asp:Label runat="server" CssClass="col-md-1" Width="120px" Text="Moneda:" Font-Bold="true"></asp:Label>
                                            <asp:Label runat="server" ID="lbl_Moneda" Text='<%# Eval("Moneda") %>' Width="110px"  ></asp:Label>

                                            <asp:Label runat="server" Width="100px" Text="Monto:" Font-Bold="true"></asp:Label>
                                            <asp:Label runat="server" ID="lbl_Monto" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("Monto")))  %>' Width="110px"></asp:Label>

                                           
                                            <asp:Label runat="server"  Width="100px" Text="Impuesto:" Font-Bold="true"></asp:Label>
                                            <asp:Label runat="server" ID="lbl_Impuesto" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("Impuesto")))  %>' Width="110px"></asp:Label>

                                           
                                            <div class="clear padding5"></div>
                                            
                                           
                                            <asp:Label runat="server" CssClass="col-md-1" Width="120px" Text="Fecha Generación:" Font-Bold="true"></asp:Label>
                                            <asp:Label runat="server" ID="lbl_FechaGenera" Text='<%# Eval("fec_generacion") %>' Width="110px"></asp:Label>

                                            <asp:Label runat="server" Width="100px" Text="Fecha de Pago:" Font-Bold="true"></asp:Label>
                                            <asp:Label runat="server" ID="lbl_FechaPago" Text='<%# Eval("Fec_Pago") %>' Width="110px"></asp:Label>

                                            <asp:Label runat="server" Width="100px" Text="Fecha Baja:" Font-Bold="true"></asp:Label>
                                            <asp:Label runat="server" ID="lbl_FechaBaja" Text='<%# Eval("Fec_Baja") %>' Width="110px"></asp:Label>

                                            <div class="clear padding5"></div>

                                            <asp:Label runat="server" Width="120px" CssClass="col-md-1" Text="Estatus:" Font-Bold="true"></asp:Label>
                                            <asp:Label runat="server" ID="lbl_Estatus" Text='<%# Eval("estatus") %>' Width="200px"></asp:Label>

                                            <div class="clear padding5"></div>

                                            <asp:Label runat="server" CssClass="col-md-1" Width="120px" Text="Descripción:" Font-Bold="true"></asp:Label>
                                            <div style="width:550px;height:55px;overflow-y:scroll;overflow-x:hidden;">
                                                <asp:label ID="lbl_Detalle" Text='<%# Eval("Texto") %>' Width="550px" runat="server"></asp:label>
                                            </div>
                                            

                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle CssClass="pager" />
                            <PagerSettings Mode="NumericFirstLast" FirstPageText="Primero" LastPageText="Ultimo" />
                        </asp:GridView>
                    </asp:Panel>
              </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div style="width:100%; text-align:right; border-top-style:inset; border-width:1px; border-color:#003A5D">
            <asp:UpdatePanel runat="server" ID="upFirma">
                <ContentTemplate>
                    <asp:LinkButton id="btn_Imprimir" runat="server" class="btn botones">
                        <span>
                            <img class="btn-imprimir"/>
                            Imprimir
                        </span>
                    </asp:LinkButton>

                    <asp:LinkButton id="btn_Firmar" runat="server" class="btn botones Autorizacion">
                        <span>
                            <img class="btn-modificar"/>
                            Firmar
                        </span>
                    </asp:LinkButton>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div id="Destinatario" style="width:350px; height:160px"  class="modal-catalogo">
        <asp:UpdatePanel runat="server" ID="upAutoriza" >
         <ContentTemplate>
             <div class="cuadro-titulo" style="height:30px">
                <button type="button" class="close"  data-dismiss="modal">&times;</button>
                <div class="titulo-modal"><label>CAMBIAR DESTINATARIO</label></div>
             </div>

             <div class="panel-body" style="height:130px; ">
                 <div class="row">
                    <div class="col-sm-12">
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="270px">El destinatario predeterminado es: </asp:label>
                            <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="270px" ID="lblDestinatario" Text=""></asp:Label>
                            <asp:HiddenField runat="server" ID="hid_Persona" Value="" />
                            <div class="clear padding10"></div>
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Destinatario: </asp:label>
                            <asp:DropDownList ID="ddl_Destinatario"  Height="25px" Width="205px" CssClass="estandar-control" runat="server"></asp:DropDownList>
                    </div>
                 </div>
                
                 <div class="clear padding10"></div> 

                 <div style="width:100%; text-align:right; padding-right:10px; ">
                    <asp:LinkButton id="btnCambia" runat="server" class="btn botones">
                        <span>
                            <img class="btn-modificar"/>
                            Cambiar
                        </span>
                    </asp:LinkButton>

                    <asp:LinkButton id="btnCancela" runat="server" data-dismiss="modal" class="btn botones CierraFirma">
                        <span>
                            <img class="btn-cancelar"/>
                            Cerrar
                        </span>
                    </asp:LinkButton>
                 </div>
             </div>
             
         </ContentTemplate>
       </asp:UpdatePanel>
    </div>


    <div id="OrdenPago" style="width:1000px; height:620px"  class="modal-orden">
        <asp:UpdatePanel runat="server" ID="upOrdenPago" >
         <ContentTemplate>
             <div class="cuadro-titulo" style="height:30px">
                <button type="button" class="close"  data-dismiss="modal">&times;</button>
                <div class="titulo-modal"><label>ORDEN DE PAGO</label></div>
             </div>
             <div class="panel-contenido" >
                 <div class="row">
                     <div class="col-md-3">
                         <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="90px" Text="Nro. Orden:"></asp:Label>
                         <asp:textbox runat="server" ID="lbl_Orden" CssClass="estandar-control Centro" Width="100px"></asp:textbox>
                     </div>
                     <div class="col-md-3">
                         <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="120px" Text="Transacción:"></asp:Label>
                         <asp:textbox runat="server" ID="lbl_Transaccion" Enabled="false"  CssClass="estandar-control Centro" Width="90px"></asp:textbox>
                     </div>
                 </div>
                 
                 <div class="clear padding5"></div>

                 <div class="row">
                     <div class="col-md-6">
                         <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="90px" Text="Compañia:"></asp:Label>
                         <asp:textbox runat="server" ID="lbl_Compañia" Enabled="false"  CssClass="estandar-control" Width="375px"></asp:textbox>
                     </div>
                     <div class="col-md-3">
                         <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="120px" Text="Fecha Estimada:"></asp:Label>
                         <asp:textbox runat="server" ID="txt_FechaEstimada" CssClass="estandar-control Fecha Centro" Width="100px"></asp:textbox>
                     </div>
                     <div class="col-md-3">
                         <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="120px" Text="Sucursal:"></asp:Label>
                         <asp:textbox runat="server" ID="lbl_Sucursal" Enabled="false"  CssClass="estandar-control" Width="100px"></asp:textbox>
                     </div>
                 </div>

                <div class="clear padding5"></div>

                 <div class="row">
                     <div class="col-md-3">
                         <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="90px" Text="Moneda:"></asp:Label>
                         <asp:textbox runat="server" ID="lbl_MonedaPago" Enabled="false"  CssClass="estandar-control" Width="100px"></asp:textbox>
                     </div>
                     <div class="col-md-3">
                         <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="120px" Text="Tipo Cambio:"></asp:Label>
                         <asp:textbox runat="server" ID="lbl_TipoCambio" Enabled="false"  CssClass="estandar-control Derecha" Width="90px"></asp:textbox>
                     </div>
                     <div class="col-md-3">
                         <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="120px" Text="Monto a Pagar:"></asp:Label>
                         <asp:textbox runat="server" ID="lbl_MontoPago" Enabled="false"  CssClass="estandar-control Derecha" Width="100px"></asp:textbox>
                     </div>
                     <div class="col-md-3">
                         <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="120px" Text="Impuesto ISR:"></asp:Label>
                         <asp:textbox runat="server" ID="lbl_Impuesto" Enabled="false"  CssClass="estandar-control Derecha" Width="100px"></asp:textbox>
                     </div>
                 </div>

                 <div class="clear padding5"></div>

                 <div class="row">
                     <div class="col-md-6">
                         <div class="cuadro-subtitulo-grid">
                            DATOS BANCARIOS
                         </div>
                     </div>
                     <div class="col-md-6">
                         <div class="cuadro-subtitulo-grid">
                            ANULACIÓN
                         </div>
                     </div>
                 </div>
                 <div class="clear padding5"></div>
                 <div class="row">
                     <div class="col-md-3">
                         <asp:HiddenField runat="server" ID="hid_codCuenta" Value="" />
                         <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="90px" Text="Clave:"></asp:Label>
                         <asp:textbox runat="server" ID="lbl_Clave" Enabled="false"  CssClass="estandar-control" Width="135px"></asp:textbox>
                     </div>
                     <div class="col-md-1">
                         <asp:Label runat="server" ID="lbl_EtiqBanco" CssClass="col-md-1 etiqueta-control"  Width="90px" Text="Banco:"></asp:Label>
                         <asp:LinkButton id="btn_CambiaCuenta"  runat="server" Height="26px" Visible="False" class="btn botones CuentaBanco" data-toggle="modal" data-target="#EsperaModal">
                            <span>
                                <img class="btn-modificar"/>
                                Cambiar
                            </span>
                        </asp:LinkButton>
                     </div>
                     <div class="col-md-2">
                         <asp:HiddenField runat="server" ID="hid_codBanco" Value="" />
                         <asp:textbox runat="server" ID="lbl_Banco" Enabled="false"  CssClass="estandar-control"  Width="123px"></asp:textbox>
                     </div>
                     <div class="col-md-3">
                         <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="120px" Text="Usuario Anula:"></asp:Label>
                         <asp:textbox runat="server" ID="lbl_UsuAnula" Enabled="false" CssClass="estandar-control" Width="100px"></asp:textbox>
                     </div>
                     <div class="col-md-3">
                         <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="120px" Text="Fecha Baja:"></asp:Label>
                         <asp:textbox runat="server" ID="lbl_FecAnula" Enabled="false" CssClass="estandar-control Centro" Width="100px"></asp:textbox>
                     </div>
                 </div>

                 <div class="clear padding5"></div>
                        
                 <div class="cuadro-subtitulo-grid">
                    DETALLE DE PAGO
                 </div>
                 <div class="clear padding5"></div>
                 <div class="row">
                     <div class="col-md-12">
                         <div style="width:100%;height:50px;overflow-y:scroll;overflow-x:hidden;">
                            <asp:label runat="server" ID="lbl_Texto" CssClass="texto-body" Width="100%"></asp:label>
                         </div>
                     </div>
                 </div>
                

                 <div class="cuadro-subtitulo-grid">
                    CONTABILIDAD EN TRANSITO
                 </div>
                 <div class="clear padding5"></div>
                 <asp:Panel runat="server" ID="pnl_Contabilidad" Width="100%" Height="190px" ScrollBars="Both">
                      <asp:GridView runat="server" ID="gvd_Contabilidad" AutoGenerateColumns="false"  ShowHeader="false"
                                      CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                      GridLines="Horizontal"  ShowHeaderWhenEmpty="true" AllowPaging="true"
                                      DataKeyNames="id_pv">
                            <Columns>
                               <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                         <asp:CheckBox runat="server"  Width="0px" ID="chk_Sel"/>
                                    </ItemTemplate>
                                </asp:TemplateField >
                                <asp:TemplateField HeaderText="Poliza">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Poliza" Text='<%# Eval("poliza") %>' Width="100px"></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField >
                                <asp:TemplateField HeaderText="Ajuste">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Ajuste" Text='<%# Eval("nro_reas") %>' Width="40px"></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField >
                                <asp:TemplateField HeaderText="Capa">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Capa" Text='<%# Eval("nro_layer") %>' Width="40px"></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField >
                                <asp:TemplateField HeaderText="Ramo Contable">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_ramo" Text='<%# Eval("ramo_contable") %>' Width="100px"></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField >
                                <asp:TemplateField HeaderText="Contrato">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Contrato" Text='<%# Eval("id_Contrato") %>' Width="80px"></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField >
                                <asp:TemplateField HeaderText="Broker">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Broker" Text='<%# Eval("broker") %>' Width="100px"></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField >
                                <asp:TemplateField HeaderText="Compañia">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Compañia" Text='<%# Eval("compañia") %>' Width="100px"></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField >
                                <asp:TemplateField HeaderText="Cuota">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_Cuota" Text='<%# Eval("nro_cuota") %>' Width="40px"></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField >
                                <asp:TemplateField HeaderText="%Pri">
                                    <ItemTemplate>
                                        <asp:textbox runat="server" ID="lbl_PrimaTotal" Text='<%# Eval("prima_cedida") %>' CssClass="NoDisplay"></asp:textbox>
                                        <asp:textbox runat="server" ID="lbl_prcPrima" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("pje_pri")))%>' Width="60px" CssClass="estandar-control"></asp:textbox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Prima">
                                    <ItemTemplate>
                                        <asp:textbox runat="server" ID="lbl_Prima" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prima")))  %>' Width="80px"  CssClass="estandar-control"></asp:textbox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="%Com">
                                    <ItemTemplate>
                                        <asp:textbox runat="server" ID="lbl_ComisionTotal" Text='<%# Eval("comisiones") %>' CssClass="NoDisplay" ></asp:textbox>
                                        <asp:textbox runat="server" ID="lbl_prcCom" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("pje_com")))  %>' Width="60px" CssClass="estandar-control"></asp:textbox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Comision">
                                    <ItemTemplate>
                                        <asp:textbox runat="server" ID="lbl_Comision" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("comision")))  %>' Width="80px" CssClass="estandar-control"></asp:textbox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Prima Neta">
                                    <ItemTemplate>
                                        <asp:label runat="server" ID="lbl_PrimaNeta" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("prima_neta")))  %>' Width="80px" CssClass="estandar-control"></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Retención">
                                    <ItemTemplate>
                                        <asp:textbox runat="server" ID="lbl_pjeRet" Text='<%# Eval("pje_isr") %>'  CssClass="NoDisplay" ></asp:textbox>
                                        <asp:label runat="server" ID="lbl_MontoISR" Text='<%# String.Format("{0:#,#0.0000}", CDbl(Eval("monto_isr")))  %>' Width="80px" CssClass="estandar-control"></asp:label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                      </asp:GridView>
                 </asp:Panel>


                 <div class="row">
                     <div class="col-md-4">
                        <div class="cuadro-subtitulo-grid">
                            REASEGURO
                        </div>
                        <div class="clear padding5"></div>
                        <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="90px" Text="Usuario:"></asp:Label>
                        <asp:textbox runat="server" ID="lbl_UsuReaseguro" Enabled="false" CssClass="estandar-control" Width="220px"></asp:textbox>
                        <div class="clear padding5"></div>
                        <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="90px" Text="Fecha:"></asp:Label>
                        <asp:textbox runat="server" ID="lbl_FecReaseguro" Enabled="false" CssClass="estandar-control Centro" Width="100px"></asp:textbox>
                     </div>
                     <div class="col-md-4">
                         <div class="cuadro-subtitulo-grid">
                            TESORERIA
                        </div>
                        <div class="clear padding5"></div>
                        <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="90px" Text="Usuario:"></asp:Label>
                        <asp:textbox runat="server" ID="lbl_UsuTesoreria" Enabled="false" CssClass="estandar-control" Width="220px"></asp:textbox>
                        <div class="clear padding5"></div>
                        <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="90px" Text="Fecha:"></asp:Label>
                        <asp:textbox runat="server" ID="lbl_FecTesoreria" Enabled="false" CssClass="estandar-control Centro" Width="100px"></asp:textbox>
                     </div>
                     <div class="col-md-4">
                         <div class="cuadro-subtitulo-grid">
                            CONTABILIDAD
                        </div>
                        <div class="clear padding5"></div>
                        <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="90px" Text="Usuario:"></asp:Label>
                        <asp:textbox runat="server" ID="lbl_UsuContabilidad" Enabled="false" CssClass="estandar-control" Width="220px"></asp:textbox>
                        <div class="clear padding5"></div>
                        <asp:Label runat="server" CssClass="col-md-1 etiqueta-control" Width="90px" Text="Fecha:"></asp:Label>
                        <asp:textbox runat="server" ID="lbl_FecContabilidad" Enabled="false" CssClass="estandar-control Centro" Width="100px"></asp:textbox>
                     </div>
                 </div>
             </div>

             <div class="row" style="border:2px solid gray; border-width: 1px 0 0 0;">
                 <div class="col-md-8">
                      <div style="width:100%; text-align:left; padding: 0 0 0 10px;">
                          <asp:LinkButton id="btn_Consultar" runat="server" class="btn botones">
                               <span>
                                   <img class="btn-buscar"/>
                                   Consultar
                               </span>
                           </asp:LinkButton>
                           <asp:LinkButton id="btn_Modificar" runat="server" class="btn botones">
                               <span>
                                   <img class="btn-modificar"/>
                                   Modificar
                               </span>
                           </asp:LinkButton>
                          <asp:LinkButton id="btn_Anular" runat="server" class="btn botones">
                               <span>
                                   <img class="btn-eliminar"/>
                                   Anular
                               </span>
                           </asp:LinkButton>
                      </div>
                 </div>
                 <div class="col-md-4">
                      <div style="width:100%; text-align:right; padding: 0 10px 0 0;">
                            <asp:LinkButton id="btn_Guardar" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-guardar"/>
                                    Guardar
                                </span>
                            </asp:LinkButton>
                            <asp:LinkButton id="btn_Cancelar" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-cancelar"/>
                                    Cancelar
                                </span>
                            </asp:LinkButton>
                      </div>
                 </div>
             </div>
            
                
             </div>
         </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="clear padding100"></div> 
</asp:Content>

