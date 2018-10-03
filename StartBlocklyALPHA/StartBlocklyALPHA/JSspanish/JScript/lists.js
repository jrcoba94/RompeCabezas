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
 * @fileoverview Generating JavaScript for list blocks.
 * @author fraser@google.com (Neil Fraser)
 */
'use strict';

goog.provide('Blockly.JScript.lists');

goog.require('Blockly.JScript');


Blockly.JScript['lists_create_empty'] = function(block) {
  // Create an empty list.
  return ['elemento de la lista []', Blockly.JScript.ORDER_ATOMIC];
};

Blockly.JScript['lists_create_with'] = function(block) {
  // Create a list with any number of elements of any type.
  var code = new Array(block.itemCount_);
  for (var n = 0; n < block.itemCount_; n++) {
    code[n] = Blockly.JScript.valueToCode(block, 'ADD' + n,
        Blockly.JScript.ORDER_COMMA) || 'nulo';
  }
  code = '[' + code.join(', ') + ']';
  return [code, Blockly.JScript.ORDER_ATOMIC];
};

Blockly.JScript['lists_repeat'] = function(block) {
  // Create a list with one element repeated.
  var functionName = Blockly.JScript.provideFunction_(
      'repetir_lista',
      [ 'funcion de ' + Blockly.JScript.FUNCTION_NAME_PLACEHOLDER_ +
          '(valor, valor n) {',
        '  crear un contenedor de tipo texto = [];',
        '  recorrer (valor i es igual a 0; i es menor que n; i++) {',
        '    contenedor con posicion [i] es igual a valor;',
        '  }',
        '  devolver contenedor;',
        '}']);
  var argument0 = Blockly.JScript.valueToCode(block, 'ITEM',
      Blockly.JScript.ORDER_COMMA) || 'nulo';
  var argument1 = Blockly.JScript.valueToCode(block, 'NUM',
      Blockly.JScript.ORDER_COMMA) || '0';
  var code = functionName + '(' + argument0 + ', ' + argument1 + ')';
  return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
};

Blockly.JScript['lists_length'] = function(block) {
  // String or array length.
  var argument0 = Blockly.JScript.valueToCode(block, 'VALUE',
      Blockly.JScript.ORDER_FUNCTION_CALL) || '[]';
  return [argument0 + 'longitud de la lista creada', Blockly.JScript.ORDER_MEMBER];
};

Blockly.JScript['lists_isEmpty'] = function(block) {
  // Is the string null or array empty?
  var argument0 = Blockly.JScript.valueToCode(block, 'VALUE',
      Blockly.JScript.ORDER_MEMBER) || '[]';
  return ['!' + argument0 + 'longitud del texto', Blockly.JScript.ORDER_LOGICAL_NOT];
};

Blockly.JScript['lists_indexOf'] = function(block) {
  // Find an item in the list.
  var operator = block.getFieldValue('END') == 'FIRST' ?
      'el primero de la lista ' : 'ultimo de la lista';
  var argument0 = Blockly.JScript.valueToCode(block, 'FIND',
      Blockly.JScript.ORDER_NONE) || '\'\'';
  var argument1 = Blockly.JScript.valueToCode(block, 'VALUE',
      Blockly.JScript.ORDER_MEMBER) || '[]';
  var code = argument1 + '.' + operator + '(' + argument0 + ') mas 1';
  return [code, Blockly.JScript.ORDER_MEMBER];
};

