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
import 'package:json_schema/src/json_schema/json_schema.dart';

import '../../schema_widget.dart';

/// Schema parser from [String] to [TextDecorationStyle]
///
/// Created by Windol <windol@legytma.com.br> on 21/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("TextDecorationStyle", "https://legytma.com.br/schema/text_decoration_style.schema.json")
class TextDecorationStyleSchemaParser
    extends TypeSchemaParser<TextDecorationStyle, String, TextDecorationStyle> {
  /// Create instance of parser using [JsonSchema] to validate values.
  TextDecorationStyleSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   TextDecorationStyle builder(BuildContext buildContext, String value,
      [TextDecorationStyle defaultValue]) {
    switch (value) {
      case "dashed":
        return TextDecorationStyle.dashed;
      case "dotted":
        return TextDecorationStyle.dotted;
      case "double":
        return TextDecorationStyle.double;
      case "solid":
        return TextDecorationStyle.solid;
      case "wavy":
        return TextDecorationStyle.wavy;
      default:
        return defaultValue;
    }
  }
}
