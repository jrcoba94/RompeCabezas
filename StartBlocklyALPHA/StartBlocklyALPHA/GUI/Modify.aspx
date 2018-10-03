<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Master.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="StartBlocklyALPHA.GUI.Modify" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="col-lg-12"">
        
        <h3 style="font-weight:bold">Traductor Blockly </h3><a href="Proyectos.aspx" >Volver a proyectos..</a>
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

            <%-- elemento para cargar el proyecto --%>
            <asp:TextBox ID="txtBolck" runat="server" ValidateRequestMode="Disabled" EnableViewState="false" CausesValidation="false" hidden="hidden"></asp:TextBox>
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

    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="../Archives/core/generator.js"></script>
    <script src="../Archives/core/xml.js"></script>

    
    <script>
        $(window).load(function () {
            var srt = $("#ContentPlaceHolder1_txtBolck").val();
            var xml = Blockly.Xml.textToDom(srt);
            Blockly.Xml.domToWorkspace(WorkSpace, xml);
        })

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

        function fromXmlBLOCK() {
            var input = document.getElementById('blokck');
            var xml = Blockly.Xml.textToDom(input.value);
            Blockly.Xml.domToWorkspace(xml);
        };

        Blockly.Xml.blockToDom_ = function (block) {
            var element = goog.dom.createDom(block.isShadow() ? 'shadow' : 'block');
            element.setAttribute('type', block.type);
            if (Blockly.Realtime.isEnabled()) {
                // Only used by realtime.
                element.setAttribute('id', block.id);
            }
            if (block.mutationToDom) {
                // Custom data for an advanced block.
                var mutation = block.mutationToDom();
                if (mutation && (mutation.hasChildNodes() || mutation.hasAttributes())) {
                    element.appendChild(mutation);
                }
            }
            function fieldToDom(field) {
                if (field.name && field.EDITABLE) {
                    var container = goog.dom.createDom('field', null, field.getValue());
                    container.setAttribute('name', field.name);
                    element.appendChild(container);
                }
            }
            for (var i = 0, input; input = block.inputList[i]; i++) {
                for (var j = 0, field; field = input.fieldRow[j]; j++) {
                    fieldToDom(field);
                }
            }

            var commentText = block.getCommentText();
            if (commentText) {
                var commentElement = goog.dom.createDom('comment', null, commentText);
                if (typeof block.comment == 'object') {
                    commentElement.setAttribute('pinned', block.comment.isVisible());
                    var hw = block.comment.getBubbleSize();
                    commentElement.setAttribute('h', hw.height);
                    commentElement.setAttribute('w', hw.width);
                }
                element.appendChild(commentElement);
            }

            if (block.data) {
                // Optional text data that round-trips beween blocks and XML.
                // Has no effect.  May be used by 3rd parties for meta information.
                var dataElement = goog.dom.createDom('data', null, block.data);
                element.appendChild(dataElement);
            }

            for (var i = 0, input; input = block.inputList[i]; i++) {
                var container;
                var empty = true;
                if (input.type == Blockly.DUMMY_INPUT) {
                    continue;
                } else {
                    var childBlock = input.connection.targetBlock();
                    if (input.type == Blockly.INPUT_VALUE) {
                        container = goog.dom.createDom('value');
                    } else if (input.type == Blockly.NEXT_STATEMENT) {
                        container = goog.dom.createDom('statement');
                    }
                    var shadow = input.connection.getShadowDom();
                    if (shadow && (!childBlock || !childBlock.isShadow())) {
                        container.appendChild(Blockly.Xml.cloneShadow_(shadow));
                    }
                    if (childBlock) {
                        container.appendChild(Blockly.Xml.blockToDom_(childBlock));
                        empty = false;
                    }
                }
                container.setAttribute('name', input.name);
                if (!empty) {
                    element.appendChild(container);
                }
            }
            if (block.inputsInlineDefault != block.inputsInline) {
                element.setAttribute('inline', block.inputsInline);
            }
            if (block.isCollapsed()) {
                element.setAttribute('collapsed', true);
            }
            if (block.disabled) {
                element.setAttribute('disabled', true);
            }
            if (!block.isDeletable() && !block.isShadow()) {
                element.setAttribute('deletable', false);
            }
            if (!block.isMovable() && !block.isShadow()) {
                element.setAttribute('movable', false);
            }
            if (!block.isEditable()) {
                element.setAttribute('editable', false);
            }

            var nextBlock = block.getNextBlock();
            if (nextBlock) {
                var container = goog.dom.createDom('next', null,
                    Blockly.Xml.blockToDom_(nextBlock));
                element.appendChild(container);
            }
            var shadow = block.nextConnection && block.nextConnection.getShadowDom();
            if (shadow && (!nextBlock || !nextBlock.isShadow())) {
                container.appendChild(Blockly.Xml.cloneShadow_(shadow));
            }

            return element;
        };

        Blockly.Xml.cloneShadow_ = function (shadow) {
            shadow = shadow.cloneNode(true);
            // Walk the tree looking for whitespace.  Don't prune whitespace in a tag.
            var node = shadow;
            var textNode;
            while (node) {
                if (node.firstChild) {
                    node = node.firstChild;
                } else {
                    while (node && !node.nextSibling) {
                        textNode = node;
                        node = node.parentNode;
                        if (textNode.nodeType == 3 && textNode.data.trim() == '' &&
                            node.firstChild != textNode) {
                            // Prune whitespace after a tag.
                            goog.dom.removeNode(textNode);
                        }
                    }
                    if (node) {
                        textNode = node;
                        node = node.nextSibling;
                        if (textNode.nodeType == 3 && textNode.data.trim() == '') {
                            // Prune whitespace before a tag.
                            goog.dom.removeNode(textNode);
                        }
                    }
                }
            }
            return shadow;
        };

        Blockly.Xml.textToDom = function (text) {
            var oParser = new DOMParser();
            var dom = oParser.parseFromString(text, 'text/xml');
            //The DOM should have one and only one top-level node, an XML tag.
            if (!dom || !dom.firstChild ||
                dom.firstChild.nodeName.toLowerCase() != 'xml' ||
                dom.firstChild !== dom.lastChild) {
                // Whatever we got back from the parser is not XML.
                //throw 'Blockly.Xml.textToDom did not obtain a valid XML tree.';
            }
            return dom.firstChild;
        };

        Blockly.Xml.domToWorkspace = function (workspace, xml) {
            var width;  // Not used in LTR.
            if (workspace.RTL) {
                width = workspace.getWidth();
            }
            Blockly.Field.startCache();
            //Safari 7.1.3 is known to provide node lists with extra references to
            //children beyond the lists' length.  Trust the length, do not use the
            //looping pattern of checking the index for an object.
            var childCount = xml.childNodes.length;
            for (var i = 0; i < childCount; i++) {
                var xmlChild = xml.childNodes[i];
                var name = xmlChild.nodeName.toLowerCase();
                if (name == 'block' || name == 'shadow') {
                    var block = Blockly.Xml.domToBlock(workspace, xmlChild);
                    var blockX = parseInt(xmlChild.getAttribute('x'), 10);
                    var blockY = parseInt(xmlChild.getAttribute('y'), 10);
                    if (!isNaN(blockX) && !isNaN(blockY)) {
                        block.moveBy(workspace.RTL ? width - blockX : blockX, blockY);
                    }
                }
            }
            Blockly.Field.stopCache();
        };

        Blockly.Xml.domToBlock = function (workspace, xmlBlock, opt_reuseBlock) {
            // Create top-level block.
            var topBlock = Blockly.Xml.domToBlockHeadless_(workspace, xmlBlock,
                                                           opt_reuseBlock);
            if (workspace.rendered) {
                // Hide connections to speed up assembly.
                topBlock.setConnectionsHidden(true);
                // Generate list of all blocks.
                var blocks = topBlock.getDescendants();
                // Render each block.
                for (var i = blocks.length - 1; i >= 0; i--) {
                    blocks[i].initSvg();
                }
                for (var i = blocks.length - 1; i >= 0; i--) {
                    blocks[i].render(false);
                }
                // Populating the connection database may be defered until after the blocks
                // have renderend.
                setTimeout(function () {
                    if (topBlock.workspace) {  // Check that the block hasn't been deleted.
                        topBlock.setConnectionsHidden(false);
                    }
                }, 1);
                topBlock.updateDisabled();
                // Fire an event to allow scrollbars to resize.
                Blockly.fireUiEvent(window, 'resize');
            }
            return topBlock;
        };

        Blockly.Xml.domToBlockHeadless_ =

        function (workspace, xmlBlock, opt_reuseBlock) {
            var block = null;
            var prototypeName = xmlBlock.getAttribute('type');
            if (!prototypeName) {
                throw 'Block type unspecified: \n' + xmlBlock.outerHTML;
            }
            var id = xmlBlock.getAttribute('id');
            if (opt_reuseBlock && id) {
                // Only used by realtime.
                block = Blockly.Block.getById(id, workspace);
                // TODO: The following is for debugging.  It should never actually happen.
                if (!block) {
                    throw 'Couldn\'t get Block with id: ' + id;
                }
                var parentBlock = block.getParent();
                // If we've already filled this block then we will dispose of it and then
                // re-fill it.
                if (block.workspace) {
                    block.dispose(true, false, true);
                }
                block.fill(workspace, prototypeName);
                block.parent_ = parentBlock;
            } else {
                block = Blockly.Block.obtain(workspace, prototypeName);
            }

            var blockChild = null;
            for (var i = 0, xmlChild; xmlChild = xmlBlock.childNodes[i]; i++) {
                if (xmlChild.nodeType == 3) {
                    // Ignore any text at the <block> level.  It's all whitespace anyway.
                    continue;
                }
                var input;

                // Find any enclosed blocks or shadows in this tag.
                var childBlockNode = null;
                var childShadowNode = null;
                var shadowActive = false;
                for (var j = 0, grandchildNode; grandchildNode = xmlChild.childNodes[j];
                     j++) {
                    if (grandchildNode.nodeType == 1) {
                        if (grandchildNode.nodeName.toLowerCase() == 'block') {
                            childBlockNode = grandchildNode;
                        } else if (grandchildNode.nodeName.toLowerCase() == 'shadow') {
                            childShadowNode = grandchildNode;
                        }
                    }
                }
                // Use the shadow block if there is no child block.
                if (!childBlockNode && childShadowNode) {
                    childBlockNode = childShadowNode;
                    shadowActive = true;
                }

                var name = xmlChild.getAttribute('name');
                switch (xmlChild.nodeName.toLowerCase()) {
                    case 'mutation':
                        // Custom data for an advanced block.
                        if (block.domToMutation) {
                            block.domToMutation(xmlChild);
                            if (block.initSvg) {
                                // Mutation may have added some elements that need initalizing.
                                block.initSvg();
                            }
                        }
                        break;
                    case 'comment':
                        block.setCommentText(xmlChild.textContent);
                        var visible = xmlChild.getAttribute('pinned');
                        if (visible) {
                            // Give the renderer a millisecond to render and position the block
                            // before positioning the comment bubble.
                            setTimeout(function () {
                                if (block.comment && block.comment.setVisible) {
                                    block.comment.setVisible(visible == 'true');
                                }
                            }, 1);
                        }
                        var bubbleW = parseInt(xmlChild.getAttribute('w'), 10);
                        var bubbleH = parseInt(xmlChild.getAttribute('h'), 10);
                        if (!isNaN(bubbleW) && !isNaN(bubbleH) &&
                            block.comment && block.comment.setVisible) {
                            block.comment.setBubbleSize(bubbleW, bubbleH);
                        }
                        break;
                    case 'data':
                        // Optional text data that round-trips beween blocks and XML.
                        // Has no effect.  May be used by 3rd parties for meta information.
                        block.data = xmlChild.textContent;
                        break;
                    case 'title':
                        // Titles were renamed to field in December 2013.
                        // Fall through.
                    case 'field':
                        var field = block.getField(name);
                        if (!field) {
                            console.warn('Ignoring non-existent field ' + name + ' in block ' +
                                         prototypeName);
                            break;
                        }
                        field.setValue(xmlChild.textContent);
                        break;
                    case 'value':
                    case 'statement':
                        input = block.getInput(name);
                        if (!input) {
                            console.warn('Ignoring non-existent input ' + name + ' in block ' +
                                         prototypeName);
                            break;
                        }
                        if (childShadowNode) {
                            input.connection.setShadowDom(childShadowNode);
                        }
                        if (childBlockNode) {
                            blockChild = Blockly.Xml.domToBlockHeadless_(workspace,
                                childBlockNode, opt_reuseBlock);
                            if (blockChild.outputConnection) {
                                input.connection.connect(blockChild.outputConnection);
                            } else if (blockChild.previousConnection) {
                                input.connection.connect(blockChild.previousConnection);
                            } else {
                                throw 'Child block does not have output or previous statement.';
                            }
                        }
                        break;
                    case 'next':
                        if (childShadowNode && block.nextConnection) {
                            block.nextConnection.setShadowDom(childShadowNode);
                        }
                        if (childBlockNode) {
                            if (!block.nextConnection) {
                                throw 'Next statement does not exist.';
                            } else if (block.nextConnection.targetConnection) {
                                // This could happen if there is more than one XML 'next' tag.
                                throw 'Next statement is already connected.';
                            }
                            blockChild = Blockly.Xml.domToBlockHeadless_(workspace,
                                childBlockNode, opt_reuseBlock);
                            if (!blockChild.previousConnection) {
                                throw 'Next block does not have previous statement.';
                            }
                            block.nextConnection.connect(blockChild.previousConnection);
                        }
                        break;
                    default:
                        // Unknown tag; ignore.  Same principle as HTML parsers.
                        console.warn('Ignoring unknown tag: ' + xmlChild.nodeName);
                }
            }

            var inline = xmlBlock.getAttribute('inline');
            if (inline) {
                block.setInputsInline(inline == 'true');
            }
            var disabled = xmlBlock.getAttribute('disabled');
            if (disabled) {
                block.setDisabled(disabled == 'true');
            }
            var deletable = xmlBlock.getAttribute('deletable');
            if (deletable) {
                block.setDeletable(deletable == 'true');
            }
            var movable = xmlBlock.getAttribute('movable');
            if (movable) {
                block.setMovable(movable == 'true');
            }
            var editable = xmlBlock.getAttribute('editable');
            if (editable) {
                block.setEditable(editable == 'true');
            }
            var collapsed = xmlBlock.getAttribute('collapsed');
            if (collapsed) {
                block.setCollapsed(collapsed == 'true');
            }
            if (xmlBlock.nodeName.toLowerCase() == 'shadow') {
                block.setShadow(true);
            }
            // Give the block a chance to clean up any initial inputs.
            if (block.validate) {
                block.validate();
            }
            return block;
        };

        Blockly.Xml.deleteNext = function (xmlBlock) {
            for (var i = 0, child; child = xmlBlock.childNodes[i]; i++) {
                if (child.nodeName.toLowerCase() == 'next') {
                    xmlBlock.removeChild(child);
                    break;
                }
            }
        };

        // Export symbols that would otherwise be renamed by Closure compiler.
        if (!goog.global['Blockly']) {
            goog.global['Blockly'] = {};
        }
        if (!goog.global['Blockly']['Xml']) {
            goog.global['Blockly']['Xml'] = {};
        }
        goog.global['Blockly']['Xml']['domToText'] = Blockly.Xml.domToText;
        goog.global['Blockly']['Xml']['domToWorkspace'] = Blockly.Xml.domToWorkspace;
        goog.global['Blockly']['Xml']['textToDom'] = Blockly.Xml.textToDom;
        goog.global['Blockly']['Xml']['workspaceToDom'] = Blockly.Xml.workspaceToDom;

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
