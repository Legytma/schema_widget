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

/// Schema parser from [Map<String, dynamic>] to [TabBarTheme]
///
/// Created by Windol <windol@legytma.com.br> at 23/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("TabBarTheme",
    "https://schema.legytma.com.br/1.1.2/schema/tab_bar_theme.schema.json")
class TabBarThemeSchemaParser
    extends TypeSchemaParser<TabBarTheme, Map<String, dynamic>, TabBarTheme> {
  /// Create instance of parser using [JsonSchema] to validate values.
  TabBarThemeSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  TabBarTheme builder(BuildContext buildContext, Map<String, dynamic> value,
      [TabBarTheme defaultValue]) {
    return TabBarTheme(
      labelStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['labelStyle']),
      indicator:
          SchemaWidget.parse<Decoration>(buildContext, value['indicator']),
      indicatorSize: SchemaWidget.parse<TabBarIndicatorSize>(
          buildContext, value['indicatorSize']),
      labelColor: SchemaWidget.parse<Color>(buildContext, value['labelColor']),
      labelPadding: SchemaWidget.parse<EdgeInsetsGeometry>(
          buildContext, value['labelPadding']),
      unselectedLabelColor: SchemaWidget.parse<Color>(
          buildContext, value['unselectedLabelColor']),
      unselectedLabelStyle: SchemaWidget.parse<TextStyle>(
          buildContext, value['unselectedLabelStyle']),
    );
  }
}