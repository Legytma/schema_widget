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

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:json_schema/json_schema.dart';

import '../../schema_widget.dart';

/// Schema parser from [Map<String, dynamic>] to [TextStyle]
///
/// Created by Windol <windol@legytma.com.br> on 21/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("TextStyle",
    "https://schema.legytma.com.br/2.0.0/schema/text_style.schema.json")
class TextStyleSchemaParser
    extends TypeSchemaParser<TextStyle, Map<String, dynamic>, TextStyle> {
  /// Create instance of parser using [JsonSchema] to validate values.
  TextStyleSchemaParser([JsonSchema jsonSchema]) : super(jsonSchema);

  @override
  TextStyle builder(BuildContext buildContext, Map<String, dynamic> value,
      [TextStyle defaultValue]) {
    return TextStyle(
      color: SchemaWidget.parse<Color>(buildContext, value['color']),
      debugLabel: value['debugLabel'],
      decoration:
          SchemaWidget.parse<TextDecoration>(buildContext, value['decoration']),
      fontSize: SchemaWidget.parse<double>(buildContext, value['fontSize']),
      fontFamily: value['fontFamily'],
      fontStyle:
          SchemaWidget.parse<FontStyle>(buildContext, value['fontStyle']),
      fontWeight:
          SchemaWidget.parse<FontWeight>(buildContext, value['fontWeight']),
      backgroundColor:
          SchemaWidget.parse<Color>(buildContext, value["backgroundColor"]),
      background: SchemaWidget.parse<Paint>(buildContext, value['background']),
      decorationColor:
          SchemaWidget.parse<Color>(buildContext, value["decorationColor"]),
      decorationStyle: SchemaWidget.parse<TextDecorationStyle>(
          buildContext, value['decorationStyle']),
      decorationThickness: SchemaWidget.parse<double>(
          buildContext, value["decorationThickness"]),
      fontFamilyFallback: value["fontFamilyFallback"],
      fontFeatures: SchemaWidget.parse<List<FontFeature>>(
          buildContext, value['fontFeatures']),
      foreground: SchemaWidget.parse<Paint>(buildContext, value['foreground']),
      height: SchemaWidget.parse<double>(buildContext, value["height"]),
      inherit: value["inherit"] ?? true,
      letterSpacing:
          SchemaWidget.parse<double>(buildContext, value["letterSpacing"]),
      locale: SchemaWidget.parse<Locale>(buildContext, value["locale"]),
      package: value["package"],
      shadows: SchemaWidget.parse<List<Shadow>>(buildContext, value['shadows']),
      textBaseline:
          SchemaWidget.parse<TextBaseline>(buildContext, value["textBaseline"]),
      wordSpacing:
          SchemaWidget.parse<double>(buildContext, value["wordSpacing"]),
    );
  }
}
