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

/// Schema parser from [String] to [TargetPlatform]
///
/// Created by Windol <windol@legytma.com.br> at 23/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("TargetPlatform",
    "https://schema.legytma.com.br/2.0.0/schema/target_platform.schema.json")
class TargetPlatformSchemaParser
    extends TypeSchemaParser<TargetPlatform, String, TargetPlatform> {
  /// Create instance of parser using [JsonSchema] to validate values.
  TargetPlatformSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  TargetPlatform builder(BuildContext buildContext, String value,
      [TargetPlatform defaultValue]) {
    switch (value) {
      case 'android':
        return TargetPlatform.android;
      case 'fuchsia':
        return TargetPlatform.fuchsia;
      case 'iOS':
        return TargetPlatform.iOS;
      default:
        return defaultValue;
    }
  }
}
