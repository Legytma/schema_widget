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

/// Schema parser from [Map<String, dynamic>] to [Offset]
///
/// Created by Windol <windol@legytma.com.br> at 29/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("Offset",
    "https://schema.legytma.com.br/3.0.0/schema/offset.schema.json", <String>[
  "default",
  "fromDirection",
  "infinite",
  "lerp",
  "zero",
])
class OffsetSchemaParser
    extends VariantTypeSchemaParser<Offset, Map<String, dynamic>, Offset> {
  /// Create instance of parser using [JsonSchema] to validate values.
  OffsetSchemaParser(
      [JsonSchema jsonSchema,
      Map<String, VariantTypeSchemaParser<Offset, Map<String, dynamic>, Offset>>
          typeSchemaParsers])
      : super(jsonSchema, typeSchemaParsers);

  @override
  String extractType(Map<String, dynamic> value) => value['type'];

  // FIXME: REMOVE-ME
  /*
  @override
  VariantTypeSchemaParser<Offset, Map<String, dynamic>, Offset>
      newVariantInstance(String schemaUri) =>
          OffsetSchemaParser(schemaUri, null);
  */

  @override
  Offset builderVariant(BuildContext buildContext, Map<String, dynamic> value,
      Offset defaultValue) {
    switch (value['type']) {
      case 'default':
        return Offset(
          SchemaWidget.parse<double>(buildContext, value['dx']),
          SchemaWidget.parse<double>(buildContext, value['dy']),
        );
      case 'fromDirection':
        return Offset.fromDirection(
            SchemaWidget.parse<double>(buildContext, value['direction']),
            SchemaWidget.parse<double>(buildContext, value['distance'], 1.0));
      case 'infinite':
        return Offset.infinite;
      case 'lerp':
        return Offset.lerp(
          SchemaWidget.parse<Offset>(buildContext, value['a']),
          SchemaWidget.parse<Offset>(buildContext, value['b']),
          SchemaWidget.parse<double>(buildContext, value['t']),
        );
      case 'zero':
        return Offset.zero;
      default:
        return defaultValue;
    }
  }
}
