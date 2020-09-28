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

/// Schema parser from [String] to [MaterialTapTargetSize]
///
/// Created by Windol <windol@legytma.com.br> on 21/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("MaterialTapTargetSize",
    "https://schema.legytma.com.br/3.0.0/schema/material_tap_target_size.schema.json")
class MaterialTapTargetSizeSchemaParser extends TypeSchemaParser<
    MaterialTapTargetSize, String, MaterialTapTargetSize> {
  /// Create instance of parser using [JsonSchema] to validate values.
  MaterialTapTargetSizeSchemaParser([JsonSchema jsonSchema])
      : super("MaterialTapTargetSize", jsonSchema);

  @override
  MaterialTapTargetSize builder(BuildContext buildContext, String value,
      [MaterialTapTargetSize defaultValue]) {
    switch (value) {
      case 'padded':
        return MaterialTapTargetSize.padded;
      case 'shrinkWrap':
        return MaterialTapTargetSize.shrinkWrap;
      default:
        return defaultValue;
    }
  }
}
