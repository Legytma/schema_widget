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
import 'package:logging/logging.dart';

/// Extends this class to make a Flutter type parser.
abstract class TypeSchemaParser<T extends D, F, D> {
  final Logger _log = Logger("TypeSchemaParser<$T, $F, $D>");

  final String _typeName;

  /// JSON Schema used to validate the json
  final JsonSchema jsonSchema;

  /// Get Parser Type
  Type get parserType => T;

  /// Get Parser From Type
  Type get parserFromType => F;

  /// Get Parser Base Type
  Type get parserBaseType => D;

  /// Get Parser Name
  String get parserName => _typeName;

  /// Get Parser From Name
  String get parserFromName => "$parserFromType";

  /// Get Parser Base Name
  String get parserBaseName => "$parserBaseType";

  /// Create Type Schema Parser
  @mustCallSuper
  TypeSchemaParser(this._typeName, [this.jsonSchema]) : super();

  /// Builder used to parse the json map into a flutter object.
  T builder(BuildContext buildContext, F value, [D defaultValue]);

  /// Parse value to predefined type
  @mustCallSuper
  T parse(BuildContext buildContext, F value, [D defaultValue]) {
    try {
      if (value == null || value is T) {
        _log.finest("Value is null or $T. Returning...");

        return value ?? defaultValue;
      }

      var listOfValidationErrors = validateWithErrors(value);

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
        _log.severe("Schema: $value");
        _log.severe("Errors: $validationMessages");

        return defaultValue;
      }

      return builder(buildContext, value, defaultValue) ?? defaultValue;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      _log.severe("Fail on parse $T: $e");

      return defaultValue;
    }
  }

  /// Validate the json map with [JsonSchema]
  bool validate(dynamic value, {bool parseJson = false}) =>
      jsonSchema?.validate(value, parseJson: parseJson) ?? true;

  /// Validate the json map with [JsonSchema]
  List<ValidationError> validateWithErrors(dynamic value,
          {bool parseJson = false}) =>
      jsonSchema?.validateWithErrors(value, parseJson: parseJson);

  /// Test parser type
  bool isParserType(dynamic value) => value is T;

  /// Test from type
  bool isFromType(dynamic value) => value is F;

  /// Test base type
  bool isBaseType(dynamic value) => value is D;
}
