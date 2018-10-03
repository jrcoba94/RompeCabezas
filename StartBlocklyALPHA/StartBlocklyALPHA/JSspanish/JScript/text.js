/**
 * @license
 * Visual Blocks Language
 *
 * Copyright 2012 Google Inc.
 * https://developers.google.com/blockly/
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @fileoverview Generating JavaScript for text blocks.
 * @author fraser@google.com (Neil Fraser)
 */
'use strict';

goog.provide('Blockly.JScript.texts');

goog.require('Blockly.JScript');


Blockly.JScript['text'] = function(block) {
  // Text value.
  var code = Blockly.JScript.quote_(block.getFieldValue('TEXT'));
  return [code, Blockly.JScript.ORDER_ATOMIC];
};

Blockly.JScript['text_join'] = function(block) {
  // Create a string made up of any number of elements of any type.
  var code;
  if (block.itemCount_ == 0) {
    return ['\'\'', Blockly.JScript.ORDER_ATOMIC];
  } else if (block.itemCount_ == 1) {
    var argument0 = Blockly.JScript.valueToCode(block, 'ADD0',
        Blockly.JScript.ORDER_NONE) || '\'\'';
    code = 'texto(' + argument0 + ')';
    return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
  } else if (block.itemCount_ == 2) {
    var argument0 = Blockly.JScript.valueToCode(block, 'ADD0',
        Blockly.JScript.ORDER_NONE) || '\'\'';
    var argument1 = Blockly.JScript.valueToCode(block, 'ADD1',
        Blockly.JScript.ORDER_NONE) || '\'\'';
    code = 'texto1 (' + argument0 + ') mas texto2 (' + argument1 + ')';
    return [code, Blockly.JScript.ORDER_ADDITION];
  } else {
    code = new Array(block.itemCount_);
    for (var n = 0; n < block.itemCount_; n++) {
      code[n] = Blockly.JScript.valueToCode(block, 'ADD' + n,
          Blockly.JScript.ORDER_COMMA) || '\'\'';
    }
    code = 'el siguiente texto [' + code.join(',') + ']. se conecta con (\'\')';
    return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
  }
};

Blockly.JScript['text_append'] = function(block) {
  // Append to a variable in place.
  var varName = Blockly.JScript.variableDB_.getName(
      block.getFieldValue('VAR'), Blockly.Variables.NAME_TYPE);
  var argument0 = Blockly.JScript.valueToCode(block, 'TEXT',
      Blockly.JScript.ORDER_NONE) || '\'\'';
  return varName + ' = texto (' + varName + ') mas el siguiente texto(' + argument0 + ');\n';
};

Blockly.JScript['text_length'] = function(block) {
  // String or array length.
  var argument0 = Blockly.JScript.valueToCode(block, 'VALUE',
      Blockly.JScript.ORDER_FUNCTION_CALL) || '\'\'';
  return [argument0 + 'la logitud del texto', Blockly.JScript.ORDER_MEMBER];
};

Blockly.JScript['text_isEmpty'] = function(block) {
  // Is the string null or array empty?
  var argument0 = Blockly.JScript.valueToCode(block, 'VALUE',
      Blockly.JScript.ORDER_MEMBER) || '\'\'';
  return ['!' + argument0 + 'la longitud del texto', Blockly.JScript.ORDER_LOGICAL_NOT];
};

Blockly.JScript['text_indexOf'] = function(block) {
  // Search the text for a substring.
  var operator = block.getFieldValue('END') == 'FIRST' ?
      ' el indice de' : 'el ultimo indice';
  var argument0 = Blockly.JScript.valueToCode(block, 'FIND',
      Blockly.JScript.ORDER_NONE) || '\'\'';
  var argument1 = Blockly.JScript.valueToCode(block, 'VALUE',
      Blockly.JScript.ORDER_MEMBER) || '\'\'';
  var code = argument1 + '.' + operator + '(' + argument0 + ') + 1';
  return [code, Blockly.JScript.ORDER_MEMBER];
};

Blockly.JScript['text_charAt'] = function(block) {
  // Get letter at index.
  // Note: Until January 2013 this block did not have the WHERE input.
  var where = block.getFieldValue('WHERE') || 'FROM_START';
  var at = Blockly.JScript.valueToCode(block, 'AT',
      Blockly.JScript.ORDER_UNARY_NEGATION) || '1';
  var text = Blockly.JScript.valueToCode(block, 'VALUE',
      Blockly.JScript.ORDER_MEMBER) || '\'\'';
  switch (where) {
    case 'FIRST':
      var code = text + 'es agregado en (0)';
      return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
    case 'LAST':
      var code = text + 'quitar(-1)';
      return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
    case 'FROM_START':
      // Blockly uses one-based indicies.
      if (Blockly.isNumber(at)) {
        // If the index is a naked number, decrement it right now.
        at = parseFloat(at) - 1;
      } else {
        // If the index is dynamic, decrement it in code.
        at += ' - 1';
      }
      var code = text + 'es agregado en (' + at + ')';
      return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
    case 'FROM_END':
      var code = text + 'quitar(-' + at + ') agregar en (0)';
      return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
    case 'RANDOM':
      var functionName = Blockly.JScript.provideFunction_(
          'letra aleatoria del texto',
          [ 'la funcion ' + Blockly.JScript.FUNCTION_NAME_PLACEHOLDER_ +
              '(texto) {',
            '  variable x = la funcion de seleccion aleatoria por la longitud del texto);',
            '  devolver texto[x];',
            '}']);
      code = functionName + '(' + text + ')';
      return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
  }
  throw 'Unhandled option (text_charAt).';
};

