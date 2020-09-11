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

/// Schema parser from [Map<String, dynamic>] to [BoxDecoration]
///
/// Created by Windol <windol@legytma.com.br> at 29/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("BoxDecoration",
    "https://schema.legytma.com.br/3.0.0/schema/box_decoration.schema.json")
class BoxDecorationSchemaParser extends TypeSchemaParser<BoxDecoration,
    Map<String, dynamic>, BoxDecoration> {
  /// Create instance of parser using [JsonSchema] to validate values.
  BoxDecorationSchemaParser([JsonSchema jsonSchema]) : super(jsonSchema);

  @override
  BoxDecoration builder(BuildContext buildContext, Map<String, dynamic> value,
      [BoxDecoration defaultValue]) {
    return BoxDecoration(
      shape: SchemaWidget.parse<BoxShape>(
          buildContext, value['shape'], BoxShape.rectangle),
      border: SchemaWidget.parse<BoxBorder>(buildContext, value['border']),
      color: SchemaWidget.parse<Color>(buildContext, value['color']),
      backgroundBlendMode: SchemaWidget.parse<BlendMode>(
          buildContext, value['backgroundBlendMode']),
      borderRadius: SchemaWidget.parse<BorderRadiusGeometry>(
          buildContext, value['borderRadius']),
      boxShadow:
          SchemaWidget.parse<List<BoxShadow>>(buildContext, value['boxShadow']),
      gradient: SchemaWidget.parse<Gradient>(buildContext, value['gradient']),
      image: SchemaWidget.parse<DecorationImage>(buildContext, value['image']),
    );
  }
}
