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

/// [SchemaWidgetParser] to [Wrap]
@SchemaParser("Wrap",
    "https://schema.legytma.com.br/2.0.0/schema/widget/wrap.schema.json")
class WrapSchemaWidgetParser extends SchemaWidgetParser<Wrap> {
  /// Create instance of parser
  WrapSchemaWidgetParser([JsonSchema jsonSchema]) : super(jsonSchema);

  @override
  Wrap builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    return Wrap(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      direction: SchemaWidget.parse<Axis>(
          buildContext, value['direction'], Axis.horizontal),
      alignment: SchemaWidget.parse<WrapAlignment>(
          buildContext, value['alignment'], WrapAlignment.start),
      spacing: SchemaWidget.parse<double>(buildContext, value['spacing'], 0.0),
      runAlignment: SchemaWidget.parse<WrapAlignment>(
          buildContext, value['runAlignment'], WrapAlignment.start),
      runSpacing:
          SchemaWidget.parse<double>(buildContext, value['runSpacing'], 0.0),
      crossAxisAlignment: SchemaWidget.parse<WrapCrossAlignment>(
          buildContext, value['crossAxisAlignment'], WrapCrossAlignment.start),
      textDirection: SchemaWidget.parse<TextDirection>(
          buildContext, value["textDirection"]),
      verticalDirection: SchemaWidget.parse<VerticalDirection>(
          buildContext, value['verticalDirection'], VerticalDirection.down),
      children: SchemaWidget.parse<List<Widget>>(
          buildContext, value['children'], const <Widget>[]),
    );
  }
}
