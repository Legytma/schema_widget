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

/// Schema parser from [Map<String, dynamic>] to [ChipThemeData]
///
/// Created by Windol <windol@legytma.com.br> at 22/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("ChipThemeData",
    "https://schema.legytma.com.br/2.0.0/schema/chip_theme_data.schema.json")
class ChipThemeDataSchemaParser extends TypeSchemaParser<ChipThemeData,
    Map<String, dynamic>, ChipThemeData> {
  /// Create instance of parser using [JsonSchema] to validate values.
  ChipThemeDataSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  ChipThemeData builder(BuildContext buildContext, Map<String, dynamic> value,
      [ChipThemeData defaultValue]) {
    return ChipThemeData(
      backgroundColor:
          SchemaWidget.parse<Color>(buildContext, value['backgroundColor']),
      disabledColor:
          SchemaWidget.parse<Color>(buildContext, value['disabledColor']),
      selectedColor:
          SchemaWidget.parse<Color>(buildContext, value['selectedColor']),
      secondarySelectedColor: SchemaWidget.parse<Color>(
          buildContext, value['secondarySelectedColor']),
      labelPadding: SchemaWidget.parse<EdgeInsetsGeometry>(
          buildContext, value['labelPadding']),
      padding: SchemaWidget.parse<EdgeInsetsGeometry>(
          buildContext, value['padding']),
      shape: SchemaWidget.parse<ShapeBorder>(buildContext, value['shape']),
      labelStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['labelStyle']),
      secondaryLabelStyle: SchemaWidget.parse<TextStyle>(
          buildContext, value['secondaryLabelStyle']),
      brightness:
          SchemaWidget.parse<Brightness>(buildContext, value['brightness']),
      elevation: SchemaWidget.parse<double>(buildContext, value['elevation']),
      checkmarkColor:
          SchemaWidget.parse<Color>(buildContext, value['checkmarkColor']),
      deleteIconColor:
          SchemaWidget.parse<Color>(buildContext, value['deleteIconColor']),
      pressElevation:
          SchemaWidget.parse<double>(buildContext, value['pressElevation']),
      selectedShadowColor:
          SchemaWidget.parse<Color>(buildContext, value['selectedShadowColor']),
      shadowColor:
          SchemaWidget.parse<Color>(buildContext, value['shadowColor']),
      showCheckmark: value['showCheckmark'],
    );
  }
}
