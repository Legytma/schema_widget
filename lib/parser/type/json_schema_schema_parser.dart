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

/// Schema parser from [Map<String, dynamic>] to [JsonSchema]
///
/// Created by Windol <windol@legytma.com.br> at 27/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("JsonSchema", "https://json-schema.org/draft-06/schema#")
class JsonSchemaSchemaParser
    extends TypeSchemaParser<JsonSchema, Map<String, dynamic>, JsonSchema> {
  /// Create instance of parser using [JsonSchema] to validate values.
  JsonSchemaSchemaParser([JsonSchema jsonSchema])
      : super("JsonSchema", jsonSchema);

  @override
  JsonSchema builder(BuildContext buildContext, Map<String, dynamic> value,
      [JsonSchema defaultValue]) {
    if (value is Map<String, dynamic>) {
      return JsonSchema.createSchema(value);
    }

    return defaultValue;
  }
}
