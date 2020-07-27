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

/// Schema parser from [Map<String, dynamic>] to [BottomSheetThemeData]
///
/// Created by Windol <windol@legytma.com.br> on 21/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("BottomSheetThemeData",
    "https://schema.legytma.com.br/2.0.0/schema/bottom_sheet_theme_data.schema.json")
class BottomSheetThemeDataSchemaParser extends TypeSchemaParser<
    BottomSheetThemeData, Map<String, dynamic>, BottomSheetThemeData> {
  /// Create instance of parser using [JsonSchema] to validate values.
  BottomSheetThemeDataSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  BottomSheetThemeData builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [BottomSheetThemeData defaultValue]) {
    return BottomSheetThemeData(
      shape: SchemaWidget.parse<ShapeBorder>(buildContext, value['shape']),
      elevation: SchemaWidget.parse<double>(buildContext, value["elevation"]),
      backgroundColor:
          SchemaWidget.parse<Color>(buildContext, value['backgroundColor']),
      clipBehavior:
          SchemaWidget.parse<Clip>(buildContext, value['clipBehavior']),
      modalBackgroundColor: SchemaWidget.parse<Color>(
          buildContext, value['modalBackgroundColor']),
      modalElevation:
          SchemaWidget.parse<double>(buildContext, value['modalElevation']),
    );
  }
}
