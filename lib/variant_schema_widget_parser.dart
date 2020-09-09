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

import 'schema_widget.dart';

/// extends this class to make a Flutter widget parser.
abstract class VariantSchemaWidgetParser<T extends Widget>
    extends VariantTypeSchemaParser<T, Map<String, dynamic>, Widget> {
  final Logger _log = Logger("VariantSchemaWidgetParser<$T>");

  /// Create Schema Widget Parser
  VariantSchemaWidgetParser([JsonSchema jsonSchema,
      Map<String, VariantTypeSchemaParser<T, Map<String, dynamic>, Widget>>
          typeSchemaParsers])
      : super(jsonSchema, typeSchemaParsers);

  @override
  Type get parserType {
    if ("$T" == "Widget") {
      var message = "Invalid declaration of"
          " WidgetSchemaParser. WidgetSchemaParser type must be descendent of"
          " Widget and must be specified.";

      _log.severe(message);

      throw Exception(message);
    }

    return super.parserType;
  }

  @override
  T parse(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    if (value != null && value is! T && value is! Map) {
      _log.warning("Invalid value: $value");

      return defaultValue;
    }

    return super.parse(buildContext, value, defaultValue);
  }
}
