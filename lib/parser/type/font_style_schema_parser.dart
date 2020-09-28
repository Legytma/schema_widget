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

/// Schema parser from [String] to [FontStyle]
///
/// Created by Windol <windol@legytma.com.br> at 27/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("FontStyle",
    "https://schema.legytma.com.br/3.0.0/schema/font_style.schema.json")
class FontStyleSchemaParser
    extends TypeSchemaParser<FontStyle, String, FontStyle> {
  /// Create instance of parser using [JsonSchema] to validate values.
  FontStyleSchemaParser([JsonSchema jsonSchema])
      : super("FontStyle", jsonSchema);

  @override
  FontStyle builder(BuildContext buildContext, String value,
      [FontStyle defaultValue]) {
    switch (value) {
      case 'italic':
        return FontStyle.italic;
      case 'normal':
        return FontStyle.normal;
      default:
        return defaultValue;
    }
  }
}
