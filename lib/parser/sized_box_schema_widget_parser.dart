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

import '../schema_widget.dart';

/// Schema parser from [Map<String, dynamic>] to [SizedBox]
///
/// Created by Windol <windol@legytma.com.br> at 14/05/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("SizedBox", 
    "https://legytma.com.br/schema/widget/sized_box.schema.json", <String>[
  "expand",
  "fromSize",
  "shrink",
  "default",
])
class SizedBoxSchemaWidgetParser extends VariantSchemaWidgetParser<SizedBox> {
  /// Create instance of parser using [JsonSchema] to validate values.
  SizedBoxSchemaWidgetParser(JsonSchema jsonSchema,
      [Map<String, VariantSchemaWidgetParser<SizedBox>> typeSchemaParsers])
      : super(jsonSchema, typeSchemaParsers);

  @override
  String extractType(Map<String, dynamic> value) => value['sizedBoxType'];

  // FIXME: REMOVE-ME
  /*
  @override
  VariantSchemaWidgetParser<SizedBox> newVariantInstance(String schemaUri) =>
      SizedBoxSchemaWidgetParser(schemaUri, null);
  */

  @override
   SizedBox builderVariant(BuildContext buildContext, Map<String, dynamic> value,
      Widget defaultValue) {
    var key = SchemaWidget.parse<Key>(buildContext, value['key']);
    var child = SchemaWidget.parse<Widget>(buildContext, value["child"]);

    switch (extractType(value)) {
      case 'expand':
        return SizedBox.expand(
          key: key,
          child: child,
        );
      case 'fromSize':
        return SizedBox.fromSize(
          key: key,
          child: child,
          size: SchemaWidget.parse<Size>(buildContext, value['size']),
        );
      case 'shrink':
        return SizedBox.shrink(
          key: key,
          child: child,
        );
      case 'default':
        return SizedBox(
          key: key,
          child: child,
          height: SchemaWidget.parse<double>(buildContext, value['height']),
          width: SchemaWidget.parse<double>(buildContext, value['width']),
        );
      default:
        return defaultValue;
    }
  }
}
