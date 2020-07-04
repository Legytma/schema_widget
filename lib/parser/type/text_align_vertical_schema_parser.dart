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

/// Schema parser from [dynamic] to [TextAlignVertical]
///
/// Created by Windol <windol@legytma.com.br> at 30/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("TextAlignVertical", "https://schema.legytma.com.br/1.1.2/schema/text_align_vertical.schema.json")
class TextAlignVerticalSchemaParser
    extends TypeSchemaParser<TextAlignVertical, dynamic, TextAlignVertical> {
  /// Create instance of parser using [JsonSchema] to validate values.
  TextAlignVerticalSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   TextAlignVertical builder(BuildContext buildContext, dynamic value,
      [TextAlignVertical defaultValue]) {
    if (value is double) {
      return TextAlignVertical(y: value);
    }

    if (value is String) {
      var y = SchemaWidget.parse<double>(buildContext, value);

      if (y != null) {
        return TextAlignVertical(y: y);
      }

      switch (value) {
        case 'top':
          return TextAlignVertical.top;
        case 'center':
          return TextAlignVertical.center;
        case 'bottom':
          return TextAlignVertical.bottom;
        default:
          return defaultValue;
      }
    }

    return defaultValue;
  }
}
