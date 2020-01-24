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
import 'package:json_schema_dart2/src/json_schema/json_schema.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to [AspectRatio]
class AspectRatioSchemaWidgetParser extends SchemaWidgetParser {
  @override
  String get parserName => "AspectRatio";

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
          "aspectRatio": {
            "title": "Aspect Ratio",
            "description": "Define the aspect ratio",
            "type": "number",
          },
          "child": {
            "title": "Child",
            "description": "Content of this widget",
            "type": "object",
          }
        },
        "required": ["type", "aspectRatio"],
      });

  @override
  Widget builder(BuildContext buildContext, Map<String, dynamic> map) {
    return AspectRatio(
      aspectRatio: map["aspectRatio"],
      child: SchemaWidget.buildFromMap(buildContext, map["child"]),
    );
  }
}