Blockly.JScript['lists_getIndex'] = function(block) {
  // Get element at index.
  // Note: Until January 2013 this block did not have MODE or WHERE inputs.
  var mode = block.getFieldValue('MODE') || 'GET';
  var where = block.getFieldValue('WHERE') || 'FROM_START';
  var at = Blockly.JScript.valueToCode(block, 'AT',
      Blockly.JScript.ORDER_UNARY_NEGATION) || '1';
  var list = Blockly.JScript.valueToCode(block, 'VALUE',
      Blockly.JScript.ORDER_MEMBER) || '[]';

  if (where == 'FIRST') {
    if (mode == 'GET') {
      var code = list + '. obtener al primero de la lista [0]';
      return [code, Blockly.JScript.ORDER_MEMBER];
    } else if (mode == 'GET_REMOVE') {
      var code = list + '.shift()';
      return [code, Blockly.JScript.ORDER_MEMBER];
    } else if (mode == 'REMOVE') {
      return list + '.shift();\n';
    }
  } else if (where == 'LAST') {
    if (mode == 'GET') {
      var code = list + '.remover al ultimo de la lista(-1)[0]';
      return [code, Blockly.JScript.ORDER_MEMBER];
    } else if (mode == 'GET_REMOVE') {
      var code = list + '.pop()';
      return [code, Blockly.JScript.ORDER_MEMBER];
    } else if (mode == 'REMOVE') {
      return list + '.pop();\n';
    }
  } else if (where == 'FROM_START') {
    // Blockly uses one-based indicies.
    if (Blockly.isNumber(at)) {
      // If the index is a naked number, decrement it right now.
      at = parseFloat(at) - 1;
    } else {
      // If the index is dynamic, decrement it in code.
      at += ' - 1';
    }
    if (mode == 'GET') {
      var code = list + '[' + at + ']';
      return [code, Blockly.JScript.ORDER_MEMBER];
    } else if (mode == 'GET_REMOVE') {
      var code = list + '.splice(' + at + ', 1)[0]';
      return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
    } else if (mode == 'REMOVE') {
      return list + '.splice(' + at + ', 1);\n';
    }
  } else if (where == 'FROM_END') {
    if (mode == 'GET') {
      var code = list + '.slice(-' + at + ')[0]';
      return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
    } else if (mode == 'GET_REMOVE' || mode == 'REMOVE') {
      var functionName = Blockly.JScript.provideFunction_(
          'lists_remove_from_end',
          [ 'function ' + Blockly.JScript.FUNCTION_NAME_PLACEHOLDER_ +
              '(list, x) {',
            '  x = list.length - x;',
            '  return list.splice(x, 1)[0];',
            '}']);
      code = functionName + '(' + list + ', ' + at + ')';
      if (mode == 'GET_REMOVE') {
        return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
      } else if (mode == 'REMOVE') {
        return code + ';\n';
      }
    }
  } else if (where == 'RANDOM') {
    var functionName = Blockly.JScript.provideFunction_(
        'obtener elementos de la lista aleatoriamente',
        [ 'funcion ' + Blockly.JScript.FUNCTION_NAME_PLACEHOLDER_ +
            '(lista, remover) {',
          '  x = devolver el minimo(funcion aleatoria por la longitud de la lista);',
          '  si se removio {',
          '    devolver los elemento de la lista;',
          '  } sino {',
          '    devolver el elemento de la lista;',
          '  }',
          '}']);
    code = functionName + '(' + list + ', ' + (mode != 'GET') + ')';
    if (mode == 'GET' || mode == 'GET_REMOVE') {
      return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
    } else if (mode == 'REMOVE') {
      return code + ';\n';
    }
  }
  throw 'Unhandled combination (lists_getIndex).';
};

Blockly.JScript['lists_setIndex'] = function(block) {
  // Set element at index.
  // Note: Until February 2013 this block did not have MODE or WHERE inputs.
  var list = Blockly.JScript.valueToCode(block, 'LIST',
      Blockly.JScript.ORDER_MEMBER) || '[]';
  var mode = block.getFieldValue('MODE') || 'GET';
  var where = block.getFieldValue('WHERE') || 'FROM_START';
  var at = Blockly.JScript.valueToCode(block, 'AT',
      Blockly.JScript.ORDER_NONE) || '1';
  var value = Blockly.JScript.valueToCode(block, 'TO',
      Blockly.JScript.ORDER_ASSIGNMENT) || 'nulo';
  // Cache non-trivial values to variables to prevent repeated look-ups.
  // Closure, which accesses and modifies 'list'.
  function cacheList() {
    if (list.match(/^\w+$/)) {
      return '';
    }
    var listVar = Blockly.JScript.variableDB_.getDistinctName(
        'tmp_list', Blockly.Variables.NAME_TYPE);
    var code = 'var ' + listVar + ' = ' + list + ';\n';
    list = listVar;
    return code;
  }
  if (where == 'FIRST') {
    if (mode == 'SET') {
      return list + '[0] = ' + value + ';\n';
    } else if (mode == 'INSERT') {
      return list + 'sin mover(' + value + ');\n';
    }
  } else if (where == 'LAST') {
    if (mode == 'SET') {
      var code = cacheList();
      code += list + '[' + list + '.longitud - 1] = ' + value + ';\n';
      return code;
    } else if (mode == 'INSERT') {
      return list + '.presionar(' + value + ');\n';
    }
  } else if (where == 'FROM_START') {
    // Blockly uses one-based indicies.
    if (Blockly.isNumber(at)) {
      // If the index is a naked number, decrement it right now.
      at = parseFloat(at) - 1;
    } else {
      // If the index is dynamic, decrement it in code.
      at += ' - 1';
    }
    if (mode == 'SET') {
      return list + '[' + at + '] = ' + value + ';\n';
    } else if (mode == 'INSERT') {
      return list + '.unir(' + at + ', 0, ' + value + ');\n';
    }
  } else if (where == 'FROM_END') {
    var code = cacheList();
    if (mode == 'SET') {
      code += list + '[' + list + '.longitud - ' + at + '] = ' + value + ';\n';
      return code;
    } else if (mode == 'INSERT') {
      code += list + '.unir(' + list + '.length - ' + at + ', 0, ' + value +
          ');\n';
      return code;
    }
  } else if (where == 'RANDOM') {
    var code = cacheList();
    var xVar = Blockly.JScript.variableDB_.getDistinctName(
        'tmp_x', Blockly.Variables.NAME_TYPE);
    code += 'var ' + xVar + ' = devolver valor minimo(funcion aleatoria * ' + list +
        '.longitud);\n';
    if (mode == 'SET') {
      code += list + '[' + xVar + '] = ' + value + ';\n';
      return code;
    } else if (mode == 'INSERT') {
      code += list + '.unir(' + xVar + ', 0, ' + value + ');\n';
      return code;
    }
  }
  throw 'Unhandled combination (lists_setIndex).';
};

