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

import 'type_schema_parser.dart';

/// extends this class to make a variant parser.
abstract class VariantTypeSchemaParser<T extends D, F, D>
    extends TypeSchemaParser<T, F, D> {
  final Map<String, VariantTypeSchemaParser<T, F, D>> _typeSchemaParsers;

  /// Create instance and variants
  VariantTypeSchemaParser([JsonSchema jsonSchema, this._typeSchemaParsers])
      : super(jsonSchema);

  /// Get [VariantTypeSchemaParser] [Map]
  Map<String, VariantTypeSchemaParser<T, F, D>> get typeSchemaParsers =>
      _typeSchemaParsers;

  @override
  T builder(BuildContext buildContext, F value, [D defaultValue]) {
    if (_typeSchemaParsers != null) {
      var typeSchemaParser = _typeSchemaParsers[extractType(value)];

      return typeSchemaParser?.parse(buildContext, value, defaultValue) ??
          defaultValue;
    }

    return builderVariant(buildContext, value, defaultValue);
  }

  /// Extract type name from [value]
  String extractType(F value);

  /// Build variant object
  T builderVariant(BuildContext buildContext, F value, D defaultValue);
}
