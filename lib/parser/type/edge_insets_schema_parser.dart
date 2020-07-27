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

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:json_schema/json_schema.dart';

import '../../schema_widget.dart';

/// Schema parser from [Map<String, dynamic>] to [EdgeInsets]
///
/// Created by Windol <windol@legytma.com.br> at 01/05/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser(
    "EdgeInsets",
    "https://schema.legytma.com.br/1.1.2/schema/edge_insets.schema.json",
    <String>[
      "string",
      "zero",
      "all",
      "fromWindowPadding",
      "lerp",
      "symmetric",
      "fromLTRB",
      "only",
    ])
class EdgeInsetsSchemaParser
    extends VariantTypeSchemaParser<EdgeInsets, dynamic, EdgeInsets> {
  /// Create instance of parser using [JsonSchema] to validate values.
  EdgeInsetsSchemaParser(JsonSchema jsonSchema,
      [Map<String, VariantTypeSchemaParser<EdgeInsets, dynamic, EdgeInsets>>
          typeSchemaParsers])
      : super(jsonSchema, typeSchemaParsers);

  @override
  String extractType(dynamic value) =>
      value is Map<String, dynamic> ? value['type'] : "string";

  @override
  EdgeInsets builderVariant(
      BuildContext buildContext, dynamic value, EdgeInsets defaultValue) {
    if (value is String) {
      if (value.trim() == '' || !value.contains(",")) {
        return defaultValue;
      }

      var values = value.split(",");

      if (values.isEmpty || values.length != 4) {
        return defaultValue;
      }

      return EdgeInsets.only(
        left: SchemaWidget.parse<double>(buildContext, values[0], 0.0),
        top: SchemaWidget.parse<double>(buildContext, values[1], 0.0),
        right: SchemaWidget.parse<double>(buildContext, values[2], 0.0),
        bottom: SchemaWidget.parse<double>(buildContext, values[3], 0.0),
      );
    }

    if (value is Map<String, dynamic>) {
      switch (value['type']) {
        case 'zero':
          return EdgeInsets.zero;
        case 'all':
          return EdgeInsets.all(
            SchemaWidget.parse<double>(buildContext, value['value']),
          );
        case 'fromWindowPadding':
          return EdgeInsets.fromWindowPadding(
            SchemaWidget.parse<WindowPadding>(buildContext, value['padding']),
            SchemaWidget.parse<double>(buildContext, value['devicePixelRatio']),
          );
        case 'lerp':
          return EdgeInsets.lerp(
            SchemaWidget.parse<EdgeInsets>(buildContext, value['a']),
            SchemaWidget.parse<EdgeInsets>(buildContext, value['b']),
            SchemaWidget.parse<double>(buildContext, value['t']),
          );
        case 'symmetric':
          return EdgeInsets.symmetric(
            horizontal: SchemaWidget.parse<double>(
                buildContext, value['horizontal'], 0.0),
            vertical: SchemaWidget.parse<double>(
                buildContext, value['vertical'], 0.0),
          );
        case 'fromLTRB':
          return EdgeInsets.fromLTRB(
            SchemaWidget.parse<double>(buildContext, value['left']),
            SchemaWidget.parse<double>(buildContext, value['top']),
            SchemaWidget.parse<double>(buildContext, value['right']),
            SchemaWidget.parse<double>(buildContext, value['bottom']),
          );
        case 'only':
          return EdgeInsets.only(
            left: SchemaWidget.parse<double>(buildContext, value['left'], 0.0),
            bottom:
                SchemaWidget.parse<double>(buildContext, value['bottom'], 0.0),
            top: SchemaWidget.parse<double>(buildContext, value['top'], 0.0),
            right:
                SchemaWidget.parse<double>(buildContext, value['right'], 0.0),
          );
        default:
          return defaultValue;
      }
    }

    return defaultValue;
  }
}
