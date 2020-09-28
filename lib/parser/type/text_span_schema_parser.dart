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

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:json_schema/json_schema.dart';

import '../../schema_widget.dart';

/// Schema parser from [Map<String, dynamic>] to [TextSpan]
///
/// Created by Windol <windol@legytma.com.br> at 14/05/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("TextSpan",
    "https://schema.legytma.com.br/3.0.0/schema/text_span.schema.json")
class TextSpanSchemaParser
    extends TypeSchemaParser<TextSpan, Map<String, dynamic>, TextSpan> {
  /// Create instance of parser using [JsonSchema] to validate values.
  TextSpanSchemaParser([JsonSchema jsonSchema]) : super("TextSpan", jsonSchema);

  @override
  TextSpan builder(BuildContext buildContext, Map<String, dynamic> value,
      [TextSpan defaultValue]) {
    return TextSpan(
      style: SchemaWidget.parse<TextStyle>(buildContext, value['style']),
      children:
          SchemaWidget.parse<List<InlineSpan>>(buildContext, value['children']),
      recognizer: SchemaWidget.parse<GestureRecognizer>(
          buildContext, value['recognizer']),
      semanticsLabel: value['semanticsLabel'],
      text: value['text'],
    );
  }
}
