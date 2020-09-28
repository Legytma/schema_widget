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

/// Schema parser from [Map<String, dynamic>] to [BorderSide]
///
/// Created by Windol <windol@legytma.com.br> at 28/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser(
    "BorderSide",
    "https://schema.legytma.com.br/3.0.0/schema/border_side.schema.json",
    <String>[
      "default",
      "none",
      "merge",
      "lerp",
    ])
class BorderSideSchemaParser extends VariantTypeSchemaParser<BorderSide,
    Map<String, dynamic>, BorderSide> {
  /// Create instance of parser using [JsonSchema] to validate values.
  BorderSideSchemaParser(
      [JsonSchema jsonSchema,
      Map<
              String,
              VariantTypeSchemaParser<BorderSide, Map<String, dynamic>,
                  BorderSide>>
          typeSchemaParsers])
      : super("BorderSide", jsonSchema, typeSchemaParsers);

  @override
  String extractType(Map<String, dynamic> value) => value['type'];

  @override
  BorderSide builderVariant(BuildContext buildContext,
      Map<String, dynamic> value, BorderSide defaultValue) {
    switch (value['type']) {
      case 'default':
        return BorderSide(
          color: SchemaWidget.parse<Color>(
              buildContext, value['color'], const Color(0xFF000000)),
          width: SchemaWidget.parse<double>(buildContext, value['width'], 1.0),
          style: SchemaWidget.parse<BorderStyle>(
              buildContext, value['style'], BorderStyle.solid),
        );
      case 'none':
        return BorderSide.none;
      case 'merge':
        return BorderSide.merge(
          SchemaWidget.parse<BorderSide>(buildContext, value['a']),
          SchemaWidget.parse<BorderSide>(buildContext, value['b']),
        );
      case 'lerp':
        return BorderSide.lerp(
          SchemaWidget.parse<BorderSide>(buildContext, value['a']),
          SchemaWidget.parse<BorderSide>(buildContext, value['b']),
          SchemaWidget.parse<double>(buildContext, value['t']),
        );
      default:
        return defaultValue;
    }
  }
}
