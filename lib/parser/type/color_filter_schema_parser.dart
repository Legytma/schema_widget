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

/// Schema parser from [Map<String, dynamic>] to [ColorFilter]
///
/// Created by Windol <windol@legytma.com.br> at 29/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("ColorFilter", 
    "https://legytma.com.br/schema/color_filter.schema.json", <String>[
  "linear_to_srgb_gamma",
  "srgb_to_linear_gamma",
  "mode",
  "matrix",
])
class ColorFilterSchemaParser extends VariantTypeSchemaParser<ColorFilter,
    Map<String, dynamic>, ColorFilter> {
  /// Create instance of parser using [JsonSchema] to validate values.
  ColorFilterSchemaParser(JsonSchema jsonSchema,
      [Map<
              String,
              VariantTypeSchemaParser<ColorFilter, Map<String, dynamic>,
                  ColorFilter>>
          typeSchemaParsers])
      : super(jsonSchema, typeSchemaParsers);

  @override
  String extractType(Map<String, dynamic> value) => value['type'];

  // FIXME: REMOVE-ME
  /*
  @override
  VariantTypeSchemaParser<ColorFilter, Map<String, dynamic>, ColorFilter>
      newVariantInstance(String schemaUri) =>
          ColorFilterSchemaParser(schemaUri, null);
  */

  @override
   ColorFilter builderVariant(BuildContext buildContext,
      Map<String, dynamic> value, ColorFilter defaultValue) {
    switch (value['type']) {
      case 'linearToSrgbGamma':
        return ColorFilter.linearToSrgbGamma();
      case 'srgbToLinearGamma':
        return ColorFilter.srgbToLinearGamma();
      case 'mode':
        return ColorFilter.mode(
          SchemaWidget.parse<Color>(buildContext, value['color']),
          SchemaWidget.parse<BlendMode>(buildContext, value['blendMode']),
        );
      case 'matrix':
        return ColorFilter.matrix(
          SchemaWidget.parse<List<double>>(buildContext, value['matrix']),
        );
      default:
        return defaultValue;
    }
  }
}
