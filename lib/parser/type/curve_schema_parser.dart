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

/// Schema parser from [String] to [Curve]
///
/// Created by Windol <windol@legytma.com.br> at 28/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("Curve", "https://legytma.com.br/schema/curve.schema.json")
class CurveSchemaParser extends TypeSchemaParser<Curve, String, Curve> {
  /// Create instance of parser using [JsonSchema] to validate values.
  CurveSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   Curve builder(BuildContext buildContext, String value, [Curve defaultValue]) {
    switch (value) {
      case 'bounceIn':
        return Curves.bounceIn;
      case 'bounceInOut':
        return Curves.bounceInOut;
      case 'bounceOut':
        return Curves.bounceOut;
      case 'decelerate':
        return Curves.decelerate;
      case 'ease':
        return Curves.ease;
      case 'easeIn':
        return Curves.easeIn;
      case 'easeInBack':
        return Curves.easeInBack;
      case 'easeInCirc':
        return Curves.easeInCirc;
      case 'easeInCubic':
        return Curves.easeInCubic;
      case 'easeInExpo':
        return Curves.easeInExpo;
      case 'easeInOut':
        return Curves.easeInOut;
      case 'easeInOutBack':
        return Curves.easeInOutBack;
      case 'easeInOutCirc':
        return Curves.easeInOutCirc;
      case 'easeInOutCubic':
        return Curves.easeInOutCubic;
      case 'easeInOutExpo':
        return Curves.easeInOutExpo;
      case 'easeInOutQuad':
        return Curves.easeInOutQuad;
      case 'easeInOutQuart':
        return Curves.easeInOutQuart;
      case 'easeInOutQuint':
        return Curves.easeInOutQuint;
      case 'easeInOutSine':
        return Curves.easeInOutSine;
      case 'easeInQuad':
        return Curves.easeInQuad;
      case 'easeInQuart':
        return Curves.easeInQuart;
      case 'easeInQuint':
        return Curves.easeInQuint;
      case 'easeInSine':
        return Curves.easeInSine;
      case 'easeInToLinear':
        return Curves.easeInToLinear;
      case 'easeOut':
        return Curves.easeOut;
      case 'easeOutBack':
        return Curves.easeOutBack;
      case 'easeOutCirc':
        return Curves.easeOutCirc;
      case 'easeOutCubic':
        return Curves.easeOutCubic;
      case 'easeOutExpo':
        return Curves.easeOutExpo;
      case 'easeOutQuad':
        return Curves.easeOutQuad;
      case 'easeOutQuart':
        return Curves.easeOutQuart;
      case 'easeOutQuint':
        return Curves.easeOutQuint;
      case 'easeOutSine':
        return Curves.easeOutSine;
      case 'elasticIn':
        return Curves.elasticIn;
      case 'elasticInOut':
        return Curves.elasticInOut;
      case 'elasticOut':
        return Curves.elasticOut;
      case 'fastLinearToSlowEaseIn':
        return Curves.fastLinearToSlowEaseIn;
      case 'fastOutSlowIn':
        return Curves.fastOutSlowIn;
      case 'linear':
        return Curves.linear;
      case 'linearToEaseOut':
        return Curves.linearToEaseOut;
      case 'slowMiddle':
        return Curves.slowMiddle;
      default:
        return defaultValue;
    }
  }
}
