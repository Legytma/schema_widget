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

/// Schema parser from [Map<String, dynamic>] to [ColorScheme]
///
/// Created by Windol <windol@legytma.com.br> on 21/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("ColorScheme",
    "https://schema.legytma.com.br/3.0.0/schema/color_scheme.schema.json")
class ColorSchemeSchemaParser
    extends TypeSchemaParser<ColorScheme, Map<String, dynamic>, ColorScheme> {
  /// Create instance of parser using [JsonSchema] to validate values.
  ColorSchemeSchemaParser([JsonSchema jsonSchema])
      : super("ColorScheme", jsonSchema);

  @override
  ColorScheme builder(BuildContext buildContext, Map<String, dynamic> value,
      [ColorScheme defaultValue]) {
    return ColorScheme(
      primary: SchemaWidget.parse<Color>(buildContext, value['primary']),
      primaryVariant:
          SchemaWidget.parse<Color>(buildContext, value['primaryVariant']),
      secondary: SchemaWidget.parse<Color>(buildContext, value['secondary']),
      secondaryVariant:
          SchemaWidget.parse<Color>(buildContext, value['secondaryVariant']),
      surface: SchemaWidget.parse<Color>(buildContext, value['surface']),
      background: SchemaWidget.parse<Color>(buildContext, value['background']),
      error: SchemaWidget.parse<Color>(buildContext, value['error']),
      onPrimary: SchemaWidget.parse<Color>(buildContext, value['onPrimary']),
      onSecondary:
          SchemaWidget.parse<Color>(buildContext, value['onSecondary']),
      onSurface: SchemaWidget.parse<Color>(buildContext, value['onSurface']),
      onBackground:
          SchemaWidget.parse<Color>(buildContext, value['onBackground']),
      onError: SchemaWidget.parse<Color>(buildContext, value['onError']),
      brightness:
          SchemaWidget.parse<Brightness>(buildContext, value['brightness']),
    );
  }
}
