// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br).
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:json_schema/json_schema.dart';

import '../../schema_widget.dart';

/// Schema parser from [String] to [BlendMode]
///
/// Created by Windol <windol@legytma.com.br> at 29/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("BlendMode",
    "https://schema.legytma.com.br/2.0.0/schema/blend_mode.schema.json")
class BlendModeSchemaParser
    extends TypeSchemaParser<BlendMode, String, BlendMode> {
  /// Create instance of parser using [JsonSchema] to validate values.
  BlendModeSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  BlendMode builder(BuildContext buildContext, String value,
      [BlendMode defaultValue]) {
    switch (value) {
      case 'color':
        return BlendMode.color;
      case 'clear':
        return BlendMode.clear;
      case 'colorBurn':
        return BlendMode.colorBurn;
      case 'colorDodge':
        return BlendMode.colorDodge;
      case 'darken':
        return BlendMode.darken;
      case 'difference':
        return BlendMode.difference;
      case 'dst':
        return BlendMode.dst;
      case 'dstATop':
        return BlendMode.dstATop;
      case 'dstIn':
        return BlendMode.dstIn;
      case 'dstOut':
        return BlendMode.dstOut;
      case 'dstOver':
        return BlendMode.dstOver;
      case 'exclusion':
        return BlendMode.exclusion;
      case 'hardLight':
        return BlendMode.hardLight;
      case 'hue':
        return BlendMode.hue;
      case 'lighten':
        return BlendMode.lighten;
      case 'luminosity':
        return BlendMode.luminosity;
      case 'modulate':
        return BlendMode.modulate;
      case 'multiply':
        return BlendMode.multiply;
      default:
        return defaultValue;
    }
  }
}
