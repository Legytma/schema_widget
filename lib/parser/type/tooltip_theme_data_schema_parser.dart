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

/// Schema parser from [Map<String, dynamic>] to [TooltipThemeData]
///
/// Created by Windol <windol@legytma.com.br> at 27/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("TooltipThemeData",
    "https://schema.legytma.com.br/1.1.2/schema/tooltip_theme_data.schema.json")
class TooltipThemeDataSchemaParser extends TypeSchemaParser<TooltipThemeData,
    Map<String, dynamic>, TooltipThemeData> {
  /// Create instance of parser using [JsonSchema] to validate values.
  TooltipThemeDataSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  TooltipThemeData builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [TooltipThemeData defaultValue]) {
    return TooltipThemeData(
      textStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['textStyle']),
      margin:
          SchemaWidget.parse<EdgeInsetsGeometry>(buildContext, value['margin']),
      height: SchemaWidget.parse<double>(buildContext, value['height']),
      padding: SchemaWidget.parse<EdgeInsetsGeometry>(
          buildContext, value['padding']),
      decoration:
          SchemaWidget.parse<Decoration>(buildContext, value['decoration']),
      excludeFromSemantics: value['excludeFromSemantics'],
      preferBelow: value['preferBelow'],
      showDuration:
          SchemaWidget.parse<Duration>(buildContext, value['showDuration']),
      verticalOffset:
          SchemaWidget.parse<double>(buildContext, value['verticalOffset']),
      waitDuration:
          SchemaWidget.parse<Duration>(buildContext, value['waitDuration']),
    );
  }
}
