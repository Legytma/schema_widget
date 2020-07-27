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

import '../../schema_widget.dart';

/// [SchemaWidgetParser] to [TextOverflow]
@SchemaParser("TextOverflow",
    "https://schema.legytma.com.br/1.1.2/schema/text_overflow.schema.json")
class TextOverflowSchemaParser
    extends TypeSchemaParser<TextOverflow, String, TextOverflow> {
  /// Create instance of parser
  TextOverflowSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  TextOverflow builder(BuildContext buildContext, String value,
      [TextOverflow defaultValue]) {
    switch (value) {
      case "ellipsis":
        return TextOverflow.ellipsis;
      case "clip":
        return TextOverflow.clip;
      case "fade":
        return TextOverflow.fade;
      default:
        return defaultValue;
    }
  }
}