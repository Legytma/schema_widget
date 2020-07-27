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

import '../../schema_widget.dart';

/// Schema parser from [Map<String, dynamic>] to [ButtonThemeData]
///
/// Created by Windol <windol@legytma.com.br> on 22/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("ButtonThemeData",
    "https://schema.legytma.com.br/1.1.2/schema/button_theme_data.schema.json")
class ButtonThemeDataSchemaParser extends TypeSchemaParser<ButtonThemeData,
    Map<String, dynamic>, ButtonThemeData> {
  /// Create instance of parser using [JsonSchema] to validate values.
  ButtonThemeDataSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  ButtonThemeData builder(BuildContext buildContext, Map<String, dynamic> value,
      [ButtonThemeData defaultValue]) {
    return ButtonThemeData(
      layoutBehavior: SchemaWidget.parse<ButtonBarLayoutBehavior>(buildContext,
          value['layoutBehavior'], ButtonBarLayoutBehavior.padded),
      shape: SchemaWidget.parse<ShapeBorder>(buildContext, value['shape']),
      padding: SchemaWidget.parse<EdgeInsetsGeometry>(
          buildContext, value['padding']),
      textTheme: SchemaWidget.parse<ButtonTextTheme>(
          buildContext, value['textTheme'], ButtonTextTheme.normal),
      height: SchemaWidget.parse<double>(buildContext, value['height'], 36.0),
      splashColor:
          SchemaWidget.parse<Color>(buildContext, value['splashColor']),
      materialTapTargetSize: SchemaWidget.parse<MaterialTapTargetSize>(
          buildContext, value['materialTapTargetSize']),
      hoverColor: SchemaWidget.parse<Color>(buildContext, value['hoverColor']),
      highlightColor:
          SchemaWidget.parse<Color>(buildContext, value['highlightColor']),
      focusColor: SchemaWidget.parse<Color>(buildContext, value['focusColor']),
      disabledColor:
          SchemaWidget.parse<Color>(buildContext, value['disabledColor']),
      colorScheme:
          SchemaWidget.parse<ColorScheme>(buildContext, value['colorScheme']),
      buttonColor:
          SchemaWidget.parse<Color>(buildContext, value['buttonColor']),
      alignedDropdown: value['alignedDropdown'] ?? false,
      minWidth:
          SchemaWidget.parse<double>(buildContext, value['minWidth'], 88.0),
    );
  }
}
