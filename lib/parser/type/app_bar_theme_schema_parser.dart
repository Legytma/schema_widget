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

/// Schema parser from [Map<String, dynamic>] to [AppBarTheme]
///
/// Created by Windol <windol@legytma.com.br> on 21/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("AppBarTheme",
    "https://schema.legytma.com.br/1.1.2/schema/app_bar_theme.schema.json")
class AppBarThemeSchemaParser
    extends TypeSchemaParser<AppBarTheme, Map<String, dynamic>, AppBarTheme> {
  /// Create instance of parser using [JsonSchema] to validate values.
  AppBarThemeSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  AppBarTheme builder(BuildContext buildContext, Map<String, dynamic> value,
      [AppBarTheme defaultValue]) {
    return AppBarTheme(
      color: SchemaWidget.parse<Color>(buildContext, value["color"]),
      textTheme:
          SchemaWidget.parse<TextTheme>(buildContext, value["textTheme"]),
      iconTheme:
          SchemaWidget.parse<IconThemeData>(buildContext, value["iconTheme"]),
      brightness:
          SchemaWidget.parse<Brightness>(buildContext, value["brightness"]),
      actionsIconTheme: SchemaWidget.parse<IconThemeData>(
          buildContext, value["actionsIconTheme"]),
      elevation: SchemaWidget.parse<double>(buildContext, "elevation"),
    );
  }
}
