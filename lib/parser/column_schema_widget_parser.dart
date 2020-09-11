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

/// [SchemaWidgetParser] to [Column]
@SchemaParser("Column",
    "https://schema.legytma.com.br/3.0.0/schema/widget/column.schema.json")
class ColumnSchemaWidgetParser extends SchemaWidgetParser<Column> {
  /// Create instance of parser
  ColumnSchemaWidgetParser([JsonSchema jsonSchema]) : super(jsonSchema);

  @override
  Column builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    return Column(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      crossAxisAlignment: SchemaWidget.parse<CrossAxisAlignment>(
          buildContext, value['crossAxisAlignment'], CrossAxisAlignment.center),
      mainAxisAlignment: SchemaWidget.parse<MainAxisAlignment>(
          buildContext, value['mainAxisAlignment'], MainAxisAlignment.start),
      mainAxisSize: SchemaWidget.parse<MainAxisSize>(
          buildContext, value['mainAxisSize'], MainAxisSize.max),
      textBaseline:
          SchemaWidget.parse<TextBaseline>(buildContext, value['textBaseline']),
      textDirection: SchemaWidget.parse<TextDirection>(
          buildContext, value['textDirection']),
      verticalDirection: SchemaWidget.parse<VerticalDirection>(
          buildContext, value['verticalDirection'], VerticalDirection.down),
      children: SchemaWidget.parse<List<Widget>>(
          buildContext, value['children'], const <Widget>[]),
    );
  }
}
