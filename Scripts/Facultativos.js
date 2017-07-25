////////////////////////////////////////////////////////////////////EVENTO EXPANDIR-CONTRAER/////////////////////////////////////
//Colapsar Ventana
$("body").on("click", ".contraer", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var id = this.id.substr(this.id.length - 1)
    fn_CambiaEstado(id, "1");
});

//Expandir Ventana
$("body").on("click", ".expandir", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var id = this.id.substr(this.id.length - 1)
    fn_CambiaEstado(id, "0");
});
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////EVENTOS AGREGA CATALOGO/////////////////////////////////////
//Detecta la clase Agregar Broker y abre el Catalogo
$("body").on("click", ".AgregaBroker", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Broker]"), $('[id*=lbl_ClaveBro]'), $('[id*=chk_SelBro]'), false);

    //*************fn_CargaCatalogo(Consulta,Seleccion,TipoSeleccion,IdGrid,PrefijoCatalogo,Titulo)***************
    fn_CargaCatalogo("spS_CatalogosOP ==Bro==,====" + strSel, "Multiple", "gvd_Broker", "Bro", "BROKERS");
});

//Detecta la clase Agregar Compañia y abre el Catalogo
$("body").on("click", ".AgregaCia", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Compañia]"), $('[id*=lbl_ClaveCia]'), $('[id*=chk_SelCia]'), false);

    //*************fn_CargaCatalogo(Consulta,Seleccion,TipoSeleccion,IdGrid,PrefijoCatalogo,Titulo)***************
    fn_CargaCatalogo("spS_CatalogosOP ==Cia==,====" + strSel, "Multiple", "gvd_Compañia", "Cia", "COMPAÑIAS");
});

$("body").on("click", ".AgregaRamoCont", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_RamoContable]"), $('[id*=lbl_ClaveRamC]'), $('[id*=chk_SelRamC]'), true);
    fn_CargaCatalogo("spS_CatalogosOP ==RamC==,====" + strSel, "Multiple", "gvd_RamoContable", "RamC", "RAMOS CONTABLES");
});

$("body").on("click", ".AgregaProducto", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Producto]"), $('[id*=lbl_ClavePro]'), $('[id*=chk_SelPro]'), true);
    fn_CargaCatalogo("spS_CatalogosOP ==Pro==,====" + strSel, "Multiple", "gvd_Producto", "Pro", "PRODUCTOS");
});

$("body").on("click", ".AgregaUsuario", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Usuario]"), $('[id*=lbl_ClaveUsu]'), $('[id*=chk_SelUsu]'), true);
    fn_CargaCatalogo("spS_CatalogosOP ==Usu==,====" + strSel, "Multiple", "gvd_Usuario", "Usu", "USUARIOS");
});

$("body").on("click", ".AgregaEstatus", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Estatus]"), $('[id*=lbl_ClaveEst]'), $('[id*=chk_SelEst]'), true);
    fn_CargaCatalogo("spS_CatalogosOP ==Est==,====" + strSel, "Multiple", "gvd_Estatus", "Est", "ESTATUS");
});

