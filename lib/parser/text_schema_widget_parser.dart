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

import '../schema_widget.dart';

/// [SchemaWidgetParser] to [Text]
class TextSchemaWidgetParser extends SchemaWidgetParser {
  @override
  String get parserName => "Text";

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
          "data": {
            "title": "Data",
            "description": "Texto a ser exibido",
            "type": "string",
          }
        },
        "required": ["type", "data"],
      });

  @override
  Widget builder(BuildContext buildContext, Map<String, dynamic> map) {
    TextSpan textSpan = SchemaWidget.build(buildContext, map['textSpan']);

    var textAlign = parseTextAlign(map['textAlign']);
    var overflow = parseTextOverflow(map['overflow']);
    var maxLines = map['maxLines'];
    var semanticsLabel = map['semanticsLabel'];
    var softWrap = map['softWrap'];
    var textDirection = parseTextDirection(map['textDirection']);
    var style = parseTextStyle(map['style']);
    var textScaleFactor = parseDouble(map['textScaleFactor']);

    if (textSpan == null) {
      return Text(
        map['data'],
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        textDirection: textDirection,
        style: style,
        textScaleFactor: textScaleFactor,
      );
    } else {
      return Text.rich(
        textSpan,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        textDirection: textDirection,
        style: style,
        textScaleFactor: textScaleFactor,
      );
    }
  }
}

/// Parser to [TextSpan]
class TextSpanParser {
  /// Parse [Map]<[String], [dynamic]> to [TextSpan]
  static TextSpan parse(BuildContext buildContext, Map<String, dynamic> map) {
//    String clickEvent = map.containsKey("recognizer") ?  : "";
    var textSpan = TextSpan(
        text: map['text'],
        style: parseTextStyle(map['style']),
        recognizer: TapGestureRecognizer()
          ..onTap = SchemaWidget.build(buildContext, map['recognizer']),
        children: []);

    if (map.containsKey('children')) {
      _parseChildren(buildContext, textSpan, map['children']);
    }

    return textSpan;
  }

  static void _parseChildren(BuildContext buildContext, TextSpan textSpan,
      List<dynamic> childrenSpan) {
    for (var childmap in childrenSpan) {
      textSpan.children.add(parse(buildContext, childmap));
    }
  }
}
