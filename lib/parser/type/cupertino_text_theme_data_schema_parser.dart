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

/// Schema parser from [Map<String, dynamic>] to [CupertinoTextThemeData]
///
/// Created by Windol <windol@legytma.com.br> at 22/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("CupertinoTextThemeData",
    "https://schema.legytma.com.br/2.0.0/schema/cupertino_text_theme_data.schema.json")
class CupertinoTextThemeDataSchemaParser extends TypeSchemaParser<
    CupertinoTextThemeData, Map<String, dynamic>, CupertinoTextThemeData> {
  /// Create instance of parser using [JsonSchema] to validate values.
  CupertinoTextThemeDataSchemaParser([JsonSchema jsonSchema])
      : super(jsonSchema);

  @override
  CupertinoTextThemeData builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [CupertinoTextThemeData defaultValue]) {
    return CupertinoTextThemeData(
      primaryColor:
          SchemaWidget.parse<Color>(buildContext, value['primaryColor']),
      actionTextStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['actionTextStyle']),
      dateTimePickerTextStyle: SchemaWidget.parse<TextStyle>(
          buildContext, value['dateTimePickerTextStyle']),
      navActionTextStyle: SchemaWidget.parse<TextStyle>(
          buildContext, value['navActionTextStyle']),
      navLargeTitleTextStyle: SchemaWidget.parse<TextStyle>(
          buildContext, value['navLargeTitleTextStyle']),
      navTitleTextStyle: SchemaWidget.parse<TextStyle>(
          buildContext, value['navTitleTextStyle']),
      pickerTextStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['pickerTextStyle']),
      tabLabelTextStyle: SchemaWidget.parse<TextStyle>(
          buildContext, value['tabLabelTextStyle']),
      textStyle:
          SchemaWidget.parse<TextStyle>(buildContext, value['textStyle']),
    );
  }
}