Blockly.JScript['text_getSubstring'] = function(block) {
  // Get substring.
  var text = Blockly.JScript.valueToCode(block, 'STRING',
      Blockly.JScript.ORDER_MEMBER) || '\'\'';
  var where1 = block.getFieldValue('WHERE1');
  var where2 = block.getFieldValue('WHERE2');
  var at1 = Blockly.JScript.valueToCode(block, 'AT1',
      Blockly.JScript.ORDER_NONE) || '1';
  var at2 = Blockly.JScript.valueToCode(block, 'AT2',
      Blockly.JScript.ORDER_NONE) || '1';
  if (where1 == 'FIRST' && where2 == 'LAST') {
    var code = text;
  } else {
    var functionName = Blockly.JScript.provideFunction_(
        'text_get_substring',
        [ 'la funcion ' + Blockly.JScript.FUNCTION_NAME_PLACEHOLDER_ +
            '(texto, ubicacion1, en1, ubicacion2, en2) {',
          '  funcion seleccionar en (ubicacion, en) {',
          '    si (la ubicacion es igual a \'FROM_START\') {',
          '      at--;',
          '    } sino si (ubicacion es igual a \'FROM_END\') {',
          '      en = longitud de texto - at;',
          '    } sino si (ubicacion es igual a \'FIRST\') {',
          '      en = 0;',
          '    } sino si (ubicacion es igual a \'LAST\') {',
          '      en = longitud de texto - 1;',
          '    } sino {',
          '      arrojar \'Unhandled option (text_getSubstring).\';',
          '    }',
          '    devolver en;',
          '  }',
          '  en1 = getAt(ubicacion1, en1);',
          '  en2 = getAt(ubicacion2, en2) + 1;',
          '  devolver parte de texto(en1, en2);',
          '}']);
    var code = functionName + '(' + text + ', \'' +
        where1 + '\', ' + at1 + ', \'' + where2 + '\', ' + at2 + ')';
  }
  return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
};

Blockly.JScript['text_changeCase'] = function(block) {
  // Change capitalization.
  var OPERATORS = {
    'UPPERCASE': ' en mayusculas',
    'LOWERCASE': ' en minusculas',
    'TITLECASE': null
  };
  var operator = OPERATORS[block.getFieldValue('CASE')];
  var code;
  if (operator) {
    // Upper and lower case are functions built into JavaScript.
    var argument0 = Blockly.JScript.valueToCode(block, 'TEXT',
        Blockly.JScript.ORDER_MEMBER) || '\'\'';
    code = argument0 + operator;
  } else {
    // Title case is not a native JavaScript function.  Define one.
    var functionName = Blockly.JScript.provideFunction_(
        'texto para titulo',
        [ 'la funcion ' +
            Blockly.JScript.FUNCTION_NAME_PLACEHOLDER_ + '(dato tipo texto) {',
          '  devolver dato de texto reemplasado por(/\\S+/g,',
          '      funcion (texto) {devolver texto[0] en mayuscula + ' +
              'subtexto (1)en minusculas;});',
          '}']);
    var argument0 = Blockly.JScript.valueToCode(block, 'TEXT',
        Blockly.JScript.ORDER_NONE) || '\'\'';
    code = functionName + '(' + argument0 + ')';
  }
  return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
};

Blockly.JScript['text_trim'] = function(block) {
  // Trim spaces.
  var OPERATORS = {
    'LEFT': "sin espacios a la derecha, '')",
    'RIGHT': "sin espacios a la izquierda, '')",
    'BOTH': 'sin espacios entre palabras'
  };
  var operator = OPERATORS[block.getFieldValue('MODE')];
  var argument0 = Blockly.JScript.valueToCode(block, 'TEXT',
      Blockly.JScript.ORDER_MEMBER) || '\'\'';
  return [argument0 + operator, Blockly.JScript.ORDER_FUNCTION_CALL];
};

Blockly.JScript['text_print'] = function(block) {
  // Print statement.
  var argument0 = Blockly.JScript.valueToCode(block, 'TEXT',
      Blockly.JScript.ORDER_NONE) || '\'\'';
  return 'mostrar el texto(' + argument0 + ');\n';
};

Blockly.JScript['text_prompt_ext'] = function(block) {
  // Prompt function.
  if (block.getField('TEXT')) {
    // Internal message.
    var msg = Blockly.JScript.quote_(block.getFieldValue('TEXT'));
  } else {
    // External message.
    var msg = Blockly.JScript.valueToCode(block, 'TEXT',
        Blockly.JScript.ORDER_NONE) || '\'\'';
  }
  var code = 'mostrar mensaje(' + msg + ')';
  var toNumber = block.getFieldValue('TYPE') == 'NUMBER';
  if (toNumber) {
    code = 'mostrar numeros(' + code + ')';
  }
  return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
};

Blockly.JScript['text_prompt'] = Blockly.JScript['text_prompt_ext'];
