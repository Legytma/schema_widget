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

/// [SchemaWidgetParser] to [Placeholder]
@SchemaParser("Placeholder", "https://legytma.com.br/schema/widget/place_holder.schema.json")
class PlaceholderSchemaWidgetParser extends SchemaWidgetParser<Placeholder> {
  /// Create instance of parser
  PlaceholderSchemaWidgetParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   Placeholder builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    return Placeholder(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      color: SchemaWidget.parse<Color>(
          buildContext, value['color'], const Color(0xFF455A64)),
      strokeWidth:
          SchemaWidget.parse<double>(buildContext, value['strokeWidth'], 2.0),
      fallbackWidth: SchemaWidget.parse<double>(
          buildContext, value['fallbackWidth'], 400.0),
      fallbackHeight: SchemaWidget.parse<double>(
          buildContext, value['fallbackHeight'], 400.0),
    );
  }
}
