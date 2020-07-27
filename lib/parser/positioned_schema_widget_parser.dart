/*
 * Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br).
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:json_schema/json_schema.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to [Positioned]
@SchemaParser("Positioned",
    "https://schema.legytma.com.br/2.0.0/schema/widget/positioned.schema.json")
class PositionedSchemaWidgetParser extends SchemaWidgetParser<Positioned> {
  /// Create instance of parser
  PositionedSchemaWidgetParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  Positioned builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    return Positioned(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      child: SchemaWidget.parse<Widget>(buildContext, value["child"]),
      top: SchemaWidget.parse<double>(buildContext, value['top']),
      right: SchemaWidget.parse<double>(buildContext, value["right"]),
      bottom: SchemaWidget.parse<double>(buildContext, value["bottom"]),
      left: SchemaWidget.parse<double>(buildContext, value["left"]),
      width: SchemaWidget.parse<double>(buildContext, value["width"]),
      height: SchemaWidget.parse<double>(buildContext, value["height"]),
    );
  }
}
