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
 * @fileoverview Generating JavaScript for loop blocks.
 * @author fraser@google.com (Neil Fraser)
 */
'use strict';

goog.provide('Blockly.JScript.loops');

goog.require('Blockly.JScript');


Blockly.JScript['controls_repeat_ext'] = function(block) {
  // Repeat n times.
  if (block.getField('TIMES')) {
    // Internal number.
    var repeats = String(Number(block.getFieldValue('TIMES')));
  } else {
    // External number.
    var repeats = Blockly.JScript.valueToCode(block, 'TIMES',
        Blockly.JScript.ORDER_ASSIGNMENT) || '0';
  }
  var branch = Blockly.JScript.statementToCode(block, 'DO');
  branch = Blockly.JScript.addLoopTrap(branch, block.id);
  var code = '';
  var loopVar = Blockly.JScript.variableDB_.getDistinctName(
      'count', Blockly.Variables.NAME_TYPE);
  var endVar = repeats;
  if (!repeats.match(/^\w+$/) && !Blockly.isNumber(repeats)) {
    var endVar = Blockly.JScript.variableDB_.getDistinctName(
        'repeat_end', Blockly.Variables.NAME_TYPE);
    code += 'var ' + endVar + ' = ' + repeats + ';\n';
  }
  code += 'repetir (variable ' + loopVar + ' es igual a 0; ' +
      loopVar + ' es menor que' + endVar + '; repetir ' +
      loopVar + ' veces) {\n' +
      branch + '}\n';
  return code;
};

Blockly.JScript['controls_repeat'] =
    Blockly.JScript['controls_repeat_ext'];

Blockly.JScript['controls_whileUntil'] = function(block) {
  // Do while/until loop.
  var until = block.getFieldValue('MODE') == 'UNTIL';
  var argument0 = Blockly.JScript.valueToCode(block, 'BOOL',
      until ? Blockly.JScript.ORDER_LOGICAL_NOT :
      Blockly.JScript.ORDER_NONE) || 'falso';
  var branch = Blockly.JScript.statementToCode(block, 'DO');
  branch = Blockly.JScript.addLoopTrap(branch, block.id);
  if (until) {
    argument0 = '!' + argument0;
  }
  return 'mientras (' + argument0 + ') {\n' + branch + '}\n';
};

Blockly.JScript['controls_for'] = function(block) {
  // For loop.
  var variable0 = Blockly.JScript.variableDB_.getName(
      block.getFieldValue('VAR'), Blockly.Variables.NAME_TYPE);
  var argument0 = Blockly.JScript.valueToCode(block, 'FROM',
      Blockly.JScript.ORDER_ASSIGNMENT) || '0';
  var argument1 = Blockly.JScript.valueToCode(block, 'TO',
      Blockly.JScript.ORDER_ASSIGNMENT) || '0';
  var increment = Blockly.JScript.valueToCode(block, 'BY',
      Blockly.JScript.ORDER_ASSIGNMENT) || '1';
  var branch = Blockly.JScript.statementToCode(block, 'DO');
  branch = Blockly.JScript.addLoopTrap(branch, block.id);
  var code;
  if (Blockly.isNumber(argument0) && Blockly.isNumber(argument1) &&
      Blockly.isNumber(increment)) {
    // All arguments are simple numbers.
    var up = parseFloat(argument0) <= parseFloat(argument1);
    code = 'repetir durante (' + variable0 + ' es igual a ' + argument0 + '; ' +
        variable0 + (up ? ' es menor o igual que ' : ' es mayor o igual que ') + argument1 + '; ' +
        variable0;
    var step = Math.abs(parseFloat(increment));
    if (step == 1) {
      code += up ? 'repetir numero de veces' : 'repetir inversamente numero de vaces';
    } else {
      code += (up ? ' += ' : ' -= ') + step;
    }
    code += ') {\n' + branch + '}\n';
  } else {
    code = '';
    // Cache non-trivial values to variables to prevent repeated look-ups.
    var startVar = argument0;
    if (!argument0.match(/^\w+$/) && !Blockly.isNumber(argument0)) {
      startVar = Blockly.JScript.variableDB_.getDistinctName(
          variable0 + '_start', Blockly.Variables.NAME_TYPE);
      code += 'var ' + startVar + ' = ' + argument0 + ';\n';
    }
    var endVar = argument1;
    if (!argument1.match(/^\w+$/) && !Blockly.isNumber(argument1)) {
      var endVar = Blockly.JScript.variableDB_.getDistinctName(
          variable0 + '_end', Blockly.Variables.NAME_TYPE);
      code += 'var ' + endVar + ' = ' + argument1 + ';\n';
    }
    // Determine loop direction at start, in case one of the bounds
    // changes during loop execution.
    var incVar = Blockly.JScript.variableDB_.getDistinctName(
        variable0 + '_inc', Blockly.Variables.NAME_TYPE);
    code += 'var ' + incVar + ' = ';
    if (Blockly.isNumber(increment)) {
      code += Math.abs(increment) + ';\n';
    } else {
      code += 'Math.abs(' + increment + ');\n';
    }
    code += 'if (' + startVar + ' > ' + endVar + ') {\n';
    code += Blockly.JScript.INDENT + incVar + ' = -' + incVar + ';\n';
    code += '}\n';
    code += 'for (' + variable0 + ' = ' + startVar + ';\n' +
        '     ' + incVar + ' >= 0 ? ' +
        variable0 + ' <= ' + endVar + ' : ' +
        variable0 + ' >= ' + endVar + ';\n' +
        '     ' + variable0 + ' += ' + incVar + ') {\n' +
        branch + '}\n';
  }
  return code;
};

Blockly.JScript['controls_forEach'] = function(block) {
  // For each loop.
  var variable0 = Blockly.JScript.variableDB_.getName(
      block.getFieldValue('VAR'), Blockly.Variables.NAME_TYPE);
  var argument0 = Blockly.JScript.valueToCode(block, 'LIST',
      Blockly.JScript.ORDER_ASSIGNMENT) || '[]';
  var branch = Blockly.JScript.statementToCode(block, 'DO');
  branch = Blockly.JScript.addLoopTrap(branch, block.id);
  var code = '';
  // Cache non-trivial values to variables to prevent repeated look-ups.
  var listVar = argument0;
  if (!argument0.match(/^\w+$/)) {
    listVar = Blockly.JScript.variableDB_.getDistinctName(
        variable0 + '_list', Blockly.Variables.NAME_TYPE);
    code += 'var ' + listVar + ' = ' + argument0 + ';\n';
  }
  var indexVar = Blockly.JScript.variableDB_.getDistinctName(
      variable0 + '_index', Blockly.Variables.NAME_TYPE);
  branch = Blockly.JScript.INDENT + variable0 + ' = ' +
      listVar + '[' + indexVar + '];\n' + branch;
  code += 'para cada (elemento de ' + indexVar + ' en ' + listVar + ') {\n' + branch + '}\n';
  return code;
};

Blockly.JScript['controls_flow_statements'] = function(block) {
  // Flow statements: continue, break.
  switch (block.getFieldValue('FLOW')) {
    case 'BREAK':
      return 'romper cadena;\n';
    case 'CONTINUE':
      return 'continuar;\n';
  }
  throw 'Unknown flow statement.';
};
