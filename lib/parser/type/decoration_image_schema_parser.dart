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

/// Schema parser from [Map<String, dynamic>] to [DecorationImage]
///
/// Created by Windol <windol@legytma.com.br> at 29/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("DecorationImage",
    "https://schema.legytma.com.br/1.1.2/schema/decoration_image.schema.json")
class DecorationImageSchemaParser extends TypeSchemaParser<DecorationImage,
    Map<String, dynamic>, DecorationImage> {
  /// Create instance of parser using [JsonSchema] to validate values.
  DecorationImageSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  DecorationImage builder(BuildContext buildContext, Map<String, dynamic> value,
      [DecorationImage defaultValue]) {
    return DecorationImage(
      image: SchemaWidget.parse<ImageProvider<dynamic>>(
          buildContext, value['image']),
      alignment: SchemaWidget.parse<Alignment>(
          buildContext, value['alignment'], Alignment.center),
      centerSlice: SchemaWidget.parse<Rect>(buildContext, value['centerSlice']),
      colorFilter:
          SchemaWidget.parse<ColorFilter>(buildContext, value['colorFilter']),
      fit: SchemaWidget.parse<BoxFit>(buildContext, value['fit']),
      matchTextDirection: value['matchTextDirection'] ?? false,
      repeat: SchemaWidget.parse<ImageRepeat>(
          buildContext, value['repeat'], ImageRepeat.noRepeat),
    );
  }
}
