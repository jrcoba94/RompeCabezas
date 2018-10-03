<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Master.Master" AutoEventWireup="true" CodeBehind="Traductor.aspx.cs" Inherits="StartBlocklyALPHA.GUI.Traductor" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="col-lg-12"">
        <a href="Proyectos.aspx" >Volver a proyectos..</a>
        <h3 style="font-weight:bold">Traductor Blockly</h3>
        <br />
        <div class="col-lg-6" id="blocklyGraficos" style="width: 650px; height: 650px">
            <asp:Xml ID="toolbox" style="display: none">
                <h2>Bloques</h2>
                        <category name="Lógicos" style="background-color:#ffd800">
                           <block type="controls_if"></block>
                           <block type="logic_compare"></block>
                           <block type="logic_operation"></block>
                           <block type="logic_negate"></block>
                           <block type="logic_boolean"></block>
                           <block type="logic_null"></block>
                           <block type="logic_ternary"></block>
                        </category>
                        <category name="Secuencias" style="background-color:#ff6a00">
                            <block type="controls_repeat_ext"><value name="TIMES"><shadow type="math_number"><field name="NUM">10</field></shadow></value></block>
                            <block type="controls_whileUntil"></block>
                            <block type="controls_for"><field name="VAR">i</field><value name="FROM"><shadow type="math_number"><field name="NUM">1</field></shadow></value><value name="TO"><shadow type="math_number"><field name="NUM">10</field></shadow></value><value name="BY"><shadow type="math_number"><field name="NUM">1</field></shadow></value></block>
                            <block type="controls_forEach"><field name="VAR">j</field></block>
                            <block type="controls_flow_statements"><field name="FLOW">BREAK</field></block>  
                        </category>
                        <category name="Matemáticos">
                           <block type="math_number"><field name="NUM">0</field></block>
                           <block type="math_arithmetic"><field name="OP">ADD</field><value name="A"><shadow type="math_number"><field name="NUM">1</field></shadow></value><value name="B"><shadow type="math_number"><field name="NUM">1</field></shadow></value></block>                          
                           <block type="math_single"><field name="OP">ROOT</field><value name="NUM"><shadow type="math_number"><field name="NUM">9</field></shadow></value></block>
                           <block type="math_trig"><field name="OP">SIN</field><value name="NUM"><shadow type="math_number"><field name="NUM">45</field></shadow></value></block>
                           <block type="math_constant"><field name="CONSTANT">PI</field></block>
                           <block type="math_number_property"><mutation divisor_input="false"></mutation><field name="PROPERTY">EVEN</field><value name="NUMBER_TO_CHECK"><shadow type="math_number"><field name="NUM">0</field></shadow></value></block>
                           <block type="math_change"><field name="VAR">item</field><value name="DELTA"><shadow type="math_number"><field name="NUM">1</field></shadow></value></block>
                           <block type="math_round"><field name="OP">ROUND</field><value name="NUM"><shadow type="math_number"><field name="NUM">3.1</field></shadow></value></block>
                           <block type="math_on_list"><mutation op="SUM"></mutation><field name="OP">SUM</field></block>
                           <block type="math_modulo"><value name="DIVIDEND"><shadow type="math_number"><field name="NUM">64</field></shadow></value><value name="DIVISOR"><shadow type="math_number"><field name="NUM">10</field></shadow></value></block>
                           <block type="math_constrain"><value name="VALUE"><shadow type="math_number"><field name="NUM">50</field></shadow></value><value name="LOW"><shadow type="math_number"><field name="NUM">1</field></shadow></value><value name="HIGH"><shadow type="math_number"><field name="NUM">100</field></shadow></value></block>
                           <block type="math_random_int"><value name="FROM"><shadow type="math_number"><field name="NUM">1</field></shadow></value><value name="TO"><shadow type="math_number"><field name="NUM">100</field></shadow></value></block>
                           <block type="math_random_float"></block>
                        </category>
                        <category name="Texto">
                             <block type="text"><field name="TEXT"></field></block>
                             <block type="text_join"><mutation items="2"></mutation></block>
                             <block type="text_append"><field name="VAR">item</field><value name="TEXT"><shadow type="text"><field name="TEXT"></field></shadow></value></block>
                             <block type="text_length"><value name="VALUE"><shadow type="text"><field name="TEXT">abc</field></shadow></value></block>
                             <block type="text_isEmpty"><value name="VALUE"><shadow type="text"><field name="TEXT"></field></shadow></value></block>
                             <block type="text_indexOf"><field name="END">FIRST</field><value name="VALUE"><block type="variables_get"><field name="VAR">text</field></block></value><value name="FIND"><shadow type="text"><field name="TEXT">abc</field></shadow></value></block>
                             <block type="text_charAt"><mutation at="true"></mutation><field name="WHERE">FROM_START</field><value name="VALUE"><block type="variables_get"><field name="VAR">text</field></block></value></block>
                             <block type="text_getSubstring"><mutation at1="true" at2="true"></mutation><field name="WHERE1">FROM_START</field><field name="WHERE2">FROM_START</field><value name="STRING"><block type="variables_get"><field name="VAR">text</field></block></value></block><block type="text_getSubstring" x="12" y="138"><mutation at1="true" at2="true"></mutation><field name="WHERE1">FROM_START</field><field name="WHERE2">FROM_START</field><value name="STRING"><block type="variables_get"><field name="VAR">text</field></block></value></block>
                             <block type="text_changeCase"><field name="CASE">UPPERCASE</field><value name="TEXT"><shadow type="text"><field name="TEXT">abc</field></shadow></value></block>
                             <block type="text_trim"><field name="MODE">BOTH</field><value name="TEXT"><shadow type="text"><field name="TEXT">abc</field></shadow></value></block>
                             <block type="text_print"><value name="TEXT"><shadow type="text"><field name="TEXT">abc</field></shadow></value></block>
                             <block type="text_prompt_ext"><mutation type="TEXT"></mutation><field name="TYPE">TEXT</field><value name="TEXT"><shadow type="text"><field name="TEXT">abc</field></shadow></value></block>
                        </category>
                        <category name="Listas">
                             <block type="lists_create_with"><mutation items="0"></mutation></block>
                             <block type="lists_create_with"><mutation items="3"></mutation></block>
                             <block type="lists_repeat"><value name="NUM"><shadow type="math_number"><field name="NUM">5</field></shadow></value></block>
                             <block type="lists_length"></block>
                             <block type="lists_isEmpty"></block>
                             <block type="lists_indexOf"><field name="END">FIRST</field><value name="VALUE"><block type="variables_get"><field name="VAR">list</field></block></value></block>
                             <block type="lists_getIndex"><mutation statement="false" at="true"></mutation><field name="MODE">GET</field><field name="WHERE">FROM_START</field><value name="VALUE"><block type="variables_get"><field name="VAR">list</field></block></value></block>
                             <block type="lists_setIndex"><mutation at="true"></mutation><field name="MODE">SET</field><field name="WHERE">FROM_START</field><value name="LIST"><block type="variables_get"><field name="VAR">list</field></block></value></block>
                             <block type="lists_getSublist"><mutation at1="true" at2="true"></mutation><field name="WHERE1">FROM_START</field><field name="WHERE2">FROM_START</field><value name="LIST"><block type="variables_get"><field name="VAR">list</field></block></value></block>
                             <block type="lists_split"><mutation mode="SPLIT"></mutation><field name="MODE">SPLIT</field><value name="DELIM"><shadow type="text"><field name="TEXT">,</field></shadow></value></block>
                        </category>
                        <category name="Colores">
                             <block type="colour_picker"><field name="COLOUR">#ff0000</field></block>
                             <block type="colour_random"></block>
                             <block type="colour_rgb"><value name="RED"><shadow type="math_number"><field name="NUM">100</field></shadow></value><value name="GREEN"><shadow type="math_number"><field name="NUM">50</field></shadow></value><value name="BLUE"><shadow type="math_number"><field name="NUM">0</field></shadow></value></block>
                             <block type="colour_blend"><value name="COLOUR1"><shadow type="colour_picker"><field name="COLOUR">#ff0000</field></shadow></value><value name="COLOUR2"><shadow type="colour_picker"><field name="COLOUR">#3333ff</field></shadow></value><value name="RATIO"><shadow type="math_number"><field name="NUM">0.5</field></shadow></value></block>
                        </category>
                        <category name="Variables">
                            <block type="variables_set"><field name="VAR">item</field></block>
                            <block type="variables_get"><field name="VAR">item</field></block>
                        </category>
                        <category name="Funciones">
                            <block type="procedures_defnoreturn"><field name="NAME">do something</field></block>
                            <block type="procedures_defreturn"><field name="NAME">do something2</field></block>
                            <block type="procedures_ifreturn"><mutation value="1"></mutation></block>
                        </category>
            </asp:Xml>
        </div>
        <div class="col-lg-2" style="width:60px"></div>
        <div class="col-lg-4" style="width:500px; height:700px">
            <input type="button" onclick="toPhp()" value="Mostrar código" style="width:153px;height:40px; text-anchor:middle"/>
            <input type="button" value="Correr" onclick="runCode()" style="width:153px;height:40px; text-anchor:middle"/>
            <input type="button" value="Guardar" onclick="guarB()" style="width:153px;height:40px; text-anchor:middle"/>
            <input type="button" id="boton-txt" value="Descargar Código" style="width: 153px; height: 40px; text-anchor: middle" />&nbsp;<input type="button" id="boton-xml" value="Descargar Código XML" style="width: 153px; height: 40px; text-anchor: middle" />
            <br />
            <asp:Label ID="lblNameProj" runat="server" Style="font-weight: 500; font-size:large" Text="Nombre del Proyecto:"></asp:Label>
            &nbsp;
            <asp:TextBox ID="txtNombre" runat="server" TabIndex="1" Width="288px"></asp:TextBox>
            <br /><br />
            <textarea id="importExport" style="width:468px;height:530px; text-wrap:normal" disabled="disabled"></textarea>

            <%-- elementos para el almacenamiento del codigo --%>
            <asp:TextBox ID="txtExportBlocks" Name="savBk" hidden="hidden" runat="server" CausesValidation="false" EnableViewState="false"></asp:TextBox>
            <asp:Button ID="btnSave" runat="server" style="display:none" Text="Button" OnClick="btnSave_Click"/>
        </div>
    </div>
    <br /><br /><br /><br /><br /><br /><br /><br />
    <br /><br /><br /><br /><br /><br /><br /><br />
    <br /><br /><br /><br /><br /><br /><br /><br />
    <br /><br /><br /><br /><br /><br /><br /><br />
    <br /><br /><br /><br /><br /><br /><br /><br />

    <script src="../Recursos/js/codigo.js"></script>
    <script src="../Recursos/js/en.js"></script>

    <script src="../JSspanish/JScript.js"></script>
    <script src="../JSspanish/JScript/colour.js"></script>
    <script src="../JSspanish/JScript/lists.js"></script>
    <script src="../JSspanish/JScript/logic.js"></script>
    <script src="../JSspanish/JScript/loops.js"></script>
    <script src="../JSspanish/JScript/math.js"></script>
    <script src="../JSspanish/JScript/procedures.js"></script>
    <script src="../JSspanish/JScript/text.js"></script>
    <script src="../JSspanish/JScript/variables.js"></script>
    <script src="../Archives/core/xml.js"></script>
    <script src="../Archives/core/generator.js"></script>
    
    <script>
    function guarB() {
             var blockXML = Blockly.Xml.workspaceToDom(WorkSpace);
             var concer = Blockly.Xml.domToText(blockXML);
             $("#ContentPlaceHolder1_txtExportBlocks").val(concer);
             $("#ContentPlaceHolder1_btnSave").click();
    }

    Blockly.Xml.workspaceToDom = function (workspace) {
        var width;  // Not used in LTR.
        if (workspace.RTL) {
            width = workspace.getWidth();
        }
        var xml = goog.dom.createDom('xml');
        var blocks = workspace.getTopBlocks(true);
        for (var i = 0, block; block = blocks[i]; i++) {
            var element = Blockly.Xml.blockToDom_(block);
            var xy = block.getRelativeToSurfaceXY();
            element.setAttribute('x', Math.round(workspace.RTL ? width - xy.x : xy.x));
            element.setAttribute('y', Math.round(xy.y));
            xml.appendChild(element);
        }
        return xml;
    };

    Blockly.Xml.domToText = function (dom) {
        var oSerializer = new XMLSerializer();
        return oSerializer.serializeToString(dom);
    };

    //Descargar código en txt y xml

    function descargarArchivo(contenidoEnBlob, nombreArchivo) {
        var reader = new FileReader();
        reader.onload = function (event) {
            var save = document.createElement('a');
            save.href = event.target.result;
            save.target = '_blank';
            save.download = nombreArchivo || 'archivo.dat';
            var clicEvent = new MouseEvent('click', {
                'view': window,
                'bubbles': true,
                'cancelable': true
            });
            save.dispatchEvent(clicEvent);
            (window.URL || window.webkitURL).revokeObjectURL(save.href);
        };
        reader.readAsDataURL(contenidoEnBlob);
    };

    //Función de ayuda: reúne los datos a exportar en un solo objeto
    function obtenerDatos() {
        return {
            nombre: document.getElementById('importExport').value,
            //telefono: document.getElementById('textTelefono').value,
            //fecha: (new Date()).toLocaleDateString()
        };
    };

    //Función de ayuda: "escapa" las entidades XML necesarias
    //para los valores (y atributos) del archivo XML
    function escaparXML(cadena) {
        if (typeof cadena !== 'string') {
            return '';
        };
        cadena = cadena.replace('&', '&amp;')
            .replace('<', '&lt;')
            .replace('>', '&gt;')
            .replace('"', '&quot;');
        return cadena;
    };

    //Genera un objeto Blob con los datos en un archivo TXT
    function generarTexto(datos) {
        var texto = [];
        //texto.push('Datos Personales:\n');
        //texto.push('Nombre: ');
        texto.push(datos.nombre);
        texto.push('\n');
        //texto.push('Teléfono: ');
        //texto.push(datos.telefono);
        //texto.push('\n');
        //texto.push('Fecha: ');
        //texto.push(datos.fecha);
        texto.push('\n');
        //El contructor de Blob requiere un Array en el primer parámetro
        //así que no es necesario usar toString. el segundo parámetro
        //es el tipo MIME del archivo
        return new Blob(texto, {
            type: 'text/plain'
        });
    };


    //Genera un objeto Blob con los datos en un archivo XML
    function generarXml(datos) {
        var texto = [];
        texto.push('<?xml version="1.0" encoding="UTF-8" ?>\n');
        texto.push('<datos>\n');
        //texto.push('\t<nombre>');
        texto.push(escaparXML(datos.nombre));
        //texto.push('</nombre>\n');
        //texto.push('\t<telefono>');
        //texto.push(escaparXML(datos.telefono));
        //texto.push('</telefono>\n');
        //texto.push('\t<fecha>');
        //texto.push(escaparXML(datos.fecha));
        //texto.push('</fecha>\n');
        texto.push('</datos>');
        //No olvidemos especificar el tipo MIME correcto :)
        return new Blob(texto, {
            type: 'application/xml'
        });
    };

    document.getElementById('boton-xml').addEventListener('click', function () {
        var datos = obtenerDatos();
        descargarArchivo(generarXml(datos), 'archivo.xml');
    }, false);

    document.getElementById('boton-txt').addEventListener('click', function () {
        var datos = obtenerDatos();
        descargarArchivo(generarTexto(datos), 'archivo.txt');
    }, false);
    </script>

</asp:Content>
