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

/// Schema parser from [Map<String, dynamic>] to [DialogTheme]
///
/// Created by Windol <windol@legytma.com.br> at 22/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("DialogTheme",
    "https://schema.legytma.com.br/3.0.0/schema/dialog_theme.schema.json")
class DialogThemeSchemaParser
    extends TypeSchemaParser<DialogTheme, Map<String, dynamic>, DialogTheme> {
  /// Create instance of parser using [JsonSchema] to validate values.
  DialogThemeSchemaParser([JsonSchema jsonSchema])
      : super("DialogTheme", jsonSchema);

  @override
  DialogTheme builder(BuildContext buildContext, Map<String, dynamic> value,
      [DialogTheme defaultValue]) {
    return DialogTheme(
      elevation: SchemaWidget.parse<double>(buildContext, value['elevation']),
      shape: SchemaWidget.parse<ShapeBorder>(buildContext, value['shape']),
      backgroundColor:
          SchemaWidget.parse<Color>(buildContext, value['backgroundColor']),
      contentTextStyle: SchemaWidget.parse<TextStyle>(
          buildContext, value['contentTextStyle']),
      titleTextStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['titleTextStyle']),
    );
  }
}
