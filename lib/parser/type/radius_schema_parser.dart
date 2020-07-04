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

/// Schema parser from [Map<String, dynamic>] to [Radius]
///
/// Created by Windol <windol@legytma.com.br> at 30/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser(
    "Radius", "https://schema.legytma.com.br/1.1.2/schema/radius.schema.json", <String>[
  "string",
  "zero",
  "circular",
  "elliptical",
  "lerp",
])
class RadiusSchemaParser
    extends VariantTypeSchemaParser<Radius, dynamic, Radius> {
  /// Create instance of parser using [JsonSchema] to validate values.
  RadiusSchemaParser(JsonSchema jsonSchema,
      [Map<String, VariantTypeSchemaParser<Radius, dynamic, Radius>>
          typeSchemaParsers])
      : super(jsonSchema, typeSchemaParsers);

  @override
  String extractType(dynamic value) =>
      value is Map<String, dynamic> ? value['type'] : "string";

  @override
  Radius builderVariant(
      BuildContext buildContext, dynamic value, Radius defaultValue) {
    if (value is String) {
      if (value.trim().isEmpty) {
        return defaultValue;
      }

      return Radius.circular(SchemaWidget.parse<double>(buildContext, value));
    }

    if (value is Map<String, dynamic>) {
      switch (value["type"]) {
        case 'zero':
          return Radius.zero;
        case 'circular':
          return Radius.circular(
            SchemaWidget.parse<double>(buildContext, value['radius']),
          );
        case 'elliptical':
          return Radius.elliptical(
            SchemaWidget.parse<double>(buildContext, value['x']),
            SchemaWidget.parse<double>(buildContext, value['y']),
          );
        case 'lerp':
          return Radius.lerp(
            SchemaWidget.parse<Radius>(buildContext, value['a']),
            SchemaWidget.parse<Radius>(buildContext, value['b']),
            SchemaWidget.parse<double>(buildContext, value['t']),
          );
        default:
          return defaultValue;
      }
    }

    return defaultValue;
  }
}
