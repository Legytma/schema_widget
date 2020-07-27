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

/// [SchemaWidgetParser] to [FloatingActionButton]
@SchemaParser("FloatingActionButton",
    "https://schema.legytma.com.br/2.0.0/schema/widget/floating_action_button.schema.json")
class FloatingActionButtonSchemaWidgetParser
    extends SchemaWidgetParser<FloatingActionButton> {
  /// Create instance of parser
  FloatingActionButtonSchemaWidgetParser(JsonSchema jsonSchema)
      : super(jsonSchema);

  @override
  FloatingActionButton builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    return FloatingActionButton(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      onPressed:
          SchemaWidget.parse<VoidCallback>(buildContext, value['onPressed']),
      autofocus: value['autofocus'] ?? false,
      backgroundColor:
          SchemaWidget.parse<Color>(buildContext, value['backgroundColor']),
      child: SchemaWidget.parse<Widget>(buildContext, value['child']),
      clipBehavior: SchemaWidget.parse<Clip>(
          buildContext, value['clipBehavior'], Clip.none),
      disabledElevation:
          SchemaWidget.parse<double>(buildContext, value['disabledElevation']),
      elevation: SchemaWidget.parse<double>(buildContext, value['elevation']),
      focusColor: SchemaWidget.parse<Color>(buildContext, value['focusColor']),
      focusElevation:
          SchemaWidget.parse<double>(buildContext, value['focusElevation']),
      focusNode:
          SchemaWidget.parse<FocusNode>(buildContext, value['focusNode']),
      foregroundColor:
          SchemaWidget.parse<Color>(buildContext, value['foregroundColor']),
      // FIXME: Impossible create because default value is private a object.
      //heroTag: SchemaWidget.parse<Object>(buildContext, value['heroTag']),
      highlightElevation:
          SchemaWidget.parse<double>(buildContext, value['highlightElevation']),
      hoverColor: SchemaWidget.parse<Color>(buildContext, value['hoverColor']),
      hoverElevation:
          SchemaWidget.parse<double>(buildContext, value['hoverElevation']),
      isExtended: value['isExtended'] ?? false,
      materialTapTargetSize: SchemaWidget.parse<MaterialTapTargetSize>(
          buildContext, value['materialTapTargetSize']),
      mini: value['mini'] ?? false,
      shape: SchemaWidget.parse<ShapeBorder>(buildContext, value['shape']),
      splashColor:
          SchemaWidget.parse<Color>(buildContext, value['splashColor']),
      tooltip: value['tooltip'],
    );
  }
}
