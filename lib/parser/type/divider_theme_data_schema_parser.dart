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

/// Schema parser from [Map<String, dynamic>] to [DividerThemeData]
///
/// Created by Windol <windol@legytma.com.br> at 22/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("DividerThemeData",
    "https://schema.legytma.com.br/3.0.0/schema/divider_theme_data.schema.json")
class DividerThemeDataSchemaParser extends TypeSchemaParser<DividerThemeData,
    Map<String, dynamic>, DividerThemeData> {
  /// Create instance of parser using [JsonSchema] to validate values.
  DividerThemeDataSchemaParser([JsonSchema jsonSchema])
      : super("DividerThemeData", jsonSchema);

  @override
  DividerThemeData builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [DividerThemeData defaultValue]) {
    return DividerThemeData(
      color: SchemaWidget.parse<Color>(buildContext, value['color']),
      endIndent: SchemaWidget.parse<double>(buildContext, value['endIndent']),
      indent: SchemaWidget.parse<double>(buildContext, value['indent']),
      space: SchemaWidget.parse<double>(buildContext, value['space']),
      thickness: SchemaWidget.parse<double>(buildContext, value['thickness']),
    );
  }
}
