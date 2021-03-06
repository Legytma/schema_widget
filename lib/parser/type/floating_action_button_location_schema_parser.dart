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

/// Schema parser from [Map<String, dynamic>] to [FloatingActionButtonLocation]
///
/// Created by Windol <windol@legytma.com.br> at 28/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("FloatingActionButtonLocation",
    "https://schema.legytma.com.br/3.0.0/schema/floating_action_button_location.schema.json")
class FloatingActionButtonLocationSchemaParser extends TypeSchemaParser<
    FloatingActionButtonLocation,
    Map<String, dynamic>,
    FloatingActionButtonLocation> {
  /// Create instance of parser using [JsonSchema] to validate values.
  FloatingActionButtonLocationSchemaParser([JsonSchema jsonSchema])
      : super("FloatingActionButtonLocation", jsonSchema);

  @override
  FloatingActionButtonLocation builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [FloatingActionButtonLocation defaultValue]) {
    switch (value['type']) {
      case 'centerDocked':
        return FloatingActionButtonLocation.centerDocked;
      case 'centerFloat':
        return FloatingActionButtonLocation.centerFloat;
      case 'endDocked':
        return FloatingActionButtonLocation.endDocked;
      case 'endFloat':
        return FloatingActionButtonLocation.endFloat;
      case 'endTop':
        return FloatingActionButtonLocation.endTop;
      case 'miniStartTop':
        return FloatingActionButtonLocation.miniStartTop;
      case 'startTop':
        return FloatingActionButtonLocation.startTop;
      default:
        return defaultValue;
    }
  }
}
