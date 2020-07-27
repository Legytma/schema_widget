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

/// Schema parser from [Map<String, dynamic>] to [TextTheme]
///
/// Created by Windol <windol@legytma.com.br> on 21/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("TextTheme",
    "https://schema.legytma.com.br/1.1.2/schema/text_theme.schema.json")
class TextThemeSchemaParser
    extends TypeSchemaParser<TextTheme, Map<String, dynamic>, TextTheme> {
  /// Create instance of parser using [JsonSchema] to validate values.
  TextThemeSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  TextTheme builder(BuildContext buildContext, Map<String, dynamic> value,
      [TextTheme defaultValue]) {
    return TextTheme(
      bodyText1:
          SchemaWidget.parse<TextStyle>(buildContext, value["bodyText1"]),
      bodyText2:
          SchemaWidget.parse<TextStyle>(buildContext, value["bodyText2"]),
      button: SchemaWidget.parse<TextStyle>(buildContext, value["button"]),
      caption: SchemaWidget.parse<TextStyle>(buildContext, value["caption"]),
      headline1:
          SchemaWidget.parse<TextStyle>(buildContext, value["headline1"]),
      headline2:
          SchemaWidget.parse<TextStyle>(buildContext, value["headline2"]),
      headline3:
          SchemaWidget.parse<TextStyle>(buildContext, value["headline3"]),
      headline4:
          SchemaWidget.parse<TextStyle>(buildContext, value["headline4"]),
      headline5:
          SchemaWidget.parse<TextStyle>(buildContext, value["headline5"]),
      headline6:
          SchemaWidget.parse<TextStyle>(buildContext, value["headline6"]),
      overline: SchemaWidget.parse<TextStyle>(buildContext, value["overline"]),
      subtitle1:
          SchemaWidget.parse<TextStyle>(buildContext, value["subtitle1"]),
      subtitle2:
          SchemaWidget.parse<TextStyle>(buildContext, value["subtitle2"]),
    );
  }
}
