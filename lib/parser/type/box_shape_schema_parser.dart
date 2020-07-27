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

/// Schema parser from [String] to [BoxShape]
///
/// Created by Windol <windol@legytma.com.br> at 28/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("BoxShape",
    "https://schema.legytma.com.br/2.0.0/schema/box_shape.schema.json")
class BoxShapeSchemaParser
    extends TypeSchemaParser<BoxShape, String, BoxShape> {
  /// Create instance of parser using [JsonSchema] to validate values.
  BoxShapeSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  BoxShape builder(BuildContext buildContext, String value,
      [BoxShape defaultValue]) {
    switch (value) {
      case 'circle':
        return BoxShape.circle;
      case 'rectangle':
        return BoxShape.rectangle;
      default:
        return defaultValue;
    }
  }
}
