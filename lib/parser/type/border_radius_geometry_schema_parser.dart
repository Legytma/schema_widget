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

/// Schema parser from [Map<String, dynamic>] to [BorderRadiusGeometry]
///
/// Created by Windol <windol@legytma.com.br> at 24/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("BorderRadiusGeometry", 
    "https://schema.legytma.com.br/1.1.2/schema/border_radius_geometry.schema.json")
class BorderRadiusGeometrySchemaParser extends TypeSchemaParser<
    BorderRadiusGeometry, Map<String, dynamic>, BorderRadiusGeometry> {
  /// Create instance of parser using [JsonSchema] to validate values.
  BorderRadiusGeometrySchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   BorderRadiusGeometry builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [BorderRadiusGeometry defaultValue]) {
    return SchemaWidget.parse<BorderRadius>(
            buildContext, value, defaultValue) ??
        defaultValue;
  }
}
