/*
 * Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br).
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:json_schema_dart2/json_schema.dart';

/// extends this class to make a Flutter widget parser.
abstract class SchemaWidgetParser {
  /// Get Parser Name
  String get parserName;

  /// Get JSON Schema used to validate the json
  JsonSchema get jsonSchema;

  /// Builder used to parse the json map into a flutter widget.
  Widget builder(BuildContext buildContext, Map<String, dynamic> map);

  /// Parse the json map into a flutter widget.
  Widget parse(BuildContext buildContext, Map<String, dynamic> map) {
    if (!validate(map)) {
      throw Exception("Invalid schema: $map");
    }

    return builder(buildContext, map);
  }

  /// Validate the json map with [JsonSchema]
  bool validate(Map<String, dynamic> map) => jsonSchema.validate(map);
}
