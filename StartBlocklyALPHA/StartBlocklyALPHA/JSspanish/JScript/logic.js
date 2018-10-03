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
 * @fileoverview Generating JavaScript for logic blocks.
 * @author q.neutron@gmail.com (Quynh Neutron)
 */
'use strict';

goog.provide('Blockly.JScript.logic');

goog.require('Blockly.JScript');


Blockly.JScript['controls_if'] = function(block) {
  // If/elseif/else condition.
  var n = 0;
  var argument = Blockly.JScript.valueToCode(block, 'IF' + n,
      Blockly.JScript.ORDER_NONE) || 'falso';
  var branch = Blockly.JScript.statementToCode(block, 'DO' + n);
  var code = 'si (' + argument + ') {\n' + branch + '}';
  for (n = 1; n <= block.elseifCount_; n++) {
    argument = Blockly.JScript.valueToCode(block, 'IF' + n,
        Blockly.JScript.ORDER_NONE) || 'falso';
    branch = Blockly.JScript.statementToCode(block, 'DO' + n);
    code += ' sino si (' + argument + ') {\n' + branch + '}';
  }
  if (block.elseCount_) {
    branch = Blockly.JScript.statementToCode(block, 'ELSE');
    code += ' sino* {\n' + branch + '}';
  }
  return code + '\n';
};

Blockly.JScript['logic_compare'] = function(block) {
  // Comparison operator.
  var OPERATORS = {
    'EQ': 'igual a',
    'NEQ': 'diferente de',
    'LT': 'es menor que',
    'LTE': 'es menor o igual que',
    'GT': 'es mayor que',
    'GTE': 'es mayor o igual que'
  };
  var operator = OPERATORS[block.getFieldValue('OP')];
  var order = (operator == '==' || operator == '!=') ?
      Blockly.JScript.ORDER_EQUALITY : Blockly.JScript.ORDER_RELATIONAL;
  var argument0 = Blockly.JScript.valueToCode(block, 'A', order) || '0';
  var argument1 = Blockly.JScript.valueToCode(block, 'B', order) || '0';
  var code = argument0 + ' ' + operator + ' ' + argument1;
  return [code, order];
};

Blockly.JScript['logic_operation'] = function(block) {
  // Operations 'and', 'or'.
  var operator = (block.getFieldValue('OP') == 'AND') ? 'y' : 'o';
  var order = (operator == 'y') ? Blockly.JScript.ORDER_LOGICAL_AND :
      Blockly.JScript.ORDER_LOGICAL_OR;
  var argument0 = Blockly.JScript.valueToCode(block, 'A', order);
  var argument1 = Blockly.JScript.valueToCode(block, 'B', order);
  if (!argument0 && !argument1) {
    // If there are no arguments, then the return value is false.
    argument0 = 'es falso';
    argument1 = 'es falso';
  } else {
    // Single missing arguments have no effect on the return value.
    var defaultArgument = (operator == 'y') ? 'es verdadero' : 'es falso';
    if (!argument0) {
      argument0 = defaultArgument;
    }
    if (!argument1) {
      argument1 = defaultArgument;
    }
  }
  var code = argument0 + ' ' + operator + ' ' + argument1;
  return [code, order];
};

Blockly.JScript['logic_negate'] = function(block) {
  // Negation.
  var order = Blockly.JScript.ORDER_LOGICAL_NOT;
  var argument0 = Blockly.JScript.valueToCode(block, 'BOOL', order) ||
      ' es verdadero';
  var code = '!' + argument0;
  return [code, order];
};

Blockly.JScript['logic_boolean'] = function(block) {
  // Boolean values true and false.
  var code = (block.getFieldValue('BOOL') == 'TRUE') ? 'es verdadero' : 'es falso';
  return [code, Blockly.JScript.ORDER_ATOMIC];
};

Blockly.JScript['logic_null'] = function(block) {
  // Null data type.
  return ['es nulo', Blockly.JScript.ORDER_ATOMIC];
};

Blockly.JScript['logic_ternary'] = function(block) {
  // Ternary operator.
  var value_if = Blockly.JScript.valueToCode(block, 'IF',
      Blockly.JScript.ORDER_CONDITIONAL) || 'es falso';
  var value_then = Blockly.JScript.valueToCode(block, 'THEN',
      Blockly.JScript.ORDER_CONDITIONAL) || 'es nulo';
  var value_else = Blockly.JScript.valueToCode(block, 'ELSE',
      Blockly.JScript.ORDER_CONDITIONAL) || 'es nulo';
  var code = value_if + ' ? ' + value_then + ' : ' + value_else;
  return [code, Blockly.JScript.ORDER_CONDITIONAL];
};
