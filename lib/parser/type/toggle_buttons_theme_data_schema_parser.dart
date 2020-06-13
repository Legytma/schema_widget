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
import 'package:json_schema/src/json_schema/json_schema.dart';

import '../../schema_widget.dart';

/// Schema parser from [Map<String, dynamic>] to [ToggleButtonsThemeData]
///
/// Created by Windol <windol@legytma.com.br> at 24/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("ToggleButtonsThemeData", 
    "https://legytma.com.br/schema/toggle_buttons_theme_data.schema.json")
class ToggleButtonsThemeDataSchemaParser extends TypeSchemaParser<
    ToggleButtonsThemeData, Map<String, dynamic>, ToggleButtonsThemeData> {
  /// Create instance of parser using [JsonSchema] to validate values.
  ToggleButtonsThemeDataSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   ToggleButtonsThemeData builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [ToggleButtonsThemeData defaultValue]) {
    return ToggleButtonsThemeData(
      splashColor:
          SchemaWidget.parse<Color>(buildContext, value['splashColor']),
      hoverColor: SchemaWidget.parse<Color>(buildContext, value['hoverColor']),
      highlightColor:
          SchemaWidget.parse<Color>(buildContext, value['highlightColor']),
      focusColor: SchemaWidget.parse<Color>(buildContext, value['focusColor']),
      disabledColor:
          SchemaWidget.parse<Color>(buildContext, value['disabledColor']),
      color: SchemaWidget.parse<Color>(buildContext, value['color']),
      textStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['textStyle']),
      borderColor:
          SchemaWidget.parse<Color>(buildContext, value['borderColor']),
      borderRadius: SchemaWidget.parse<BorderRadius>(
          buildContext, buildContext, value['borderRadius']),
      borderWidth:
          SchemaWidget.parse<double>(buildContext, value['borderWidth']),
      constraints: SchemaWidget.parse<BoxConstraints>(
          buildContext, value['constraints']),
      disabledBorderColor:
          SchemaWidget.parse<Color>(buildContext, value['disabledBorderColor']),
      fillColor: SchemaWidget.parse<Color>(buildContext, value['fillColor']),
      selectedBorderColor:
          SchemaWidget.parse<Color>(buildContext, value['selectedBorderColor']),
      selectedColor:
          SchemaWidget.parse<Color>(buildContext, value['selectedColor']),
    );
  }
}