$("body").on("click", ".AgregaContrato", function () {
    var Condicion = "";

    //Fechas de Vigencia
    if ($("input[id$='txt_FechaDe']")[0].value.length == 10) {
        var Fecha1 = $("input[id$='txt_FechaDe']")[0].value;
        FechaDe = Fecha1.substring(6, 10) + Fecha1.substring(3, 5) + Fecha1.substring(0, 2);
        Condicion = " AND fecha_fac >= ====" + FechaDe + "====";
    }

    if ($("input[id$='txt_FechaA']")[0].value.length == 10) {
        var Fecha2 = $("input[id$='txt_FechaA']")[0].value;
        FechaA = Fecha2.substring(6, 10) + Fecha2.substring(3, 5) + Fecha2.substring(0, 2);
        Condicion = Condicion + " AND fecha_fac <= ====" + FechaA + "====";
    }


    var Brks = '-1';
    if ($("[id*=gvd_Broker]")[0] != undefined) {
        var Rows = $("[id*=gvd_Broker]")[0].rows;
        for (i = 0; i <= Rows.length - 2; i++) {
            if ($('[id*=chk_SelBro]')[i].value != "true") {
                Brks = Brks + ',' + $('[id*=lbl_ClaveBro]')[i].innerText;
            }
        }
    }

    if (Brks != '-1') {
        Condicion = Condicion + ' AND mr.cod_broker IN (' + Brks + ')'
    }

    var Cias = '-1';
    if ($("[id*=gvd_Compañia]")[0] != undefined) {
        var Rows = $("[id*=gvd_Compañia]")[0].rows;
        for (i = 0; i <= Rows.length - 2; i++) {
            if ($('[id*=chk_SelCia]')[i].value != "true") {
                Cias = Cias + ',' + $('[id*=lbl_ClaveCia]')[i].innerText;
            }
        }
    }

    if (Cias != '-1') {
        Condicion = Condicion + ' AND mr.cod_cia IN (' + Cias + ')'
    }

    if (Condicion.length == 0) {
        Condicion = "====";
    }
    else {
        Condicion = "==" + Condicion + "==";
    }

    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Contrato]"), $('[id*=lbl_ClaveFac]'), $('[id*=chk_SelFac]'), true);
    fn_CargaCatalogo("spS_CatalogosOP ==Fac==," + Condicion + strSel, "Multiple", "gvd_Contrato", "Fac", "FACULTATIVOS");
});
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////EVENTOS BORRA CATALOGO//////////////////////////////////////
//Delete event handler.
$("body").on("click", "[id*=gvd_Broker] .Delete", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var row = $(this).closest("tr");
    $('[id*=chk_SelBro]')[row[0].rowIndex - 1].value = "true";
    row.hide();
    return false;
});

//Delete event handler.
$("body").on("click", "[id*=gvd_Compañia] .Delete", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var row = $(this).closest("tr");
    $('[id*=chk_SelCia]')[row[0].rowIndex - 1].value = "true";
    row.hide();
    return false;
});

//Delete event handler.
$("body").on("click", "[id*=gvd_RamoContable] .Delete", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var row = $(this).closest("tr");
    $('[id*=chk_SelRamC]')[row[0].rowIndex - 1].value = "true";
    row.hide();
    return false;
});

//Delete event handler.
$("body").on("click", "[id*=gvd_Producto] .Delete", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var row = $(this).closest("tr");
    $('[id*=chk_SelPro]')[row[0].rowIndex - 1].value = "true";
    row.hide();
    return false;
});

//Delete event handler.
$("body").on("click", "[id*=gvd_Usuario] .Delete", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var row = $(this).closest("tr");
    $('[id*=chk_SelUsu]')[row[0].rowIndex - 1].value = "true";
    row.hide();
    return false;
});

//Delete event handler.
$("body").on("click", "[id*=gvd_Estatus] .Delete", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var row = $(this).closest("tr");
    $('[id*=chk_SelEst]')[row[0].rowIndex - 1].value = "true";
    row.hide();
    return false;
});

//Delete event handler.
$("body").on("click", "[id*=gvd_Contrato] .Delete", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var row = $(this).closest("tr");
    $('[id*=chk_SelFac]')[row[0].rowIndex - 1].value = "true";
    row.hide();
    return false;
});

//Delete event handler.
$("body").on("click", "[id*=gvd_Poliza] .Delete", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var row = $(this).closest("tr");
    $('[id*=chk_SelPol]')[row[0].rowIndex - 1].value = "true";
    row.hide();
    return false;
});

//Delete event handler.
$("body").on("click", "[id*=gvd_Asegurado] .Delete", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var row = $(this).closest("tr");
    $('[id*=chk_SelAse]')[row[0].rowIndex - 1].value = "true";
    row.hide();
    return false;
});

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                           EVENTOS KEYDOWN


$("body").on("keydown", "[id$=txtSearchAse]", function (e) {
   
    if (e.which != 13) {
        $("input[id$='hidClaveAse']")[0].value = "";
    }

    $('[id$=txtSearchAse]').autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "../LocalServices/ConsultaBD.asmx/GetAsegurado",
                data: "{ 'prefix': '" + request.term + "'}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return {
                            label: item.split('|')[0],
                            val: item.split('|')[1]
                        }
                    }))
                },
                error: function (response) {
                    EvaluaMensaje('JSON', response.responseText);
                },
            });
        },
        select: function (e, i) {
            $("input[id$='hidClaveAse']")[0].value = i.item.val;
        },
        minLength: 1
    });
});

