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
import 'package:json_schema/json_schema.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to [Container]
@SchemaParser("AnimatedContainer",
    "https://schema.legytma.com.br/1.1.2/schema/widget/animated_container.schema.json")
class AnimatedContainerSchemaWidgetParser
    extends SchemaWidgetParser<AnimatedContainer> {
  /// Create instance of parser
  AnimatedContainerSchemaWidgetParser(JsonSchema jsonSchema)
      : super(jsonSchema);

  @override
  AnimatedContainer builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    return AnimatedContainer(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      alignment:
          SchemaWidget.parse<Alignment>(buildContext, value['alignment']),
      padding: SchemaWidget.parse<EdgeInsetsGeometry>(
          buildContext, value['padding']),
      color: SchemaWidget.parse<Color>(buildContext, value['color']),
      margin:
          SchemaWidget.parse<EdgeInsetsGeometry>(buildContext, value['margin']),
      width: SchemaWidget.parse<double>(buildContext, value['width']),
      height: SchemaWidget.parse<double>(buildContext, value['height']),
      constraints: SchemaWidget.parse<BoxConstraints>(
          buildContext, value['constraints']),
      child: SchemaWidget.parse<Widget>(buildContext, value['child']),
      decoration:
          SchemaWidget.parse<Decoration>(buildContext, value['decoration']),
      foregroundDecoration: SchemaWidget.parse<Decoration>(
          buildContext, value['foregroundDecoration']),
      transform: SchemaWidget.parse<Matrix4>(buildContext, value['transform']),
      duration: SchemaWidget.parse<Duration>(
          buildContext, value['duration'], kThemeAnimationDuration),
      curve: SchemaWidget.parse<Curve>(
          buildContext, value['curve'], Curves.linear),
      onEnd: SchemaWidget.parse<VoidCallback>(buildContext, value['onEnd']),
    );
  }
}
