<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="ConsultaFacultativos.aspx.vb" Inherits="Recordatorios_ConsultaFacultativos" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
             <script src="../Scripts/jquery.maskedinput.js"></script>
             <script src="../Scripts/jquery.numeric.js"></script>
             <script src="../Scripts/Facultativos.js"></script>

         <script type="text/javascript"> 
             Sys.WebForms.PageRequestManager.getInstance().add_endRequest(PageLoad);
         </script>

            <div class="cuadro-titulo panel-encabezado">
                Consulta de Facultativos
                 <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|0|0|" />
                 <asp:HiddenField runat="server" ID="hid_Clave" Value="" />
            </div>
            <div class="clear padding10"></div>
            <div style="width:1000px; min-width:1000px; overflow-x:hidden">
                 <div class="row">
                    <div class="col-md-6">
                        <asp:UpdatePanel runat="server" ID="upd_Opc">
                         <ContentTemplate>
                               <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="150px">Tipo de Consulta: </asp:Label>
                                <asp:RadioButton runat="server" ID="opcFac" CssClass="etiqueta-control" Text=" Facultativos" Checked="true" OnCheckedChanged="opcFac_CheckedChanged" AutoPostBack ="true" />
                                <asp:RadioButton runat="server" ID="opcEsp" CssClass="etiqueta-control" Text=" Especiales" OnCheckedChanged="opcEsp_CheckedChanged" AutoPostBack ="true" />
                         </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            
             <div class="clear padding10"></div>

            <%--Seccion 1--%>
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
                                                                <asp:Label runat="server" ID="lbl_ClaveBro" Text='<%# Eval("Clave") %>' Width="50px" Font-Size="10px" ></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Descripción">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="310px" Font-Size="10px"></asp:Label>
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
                            <asp:UpdatePanel runat="server" ID="upCia">
                            <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnlCompañia" Width="100%" Height="130px" ScrollBars="Both">
                                        <asp:GridView runat="server" ID="gvd_Compañia" AutoGenerateColumns="false" 
                                                        CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                        GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="chk_SelCia" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="Clave">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveCia" Text='<%# Eval("Clave") %>' Width="50px" Font-Size="10px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="310px" Font-Size="10px"></asp:Label>
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

            <%--Seccion 2--%>
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
                                                        <asp:Label runat="server" ID="lbl_ClaveRamC" Text='<%# Eval("Clave") %>' Width="80px" Font-Size="10px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="280px" Font-Size="10px"></asp:Label>
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
                            Póliza
                        </div>
                        <div class="panel-subcontenido">
                                <asp:UpdatePanel runat="server" ID="upPoliza">
                                    <ContentTemplate>
                                        <asp:HiddenField runat="server" ID="hid_Polizas" Value="" />
                                        <asp:HiddenField runat="server" ID="hid_HTML" Value="" />
                                        <div class="clear padding5"></div>

                                        <asp:Panel runat="server" ID="pnlPoliza" Width="100%" Height="140px" ScrollBars="Both">
                                                <asp:GridView runat="server" ID="gvd_Poliza" AutoGenerateColumns="false" 
                                                              CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                              GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="" ItemStyle-CssClass="SelCia">
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="chk_SelPol" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Clave" ItemStyle-CssClass="ClaveCia">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lbl_ClavePol" Text='<%# Eval("Clave") %>' Width="100px" Font-Size="9.5px" ></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Grupo Endoso">
                                                            <ItemTemplate>
                                                                <asp:label runat="server" ID="lbl_DescripcionPol" Enabled="false" Text='<%# Eval("Descripcion")   %>' Width="260px" Font-Size="9.5px"  ></asp:label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Id_Pv" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:label runat="server" ID="lbl_idpv" Enabled="false" Text='<%# Eval("id_pv")   %>' Width="260px" Font-Size="9.5px"  ></asp:label>
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
<%--                  <div class="col-md-6">
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
                                                <asp:TemplateField HeaderText="" ItemStyle-CssClass="SelCia">
                                                    <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelFac" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Clave" ItemStyle-CssClass="ClaveCia">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveFac" Text='<%# Eval("Clave") %>' Width="60px" Font-Size="9.5px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción" ItemStyle-CssClass="DescripcionCia">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="300px" Font-Size="9.5px"></asp:Label>
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

                   </div>--%>
                </div>
                 <div class="row">

                
                   <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            Asegurados
                        </div>
                        <div class="panel-subcontenido">
                            <asp:UpdatePanel runat="server" ID="updAsegurado">
                                <ContentTemplate>
                                   <div class="form-group">
                                    <div class="input-group">
                                       <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="80px">Asegurado: </asp:Label>
                                       <asp:HiddenField runat="server" ID="hidClaveAse"></asp:HiddenField>
                                       <asp:TextBox runat="server" ID="txtSearchAse" CssClass="form-control" Width="260px" Height="26px"></asp:TextBox>
                                         <asp:LinkButton id="btn_AgregarAse" runat="server" class="btn botones">
                                                    <span>
                                                        <img class="btn-añadir"/>
                                                        Añadir
                                                    </span>
                                         </asp:LinkButton>
                                   </div>
                                 </div>
                                 <asp:Panel runat="server" ID="pnlAse" Width="100%" Height="130px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Asegurado" AutoGenerateColumns="false" CssClass="grid-view" HeaderStyle-CssClass="header" DataKeyNames="Clave,Descripcion"  
                                              AlternatingRowStyle-CssClass="altern" GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelAse" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="Clave">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveAse" Text='<%# Eval("Clave") %>' Width="50px" Font-Size="10px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="310px" Font-Size="10px"></asp:Label>
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
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                  
                    </div>
                     <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            Adicionales
                        </div>
                        <div class="panel-subcontenido">
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                    <ContentTemplate>
                                       <br />
                                        <div class="clear padding10"></div>
                                        <table>
                                            <tr>
                                                <td>
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <asp:label runat="server" class="col-md-1 etiqueta-control" Width="120px">No.Siniestro:</asp:label>
                                                            <asp:TextBox runat="server" ID="txt_NoSiniestro" Text="" CssClass="form-control LetraDetalle Derecha" Width="120px" Height="22px"></asp:TextBox>
                                                            <br />
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:120px"></td>
                                                <td>
                                                 <div style="width:100%;  text-align:right">
                                                        <div class="clear padding30"></div>
                                                        <div class="clear padding30"></div>
                                                        <div class="clear padding30"></div>
                                                     <div class="clear padding30"></div>
                                                            <asp:LinkButton id="btn_Buscar" runat="server" class="btn botones BuscaFase">
                                                                <span>
                                                                    <img class="btn-buscar"/>
                                                                    Buscar
                                                                </span>
                                                            </asp:LinkButton>
                                                            <asp:LinkButton id="btn_CancelaFac" runat="server" class="btn botones">
                                                                <span>
                                                                    <img class="btn-cancelar"/>
                                                                    Cancelar
                                                                </span>
                                                            </asp:LinkButton>
                                                    </div>
                                                </td>
                                            </tr>
                                            
                                        </table>
                                          <div class="clear padding30"></div>
                                          <div class="clear padding30"></div>
                                          <div class="clear padding30"></div>
                                    </ContentTemplate>
                                    </asp:UpdatePanel> 
                                </div>
                            </div>
                         </div>

                        </div>

                  </div> 

                <div class="row" >
                    <div class="col-md-12"> 
                        <asp:UpdatePanel runat="server" ID="upSiniestros">
                            <ContentTemplate>
                                 <asp:Panel runat="server" ID="pnlSiniestros" Width="900px"  ScrollBars="None">
                                        <asp:GridView runat="server" ID="gvd_Siniestros" AutoGenerateColumns="false" CssClass="grid-view" HeaderStyle-CssClass="header" 
                                            AlternatingRowStyle-CssClass="altern" GridLines="Horizontal"  ShowHeaderWhenEmpty="true"
                                            DataKeyNames="Clave,Descripcion">
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelAse" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="Clave">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveAse" Text='<%# Eval("Clave") %>' Width="50px" Font-Size="10px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="310px" Font-Size="10px"></asp:Label>
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
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>

      

              </div>



</asp:Content>

