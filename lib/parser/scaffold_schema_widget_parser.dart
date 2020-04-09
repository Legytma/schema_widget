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

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:json_schema/src/json_schema/json_schema.dart';
import 'package:logging/logging.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to parse [Scaffold].
class ScaffoldSchemaWidgetParser extends SchemaWidgetParser {
  static final Logger _log = Logger("ScaffoldSchemaWidgetParser");

  @override
  String get parserName => "Scaffold";

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

    return Scaffold(
      key: SchemaWidget.build(buildContext, map["key"]),
      backgroundColor: parseHexColor(map['backgroundColor']),
      body: SchemaWidget.build(buildContext, map["body"]),
      drawer: SchemaWidget.build(buildContext, map["drawer"]),
      appBar: SchemaWidget.build(buildContext, map["appBar"]),
      floatingActionButton:
          SchemaWidget.build(buildContext, map["floatingActionButton"]),
      primary: map['primary'] ?? true,
      bottomNavigationBar:
          SchemaWidget.build(buildContext, map["bottomNavigationBar"]),
      bottomSheet: SchemaWidget.build(buildContext, map["bottomSheet"]),
      drawerDragStartBehavior: parseDragStartBehavior(
          map['drawerDragStartBehavior'], DragStartBehavior.start),
      drawerEdgeDragWidth: parseDouble(map['drawerEdgeDragWidth']),
      drawerScrimColor: parseHexColor(map['drawerScrimColor']),
      endDrawer: SchemaWidget.build(buildContext, map["endDrawer"]),
      extendBody: map['extendBody'] ?? false,
      extendBodyBehindAppBar: map['extendBodyBehindAppBar'] ?? false,
      floatingActionButtonAnimator: parseFloatingActionButtonAnimator(
          buildContext, map['floatingActionButtonAnimator']),
      floatingActionButtonLocation: parseFloatingActionButtonLocation(
          buildContext, map['floatingActionButtonLocation']),
      persistentFooterButtons:
          SchemaWidget.build(buildContext, map["persistentFooterButtons"]),
      resizeToAvoidBottomInset: map['resizeToAvoidBottomInset'],
      resizeToAvoidBottomPadding: map['resizeToAvoidBottomPadding'],
    );
  }
}
