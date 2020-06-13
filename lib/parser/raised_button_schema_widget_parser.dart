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

/// [SchemaWidgetParser] to [RaisedButton]
@SchemaParser("RaisedButton", "https://legytma.com.br/schema/widget/raised_button.schema.json")
class RaisedButtonSchemaWidgetParser extends SchemaWidgetParser<RaisedButton> {
  /// Create instance of parser
  RaisedButtonSchemaWidgetParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   RaisedButton builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    return RaisedButton(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      onLongPress:
          SchemaWidget.parse<VoidCallback>(buildContext, value['onLongPress']),
      clipBehavior: SchemaWidget.parse<Clip>(
          buildContext, value['clipBehavior'], Clip.none),
      shape: SchemaWidget.parse<ShapeBorder>(buildContext, value['shape']),
      focusNode:
          SchemaWidget.parse<FocusNode>(buildContext, value['focusNode']),
      autofocus: value['autofocus'] ?? false,
      focusColor: SchemaWidget.parse<Color>(buildContext, value['focusColor']),
      highlightColor:
          SchemaWidget.parse<Color>(buildContext, value['highlightColor']),
      hoverColor: SchemaWidget.parse<Color>(buildContext, value['hoverColor']),
      textTheme:
          SchemaWidget.parse<ButtonTextTheme>(buildContext, value['textTheme']),
      animationDuration: SchemaWidget.parse<Duration>(
          buildContext, value['animationDuration']),
      colorBrightness: SchemaWidget.parse<Brightness>(
          buildContext, value['colorBrightness']),
      focusElevation:
          SchemaWidget.parse<double>(buildContext, value['focusElevation']),
      highlightElevation:
          SchemaWidget.parse<double>(buildContext, value['highlightElevation']),
      hoverElevation:
          SchemaWidget.parse<double>(buildContext, value['hoverElevation']),
      materialTapTargetSize: SchemaWidget.parse<MaterialTapTargetSize>(
          buildContext, value['materialTapTargetSize']),
      onHighlightChanged: SchemaWidget.parse<ValueChanged<bool>>(
          buildContext, value['onHighlightChanged']),
      color: SchemaWidget.parse<Color>(buildContext, value['color']),
      disabledColor:
          SchemaWidget.parse<Color>(buildContext, value['disabledColor']),
      disabledElevation:
          SchemaWidget.parse<double>(buildContext, value['disabledElevation']),
      disabledTextColor:
          SchemaWidget.parse<Color>(buildContext, value['disabledTextColor']),
      elevation: SchemaWidget.parse<double>(buildContext, value['elevation']),
      padding: SchemaWidget.parse<EdgeInsetsGeometry>(
          buildContext, value['padding']),
      splashColor:
          SchemaWidget.parse<Color>(buildContext, value['splashColor']),
      textColor: SchemaWidget.parse<Color>(buildContext, value['textColor']),
      child: SchemaWidget.parse<Widget>(buildContext, value['child']),
      onPressed:
          SchemaWidget.parse<VoidCallback>(buildContext, value['onPressed']),
    );
  }
}
