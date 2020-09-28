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

/// Schema parser from [String] to [FontWeight]
///
/// Created by Windol <windol@legytma.com.br> on 15/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("FontWeight",
    "https://schema.legytma.com.br/3.0.0/schema/font_weight.schema.json")
class FontWeightSchemaParser
    extends TypeSchemaParser<FontWeight, String, FontWeight> {
  /// Create instance of parser
  FontWeightSchemaParser([JsonSchema jsonSchema])
      : super("FontWeight", jsonSchema);

  @override
  FontWeight builder(BuildContext buildContext, String value,
      [FontWeight defaultValue]) {
    switch (value) {
      case 'w100':
        return FontWeight.w100;
      case 'w200':
        return FontWeight.w200;
      case 'w300':
        return FontWeight.w300;
      case 'normal':
        return FontWeight.normal;
      case 'w400':
        return FontWeight.w400;
      case 'w500':
        return FontWeight.w500;
      case 'w600':
        return FontWeight.w600;
      case 'bold':
        return FontWeight.bold;
      case 'w700':
        return FontWeight.w700;
      case 'w800':
        return FontWeight.w800;
      case 'w900':
        return FontWeight.w900;
      default:
        return defaultValue;
    }
  }
}
