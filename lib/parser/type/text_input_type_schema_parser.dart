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

/// Schema parser from [String] to [TextInputType]
///
/// Created by Windol <windol@legytma.com.br> at 01/05/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("TextInputType",
    "https://schema.legytma.com.br/1.1.2/schema/text_input_type.schema.json")
class TextInputTypeSchemaParser
    extends TypeSchemaParser<TextInputType, String, TextInputType> {
  /// Create instance of parser using [JsonSchema] to validate values.
  TextInputTypeSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  TextInputType builder(BuildContext buildContext, String value,
      [TextInputType defaultValue]) {
    switch (value) {
      case 'datetime':
        return TextInputType.datetime;
      case 'emailAddress':
        return TextInputType.emailAddress;
      case 'multiline':
        return TextInputType.multiline;
      case 'number':
      case 'numberWithOptions':
        return TextInputType.number;
      case 'phone':
        return TextInputType.phone;
      case 'text':
        return TextInputType.text;
      case 'url':
        return TextInputType.url;
      case 'visiblePassword':
        return TextInputType.visiblePassword;
      case 'numberWithOptionsDecimal':
        return TextInputType.numberWithOptions(decimal: true);
      case 'numberWithOptionsSigned':
        return TextInputType.numberWithOptions(signed: true);
      case 'numberWithOptionsDecimalSigned':
        return TextInputType.numberWithOptions(decimal: true, signed: true);
      default:
        return defaultValue;
    }
  }
}
