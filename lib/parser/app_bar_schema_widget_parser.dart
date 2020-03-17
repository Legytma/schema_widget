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
import 'package:logging/logging.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to parse [AppBar].
class AppBarSchemaWidgetParser extends SchemaWidgetParser {
  static final Logger _log = Logger("AppBarSchemaWidgetParser");

  @override
  String get parserName => "AppBar";

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
    _log.finer(map);

    return AppBar(
//      key: SchemaWidget.build(buildContext, map["key"]),
      title: SchemaWidget.build(buildContext, map["title"]),
      primary: map["primary"] ?? true,
      actions: SchemaWidget.build(buildContext, map["actions"]),
//      actionsIconTheme: SchemaWidget.build(buildContext, map["actionsIconTheme"]),
      automaticallyImplyLeading: map["automaticallyImplyLeading"] ?? true,
      backgroundColor: parseHexColor(map["backgroundColor"]),
      bottom: SchemaWidget.build(buildContext, map["bottom"]),
      bottomOpacity: map["bottomOpacity"] ?? 1.0,
//      brightness: SchemaWidget.build(buildContext, map["brightness"]),
      centerTitle: map["centerTitle"],
      elevation: map["elevation"],
      flexibleSpace: SchemaWidget.build(buildContext, map["flexibleSpace"]),
//      iconTheme: SchemaWidget.build(buildContext, map["iconTheme"]),
      leading: SchemaWidget.build(buildContext, map["leading"]),
//      shape: SchemaWidget.build(buildContext, map["shape"]),
//      textTheme: SchemaWidget.build(buildContext, map["textTheme"]),
      titleSpacing: map["titleSpacing"] ?? NavigationToolbar.kMiddleSpacing,
      toolbarOpacity: map["toolbarOpacity"] ?? 1.0,
    );
  }
}
