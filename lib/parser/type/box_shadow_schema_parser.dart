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

/// Schema parser from [Map<String, dynamic>] to [BoxShadow]
///
/// Created by Windol <windol@legytma.com.br> at 29/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("BoxShadow", "https://schema.legytma.com.br/1.1.2/schema/box_shadow.schema.json")
class BoxShadowSchemaParser
    extends TypeSchemaParser<BoxShadow, Map<String, dynamic>, BoxShadow> {
  /// Create instance of parser using [JsonSchema] to validate values.
  BoxShadowSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   BoxShadow builder(BuildContext buildContext, Map<String, dynamic> value,
      [BoxShadow defaultValue]) {
    return BoxShadow(
      color: SchemaWidget.parse<Color>(
          buildContext, value['color'], const Color(0xFF000000)),
      blurRadius:
          SchemaWidget.parse<double>(buildContext, value['blurRadius'], 0.0),
      offset: SchemaWidget.parse<Offset>(
          buildContext, value['offset'], Offset.zero),
      spreadRadius:
          SchemaWidget.parse<double>(buildContext, value['spreadRadius'], 0.0),
    );
  }
}
