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
import 'package:json_schema/src/json_schema/json_schema.dart';

import '../../schema_widget.dart';

/// Schema parser from [List] to [ListDouble]
///
/// Created by Windol <windol@legytma.com.br> at 29/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("List<double>", "https://schema.legytma.com.br/1.1.2/schema/list_double.schema.json")
class ListDoubleSchemaParser
    extends TypeSchemaParser<List<double>, List, List<double>> {
  /// Create instance of parser using [JsonSchema] to validate values.
  ListDoubleSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   List<double> builder(BuildContext buildContext, List value,
      [List<double> defaultValue]) {
    var result = <double>[];

    for (var item in value) {
      var itemParsed = SchemaWidget.parse<double>(buildContext, item);

      if (itemParsed != null) {
        result.add(itemParsed);
      }
    }

    return result;
  }
}
