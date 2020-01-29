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

/// [SchemaWidgetParser] to [Image.asset]
class AssetImageSchemaWidgetParser extends SchemaWidgetParser {
  @override
  String get parserName => "AssetImage";

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
          "name": {
            "title": "Name",
            "description": "Name of image asset to load",
            "type": "string",
            "examples": ["assets/LegytmaSolucoesInteligentesCubico.png"],
          },
        },
        "required": ["type", "name"],
      });

  @override
  Widget builder(BuildContext buildContext, Map<String, dynamic> map) {
    String name = map['name'];
    String semanticLabel =
        map.containsKey('semanticLabel') ? map['semanticLabel'] : null;
    bool excludeFromSemantics = map.containsKey('excludeFromSemantics')
        ? map['excludeFromSemantics']
        : false;
    double scale = map.containsKey("scale") ? map['scale'] : null;
    double width = map.containsKey('width') ? map['width'] : null;
    double height = map.containsKey('height') ? map['height'] : null;
    var color = map.containsKey('color') ? parseHexColor(map['color']) : null;
    var blendMode =
        map.containsKey('blendMode') ? parseBlendMode(map['blendMode']) : null;
    var boxFit = map.containsKey('boxFit') ? parseBoxFit(map['boxFit']) : null;
    var alignment = map.containsKey('alignment')
        ? parseAlignment(map['alignment'])
        : Alignment.center;
    var repeat = map.containsKey('repeat')
        ? parseImageRepeat(map['repeat'])
        : ImageRepeat.noRepeat;
    var centerSlice =
        map.containsKey('centerSlice') ? parseRect(map['centerSlice']) : null;
    bool matchTextDirection = map.containsKey('matchTextDirection')
        ? map['matchTextDirection']
        : false;
    var gaplessPlayback =
        map.containsKey('gaplessPlayback') ? map['gaplessPlayback'] : false;
    var filterQuality = map.containsKey('filterQuality')
        ? parseFilterQuality(map['filterQuality'])
        : FilterQuality.low;

    var widget = Image.asset(
      name,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      colorBlendMode: blendMode,
      fit: boxFit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      filterQuality: filterQuality,
    );

    return widget;
  }
}
