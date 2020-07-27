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

/// Schema parser from [Map<String, dynamic>] to [SnackBarThemeData]
///
/// Created by Windol <windol@legytma.com.br> at 23/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("SnackBarThemeData",
    "https://schema.legytma.com.br/1.1.2/schema/snack_bar_theme_data.schema.json")
class SnackBarThemeDataSchemaParser extends TypeSchemaParser<SnackBarThemeData,
    Map<String, dynamic>, SnackBarThemeData> {
  /// Create instance of parser using [JsonSchema] to validate values.
  SnackBarThemeDataSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  SnackBarThemeData builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [SnackBarThemeData defaultValue]) {
    return SnackBarThemeData(
      shape: SchemaWidget.parse<ShapeBorder>(buildContext, value['shape']),
      elevation: SchemaWidget.parse<double>(buildContext, value['elevation']),
      backgroundColor:
          SchemaWidget.parse<Color>(buildContext, value['backgroundColor']),
      contentTextStyle: SchemaWidget.parse<TextStyle>(
          buildContext, value['contentTextStyle']),
      actionTextColor:
          SchemaWidget.parse<Color>(buildContext, value['actionTextColor']),
      behavior:
          SchemaWidget.parse<SnackBarBehavior>(buildContext, value['behavior']),
      disabledActionTextColor: SchemaWidget.parse<Color>(
          buildContext, value['disabledActionTextColor']),
    );
  }
}
