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

/// Schema parser from [Map<String, dynamic>] to [ShapeDecoration]
///
/// Created by Windol <windol@legytma.com.br> at 30/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("ShapeDecoration",
    "https://schema.legytma.com.br/3.0.0/schema/shape_decoration.schema.json")
class ShapeDecorationSchemaParser extends TypeSchemaParser<ShapeDecoration,
    Map<String, dynamic>, ShapeDecoration> {
  /// Create instance of parser using [JsonSchema] to validate values.
  ShapeDecorationSchemaParser([JsonSchema jsonSchema])
      : super("ShapeDecoration", jsonSchema);

  @override
  ShapeDecoration builder(BuildContext buildContext, Map<String, dynamic> value,
      [ShapeDecoration defaultValue]) {
    return ShapeDecoration(
      shape: SchemaWidget.parse<ShapeBorder>(buildContext, value['shape']),
      color: SchemaWidget.parse<Color>(buildContext, value['color']),
      image: SchemaWidget.parse<DecorationImage>(buildContext, value['image']),
      gradient: SchemaWidget.parse<Gradient>(buildContext, value['gradient']),
      shadows:
          SchemaWidget.parse<List<BoxShadow>>(buildContext, value['shadows']),
    );
  }
}
