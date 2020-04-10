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
import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';

/// extends this class to make a Flutter widget parser.
abstract class SchemaWidgetParser {
  final Logger _log = Logger("SchemaWidgetParser");

  /// Get Parser Name
  String get parserName;

  /// Get JSON Schema used to validate the json
  JsonSchema get jsonSchema;

  /// Builder used to parse the json map into a flutter widget.
  Widget builder(BuildContext buildContext, Map<String, dynamic> map);

  /// Parse the json map into a flutter widget.
  Widget parse(BuildContext buildContext, Map<String, dynamic> map) {
    var listOfValidationErrors = validateWithErrors(map);

    if (listOfValidationErrors != null && listOfValidationErrors.isNotEmpty) {
      var validationMessages;

      for (var validationError in listOfValidationErrors) {
        if (validationMessages == null) {
          validationMessages =
              "${validationError.schemaPath}: ${validationError.message}";
        } else {
          validationMessages = "$validationMessages\n"
              "${validationError.schemaPath}: ${validationError.message}";
        }
      }

      _log.severe("Invalid schema:");
      _log.severe("Schema: $map");
      _log.severe("Errors: $validationMessages");

      return null;
    }

    return builder(buildContext, map);
  }

  /// Validate the json map with [JsonSchema]
  bool validate(Map<String, dynamic> map) => jsonSchema.validate(map);

  /// Validate the json map with [JsonSchema]
  List<ValidationError> validateWithErrors(Map<String, dynamic> map) =>
      jsonSchema.validateWithErrors(map);
}
