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

import '../schema_widget.dart';

/// [SchemaWidgetParser] to [Card]
@SchemaParser("Card",
    "https://schema.legytma.com.br/2.0.0/schema/widget/card.schema.json")
class CardSchemaWidgetParser extends SchemaWidgetParser<Card> {
  /// Create instance of parser
  CardSchemaWidgetParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  Card builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    return Card(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      color: SchemaWidget.parse<Color>(buildContext, value['color']),
      child: SchemaWidget.parse<Widget>(buildContext, value['child']),
      shape: SchemaWidget.parse<ShapeBorder>(buildContext, value['shape']),
      elevation: SchemaWidget.parse<double>(buildContext, value['elevation']),
      borderOnForeground: value['borderOnForeground'] ?? true,
      clipBehavior:
          SchemaWidget.parse<Clip>(buildContext, value['clipBehavior']),
      margin:
          SchemaWidget.parse<EdgeInsetsGeometry>(buildContext, value['margin']),
      semanticContainer: value['semanticContainer'] ?? true,
    );
  }
}
