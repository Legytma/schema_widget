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

import 'package:flutter/material.dart';
import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to parse [SchemaFormWidget].
@SchemaParser("IconButton",
    "https://schema.legytma.com.br/2.0.0/schema/widget/icon_button.schema.json")
class IconButtonSchemaWidgetParser extends SchemaWidgetParser<IconButton> {
  static final Logger _log = Logger("IconButtonSchemaWidgetParser");

  /// Create instance of parser
  IconButtonSchemaWidgetParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  IconButton builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    _log.finer(value);

    return IconButton(
      key: SchemaWidget.parse<Key>(buildContext, value["key"]),
      icon: SchemaWidget.parse<Widget>(buildContext, value["icon"]),
      onPressed:
          SchemaWidget.parse<VoidCallback>(buildContext, value["onPressed"]),
      padding: SchemaWidget.parse<EdgeInsetsGeometry>(
          buildContext, value["padding"], const EdgeInsets.all(8.0)),
      focusNode:
          SchemaWidget.parse<FocusNode>(buildContext, value["focusNode"]),
      autofocus: value["autofocus"] ?? false,
      alignment: SchemaWidget.parse<AlignmentGeometry>(
          buildContext, value["alignment"], Alignment.center),
      color: SchemaWidget.parse<Color>(buildContext, value["color"]),
      disabledColor:
          SchemaWidget.parse<Color>(buildContext, value["disabledColor"]),
      enableFeedback: value["enableFeedback"] ?? true,
      focusColor: SchemaWidget.parse<Color>(buildContext, value["focusColor"]),
      highlightColor:
          SchemaWidget.parse<Color>(buildContext, value["highlightColor"]),
      hoverColor: SchemaWidget.parse<Color>(buildContext, value["hoverColor"]),
      iconSize:
          SchemaWidget.parse<double>(buildContext, value["iconSize"], 24.0),
      splashColor:
          SchemaWidget.parse<Color>(buildContext, value["splashColor"]),
      tooltip: value["tooltip"],
    );
  }
}
