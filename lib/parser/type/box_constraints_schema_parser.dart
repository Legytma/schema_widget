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

/// Schema parser from [Map<String, dynamic>] to [BoxConstraints]
///
/// Created by Windol <windol@legytma.com.br> at 30/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser(
    "BoxConstraints",
    "https://schema.legytma.com.br/3.0.0/schema/box_constraints.schema.json",
    <String>[
      "loose",
      "tightFor",
      "expand",
      "tightForFinite",
      "lerp",
      "default",
    ])
class BoxConstraintsSchemaParser extends VariantTypeSchemaParser<BoxConstraints,
    Map<String, dynamic>, BoxConstraints> {
  /// Create instance of parser using [JsonSchema] to validate values.
  BoxConstraintsSchemaParser(
      [JsonSchema jsonSchema,
      Map<
              String,
              VariantTypeSchemaParser<BoxConstraints, Map<String, dynamic>,
                  BoxConstraints>>
          typeSchemaParsers])
      : super(jsonSchema, typeSchemaParsers);

  @override
  String extractType(Map<String, dynamic> value) => value['type'];

  // FIXME: REMOVE-ME
  /*
  @override
  VariantTypeSchemaParser<BoxConstraints, Map<String, dynamic>, BoxConstraints>
      newVariantInstance(String schemaUri) =>
          BoxConstraintsSchemaParser(schemaUri, null);
  */

  @override
  BoxConstraints builderVariant(BuildContext buildContext,
      Map<String, dynamic> value, BoxConstraints defaultValue) {
    switch (value['type']) {
      case 'loose':
        return BoxConstraints.loose(
          SchemaWidget.parse<Size>(buildContext, value['size']),
        );
      case 'tightFor':
        return BoxConstraints.tightFor(
          width: SchemaWidget.parse<double>(buildContext, value['width']),
          height: SchemaWidget.parse<double>(buildContext, value['height']),
        );
      case 'expand':
        return BoxConstraints.expand(
          width: SchemaWidget.parse<double>(buildContext, value['width']),
          height: SchemaWidget.parse<double>(buildContext, value['height']),
        );
      case 'tightForFinite':
        return BoxConstraints.tightForFinite(
          width: SchemaWidget.parse<double>(
              buildContext, value['width'], double.infinity),
          height: SchemaWidget.parse<double>(
              buildContext, value['height'], double.infinity),
        );
      case 'lerp':
        return BoxConstraints.lerp(
          SchemaWidget.parse<BoxConstraints>(buildContext, value['a']),
          SchemaWidget.parse<BoxConstraints>(buildContext, value['b']),
          SchemaWidget.parse<double>(buildContext, value['t']),
        );
      case 'default':
        return BoxConstraints(
          minWidth:
              SchemaWidget.parse<double>(buildContext, value['minWidth'], 0.0),
          maxWidth: SchemaWidget.parse<double>(
              buildContext, value['maxWidth'], double.infinity),
          minHeight:
              SchemaWidget.parse<double>(buildContext, value['minHeight'], 0.0),
          maxHeight: SchemaWidget.parse<double>(
              buildContext, value['maxHeight'], double.infinity),
        );
      default:
        return defaultValue;
    }
  }
}
