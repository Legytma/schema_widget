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

import '../../schema_widget.dart';

/// [SchemaWidgetParser] to [Widget]
@SchemaParser(
    "Widget", "https://schema.legytma.com.br/2.0.0/schema/widget.schema.json")
class WidgetSchemaParser extends TypeSchemaParser<Widget, dynamic, Widget> {
  final Logger _log = Logger("WidgetSchemaParser");

  /// Create instance of parser
  WidgetSchemaParser([JsonSchema jsonSchema]) : super(jsonSchema);

  @override
  Widget builder(BuildContext buildContext, dynamic value,
      [Widget defaultValue]) {
    if (value is! Map<String, dynamic>) {
      return defaultValue;
    }

    var listOfValidationErrors = jsonSchema?.validateWithErrors(value);
    
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

      _log.severe("Invalid schema: $validationMessages");

      return defaultValue;
    }

    if (value is Map) {
      var testTypeValueKey = "__testTypeValue__";

      try {
        value[testTypeValueKey] = 0;
        value[testTypeValueKey] = "";
        value[testTypeValueKey] = {};
        value[testTypeValueKey] = [];

        value.remove(testTypeValueKey);

        _log.finer("layoutMap with original type: ${value.runtimeType}");
        // ignore: avoid_catches_without_on_clauses
      } catch (e) {
        if (value.containsKey(testTypeValueKey)) {
          value.remove(testTypeValueKey);
        }

        _log.finer("layoutMap type changed from ${value.values.runtimeType}"
            " to Map<String, dynamic>");

        value = <String, dynamic>{}..addAll(value);
      }
    }

    TypeSchemaParser typeSchemaParser;

    try {
      typeSchemaParser = SchemaWidget.getParserByName(value['type']);

      _log.finest("typeSchemaParser: $typeSchemaParser");
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      _log.warning("Cannot be found parser to ${value['type']}: $e");
    }

    return typeSchemaParser?.parse(buildContext, value, defaultValue) ??
        defaultValue;
  }
}
