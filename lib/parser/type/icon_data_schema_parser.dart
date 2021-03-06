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

/// Schema parser from [Map<String, dynamic>] to [IconData]
///
/// Created by Windol <windol@legytma.com.br> at 09/05/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("IconData",
    "https://schema.legytma.com.br/3.0.0/schema/icon_data.schema.json")
class IconDataSchemaParser
    extends TypeSchemaParser<IconData, Map<String, dynamic>, IconData> {
  /// Create instance of parser using [JsonSchema] to validate values.
  IconDataSchemaParser([JsonSchema jsonSchema]) : super("IconData", jsonSchema);

  @override
  IconData builder(BuildContext buildContext, Map<String, dynamic> value,
      [IconData defaultValue]) {
    return IconData(
      SchemaWidget.parse<int>(buildContext, value['codePoint']),
      fontFamily: value['fontFamily'],
      fontPackage: value['fontPackage'],
      matchTextDirection: value['matchTextDirection'] ?? false,
    );
  }
}
