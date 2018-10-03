/// <reference path="../../GUI/Inicio.aspx" />
/// <reference path="../../GUI/Inicio.aspx" />
var WorkSpace = Blockly.inject('blocklyGraficos',
    {
        toolbox: document.getElementById('toolbox'),
        grid:
        {
            spacing: 25,
            length: 3,
            colour: '#ccc',
            snap: true
        },
        zoom:
        {
            controls: true,
            wheel: true
        }
    });
//var codigo = Blockly.JavaScript.workspaceToCode();
var wor = null;
function MostrarCodigo()
{
    var codere = Blockly.JScript.workspaceToCode(wor);
    document.getElementById('compilar').innerHTML = codere;
}
//----------------------------------------------------------------------

'use strict';
function setOutput(text) {
    var output = document.getElementById('importExport');
    output.value = text;
    output.focus();
    output.select();
}

function toPhp() {
    var code = Blockly.JScript.workspaceToCode(WorkSpace);
    setOutput(code);
}

//-----------------------------------------------------------------------

function runCode()
{
    var code = Blockly.JavaScript.workspaceToCode(WorkSpace);
    try {
        eval(code);
    } catch (e) {
        alert(e);
    }
}

//-------------------------------------------------------------------

function ToXml()
{
    var output = document.getElementById('importExport');
    var xml = Blockly.Xml.workspaceToDom(WorkSpace);
    output.value = Blockly.Xml.domToPrettyText(xml);
    output.focus();
    output.select();
}

//-------------------------------------------------------------------

function fromXml() {
    var input = document.getElementById('importExport');
    var xml = Blockly.Xml.textToDom(input.value);
    Blockly.Xml.domToWorkspace(WorkSpace, xml);
}
