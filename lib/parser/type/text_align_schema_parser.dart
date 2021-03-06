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

/// [SchemaWidgetParser] to [TextAlign]
@SchemaParser("TextAlign",
    "https://schema.legytma.com.br/3.0.0/schema/text_align.schema.json")
class TextAlignSchemaParser
    extends TypeSchemaParser<TextAlign, String, TextAlign> {
  /// Create instance of parser
  TextAlignSchemaParser([JsonSchema jsonSchema])
      : super("TextAlign", jsonSchema);

  @override
  TextAlign builder(BuildContext buildContext, String value,
      [TextAlign defaultValue]) {
    switch (value) {
      case "left":
        return TextAlign.left;
      case "right":
        return TextAlign.right;
      case "center":
        return TextAlign.center;
      case "justify":
        return TextAlign.justify;
      case "start":
        return TextAlign.start;
      case "end":
        return TextAlign.end;
      default:
        //left the system decide
        return defaultValue;
    }
  }
}
