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

/// Schema parser from [Map<String, dynamic>] to [MaterialColor]
///
/// Created by Windol <windol@legytma.com.br> on 19/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("MaterialColor",
    "https://schema.legytma.com.br/1.1.2/schema/material_color.schema.json")
class MaterialColorSchemaParser extends TypeSchemaParser<MaterialColor,
    Map<String, dynamic>, MaterialColor> {
  /// Create instance of parser
  MaterialColorSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  MaterialColor builder(BuildContext buildContext, Map<String, dynamic> value,
      [MaterialColor defaultValue]) {
    var primary = SchemaWidget.parse<Color>(buildContext, value["primary"]);
    var swatch = _parseSwatchIntColor(buildContext, value["swatch"], primary);

    return MaterialColor(primary.value, swatch);
  }

  Map<int, Color> _parseSwatchIntColor(
      BuildContext buildContext, Map<String, dynamic> map,
      [Color primary]) {
    if (map == null) {
      if (primary == null) {
        return null;
      }

      return <int, Color>{
        50: primary.withOpacity(.1),
        100: primary.withOpacity(.2),
        200: primary.withOpacity(.3),
        300: primary.withOpacity(.4),
        400: primary.withOpacity(.5),
        500: primary.withOpacity(.6),
        600: primary.withOpacity(.7),
        700: primary.withOpacity(.8),
        800: primary.withOpacity(.9),
        900: primary.withOpacity(1),
      };
    }

    var swatch = <int, Color>{};

    swatch = _extractValue(buildContext, swatch, map, 50);
    swatch = _extractValue(buildContext, swatch, map, 100);
    swatch = _extractValue(buildContext, swatch, map, 200);
    swatch = _extractValue(buildContext, swatch, map, 300);
    swatch = _extractValue(buildContext, swatch, map, 400);
    swatch = _extractValue(buildContext, swatch, map, 500);
    swatch = _extractValue(buildContext, swatch, map, 600);
    swatch = _extractValue(buildContext, swatch, map, 700);
    swatch = _extractValue(buildContext, swatch, map, 800);
    swatch = _extractValue(buildContext, swatch, map, 900);

    return swatch;
  }

  Map<int, Color> _extractValue(BuildContext buildContext,
      Map<int, Color> swatch, Map<String, dynamic> map, int key) {
    if (map.containsKey(key)) {
      swatch[key] = SchemaWidget.parse<Color>(buildContext, map['$key']);
    }

    return swatch;
  }
}
