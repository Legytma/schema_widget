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

/// Schema parser from [Map<String, dynamic>] to [Border]
///
/// Created by Windol <windol@legytma.com.br> at 28/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("Border",
    "https://schema.legytma.com.br/3.0.0/schema/border.schema.json", <String>[
  "default",
  "all",
  "fromBorderSide",
  "merge",
  "lerp",
])
class BorderSchemaParser
    extends VariantTypeSchemaParser<Border, Map<String, dynamic>, Border> {
  /// Create instance of parser using [JsonSchema] to validate values.
  BorderSchemaParser(
      [JsonSchema jsonSchema,
      Map<String, VariantTypeSchemaParser<Border, Map<String, dynamic>, Border>>
          typeSchemaParsers])
      : super("Border", jsonSchema, typeSchemaParsers);

  @override
  String extractType(Map<String, dynamic> value) => value['type'];

  @override
  Border builderVariant(BuildContext buildContext, Map<String, dynamic> value,
      Border defaultValue) {
    switch (value['type']) {
      case 'default':
        return Border(
          top: SchemaWidget.parse<BorderSide>(
              buildContext, value['top'], BorderSide.none),
          bottom: SchemaWidget.parse<BorderSide>(
              buildContext, value['bottom'], BorderSide.none),
          left: SchemaWidget.parse<BorderSide>(
              buildContext, value['left'], BorderSide.none),
          right: SchemaWidget.parse<BorderSide>(
              buildContext, value['right'], BorderSide.none),
        );
      case 'all':
        return Border.all(
          color: SchemaWidget.parse<Color>(
              buildContext, value['color'], const Color(0xFF000000)),
          style: SchemaWidget.parse<BorderStyle>(
              buildContext, value['style'], BorderStyle.solid),
          width: SchemaWidget.parse<double>(buildContext, value['width'], 1.0),
        );
      case 'fromBorderSide':
        return Border.fromBorderSide(
          SchemaWidget.parse<BorderSide>(buildContext, value['side']),
        );
      case 'lerp':
        return Border.lerp(
          SchemaWidget.parse<Border>(buildContext, value['a']),
          SchemaWidget.parse<Border>(buildContext, value['b']),
          SchemaWidget.parse<double>(buildContext, value['t']),
        );
      case 'merge':
        return Border.merge(
          SchemaWidget.parse<Border>(buildContext, value['a']),
          SchemaWidget.parse<Border>(buildContext, value['b']),
        );
      default:
        return defaultValue;
    }
  }
}
