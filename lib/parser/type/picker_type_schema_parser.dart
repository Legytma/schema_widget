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
import 'package:schema_form/enum/PickerType.dart';

import '../../schema_widget.dart';

/// Schema parser from [String] to [PickerType]
///
/// Created by Windol <windol@legytma.com.br> at 27/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("PickerType", "https://legytma.com.br/schema/picker_type.schema.json")
class PickerTypeSchemaParser
    extends TypeSchemaParser<PickerType, String, PickerType> {
  /// Create instance of parser using [JsonSchema] to validate values.
  PickerTypeSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   PickerType builder(BuildContext buildContext, String value,
      [PickerType defaultValue]) {
    switch (value) {
      case 'TimePicker':
        return PickerType.TimePicker;
      case 'DatePicker':
        return PickerType.DatePicker;
      case 'DateTimePicker':
        return PickerType.DateTimePicker;
      default:
        return defaultValue;
    }
  }
}