Blockly.JScript['lists_getSublist'] = function(block) {
  // Get sublist.
  var list = Blockly.JScript.valueToCode(block, 'LIST',
      Blockly.JScript.ORDER_MEMBER) || '[]';
  var where1 = block.getFieldValue('WHERE1');
  var where2 = block.getFieldValue('WHERE2');
  var at1 = Blockly.JScript.valueToCode(block, 'AT1',
      Blockly.JScript.ORDER_NONE) || '1';
  var at2 = Blockly.JScript.valueToCode(block, 'AT2',
      Blockly.JScript.ORDER_NONE) || '1';
  if (where1 == 'FIRST' && where2 == 'LAST') {
    var code = list + '.concat()';
  } else {
    var functionName = Blockly.JScript.provideFunction_(
        'obtener sublista',
        [ 'funcion ' + Blockly.JScript.FUNCTION_NAME_PLACEHOLDER_ +
            '(lista, ubicacion1, en1, ubicacion2, en2) {',
          '  funcion obtener en (ubicacion, en) {',
          '    si (ubicacion es igual a \'FROM_START\') {',
          '      at--;',
          '    } sino si (ubicacion es igual a \'FROM_END\') {',
          '      en = la longitud de la lista - en;',
          '    } sino si (ubicacion es igual a \'FIRST\') {',
          '      en = 0;',
          '    } sino si (ubicacion es igual a \'LAST\') {',
          '      en = la longitud de la lista - 1;',
          '    } sino {',
          '      arrojar \'Unhandled option (lists_getSublist).\';',
          '    }',
          '    devolver en;',
          '  }',
          '  en1 = obtener en(ubicacion1, en1);',
          '  en2 = obtener en(ubicacion2, en2) + 1;',
          '  devolver porciones de la lista(at1, at2);',
          '}']);
    var code = functionName + '(' + list + ', \'' +
        where1 + '\', ' + at1 + ', \'' + where2 + '\', ' + at2 + ')';
  }
  return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
};

Blockly.JScript['lists_split'] = function(block) {
  // Block for splitting text into a list, or joining a list into text.
  var value_input = Blockly.JScript.valueToCode(block, 'INPUT',
      Blockly.JScript.ORDER_MEMBER);
  var value_delim = Blockly.JScript.valueToCode(block, 'DELIM',
      Blockly.JScript.ORDER_NONE) || '\'\'';
  var mode = block.getFieldValue('MODE');
  if (mode == 'SPLIT') {
    if (!value_input) {
      value_input = '\'\'';
    }
    var functionName = 'dividir';
  } else if (mode == 'JOIN') {
    if (!value_input) {
      value_input = '[]';
    }
    var functionName = 'conectar';
  } else {
    throw 'Unknown mode: ' + mode;
  }
  var code = value_input + '.' + functionName + '(' + value_delim + ')';
  return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
};
