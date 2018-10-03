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
 * @fileoverview Generating JavaScript for colour blocks.
 * @author fraser@google.com (Neil Fraser)
 */
'use strict';

goog.provide('Blockly.JScript.colour');

goog.require('Blockly.JScript');


Blockly.JScript['colour_picker'] = function(block) {
  // Colour picker.
  var code = '\'' + block.getFieldValue('COLOUR') + '\'';
  return [code, Blockly.JScript.ORDER_ATOMIC];
};

Blockly.JScript['colour_random'] = function(block) {
  // Generate a random colour.
  var funcionName = Blockly.JScript.provideFunction_(
      'color_aleatorio',
      [ 'funcion ' + Blockly.JScript.FUNCTION_NAME_PLACEHOLDER_ + '() {',
        '  variable numero = matematicas.redondeo(matematicas.aleatorio() * matematicas.potencia(2, 24));',
        '  regresar \'#\' + (\'00000\' + numero.cadena(16)).subcadena(-6);',
        '}']);
  var code = funcionName + '()';
  return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
};

Blockly.JScript['colour_rgb'] = function(block) {
  // Compose a colour from RGB components expressed as percentages.
  var red = Blockly.JScript.valueToCode(block, 'RED',
      Blockly.JScript.ORDER_COMMA) || 0;
  var green = Blockly.JScript.valueToCode(block, 'GREEN',
      Blockly.JScript.ORDER_COMMA) || 0;
  var blue = Blockly.JScript.valueToCode(block, 'BLUE',
      Blockly.JScript.ORDER_COMMA) || 0;
  var functionName = Blockly.JScript.provideFunction_(
      'color_rgb',
      [ 'funcion ' + Blockly.JScript.FUNCTION_NAME_PLACEHOLDER_ +
          '(r, g, b) {',
        '  r = matematicas.maximo(matematicas.minimo(numero(r), 100), 0) * 2.55;',
        '  g = matematicas.maximo(matematicas.minimo(numero(g), 100), 0) * 2.55;',
        '  b = matematicas.maximo(Matematicas.minimo(numero(b), 100), 0) * 2.55;',
        '  r = (\'0\' + (matematicas.redondeo(r) || 0).cadena(16)).extrae(-2);',
        '  g = (\'0\' + (matematicas.redondeo(g) || 0).cadena(16)).extrae(-2);',
        '  b = (\'0\' + (matematicas.redondeo(b) || 0).cadena(16)).extrae(-2);',
        '  regresar \'#\' + r + g + b;',
        '}']);
  var code = functionName + '(' + red + ', ' + green + ', ' + blue + ')';
  return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
};

Blockly.JScript['colour_blend'] = function(block) {
  // Blend two colours together.
  var c1 = Blockly.JScript.valueToCode(block, 'COLOUR1',
      Blockly.JScript.ORDER_COMMA) || '\'#000000\'';
  var c2 = Blockly.JScript.valueToCode(block, 'COLOUR2',
      Blockly.JScript.ORDER_COMMA) || '\'#000000\'';
  var ratio = Blockly.JScript.valueToCode(block, 'RATIO',
      Blockly.JScript.ORDER_COMMA) || 0.5;
  var functionName = Blockly.JScript.provideFunction_(
      'color_mezcla',
      [ 'funcion ' + Blockly.JScript.FUNCTION_NAME_PLACEHOLDER_ +
          '(c1, c2, ratio) {',
        '  proporcion = matematicas.maximo(maximo.minimo(numero(proporcion), 1), 0);',
        '  variable r1 = convertirentero(c1.subcadena(1, 3), 16);',
        '  variable g1 = convertirentero(c1.subcadena(3, 5), 16);',
        '  variable b1 = convertirentero(c1.subcadena(5, 7), 16);',
        '  variable r2 = convertirentero(c2.subcadena(1, 3), 16);',
        '  variable g2 = convertirentero(c2.subcadena(3, 5), 16);',
        '  variable b2 = convertirentero(c2.subcadena(5, 7), 16);',
        '  variable r = matematicas.redondeo(r1 * (1 - proporcion) + r2 * proporcion);',
        '  variable g = matematicas.redondeo(g1 * (1 - proporcion) + g2 * proporcion);',
        '  variable b = matematicas.redondeo(b1 * (1 - proporcion) + b2 * proporcion);',
        '  r = (\'0\' + (r || 0).cadena(16)).extrae(-2);',
        '  g = (\'0\' + (g || 0).cadena(16)).extrae(-2);',
        '  b = (\'0\' + (b || 0).cadena(16)).extrae(-2);',
        '  regresar \'#\' + r + g + b;',
        '}']);
  var code = functionName + '(' + c1 + ', ' + c2 + ', ' + ratio + ')';
  return [code, Blockly.JScript.ORDER_FUNCTION_CALL];
};
