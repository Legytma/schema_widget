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

/// Schema parser from [Map<String, dynamic>] to [SliderThemeData]
///
/// Created by Windol <windol@legytma.com.br> at 23/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("SliderThemeData",
    "https://schema.legytma.com.br/3.0.0/schema/slider_theme_data.schema.json")
class SliderThemeDataSchemaParser extends TypeSchemaParser<SliderThemeData,
    Map<String, dynamic>, SliderThemeData> {
  /// Create instance of parser using [JsonSchema] to validate values.
  SliderThemeDataSchemaParser([JsonSchema jsonSchema]) : super(jsonSchema);

  @override
  SliderThemeData builder(BuildContext buildContext, Map<String, dynamic> value,
      [SliderThemeData defaultValue]) {
    return SliderThemeData(
      activeTrackColor:
          SchemaWidget.parse<Color>(buildContext, value['activeTrackColor']),
      inactiveTrackColor:
          SchemaWidget.parse<Color>(buildContext, value['inactiveTrackColor']),
      activeTickMarkColor:
          SchemaWidget.parse<Color>(buildContext, value['activeTickMarkColor']),
      disabledActiveTickMarkColor: SchemaWidget.parse<Color>(
          buildContext, value['disabledActiveTickMarkColor']),
      disabledActiveTrackColor: SchemaWidget.parse<Color>(
          buildContext, value['disabledActiveTrackColor']),
      disabledInactiveTickMarkColor: SchemaWidget.parse<Color>(
          buildContext, value['disabledInactiveTickMarkColor']),
      disabledInactiveTrackColor: SchemaWidget.parse<Color>(
          buildContext, value['disabledInactiveTrackColor']),
      disabledThumbColor:
          SchemaWidget.parse<Color>(buildContext, value['disabledThumbColor']),
      inactiveTickMarkColor: SchemaWidget.parse<Color>(
          buildContext, value['inactiveTickMarkColor']),
      minThumbSeparation:
          SchemaWidget.parse<double>(buildContext, value['minThumbSeparation']),
      overlappingShapeStrokeColor: SchemaWidget.parse<Color>(
          buildContext, value['overlappingShapeStrokeColor']),
      overlayColor:
          SchemaWidget.parse<Color>(buildContext, value['overlayColor']),
      overlayShape: SchemaWidget.parse<SliderComponentShape>(
          buildContext, value['overlayShape']),
      rangeThumbShape: SchemaWidget.parse<RangeSliderThumbShape>(
          buildContext, value['rangeThumbShape']),
      rangeTickMarkShape: SchemaWidget.parse<RangeSliderTickMarkShape>(
          buildContext, value['rangeTickMarkShape']),
      rangeTrackShape: SchemaWidget.parse<RangeSliderTrackShape>(
          buildContext, value['rangeTrackShape']),
      rangeValueIndicatorShape:
          SchemaWidget.parse<RangeSliderValueIndicatorShape>(
              buildContext, value['rangeValueIndicatorShape']),
      showValueIndicator: SchemaWidget.parse<ShowValueIndicator>(
          buildContext, value['showValueIndicator']),
      thumbColor: SchemaWidget.parse<Color>(buildContext, value['thumbColor']),
      thumbSelector: SchemaWidget.parse<RangeThumbSelector>(
          buildContext, value['thumbSelector']),
      thumbShape: SchemaWidget.parse<SliderComponentShape>(
          buildContext, value['thumbShape']),
      tickMarkShape: SchemaWidget.parse<SliderTickMarkShape>(
          buildContext, value['tickMarkShape']),
      trackHeight:
          SchemaWidget.parse<double>(buildContext, value['trackHeight']),
      trackShape: SchemaWidget.parse<SliderTrackShape>(
          buildContext, value['trackShape']),
      valueIndicatorColor:
          SchemaWidget.parse<Color>(buildContext, value['valueIndicatorColor']),
      valueIndicatorShape: SchemaWidget.parse<SliderComponentShape>(
          buildContext, value['valueIndicatorShape']),
      valueIndicatorTextStyle: SchemaWidget.parse<TextStyle>(
          buildContext, value['valueIndicatorTextStyle']),
    );
  }
}
