// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br).
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:json_schema/json_schema.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to [GestureDetector]
@SchemaParser("GestureDetector",
    "https://schema.legytma.com.br/3.0.0/schema/widget/gesture_detector.schema.json")
class GestureDetectorSchemaWidgetParser
    extends SchemaWidgetParser<GestureDetector> {
  /// Create instance of parser
  GestureDetectorSchemaWidgetParser([JsonSchema jsonSchema])
      : super(jsonSchema);

  @override
  GestureDetector builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    return GestureDetector(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      dragStartBehavior: SchemaWidget.parse<DragStartBehavior>(
          buildContext, value['dragStartBehavior'], DragStartBehavior.start),
      behavior:
          SchemaWidget.parse<HitTestBehavior>(buildContext, value['behavior']),
      excludeFromSemantics: value['excludeFromSemantics'] ?? false,
      onDoubleTap: SchemaWidget.parse<GestureTapCallback>(
          buildContext, value['onDoubleTap']),
      onForcePressEnd: SchemaWidget.parse<GestureForcePressEndCallback>(
          buildContext, value['onForcePressEnd']),
      onForcePressPeak: SchemaWidget.parse<GestureForcePressPeakCallback>(
          buildContext, value['onForcePressPeak']),
      onForcePressStart: SchemaWidget.parse<GestureForcePressStartCallback>(
          buildContext, value['onForcePressStart']),
      onForcePressUpdate: SchemaWidget.parse<GestureForcePressUpdateCallback>(
          buildContext, value['onForcePressUpdate']),
      onHorizontalDragCancel: SchemaWidget.parse<GestureDragCancelCallback>(
          buildContext, value['onHorizontalDragCancel']),
      onHorizontalDragDown: SchemaWidget.parse<GestureDragDownCallback>(
          buildContext, value['onHorizontalDragDown']),
      onHorizontalDragEnd: SchemaWidget.parse<GestureDragEndCallback>(
          buildContext, value['onHorizontalDragEnd']),
      onHorizontalDragStart: SchemaWidget.parse<GestureDragStartCallback>(
          buildContext, value['onHorizontalDragStart']),
      onHorizontalDragUpdate: SchemaWidget.parse<GestureDragUpdateCallback>(
          buildContext, value['onHorizontalDragUpdate']),
      onLongPress: SchemaWidget.parse<GestureLongPressCallback>(
          buildContext, value['onLongPress']),
      onLongPressEnd: SchemaWidget.parse<GestureLongPressEndCallback>(
          buildContext, value['onLongPressEnd']),
      onLongPressMoveUpdate:
          SchemaWidget.parse<GestureLongPressMoveUpdateCallback>(
              buildContext, value['onLongPressMoveUpdate']),
      onLongPressStart: SchemaWidget.parse<GestureLongPressStartCallback>(
          buildContext, value['onLongPressStart']),
      onLongPressUp: SchemaWidget.parse<GestureLongPressUpCallback>(
          buildContext, value['onLongPressUp']),
      onPanCancel: SchemaWidget.parse<GestureDragCancelCallback>(
          buildContext, value['onPanCancel']),
      onPanDown: SchemaWidget.parse<GestureDragDownCallback>(
          buildContext, value['onPanDown']),
      onPanEnd: SchemaWidget.parse<GestureDragEndCallback>(
          buildContext, value['onPanEnd']),
      onPanStart: SchemaWidget.parse<GestureDragStartCallback>(
          buildContext, value['onPanStart']),
      onPanUpdate: SchemaWidget.parse<GestureDragUpdateCallback>(
          buildContext, value['onPanUpdate']),
      onScaleEnd: SchemaWidget.parse<GestureScaleEndCallback>(
          buildContext, value['onScaleEnd']),
      onScaleStart: SchemaWidget.parse<GestureScaleStartCallback>(
          buildContext, value['onScaleStart']),
      onScaleUpdate: SchemaWidget.parse<GestureScaleUpdateCallback>(
          buildContext, value['onScaleUpdate']),
      onSecondaryTapCancel: SchemaWidget.parse<GestureTapCancelCallback>(
          buildContext, value['onSecondaryTapCancel']),
      onSecondaryTapDown: SchemaWidget.parse<GestureTapDownCallback>(
          buildContext, value['onSecondaryTapDown']),
      onSecondaryTapUp: SchemaWidget.parse<GestureTapUpCallback>(
          buildContext, value['onSecondaryTapUp']),
      onTap:
          SchemaWidget.parse<GestureTapCallback>(buildContext, value['onTap']),
      onTapCancel: SchemaWidget.parse<GestureTapCancelCallback>(
          buildContext, value['onTapCancel']),
      onTapDown: SchemaWidget.parse<GestureTapDownCallback>(
          buildContext, value['onTapDown']),
      onTapUp: SchemaWidget.parse<GestureTapUpCallback>(
          buildContext, value['onTapUp']),
      onVerticalDragCancel: SchemaWidget.parse<GestureDragCancelCallback>(
          buildContext, value['onVerticalDragCancel']),
      onVerticalDragDown: SchemaWidget.parse<GestureDragDownCallback>(
          buildContext, value['onVerticalDragDown']),
      onVerticalDragEnd: SchemaWidget.parse<GestureDragEndCallback>(
          buildContext, value['onVerticalDragEnd']),
      onVerticalDragStart: SchemaWidget.parse<GestureDragStartCallback>(
          buildContext, value['onVerticalDragStart']),
      onVerticalDragUpdate: SchemaWidget.parse<GestureDragUpdateCallback>(
          buildContext, value['onVerticalDragUpdate']),
      child: SchemaWidget.parse<Widget>(buildContext, value['child']),
    );
  }
}
