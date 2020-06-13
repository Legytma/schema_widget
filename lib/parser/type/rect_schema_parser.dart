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

/// Schema parser from [Map<String, dynamic>] to [Rect]
///
/// Created by Windol <windol@legytma.com.br> at 01/05/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("Rect", "https://legytma.com.br/schema/rect.schema.json", <String>[
  "zero",
  "largest",
  "fromPoints",
  "fromCircle",
  "fromCenter",
  "lerp",
  "fromLTRB",
  "fromLTWH",
])
class RectSchemaParser
    extends VariantTypeSchemaParser<Rect, Map<String, dynamic>, Rect> {
  /// Create instance of parser using [JsonSchema] to validate values.
  RectSchemaParser(JsonSchema jsonSchema,
      [Map<String, VariantTypeSchemaParser<Rect, Map<String, dynamic>, Rect>>
          typeSchemaParsers])
      : super(jsonSchema, typeSchemaParsers);

  @override
  String extractType(Map<String, dynamic> value) => value['type'];

  // FIXME: REMOVE-ME
  /*
  @override
  VariantTypeSchemaParser<Rect, Map<String, dynamic>, Rect> newVariantInstance(
          String schemaUri) =>
      RectSchemaParser(schemaUri, null);
  */

  @override
   Rect builderVariant(BuildContext buildContext, Map<String, dynamic> value,
      Rect defaultValue) {
    switch (extractType(value)) {
      case 'zero':
        return Rect.zero;
      case 'largest':
        return Rect.largest;
      case 'fromPoints':
        return Rect.fromPoints(
          SchemaWidget.parse<Offset>(buildContext, value['a']),
          SchemaWidget.parse<Offset>(buildContext, value['b']),
        );
      case 'fromCircle':
        return Rect.fromCircle(
          center: SchemaWidget.parse<Offset>(buildContext, value['center']),
          radius: SchemaWidget.parse<double>(buildContext, value['radius']),
        );
      case 'fromCenter':
        return Rect.fromCenter(
          center: SchemaWidget.parse<Offset>(buildContext, value['center']),
          height: SchemaWidget.parse<double>(buildContext, value['height']),
          width: SchemaWidget.parse<double>(buildContext, value['width']),
        );
      case 'lerp':
        return Rect.lerp(
          SchemaWidget.parse<Rect>(buildContext, value['a']),
          SchemaWidget.parse<Rect>(buildContext, value['b']),
          SchemaWidget.parse<double>(buildContext, value['t']),
        );
      case 'fromLTRB':
        return Rect.fromLTRB(
          SchemaWidget.parse<double>(buildContext, value['left']),
          SchemaWidget.parse<double>(buildContext, value['top']),
          SchemaWidget.parse<double>(buildContext, value['right']),
          SchemaWidget.parse<double>(buildContext, value['bottom']),
        );
      case 'fromLTWH':
        return Rect.fromLTWH(
          SchemaWidget.parse<double>(buildContext, value['left']),
          SchemaWidget.parse<double>(buildContext, value['top']),
          SchemaWidget.parse<double>(buildContext, value['width']),
          SchemaWidget.parse<double>(buildContext, value['height']),
        );
      default:
        return defaultValue;
    }
  }
}
