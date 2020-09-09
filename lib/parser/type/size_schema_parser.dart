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

/// Schema parser from [Map<String, dynamic>] to [Size]
///
/// Created by Windol <windol@legytma.com.br> at 30/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("Size",
    "https://schema.legytma.com.br/2.0.0/schema/size.schema.json", <String>[
  "zero",
  "infinite",
  "fromHeight",
  "fromRadius",
  "fromWidth",
  "square",
  "default",
])
class SizeSchemaParser
    extends VariantTypeSchemaParser<Size, Map<String, dynamic>, Size> {
  /// Create instance of parser using [JsonSchema] to validate values.
  SizeSchemaParser(
      [JsonSchema jsonSchema,
      Map<String, VariantTypeSchemaParser<Size, Map<String, dynamic>, Size>>
          typeSchemaParsers])
      : super(jsonSchema, typeSchemaParsers);

  @override
  String extractType(Map<String, dynamic> value) => value['type'];

  // FIXME: REMOVE-ME
  /*
  @override
  VariantTypeSchemaParser<Size, Map<String, dynamic>, Size> newVariantInstance(
          String schemaUri) =>
      SizeSchemaParser(schemaUri, null);
  */

  @override
  Size builderVariant(BuildContext buildContext, Map<String, dynamic> value,
      Size defaultValue) {
    switch (extractType(value)) {
      case 'zero':
        return Size.zero;
      case 'infinite':
        return Size.infinite;
      case 'fromHeight':
        return Size.fromHeight(
          SchemaWidget.parse<double>(buildContext, value['height']),
        );
      case 'fromRadius':
        return Size.fromRadius(
          SchemaWidget.parse<double>(buildContext, value['radius']),
        );
      case 'fromWidth':
        return Size.fromWidth(
          SchemaWidget.parse<double>(buildContext, value['width']),
        );
      case 'square':
        return Size.square(
          SchemaWidget.parse<double>(buildContext, value['dimension']),
        );
      case 'default':
        return Size(
          SchemaWidget.parse<double>(buildContext, value['width']),
          SchemaWidget.parse<double>(buildContext, value['height']),
        );
      default:
        return defaultValue;
    }
  }
}
