<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="RecSiniestrosAdmin.aspx.vb" Inherits="Recordatorios_RecSiniestrosAdmin_" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
         <script src="../Scripts/jquery.maskedinput.js"></script>
         <script src="../Scripts/jquery.numeric.js"></script>
         <script src="../Scripts/Recordatorios.js"></script>

         <script type="text/javascript"> 
             Sys.WebForms.PageRequestManager.getInstance().add_endRequest(PageLoad);
         </script>


       <asp:UpdatePanel runat="server" ID="updValores">
             <ContentTemplate>
                <asp:HiddenField runat="server" ID="hid_Ventanas" Value="1|1|1|1|1|" />
                <asp:HiddenField runat="server" ID="hid_Clave" Value="" />
                <asp:HiddenField runat="server" id="hid_Actual" Value="" />
            </ContentTemplate>
       </asp:UpdatePanel>

            <div class="cuadro-titulo panel-encabezado">
                Configuración del Recordatorio

            </div>
            <div class="clear padding10"></div>
    <div style="width:900px; min-width:900px; overflow-x:hidden">
            <div class="row">
                 <div class="col-md-8">

                    <div class="cuadro-subtitulo">
                        <input type="image" src="../Images/contraer_mini.png" id="coVentana0" class="contraer"  />
                        <input type="image" src="../Images/expander_mini.png"   id="exVentana0" class="expandir"  />
                        <label class="etiqueta-simple">Catálogo de Fase de Recuperación</label>
                        
                    </div>

                    <div class="panel-contenido ventana0" >

                              <div class="panel-subcontenido">
                                <asp:UpdatePanel runat="server" ID="upFase" >
                                    <ContentTemplate>
                                     <asp:Panel runat="server" ID="pnlFase" Width="100%"  Height="190px" ScrollBars="Vertical">
                                          <asp:GridView runat="server" ID="gvd_Fase" AutoGenerateColumns="false" CssClass="grid-view" HeaderStyle-CssClass="header" DataKeyNames="Clave" 
                                              AlternatingRowStyle-CssClass="altern" GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelFas" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="Clave">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveFas" Text='<%# Eval("Clave") %>' Width="50px" Font-Size="10px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="310px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                             <asp:imagebutton ID="btn_Edicion" ImageUrl="~/Images/edicion_ICONO.png" CommandName="Editar" Height="26" runat="server" CssClass="btn Confirmacion" />
                                                     </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                             <asp:imagebutton ID="btn_Eliminar" ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Confirmacion" />
                                                     </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                     </asp:Panel>
                                         <div style="width:100%;  text-align:right">
                                            <asp:LinkButton id="btn_Nuevo" runat="server" class="btn botones NuevaFase">
                                                <span>
                                                    <img class="btn-añadir"/>
                                                    Nuevo
                                                </span>
                                            </asp:LinkButton>
                                            <asp:LinkButton id="btn_Buscar" runat="server" class="btn botones BuscaFase" data-toggle="modal" data-target="#EsperaModal">
                                                <span>
                                                    <img class="btn-buscar"/>
                                                    Buscar
                                                </span>
                                            </asp:LinkButton>
                                         </div>
                                    
                                     </ContentTemplate>
                                     </asp:UpdatePanel>
                        
                                  
                        </div>
                    </div>
                </div>
            </div>

            <div class="clear padding10"></div>
             <%-------Ventana 2--%>
             <div class="row">
                <div class="col-md-8">
                    <div class="cuadro-subtitulo">
                        <input type="image" src="../Images/contraer_mini.png" id="coVentana1" class="contraer"  />
                        <input type="image" src="../Images/expander_mini.png"   id="exVentana1" class="expandir"  />
                        <label class="etiqueta-simple">Catálogo de Estatus de Siniestro</label>
                        
                    </div>
                    <div class="clear padding10"></div>
                     <div class="panel-contenido ventana1" >
                        <div class="panel-subcontenido">
                           <asp:UpdatePanel runat="server" ID="upEstatus">
                             <ContentTemplate>
                               <asp:Panel runat="server" ID="pnlEstatus" Width="100%" Height="190px" ScrollBars="Vertical">
                                 <div class="form-group">
                                    <div class="input-group">
                                       <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="150px">Seleccione Fase: </asp:Label>
                                       <asp:TextBox runat="server" ID="txtClaveFas" CssClass="form-control" Width="70px" Height="26px"></asp:TextBox>
                                       <button type="button" id="btn_SelFas" class="btn btn-info" data-toggle="modal" style="width: 36px; height: 26px;" data-target="#EsperaModal">...</button>
                                       <asp:TextBox runat="server" ID="txtSearchFas" CssClass="form-control" Width="260px" Height="26px"></asp:TextBox>
                                   </div>
                                 </div>
                                    <asp:GridView runat="server" ID="gvd_Estatus" AutoGenerateColumns="false" CssClass="grid-view" HeaderStyle-CssClass="header" DataKeyNames="Clave"  
                                              AlternatingRowStyle-CssClass="altern" GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelSts" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="Clave">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveSts" Text='<%# Eval("Clave") %>' Width="50px" Font-Size="10px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="310px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                             <asp:imagebutton ID="btn_Edicion" ImageUrl="~/Images/edicion_ICONO.png" CommandName="Editar" Height="26" runat="server" CssClass="btn Confirmacion" />
                                                     </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                             <asp:imagebutton ID="btn_Eliminar" ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Confirmacion" />
                                                     </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                     <div style="width:100%;  text-align:right">
                                        <asp:LinkButton id="btn_NuevoEst" runat="server" class="btn botones">
                                            <span>
                                                <img class="btn-añadir"/>
                                                Nuevo
                                            </span>
                                        </asp:LinkButton>
                                        <asp:LinkButton id="btn_BuscarEst" runat="server" class="btn botones BuscaEst" data-toggle="modal" data-target="#EsperaModal">
                                            <span>
                                                <img class="btn-buscar"/>
                                                Buscar
                                            </span>
                                        </asp:LinkButton>
                                    </div>
                              </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>

             <%-------Ventana 3--%>
             <div class="row">
                <div class="col-md-8">
                    <div class="cuadro-subtitulo">
                        <input type="image" src="../Images/contraer_mini.png" id="coVentana2" class="contraer"  />
                        <input type="image" src="../Images/expander_mini.png"   id="exVentana2" class="expandir"  />
                        <label class="etiqueta-simple">Niveles de Recordatorio</label>
                        
                    </div>
                    <div class="clear padding10"></div>
                     <div class="panel-contenido ventana2" >
                        <div class="panel-subcontenido">
                           <asp:UpdatePanel runat="server" ID="updNiveles">
                             <ContentTemplate>
                                 <asp:Panel runat="server" ID="pnlNiveles" Width="100%"  Height="190px" ScrollBars="Vertical">
                                      <asp:GridView runat="server" ID="gvd_Nivel" AutoGenerateColumns="false" CssClass="grid-view" HeaderStyle-CssClass="header" DataKeyNames="Clave" 
                                              AlternatingRowStyle-CssClass="altern" GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelNiv" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Clave">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveNiv" Text='<%# Eval("Clave") %>' Width="50px" Font-Size="10px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="280px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Días Tolerancia">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Oculta1" Text='<%# Eval("OcultaCampo1") %>' Width="80px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                             <asp:imagebutton ID="btn_Edicion" ImageUrl="~/Images/edicion_ICONO.png" CommandName="Editar" Height="26" runat="server" CssClass="btn Confirmacion" />
                                                     </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                      <ItemTemplate>
                                                             <asp:imagebutton ID="btn_Eliminar" ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Confirmacion" />
                                                     </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                 </asp:Panel>             
                                    <div style="width:100%;  text-align:right">
                                        <asp:LinkButton id="btn_NuevoNivel" runat="server" class="btn botones NuevoNivel">
                                            <span>
                                                <img class="btn-añadir"/>
                                                Nuevo
                                            </span>
                                        </asp:LinkButton>
                                        <asp:LinkButton id="btn_BuscaNivel" runat="server" class="btn botones BuscaNivel" data-toggle="modal" data-target="#EsperaModal">
                                            <span>
                                                <img class="btn-buscar"/>
                                                Buscar
                                            </span>
                                        </asp:LinkButton>
                                    </div>
                               </ContentTemplate>
                           </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
             <%-------Ventana 4--%> 
              <div class="row">
                <div class="col-md-8">
                    <div class="cuadro-subtitulo">
                        <input type="image" src="../Images/contraer_mini.png" id="coVentana3" class="contraer"  />
                        <input type="image" src="../Images/expander_mini.png"   id="exVentana3" class="expandir"  />
                        <label class="etiqueta-simple">Aviso a Usuarios</label>
                        
                    </div>
                    <div class="clear padding10"></div>
                     <div class="panel-contenido ventana3" >
                        <div class="panel-subcontenido">
                           <asp:UpdatePanel runat="server" ID="updUsuarios">
                             <ContentTemplate>
                              <asp:Panel runat="server" ID="pnlUsuarios" Width="100%"  Height="190px" ScrollBars="Vertical">
                                   <div class="form-group">
                                    <div class="input-group">
                                       <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="150px">Seleccione Depto: </asp:Label>
                                       <asp:TextBox runat="server" ID="txtClaveSec" CssClass="form-control" Width="70px" Height="26px"></asp:TextBox>
                                       <button type="button" id="btn_SelSec" class="btn btn-info" data-toggle="modal" style="width: 36px; height: 26px;" data-target="#EsperaModal">...</button>
                                       <asp:TextBox runat="server" ID="txtSearchSec" CssClass="form-control" Width="260px" Height="26px"></asp:TextBox>
                                   </div>
                                 </div>
                                   <asp:GridView runat="server" ID="gvd_Usuarios" AutoGenerateColumns="false" CssClass="grid-view" HeaderStyle-CssClass="header" DataKeyNames="OcultaCampo3" 
                                              AlternatingRowStyle-CssClass="altern" GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelAvU" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="Clave">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveAvU" Text='<%# Eval("Clave") %>' Width="50px" Font-Size="10px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="220px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Departamento">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Oculta2" Text='<%# Eval("OcultaCampo2") %>' Width="150px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Nivel">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Oculta1" Text='<%# Eval("OcultaCampo1") %>' Width="40px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="idav" Visible ="false">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Oculta3" Text='<%# Eval("OcultaCampo3") %>' Width="30px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                             <asp:imagebutton ID="btn_Edicion" ImageUrl="~/Images/edicion_ICONO.png" CommandName="Editar" Height="26" runat="server" CssClass="btn Confirmacion" />
                                                     </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                             <asp:imagebutton ID="btn_Eliminar" ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Confirmacion" />
                                                     </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                </asp:Panel>
                                    <div style="width:100%;  text-align:right">
                                        <asp:LinkButton id="btn_NuevoAvU" runat="server" class="btn botones">
                                            <span>
                                                <img class="btn-añadir"/>
                                                Nuevo
                                            </span>
                                        </asp:LinkButton>
                                        <asp:LinkButton id="btn_BuscarAvU" runat="server" class="btn botones BuscaAvU" data-toggle="modal" data-target="#EsperaModal">
                                            <span>
                                                <img class="btn-buscar"/>
                                                Buscar
                                            </span>
                                        </asp:LinkButton>
                                    </div>
                                 </ContentTemplate>
                           </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
            <%------Ventana 5------%>
             <div class="row">
                 <div class="col-md-8">

                    <div class="cuadro-subtitulo">
                        <input type="image" src="../Images/contraer_mini.png" id="coVentana4" class="contraer"  />
                        <input type="image" src="../Images/expander_mini.png"   id="exVentana4" class="expandir"  />
                        <label class="etiqueta-simple">Configurar Horario</label>
                        
                    </div>

                    <div class="panel-contenido ventana4" >
                        <div class="panel-subcontenido">
                            <asp:UpdatePanel runat="server" ID="updAvisos">
                            <ContentTemplate>
                                <asp:Panel runat="server" ID="pnlAviso" Width="100%"  Height="80px">
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="200px">Establecer Hora de Envío:</asp:label>
                                    <asp:HiddenField runat="server" ID="hid_hora" />
                                    <asp:TextBox runat="server" ID="txt_hora"  class="timepicker estandar-control" Width="190px" OnTextChanged="txt_hora_TextChanged"></asp:TextBox>
                                   <%-- <input type="text" name="timepicker" id="ctrl_hr" style="width:190px" class="timepicker estandar-control"/>--%>
                                    <br />
                                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="180px">Estado de la Tarea:</asp:label>
                                    <asp:label runat="server" ID="lbl_StatusJob" class="col-md-1 etiqueta-control" Width="100px" Height="23" Text="DESACTIVADO"></asp:label>
                                    <asp:ImageButton ID="btn_Switch" runat="server" 
                                        Width="35" Height="16" border="0" OnClick="btn_Switch_Click" />
                                </asp:Panel>
                                  <div style="width:100%;  text-align:right">
                                        <asp:LinkButton id="btn_GuardarHora" runat="server" class="btn botones">
                                            <span>
                                                <img class="btn-guardar"/>
                                                Guardar
                                            </span>
                                        </asp:LinkButton>
                                  </div>
                            </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>

            <div class="clear padding10"></div>
    </div>

    <div id="GuardaFaseModal" style="width:420px; height:195px"  class="modal-mensaje">
               <div class="cuadro-titulo" style="height:40px">
                    <button type="button" class="close"  data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                         Fase
                     </h4>
               </div>
               <asp:UpdatePanel runat="server" ID="upModVersion">
                   <ContentTemplate>
                       <div class="modal-body" style="height:100px">
                            <%--<asp:CheckBox runat="server" Font-Size="13px" Width="365px" ID="chk_Temporal" Text="Ambiente Temporal Agrupadores" CssClass="form-control" />
                         --%>
                            <div class="clear padding5"></div>
 
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Descripción:</asp:label>
                            <asp:TextBox runat="server" class="estandar-control" ID="txt_descripcion" Width="275px" Height="25px"></asp:TextBox>
                           
                            <div class="clear padding10"></div>
                      </div>
                      <div style="width:100%; padding-left:215px; border-top:none;border-top-width:1px; padding-top:3px;">
                            <asp:LinkButton id="btn_Guardar" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-guardar"/>
                                    Guardar
                                </span>
                            </asp:LinkButton>
                            <asp:LinkButton id="btn_Cancela" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-cancelar"/>
                                    Cancelar
                                </span>
                            </asp:LinkButton>
                           
                      </div>
                    </ContentTemplate>
              </asp:UpdatePanel>
    </div>


      <div id="GuardaEstatusModal" style="width:450px; height:195px"  class="modal-mensaje">
               <div class="cuadro-titulo" style="height:40px">
                    <button type="button" class="close"  data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                         Estatus
                     </h4>
               </div>
               <asp:UpdatePanel runat="server" ID="updActEstatus">
                   <ContentTemplate>
                       <div class="modal-body" style="height:100px">
                            <%--<asp:CheckBox runat="server" Font-Size="13px" Width="365px" ID="chk_Temporal" Text="Ambiente Temporal Agrupadores" CssClass="form-control" />
                         --%>
                           <div class="clear padding5"></div>
                           <div class="form-group">
                               <div class="input-group">
                                   <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="100px">Fase :</asp:Label>
                                   <asp:DropDownList runat="server" ID="ddl_Fase" CssClass="form-control estandar-control" Width="275px" Height="28px"></asp:DropDownList>
                               </div>
                           </div>
                            
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Descripción:</asp:label>
                            <asp:TextBox runat="server" class="estandar-control" ID="txtDescripSts" Width="275px" Height="25px"></asp:TextBox>
                           
                            <div class="clear padding10"></div>
                      </div>
                      <div style="width:100%; padding-left:215px; border-top:none;border-top-width:1px; padding-top:3px;">
                            <asp:LinkButton id="btn_GuardarSts" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-guardar"/>
                                    Guardar
                                </span>
                            </asp:LinkButton>
                            <asp:LinkButton id="btn_CancelarSts" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-cancelar"/>
                                    Cancelar
                                </span>
                            </asp:LinkButton>
                           
                      </div>
                    </ContentTemplate>
              </asp:UpdatePanel>
    </div>

     <div id="GuardaNivelModal" style="width:420px; height:195px"  class="modal-mensaje">
               <div class="cuadro-titulo" style="height:40px">
                    <button type="button" class="close"  data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                         Niveles
                     </h4>
               </div>
               <asp:UpdatePanel runat="server" ID="updNivelModal">
                   <ContentTemplate>
                       <div class="modal-body" style="height:100px">
                            <%--<asp:CheckBox runat="server" Font-Size="13px" Width="365px" ID="chk_Temporal" Text="Ambiente Temporal Agrupadores" CssClass="form-control" />
                         --%>
                            <div class="clear padding5"></div>
 
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Descripción:</asp:label>
                            <asp:TextBox runat="server" class="estandar-control" ID="txtDescripNivel" Width="275px" Height="25px"></asp:TextBox>
                            <div class="clear padding5"></div>
                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">Días de Tolerancia:</asp:label>
                            <asp:DropDownList runat="server" ID="ddlDiasTol" CssClass="form-control etiqueta-control" Width="50px" Height="28px">
                                <asp:ListItem Text ="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text ="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text ="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text ="4" Value="4"></asp:ListItem>
                                <asp:ListItem Text ="5" Value="5"></asp:ListItem>
                                <asp:ListItem Text ="6" Value="6"></asp:ListItem>
                                <asp:ListItem Text ="7" Value="7"></asp:ListItem>
                                <asp:ListItem Text ="8" Value="8"></asp:ListItem>
                                <asp:ListItem Text ="9" Value="9"></asp:ListItem>
                                <asp:ListItem Text ="10" Value="10"></asp:ListItem>
                            </asp:DropDownList>
                            
                            <div class="clear padding10"></div>
                      </div>
                      <div style="width:100%; padding-left:215px; border-top:none;border-top-width:1px; padding-top:3px;">
                            <asp:LinkButton id="btn_GuardarNivel" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-guardar"/>
                                    Guardar
                                </span>
                            </asp:LinkButton>
                            <asp:LinkButton id="btn_CancelarNivel" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-cancelar"/>
                                    Cancelar
                                </span>
                            </asp:LinkButton>
                           
                      </div>
                    </ContentTemplate>
              </asp:UpdatePanel>
    </div>

      <div id="GuardaUsuariosModal" style="width:450px; height:285px"  class="modal-mensaje">
               <div class="cuadro-titulo" style="height:40px">
                    <button type="button" class="close"  data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                         Aviso a Usuarios
                     </h4>
               </div>
               <asp:UpdatePanel runat="server" ID="updAvU">
                   <ContentTemplate>
                       <div class="modal-body" style="height:200px">
                            <%--<asp:CheckBox runat="server" Font-Size="13px" Width="365px" ID="chk_Temporal" Text="Ambiente Temporal Agrupadores" CssClass="form-control" />
                         --%>
                           <div class="clear padding5"></div>
                           <div class="form-group">
                               <div class="input-group">
                                   <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="100px">Depto :</asp:Label>
                                   <asp:DropDownList runat="server" ID="ddlSector" CssClass="form-control estandar-control" Width="275px" Height="28px"></asp:DropDownList>
                               </div>
                           </div>
                            
                           <div class="form-group">
                               <div class="input-group">
                                   <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="100px">Usuario :</asp:Label>
                                   <asp:DropDownList runat="server" ID="ddlUsuario" CssClass="form-control estandar-control" Width="275px" Height="28px"></asp:DropDownList>
                               </div>
                           </div>
                           
                           <div class="form-group">
                               <div class="input-group">
                                   <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="100px">Nivel :</asp:Label>
                                   <asp:DropDownList runat="server" ID="ddlNivel" CssClass="form-control estandar-control" Width="275px" Height="28px"></asp:DropDownList>
                               </div>
                           </div>
                           
                           
                      </div>
                      <div style="width:100%; padding-left:215px; border-top:none;border-top-width:1px; padding-top:3px;">
                            <asp:LinkButton id="btn_GuardarAvU" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-guardar"/>
                                    Guardar
                                </span>
                            </asp:LinkButton>
                            <asp:LinkButton id="btn_CancelaAvU" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-cancelar"/>
                                    Cancelar
                                </span>
                            </asp:LinkButton>
                           
                      </div>
                    </ContentTemplate>
              </asp:UpdatePanel>
    </div>



</asp:Content>



