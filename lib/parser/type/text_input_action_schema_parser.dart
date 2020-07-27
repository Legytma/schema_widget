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

/// Schema parser from [String] to [TextInputAction]
///
/// Created by Windol <windol@legytma.com.br> at 01/05/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("TextInputAction",
    "https://schema.legytma.com.br/1.1.2/schema/text_input_action.schema.json")
class TextInputActionSchemaParser
    extends TypeSchemaParser<TextInputAction, String, TextInputAction> {
  /// Create instance of parser using [JsonSchema] to validate values.
  TextInputActionSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  TextInputAction builder(BuildContext buildContext, String value,
      [TextInputAction defaultValue]) {
    switch (value) {
      case 'none':
        return TextInputAction.none;
      case 'continueAction':
        return TextInputAction.continueAction;
      case 'done':
        return TextInputAction.done;
      case 'emergencyCall':
        return TextInputAction.emergencyCall;
      case 'go':
        return TextInputAction.go;
      case 'join':
        return TextInputAction.join;
      case 'newline':
        return TextInputAction.newline;
      case 'next':
        return TextInputAction.next;
      case 'previous':
        return TextInputAction.previous;
      case 'route':
        return TextInputAction.route;
      case 'search':
        return TextInputAction.search;
      case 'send':
        return TextInputAction.send;
      case 'unspecified':
        return TextInputAction.unspecified;
      default:
        return defaultValue;
    }
  }
}
