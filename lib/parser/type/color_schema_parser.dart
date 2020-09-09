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

/// Schema parser from [dynamic] to [Color]
///
/// Created by Windol <windol@legytma.com.br> on 16/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser(
    "Color", "https://schema.legytma.com.br/2.0.0/schema/color.schema.json")
class ColorSchemaParser extends TypeSchemaParser<Color, dynamic, Color> {
  /// Create Color Schema Parser
  ColorSchemaParser([JsonSchema jsonSchema]) : super(jsonSchema);

  @override
  Color builder(BuildContext buildContext, dynamic value,
      [Color defaultValue]) {
    if (value is String) {
      if (value.startsWith("#") && value.length == 7) {
        value = "#FF${value.substring(1)}";
      } else if (value.startsWith("\$") && value.length == 7) {
        value = "\$FF${value.substring(1)}";
      } else if (value.toUpperCase().startsWith("0X") && value.length == 8) {
        value = "0xFF${value.substring(2)}";
      } else if (value.toUpperCase().startsWith("0b") &&
          value.length == (6 * 8) + 2) {
        value = "0b1111111111111111${value.substring(2)}";
      }

      value = SchemaWidget.parse<int>(buildContext, value);
    }

    if (value == null || value is! int) {
      return defaultValue;
    }

    return Color(value);
  }
}
