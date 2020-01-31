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
import 'package:json_schema/src/json_schema/json_schema.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to [ListTile]
class ListTileSchemaWidgetParser extends SchemaWidgetParser {
  @override
  String get parserName => "ListTile";

  @override
  JsonSchema get jsonSchema => JsonSchema.createSchema({
        "\$schema": "http://json-schema.org/draft-06/schema#",
//        "\$id": "#widget-schema",
        "title": "Container Parser Schema",
        "description": "Schema to validation of JSON used to parse Container"
            " Widget.",
        "type": "object",
        "\$comment": "You can add all valid properties to complete validation.",
        "properties": {
          "type": {
            "\$comment": "Used to identify parser. Every parser can permit only"
                " one type",
            "title": "Type",
            "description": "Identify the widget type",
            "type": "string",
            "default": parserName,
            "examples": [parserName],
            "enum": [parserName],
            "const": parserName,
          },
        },
        "required": ["type"],
      });

  @override
  Widget builder(BuildContext buildContext, Map<String, dynamic> map) {
    bool isThreeLine =
        map.containsKey("isThreeLine") ? map["isThreeLine"] : false;
    var contentPadding = map.containsKey("contentPadding")
        ? parseEdgeInsetsGeometry(map["contentPadding"])
        : null;
    bool dense = map.containsKey("dense") ? map["dense"] : false;
    bool enabled = map.containsKey("enabled") ? map["enabled"] : true;
    var leading = map.containsKey("leading")
        ? SchemaWidget.build(buildContext, map["leading"])
        : null;
    bool selected = map.containsKey("selected") ? map["selected"] : false;
    var subtitle = map.containsKey("subtitle")
        ? SchemaWidget.build(buildContext, map["subtitle"])
        : null;
    var title = map.containsKey("title")
        ? SchemaWidget.build(buildContext, map["title"])
        : null;
    var trailing = map.containsKey("trailing")
        ? SchemaWidget.build(buildContext, map["trailing"])
        : null;
//    String tapEvent = map.containsKey("tapEvent") ?  : null;

    return ListTile(
      isThreeLine: isThreeLine,
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      dense: dense,
      contentPadding: contentPadding,
      enabled: enabled,
      onTap: SchemaWidget.build(buildContext, map["tapEvent"]),
      selected: selected,
    );
  }
}
