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

/// [SchemaWidgetParser] to [GestureDetector]
class GestureDetectorSchemaWidgetParser extends SchemaWidgetParser {
  @override
  String get parserName => "GestureDetector";

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
    return GestureDetector(
      onDoubleTap: SchemaWidget.build(buildContext, map['onDoubleTap']),
      onForcePressEnd: SchemaWidget.build(buildContext, map['onForcePressEnd']),
      onForcePressPeak:
          SchemaWidget.build(buildContext, map['onForcePressPeak']),
      onForcePressStart:
          SchemaWidget.build(buildContext, map['onForcePressStart']),
      onForcePressUpdate:
          SchemaWidget.build(buildContext, map['onForcePressUpdate']),
      onHorizontalDragCancel:
          SchemaWidget.build(buildContext, map['onHorizontalDragCancel']),
      onHorizontalDragDown:
          SchemaWidget.build(buildContext, map['onHorizontalDragDown']),
      onHorizontalDragEnd:
          SchemaWidget.build(buildContext, map['onHorizontalDragEnd']),
      onHorizontalDragStart:
          SchemaWidget.build(buildContext, map['onHorizontalDragStart']),
      onHorizontalDragUpdate:
          SchemaWidget.build(buildContext, map['onHorizontalDragUpdate']),
      onLongPress: SchemaWidget.build(buildContext, map['onLongPress']),
      onLongPressEnd: SchemaWidget.build(buildContext, map['onLongPressEnd']),
      onLongPressMoveUpdate:
          SchemaWidget.build(buildContext, map['onLongPressMoveUpdate']),
      onLongPressStart:
          SchemaWidget.build(buildContext, map['onLongPressStart']),
      onLongPressUp: SchemaWidget.build(buildContext, map['onLongPressUp']),
      onPanCancel: SchemaWidget.build(buildContext, map['onPanCancel']),
      onPanDown: SchemaWidget.build(buildContext, map['onPanDown']),
      onPanEnd: SchemaWidget.build(buildContext, map['onPanEnd']),
      onPanStart: SchemaWidget.build(buildContext, map['onPanStart']),
      onPanUpdate: SchemaWidget.build(buildContext, map['onPanUpdate']),
      onScaleEnd: SchemaWidget.build(buildContext, map['onScaleEnd']),
      onScaleStart: SchemaWidget.build(buildContext, map['onScaleStart']),
      onScaleUpdate: SchemaWidget.build(buildContext, map['onScaleUpdate']),
      onSecondaryTapCancel:
          SchemaWidget.build(buildContext, map['onSecondaryTapCancel']),
      onSecondaryTapDown:
          SchemaWidget.build(buildContext, map['onSecondaryTapDown']),
      onSecondaryTapUp:
          SchemaWidget.build(buildContext, map['onSecondaryTapUp']),
      onTap: SchemaWidget.build(buildContext, map['onTap']),
      onTapCancel: SchemaWidget.build(buildContext, map['onTapCancel']),
      onTapDown: SchemaWidget.build(buildContext, map['onTapDown']),
      onTapUp: SchemaWidget.build(buildContext, map['onTapUp']),
      onVerticalDragCancel:
          SchemaWidget.build(buildContext, map['onVerticalDragCancel']),
      onVerticalDragDown:
          SchemaWidget.build(buildContext, map['onVerticalDragDown']),
      onVerticalDragEnd:
          SchemaWidget.build(buildContext, map['onVerticalDragEnd']),
      onVerticalDragStart:
          SchemaWidget.build(buildContext, map['onVerticalDragStart']),
      onVerticalDragUpdate:
          SchemaWidget.build(buildContext, map['onVerticalDragUpdate']),
      child: SchemaWidget.build(buildContext, map['child']),
    );
  }
}
