<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="Facultativo.aspx.vb" Inherits="OrdenPago_Facultativo" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
    <script src="../Scripts/Facultativos.js"></script>

    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|0|0|0|" />
    <%-----------------------------------Sección 1----------------------------------------------------------------------------------------------------%>
        <div style="width:1000px; min-width:1000px; overflow-x:hidden">
            <div class="cuadro-titulo panel-encabezado">
                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana0" class="contraer"  />
                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana0" class="expandir"  />
                Filtro Broker / Compañia
            </div>


            <div class="panel-contenido ventana0" >
                <div class="row">
                    <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            Broker
                        </div>
                        <div class="panel-subcontenido">
                                <asp:UpdatePanel runat="server" ID="upBroker">
                                    <ContentTemplate>
                                        <asp:Panel runat="server" ID="pnlBroker" Width="100%" Height="130px" ScrollBars="Both">
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
                            Compañia
                        </div>
                        <div class="panel-subcontenido">
                                <asp:UpdatePanel runat="server" ID="upCompañia">
                                    <ContentTemplate>
                                        <asp:Panel runat="server" ID="pnlCompañia" Width="100%" Height="130px" ScrollBars="Both">
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
            </div>


             <%-----------------------------------Sección 2----------------------------------------------------------------------------------------------------%>
            <div class="cuadro-titulo panel-encabezado">
                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana1" class="contraer"  />
                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana1" class="expandir"  />
                <strong>Filtro Facultativos / Pólizas</strong>
            </div>
            <div class="panel-contenido ventana1" >
                <div class="row">
                    <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            Facultativos
                        </div>
                        <div class="panel-subcontenido">
                            <asp:UpdatePanel runat="server" ID="upFechas">
                            <ContentTemplate>

                                    <table>
                                        <tr>
                                            <td>
                                                <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Fec. Fac</asp:label>
                                                <asp:TextBox runat="server" ID="txt_FechaDe" CssClass="estandar-control Fecha" Width="110px" Height="26px" ></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:label runat="server" class="col-md-1 etiqueta-control" Width="38px">A</asp:label>
                                                <asp:TextBox runat="server" ID="txt_FechaA" CssClass="estandar-control Fecha" Width="110px" Height="26px" ></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
        
                                </ContentTemplate>
                            </asp:UpdatePanel>
                                            
                                                            

                            <asp:UpdatePanel runat="server" ID="upContrato">
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnlContrato" Width="100%" Height="105px" ScrollBars="Both">
                                        <asp:GridView runat="server" ID="gvd_Contrato" AutoGenerateColumns="false"  
                                                      CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                      GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelFac" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Clave">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveFac" Text='<%# Eval("Clave") %>' Width="60px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="DescripcionCia">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="350px"></asp:Label>
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
                                        <asp:LinkButton id="btn_AddCtr" runat="server" class="btn botones AgregaContrato" data-toggle="modal" data-target="#EsperaModal">
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
                            Póliza
                        </div>
                        <div class="panel-subcontenido">
                                <asp:UpdatePanel runat="server" ID="upPoliza">
                                    <ContentTemplate>
                                        <asp:HiddenField runat="server" ID="hid_HTML" Value="" />
                                        <div class="clear padding5"></div>
                                        <div class="input-group">
                                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="120px">Busqueda por:</asp:label>
                                            <asp:RadioButtonList runat="server"  ID="optAjuste" CssClass="rbl etiqueta-control" RepeatDirection="Horizontal" AutoPostBack="true">
                                                <asp:ListItem Selected="True" Value="0" Text="Endosos"></asp:ListItem>
                                                <asp:ListItem  Value="1" Text="Endosos y Ajustes"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>

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
                </div>
            </div>

             <%-----------------------------------Sección 3----------------------------------------------------------------------------------------------------%>
            <div class="cuadro-titulo panel-encabezado">
                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana2" class="contraer"  />
                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana2" class="expandir"  />
                <strong>Filtro Adicionales</strong>
            </div>
            <div class="panel-contenido ventana2" >
                <div class="row">
                    <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            Ramo Contable
                        </div>
                        <div class="panel-subcontenido">
                             <asp:UpdatePanel runat="server" ID="upRamoContable">
                                <ContentTemplate>
                                     <asp:Panel runat="server" ID="pn_RamoContable" Width="100%" Height="130px" ScrollBars="Both">
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

                    <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            Producto
                        </div>
                        <div class="panel-subcontenido">
                            <asp:UpdatePanel runat="server" ID="upProducto">
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnl_Producto" Width="100%" Height="130px" ScrollBars="Both">
                                        <asp:GridView runat="server" ID="gvd_Producto" AutoGenerateColumns="false"
                                                      CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                      GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="chk_SelPro" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="Clave">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClavePro" Text='<%# Eval("Clave") %>' Width="50px"></asp:Label>
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
                                        <asp:LinkButton id="btn_AddProducto" runat="server" class="btn botones AgregaProducto" data-toggle="modal" data-target="#EsperaModal">
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

                <div class="clear padding10"></div>

                <div class="row">
                     <div class="col-md-6">
                        <asp:UpdatePanel runat="server" ID="upFechasAdicional">
                            <ContentTemplate>
                             <table>
                                <tr>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Fec. Pago</asp:label>
                                        <asp:TextBox runat="server" ID="txtFecPagoDe" CssClass="estandar-control Fecha" Width="110px" Height="26px" ></asp:TextBox>  
                                    </td>
                                    <td>
                                        <asp:label runat="server" class="col-md-1 etiqueta-control" Width="38px">A</asp:label>
                                        <asp:TextBox runat="server" ID="txtFecPagoA" CssClass="estandar-control Fecha" Width="110px" Height="26px" ></asp:TextBox>
                                    </td>
                                </tr>
                             </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                     </div>
                     
                     <div class="col-md-6">
                         <asp:UpdatePanel runat="server" ID="upMoneda">
                            <ContentTemplate>
                             <asp:label runat="server" class="col-md-1 etiqueta-control" Width="130px">Moneda</asp:label>
                             <asp:DropDownList runat="server" ID="ddl_Moneda" CssClass="estandar-control" Width="302px" Height="26px"></asp:DropDownList>
                          </ContentTemplate>
                        </asp:UpdatePanel>
                     </div>
                </div>

                <div class="clear padding10"></div>

                <div class="row">
                     <div class="col-md-6">
                         <asp:label runat="server" class="col-md-1 etiqueta-control" Width="120px">Cobranzas</asp:label>
                         <asp:RadioButtonList runat="server" ID="opt_Cobranzas" RepeatDirection="Vertical" CssClass="rbl etiqueta-control" Width="300px"  >
                            <asp:ListItem Text="Todos" Value="-1" Selected="True"/>
                            <asp:ListItem Text="Cobrados" value="1" />
                            <asp:ListItem Text="Compensados" value="2" />
                            <asp:ListItem Text="Parcial Cobrado" Value="3" />
                            <asp:ListItem Text="No Cobrados/No Compensados" Value="0" />
                            <asp:ListItem Text="Cancelados" Value="4" />
                            <%--<asp:ListItem Text="Primas en Deposito" Value="3" />--%>
                         </asp:RadioButtonList>
                     </div>
                     <div class="col-md-6">
                         <asp:label runat="server" class="col-md-1 etiqueta-control" Width="120px">Reaseguro</asp:label>
                         <asp:RadioButtonList runat="server" ID="opt_Estatus" RepeatDirection="Vertical" CssClass="rbl etiqueta-control" Width="300px" >
                            <asp:ListItem Text="Todos" Value="-1" Selected="True" />
                            <asp:ListItem Text="Pagados" value="1" />
                            <asp:ListItem Text="Pagados en Exceso" Value="2" />
                            <asp:ListItem Text="Saldo Pendiente" Value="0" />
                            <asp:ListItem Text="Solicitados" Value="3" />
                            <asp:ListItem Text="Recuperaciones" Value="4" />
                            <asp:ListItem Text="Temporales" Value="5" />
                         </asp:RadioButtonList>
                     </div>
                </div>
            </div>

             <%-----------------------------------Sección 3----------------------------------------------------------------------------------------------------%>
            <div class="cuadro-titulo panel-encabezado">
                <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana3" class="contraer"  />
                <input type="image" src="../Images/expander_mini_inv.png"   id="exVentana3" class="expandir"  />
                <strong>Filtro Orden de Pago</strong>
            </div>
            <div class="panel-contenido ventana3" >
                <div class="row">
                    <div class="col-md-6">
                        <asp:UpdatePanel runat="server" ID="upFechasGen">
                            <ContentTemplate>
                                <table>
                                        <tr>
                                            <td>
                                                <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Generada</asp:label>
                                                <asp:TextBox runat="server" ID="txtFecGeneraDe" CssClass="estandar-control Fecha" Width="110px" Height="26px" ></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:label runat="server" class="col-md-1 etiqueta-control" Width="10px">A</asp:label>
                                                <asp:TextBox runat="server" ID="txtFecGeneraA" CssClass="estandar-control Fecha" Width="110px" Height="26px" ></asp:TextBox>
                                            </td>
                                        </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            Usuario Solicitante
                        </div>
                        <div class="panel-subcontenido">
                            <asp:UpdatePanel runat="server" ID="upUsuarios">
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
                                                        <asp:Label runat="server" ID="lbl_ClaveUsu" Text='<%# Eval("Clave") %>' Width="80px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="330px"></asp:Label>
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
                            Estatus Órden Pago
                        </div>
                        <div class="panel-subcontenido">
                            <asp:UpdatePanel runat="server" ID="upEstatus">
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnlEstatus" Width="100%" Height="100px" ScrollBars="Both">
                                        <asp:GridView runat="server" ID="gvd_Estatus" AutoGenerateColumns="false" 
                                                      CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                      GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="chk_SelEst" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="Clave">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveEst" Text='<%# Eval("Clave") %>' Width="50px" ></asp:Label>
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

                <div class="row">
                    <div class="col-md-12">
                        <div class="cuadro-subtitulo">
                            Órdenes de Pago
                        </div>
                        <div class="panel-subcontenido">
                             <asp:UpdatePanel runat="server" ID="upLstOP">
                                 <ContentTemplate>
                                     <asp:Panel runat="server" ID="pnlOrdenP" Width="100%" Height="200px" ScrollBars="Vertical">
                                        <asp:GridView runat="server" ID="gvd_LstOrdenPago" AutoGenerateColumns="false" 
                                                        CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                        GridLines="Horizontal"  ShowHeaderWhenEmpty="true" AllowPaging="true" PageSize="10" 
                                                        DataKeyNames="nro_op,id_imputacion,id_pv,cod_estatus_op,fec_baja,fec_autoriz_sector,fec_autoriz_contab,fec_pago">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Filtro" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server"  Width="40px" ID="chk_SelOp" Checked='<%# Eval("tSEl_Val") %>'/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >

                                                <asp:TemplateField HeaderText="Nro Op">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="lbl_OrdenPago" Text='<%# Eval("nro_op")%>' CssClass="form-control DetExh Link" Height="25px"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Impresión" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                            <asp:CheckBox runat="server" Width="70px" ID="chk_Impresion" Checked='<%# Eval("sn_impresion") %>'/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >

                                                <asp:TemplateField HeaderText="Asegurado">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Asegurado" Text='<%# Eval("Asegurado")%>' Width="200px" Height="25px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Ramos Contables" ControlStyle-Width="200px">
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="ddl_RamosContables"  Height="25px"
                                                                            runat="server">
                                                        </asp:DropDownList>
                                                        <asp:Label ID="lbl_RamosContables" 
                                                                    Text='<%# DataBinder.Eval(Container.DataItem, "Ramos") %>' 
                                                                    Visible="false"     
                                                                    runat="server"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Broker / Compañia">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_BroCia" Text='<%# Eval("txt_otros") %>' Width="410px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Fec Pago">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_FechaPago" Text='<%# Eval("Fec_Pago") %>' Width="70px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Usuario">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Usuario" Text='<%# Eval("Solicitante") %>' Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Monto">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Monto" Text='<%# String.Format("{0:#,#0.00}", CDbl(Eval("Monto")))  %>' Width="90px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Estatus">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Estatus" Text='<%# Eval("estatus") %>' Width="100px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <div style="width:100%; text-align:right;">
                                        <asp:LinkButton id="btn_BuscaOP" runat="server" class="btn botones">
                                            <span>
                                                <img class="btn-buscar"/>
                                                Buscar
                                            </span>
                                        </asp:LinkButton>
                                        <asp:LinkButton id="btn_Imprimir" runat="server" class="btn botones">
                                            <span>
                                                <img class="btn-imprimir"/>
                                                Imprimir
                                            </span>
                                        </asp:LinkButton>
                                        <asp:LinkButton id="btn_Limpiar" runat="server" class="btn botones">
                                            <span>
                                                <img class="btn-limpiar"/>
                                                Limpiar
                                            </span>
                                        </asp:LinkButton>
                                    </div>
                                 </ContentTemplate>
                             </asp:UpdatePanel>
                        </div>
                    </div>
                </div>  
            </div>

        </div>

        <div class="row">
             <div class="col-md-12">
                 <div  style="width:100%; border:5px solid gray; border-width: 2px 0 0 0; text-align:right; padding: 0 0 0 620px; "  >
                      <asp:LinkButton id="btn_Buscar" runat="server" class="btn botones boton-largo" data-toggle="modal">
                        <span>
                            <img class="btn-buscar"/>
                            Busca Reaseguros
                        </span>
                      </asp:LinkButton>
                </div>
             </div>

        </div>

        
        <div class="clear padding100"></div>
</asp:Content>

