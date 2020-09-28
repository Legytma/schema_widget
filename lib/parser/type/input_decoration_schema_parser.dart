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

/// Schema parser from [Map<String, dynamic>] to [InputDecoration]
///
/// Created by Windol <windol@legytma.com.br> at 27/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("InputDecoration",
    "https://schema.legytma.com.br/3.0.0/schema/input_decoration.schema.json")
class InputDecorationSchemaParser extends TypeSchemaParser<InputDecoration,
    Map<String, dynamic>, InputDecoration> {
  /// Create instance of parser using [JsonSchema] to validate values.
  InputDecorationSchemaParser([JsonSchema jsonSchema])
      : super("InputDecoration", jsonSchema);

  @override
  InputDecoration builder(BuildContext buildContext, Map<String, dynamic> value,
      [InputDecoration defaultValue]) {
    return InputDecoration(
      labelStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['labelStyle']),
      suffixStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['suffixStyle']),
      prefixStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['prefixStyle']),
      hintStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['hintStyle']),
      helperStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['helperStyle']),
      helperMaxLines:
          SchemaWidget.parse<int>(buildContext, value['helperMaxLines']),
      floatingLabelBehavior: SchemaWidget.parse<FloatingLabelBehavior>(
          buildContext, value['floatingLabelBehavior']),
      prefixIconConstraints: SchemaWidget.parse<BoxConstraints>(
          buildContext, value['prefixIconConstraints']),
      suffixIconConstraints: SchemaWidget.parse<BoxConstraints>(
          buildContext, value['suffixIconConstraints']),
      focusedErrorBorder: SchemaWidget.parse<InputBorder>(
          buildContext, value['focusedErrorBorder']),
      focusedBorder:
          SchemaWidget.parse<InputBorder>(buildContext, value['focusedBorder']),
      filled: value['filled'],
      fillColor: SchemaWidget.parse<Color>(buildContext, value['fillColor']),
      errorMaxLines:
          SchemaWidget.parse<int>(buildContext, value['errorMaxLines']),
      errorBorder:
          SchemaWidget.parse<InputBorder>(buildContext, value['errorBorder']),
      enabledBorder:
          SchemaWidget.parse<InputBorder>(buildContext, value['enabledBorder']),
      disabledBorder: SchemaWidget.parse<InputBorder>(
          buildContext, value['disabledBorder']),
      counterStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['counterStyle']),
      border: SchemaWidget.parse<InputBorder>(buildContext, value['border']),
      alignLabelWithHint: value['alignLabelWithHint'],
      errorStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['errorStyle']),
      isDense: value['isDense'],
      contentPadding: SchemaWidget.parse<EdgeInsetsGeometry>(
          buildContext, value['contentPadding']),
      focusColor: SchemaWidget.parse<Color>(buildContext, value['focusColor']),
      hoverColor: SchemaWidget.parse<Color>(buildContext, value['hoverColor']),
      suffixIcon: SchemaWidget.parse<Widget>(buildContext, value['suffixIcon']),
      enabled: value['enabled'] ?? true,
      errorText: value['errorText'],
      hintText: value['hintText'],
      labelText: value['labelText'],
      helperText: value['helperText'],
      semanticCounterText: value['semanticCounterText'],
      prefixText: value['prefixText'],
      counterText: value['counterText'],
      counter: SchemaWidget.parse<Widget>(buildContext, value['counter']),
      hintMaxLines:
          SchemaWidget.parse<int>(buildContext, value['hintMaxLines']),
      icon: SchemaWidget.parse<Widget>(buildContext, value['icon']),
      prefix: SchemaWidget.parse<Widget>(buildContext, value['prefix']),
      prefixIcon: SchemaWidget.parse<Widget>(buildContext, value['prefixIcon']),
      suffix: SchemaWidget.parse<Widget>(buildContext, value['suffix']),
      suffixText: value['suffixText'],
    );
  }
}
