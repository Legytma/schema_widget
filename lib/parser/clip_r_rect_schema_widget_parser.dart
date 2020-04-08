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

/// [SchemaWidgetParser] to [ClipRRect]
class ClipRRectSchemaWidgetParser extends SchemaWidgetParser {
  @override
  String get parserName => "ClipRRect";

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
          "borderRadius": {
            "title": "Border Radius",
            "description": "String containing border radius values splited by"
                " comma.",
            "type": "string",
            "default": "0,0,0,0",
            "examples": ["0,0,0,0", "0,2,5,9"]
          }
        },
        "required": ["type", "borderRadius"],
      });

  @override
  Widget builder(BuildContext buildContext, Map<String, dynamic> map) {
    var radius = map['borderRadius'].toString().split(",");
    var topLeft = double.parse(radius[0]);
    var topRight = double.parse(radius[1]);
    var bottomLeft = double.parse(radius[2]);
    var bottomRight = double.parse(radius[3]);
    var clipBehaviorString = map['clipBehavior'];

    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight)),
      clipBehavior: parseClip(clipBehaviorString, Clip.antiAlias),
      child: SchemaWidget.build(buildContext, map["child"]),
    );
  }
}
