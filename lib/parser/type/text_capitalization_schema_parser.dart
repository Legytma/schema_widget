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

/// Schema parser from [String] to [TextCapitalization]
///
/// Created by Windol <windol@legytma.com.br> at 01/05/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("TextCapitalization", "https://schema.legytma.com.br/1.1.2/schema/text_capitalization.schema.json")
class TextCapitalizationSchemaParser
    extends TypeSchemaParser<TextCapitalization, String, TextCapitalization> {
  /// Create instance of parser using [JsonSchema] to validate values.
  TextCapitalizationSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   TextCapitalization builder(BuildContext buildContext, String value,
      [TextCapitalization defaultValue]) {
    switch (value) {
      case 'characters':
        return TextCapitalization.characters;
      case 'none':
        return TextCapitalization.none;
      case 'sentences':
        return TextCapitalization.sentences;
      case 'words':
        return TextCapitalization.words;
      default:
        return defaultValue;
    }
  }
}
