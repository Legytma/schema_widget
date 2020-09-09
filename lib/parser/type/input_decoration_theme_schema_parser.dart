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

/// Schema parser from [Map<String, dynamic>] to [InputDecorationTheme]
///
/// Created by Windol <windol@legytma.com.br> at 23/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("InputDecorationTheme",
    "https://schema.legytma.com.br/2.0.0/schema/input_decoration_theme.schema.json")
class InputDecorationThemeSchemaParser extends TypeSchemaParser<
    InputDecorationTheme, Map<String, dynamic>, InputDecorationTheme> {
  /// Create instance of parser using [JsonSchema] to validate values.
  InputDecorationThemeSchemaParser([JsonSchema jsonSchema]) : super(jsonSchema);

  @override
  InputDecorationTheme builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [InputDecorationTheme defaultValue]) {
    return InputDecorationTheme(
      hoverColor: SchemaWidget.parse<Color>(buildContext, value['hoverColor']),
      focusColor: SchemaWidget.parse<Color>(buildContext, value['focusColor']),
      contentPadding: SchemaWidget.parse<EdgeInsetsGeometry>(
          buildContext, value['contentPadding']),
      isDense: value['isDense'] ?? false,
      errorStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['errorStyle']),
      alignLabelWithHint: value['alignLabelWithHint'] ?? false,
      border: SchemaWidget.parse<InputBorder>(buildContext, value['border']),
      counterStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['counterStyle']),
      disabledBorder: SchemaWidget.parse<InputBorder>(
          buildContext, value['disabledBorder']),
      enabledBorder:
          SchemaWidget.parse<InputBorder>(buildContext, value['enabledBorder']),
      errorBorder:
          SchemaWidget.parse<InputBorder>(buildContext, value['errorBorder']),
      errorMaxLines: value['errorMaxLines'],
      fillColor: SchemaWidget.parse<Color>(buildContext, value['fillColor']),
      filled: value['filled'] ?? false,
      focusedBorder:
          SchemaWidget.parse<InputBorder>(buildContext, value['focusedBorder']),
      focusedErrorBorder: SchemaWidget.parse<InputBorder>(
          buildContext, value['focusedErrorBorder']),
      floatingLabelBehavior: SchemaWidget.parse<FloatingLabelBehavior>(
          buildContext, value['floatingLabelBehavior']),
      helperMaxLines: value['helperMaxLines'],
      helperStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['helperStyle']),
      hintStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['hintStyle']),
      isCollapsed: value['isCollapsed'] ?? false,
      labelStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['labelStyle']),
      prefixStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['prefixStyle']),
      suffixStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['suffixStyle']),
    );
  }
}
