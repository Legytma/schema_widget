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

/// Schema parser from [Map<String, dynamic>] to [ButtonBarTheme]
///
/// Created by Windol <windol@legytma.com.br> on 21/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("ButtonBarThemeData",
    "https://schema.legytma.com.br/3.0.0/schema/button_bar_theme_data.schema.json")
class ButtonBarThemeDataSchemaParser extends TypeSchemaParser<
    ButtonBarThemeData, Map<String, dynamic>, ButtonBarThemeData> {
  /// Create instance of parser using [JsonSchema] to validate values.
  ButtonBarThemeDataSchemaParser([JsonSchema jsonSchema]) : super(jsonSchema);

  @override
  ButtonBarThemeData builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [ButtonBarThemeData defaultValue]) {
    return ButtonBarThemeData(
      alignment: SchemaWidget.parse<MainAxisAlignment>(
          buildContext, value['alignment']),
      buttonAlignedDropdown: value['buttonAlignedDropdown'],
      buttonHeight:
          SchemaWidget.parse<double>(buildContext, value['buttonHeight']),
      buttonMinWidth:
          SchemaWidget.parse<double>(buildContext, value['buttonMinWidth']),
      buttonPadding: SchemaWidget.parse<EdgeInsetsGeometry>(
          buildContext, value['buttonPadding']),
      buttonTextTheme: SchemaWidget.parse<ButtonTextTheme>(
          buildContext, value['buttonTextTheme']),
      layoutBehavior: SchemaWidget.parse<ButtonBarLayoutBehavior>(
          buildContext, value['layoutBehavior']),
      mainAxisSize:
          SchemaWidget.parse<MainAxisSize>(buildContext, value['mainAxisSize']),
    );
  }
}
