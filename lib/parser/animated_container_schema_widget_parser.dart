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

/// [SchemaWidgetParser] to [Container]
class AnimatedContainerSchemaWidgetParser extends SchemaWidgetParser {
  @override
  String get parserName => "AnimatedContainer";

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
    return AnimatedContainer(
      key: SchemaWidget.build(buildContext, map['key']),
      alignment: parseAlignment(map['alignment']),
      padding: parseEdgeInsetsGeometry(map['padding']),
      color: parseHexColor(map['color']),
      margin: parseEdgeInsetsGeometry(map['margin']),
      width: parseDouble(map['width']),
      height: parseDouble(map['height']),
      constraints: parseBoxConstraints(map['constraints']),
      child: SchemaWidget.build(buildContext, map['child']),
      decoration: parseDecoration(buildContext, map['decoration']),
      foregroundDecoration:
          parseDecoration(buildContext, map['foregroundDecoration']),
      transform: SchemaWidget.build(buildContext, map['transform']),
      duration:
      parseDuration(buildContext, map['duration'], kThemeAnimationDuration),
      curve: parseCurve(map['curve'], Curves.linear),
      onEnd: SchemaWidget.build(buildContext, map['onEnd']),
    );
  }
}