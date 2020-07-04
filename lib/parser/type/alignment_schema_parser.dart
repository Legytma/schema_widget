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

/// Schema parser from [String] to [Alignment]
///
/// Created by Windol <windol@legytma.com.br> on 20/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("Alignment", "https://schema.legytma.com.br/1.1.2/schema/alignment.schema.json")
class AlignmentSchemaParser
    extends TypeSchemaParser<Alignment, String, Alignment> {
  /// Create instance of parser
  AlignmentSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  // FIXME: REMOVE-ME
  /*static Future<AlignmentSchemaParser> instance() async {
    var jsonSchema = await JsonSchema.createSchemaFromUrl(
      "https://schema.legytma.com.br/1.1.2/schema/alignment.schema.json",
    );

    return AlignmentSchemaParser(jsonSchema);
  }*/

  @override
  Alignment builder(BuildContext buildContext, String value,
      [Alignment defaultValue]) {
    switch (value) {
      case 'topLeft':
        return Alignment.topLeft;
      case 'topCenter':
        return Alignment.topCenter;
      case 'topRight':
        return Alignment.topRight;
      case 'centerLeft':
        return Alignment.centerLeft;
      case 'center':
        return Alignment.center;
      case 'centerRight':
        return Alignment.centerRight;
      case 'bottomLeft':
        return Alignment.bottomLeft;
      case 'bottomCenter':
        return Alignment.bottomCenter;
      case 'bottomRight':
        return Alignment.bottomRight;
      default:
        return defaultValue;
    }
  }
}
