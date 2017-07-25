﻿
$(document).ready(function () {
    PageLoad();
});

function PageLoad() {
    

    var options = {
        now: $("input[id$='hid_hora']")[0].value,
        //upArrow: 'wickedpicker__controls__control-up',
        //downArrow: 'wickedpicker__controls__control-down',
        //hoverState: 'hover-state',
        title: 'Hora de Proceso'
    };
    $('.timepicker').wickedpicker(options);


    $("input[id$='txtClaveFas']").focusout(function () {
        var Id = $("input[id$='txtClaveFas']")[0].value;
        if (Id == "") {
            Id = 10000; //Coloca un número de compañia inexistente
        }
        $.ajax({
            url: "../LocalServices/ConsultaBD.asmx/GetFase",
            data: "{ 'Id': " + Id + "}",
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                $("input[id$='txtSearchFas']")[0].value = data.d;
            },
            error: function (response) {
                alert(response.responseText);
                fn_MuestraMensaje('Error', response.responseText, 3, "")
            },
        });
    });

    $("input[id$='txtClaveSec']").focusout(function () {
        var Id = $("input[id$='txtClaveSec']")[0].value;
        if (Id == "") {
            Id = 10000; //Coloca un número de compañia inexistente
        }
        $.ajax({
            url: "../LocalServices/ConsultaBD.asmx/GetDeptos",
            data: "{ 'Id': " + Id + "}",
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                $("input[id$='txtSearchSec']")[0].value = data.d;
            },
            error: function (response) {
                alert(response.responseText);
                fn_MuestraMensaje('Error', response.responseText, 3, "")
            },
        });
    });

}



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
    

//Detecta evento de Confirmación en Controles con dicha Clase
$("body").on("click", ".Confirmacion", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    var row = $(this).closest("tr");
    $("input[id$='hid_Clave']")[0].value = row[0].rowIndex;
    if (this.name == '') {
        var id = '';
        id = this.id;
        this.name = id.replace('cph_principal_', 'ctl00$cph_principal$');
    }
    fn_MuestraMensaje('Confirmación', '¿Esta seguro de continuar con la operación?', 3, this.name)
    return false;
});


$("body").on("click", ".NuevaFase", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    fn_AbrirModal('#GuardaFaseModal');
});

$("body").on("click", ".NuevoNivel", function () {
    event.preventDefault ? event.preventDefault() : event.returnValue = false;
    fn_AbrirModal('#GuardaNivelModal');
});


$("body").on("click", ".BuscaEst", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Estatus]"), $('[id*=lbl_ClaveSts]'), $('[id*=chk_SelSts]'), false);
    var Id = $("input[id$='txtClaveFas']")[0].value;
    var Condicion = ' WHERE id_Fase = ' + Id
    fn_CargaCatalogo("spS_CatalogosOP ==Sts==" + ",==" + Condicion + "==" + strSel, "Multiple", "gvd_Estatus", "Sts", "Estatus de Siniestro");
});

$("body").on("click", ".BuscaAvU", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Usuarios]"), $('[id*=lbl_ClaveAvU]'), $('[id*=chk_SelAvU]'), false);
    var Id = $("input[id$='txtClaveSec']")[0].value;
    var Condicion = ' WHERE ts.cod_sector = ' + Id
    fn_CargaCatalogo("spS_CatalogosOP ==AvU==" + ",==" + Condicion + "==" + strSel, "Multiple", "gvd_Usuarios", "Sec", "Aviso a Usuarios");
});


//Detecta la clase Agregar Broker y abre el Catalogo
$("body").on("click", ".BuscaFase", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Fase]"), $('[id*=lbl_ClaveFas]'), $('[id*=chk_SelFas]'), false);
    //*************fn_CargaCatalogo(Consulta,Seleccion,TipoSeleccion,IdGrid,PrefijoCatalogo,Titulo)***************
    fn_CargaCatalogo("spS_CatalogosOP ==Fas==,====" + strSel, "Multiple", "gvd_Fase", "Fas", "FASES DE RECUPERACION");
});

$("body").on("click", ".BuscaNivel", function () {
    var strSel = fn_ElementosSeleccionados($("[id*=gvd_Nivel]"), $('[id*=lbl_ClaveNiv]'), $('[id*=chk_SelNiv]'), false);
    //*************fn_CargaCatalogo(Consulta,Seleccion,TipoSeleccion,IdGrid,PrefijoCatalogo,Titulo)***************
    fn_CargaCatalogo("spS_CatalogosOP ==Niv==,====" + strSel, "Multiple", "gvd_Nivel", "Niv", "NIVELES DE RECORDATORIO");
});

$("body").on("click", "#btn_SelFas", function () {
    //*************fn_CargaCatalogo(Consulta,Seleccion,TipoSeleccion,IdGrid,PrefijoCatalogo,Titulo)***************
    fn_CargaCatalogo("spS_CatalogosOP ==Fas==,====", "Unica", "txtClaveFas|txtSearchFas|gvd_Estatus", "Fas", "Fases");
});

$("body").on("click", "#btn_SelSec", function () {
    //*************fn_CargaCatalogo(Consulta,Seleccion,TipoSeleccion,IdGrid,PrefijoCatalogo,Titulo)***************
    fn_CargaCatalogo("spS_CatalogosOP ==Sec==,====", "Unica", "txtClaveSec|txtSearchSec|gvd_Usuarios", "Sec", "Departamentos");
});




