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
import 'package:json_schema/src/json_schema/json_schema.dart';

import '../../schema_widget.dart';

/// Schema parser from [Map<String, dynamic>] to [BorderRadius]
///
/// Created by Windol <windol@legytma.com.br> at 24/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("BorderRadius",
    "https://schema.legytma.com.br/1.1.2/schema/border_radius.schema.json", <String>[
  "string",
  "only",
  "all",
  "circular",
  "zero",
  "horizontal",
  "vertical",
  "lerp",
])
class BorderRadiusSchemaParser extends VariantTypeSchemaParser<BorderRadius,
    dynamic, BorderRadiusGeometry> {
  /// Create instance of parser using [JsonSchema] to validate values.
  BorderRadiusSchemaParser(JsonSchema jsonSchema,
      [Map<String, BorderRadiusSchemaParser> typeSchemaParsers])
      : super(jsonSchema, typeSchemaParsers);

  @override
  String extractType(dynamic value) =>
      value is Map<String, dynamic> ? value['type'] : "string";

  @override
  BorderRadius builderVariant(BuildContext buildContext, dynamic value,
      BorderRadiusGeometry defaultValue) {
    if (value is String) {
      if (value.trim() == '' || !value.contains(",")) {
        return defaultValue;
      }

      var values = value.split(",");

      if (values.isEmpty || values.length != 4) {
        return defaultValue;
      }

      return BorderRadius.only(
        topLeft:
            SchemaWidget.parse<Radius>(buildContext, values[0], Radius.zero),
        topRight:
            SchemaWidget.parse<Radius>(buildContext, values[1], Radius.zero),
        bottomLeft:
            SchemaWidget.parse<Radius>(buildContext, values[2], Radius.zero),
        bottomRight:
            SchemaWidget.parse<Radius>(buildContext, values[3], Radius.zero),
      );
    }

    if (value is Map<String, dynamic>) {
      switch (value['type']) {
        case 'all':
          return BorderRadius.all(
              SchemaWidget.parse<Radius>(buildContext, value['all']));
        case 'circular':
          return BorderRadius.circular(
              SchemaWidget.parse<double>(buildContext, value['radius']));
        case 'horizontal':
          return BorderRadius.horizontal(
            right: SchemaWidget.parse<Radius>(
                buildContext, value['right'], Radius.zero),
            left: SchemaWidget.parse<Radius>(
                buildContext, value['left'], Radius.zero),
          );
        case 'lerp':
          return BorderRadius.lerp(
            SchemaWidget.parse<BorderRadius>(buildContext, value['a']),
            SchemaWidget.parse<BorderRadius>(buildContext, value['b']),
            SchemaWidget.parse<double>(buildContext, value['t']),
          );
        case 'only':
          return BorderRadius.only(
            topLeft: SchemaWidget.parse<Radius>(buildContext, value['topLeft']),
            topRight:
                SchemaWidget.parse<Radius>(buildContext, value['topRight']),
            bottomLeft:
                SchemaWidget.parse<Radius>(buildContext, value['bottomLeft']),
            bottomRight:
                SchemaWidget.parse<Radius>(buildContext, value['bottomRight']),
          );
        case 'vertical':
          return BorderRadius.vertical(
            bottom: SchemaWidget.parse<Radius>(
                buildContext, value['bottom'], Radius.zero),
            top: SchemaWidget.parse<Radius>(
                buildContext, value['top'], Radius.zero),
          );
        case 'zero':
          return BorderRadius.zero;
        default:
          return defaultValue;
      }
    }

    return defaultValue;
  }
}
