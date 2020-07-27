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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_schema/json_schema.dart';

import '../../schema_widget.dart';

/// Schema parser from [Map<String, dynamic>] to [CupertinoThemeData]
///
/// Created by Windol <windol@legytma.com.br> at 22/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("CupertinoThemeData",
    "https://schema.legytma.com.br/1.1.2/schema/cupertino_theme_data.schema.json")
class CupertinoThemeDataSchemaParser extends TypeSchemaParser<
    CupertinoThemeData, Map<String, dynamic>, CupertinoThemeData> {
  /// Create instance of parser using [JsonSchema] to validate values.
  CupertinoThemeDataSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  CupertinoThemeData builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [CupertinoThemeData defaultValue]) {
    return CupertinoThemeData(
      textTheme: SchemaWidget.parse<CupertinoTextThemeData>(
          buildContext, value['textTheme']),
      brightness:
          SchemaWidget.parse<Brightness>(buildContext, value['brightness']),
      scaffoldBackgroundColor: SchemaWidget.parse<Color>(
          buildContext, value['scaffoldBackgroundColor']),
      primaryColor:
          SchemaWidget.parse<Color>(buildContext, value['primaryColor']),
      barBackgroundColor:
          SchemaWidget.parse<Color>(buildContext, value['barBackgroundColor']),
      primaryContrastingColor: SchemaWidget.parse<Color>(
          buildContext, value['primaryContrastingColor']),
    );
  }
}
