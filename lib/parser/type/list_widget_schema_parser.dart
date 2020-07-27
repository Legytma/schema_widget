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

import '../../schema_widget.dart';

/// [SchemaWidgetParser] to [List]<[Widget]>
@SchemaParser("List<Widget>",
    "https://schema.legytma.com.br/2.0.0/schema/list_widget.schema.json")
class ListWidgetSchemaParser
    extends TypeSchemaParser<List<Widget>, dynamic, List<Widget>> {
//  final Logger _log = Logger("ListWidgetSchemaParser");

  /// Create instance
  ListWidgetSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  List<Widget> builder(BuildContext buildContext, dynamic value,
      [List<Widget> defaultValue]) {
    if (value is! List<Map<String, dynamic>>) {
      return defaultValue;
    }

    var widgetSchemaParser = SchemaWidget.getParserByType(Widget);
    var widgets = <Widget>[];

    for (var map in value) {
      var widget = widgetSchemaParser.parse(buildContext, map);

      if (widget != null) {
        widgets.add(widget);
      }
    }

    if (widgets.isEmpty) {
      return defaultValue;
    }

    return widgets;
  }
}
