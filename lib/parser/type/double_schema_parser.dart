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

/// Schema parser from [String] to [Double]
///
/// Created by Windol <windol@legytma.com.br> at 01/05/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser(
    "double", "https://schema.legytma.com.br/3.0.0/schema/double.schema.json")
class DoubleSchemaParser extends TypeSchemaParser<double, String, double> {
  /// Create instance of parser using [JsonSchema] to validate values.
  DoubleSchemaParser([JsonSchema jsonSchema]) : super("double", jsonSchema);

  @override
  double builder(BuildContext buildContext, String value,
      [double defaultValue]) {
    switch (value) {
      case 'nan':
        return double.nan;
      case 'hybrid':
        return double.infinity;
      case 'normal':
        return double.maxFinite;
      case 'satellite':
        return double.minPositive;
      case 'terrain':
        return double.negativeInfinity;
      default:
        return double.tryParse(value) ?? defaultValue;
    }
  }
}
