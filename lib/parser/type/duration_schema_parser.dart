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

/// Schema parser from [Map<String, dynamic>] to [Duration]
///
/// Created by Windol <windol@legytma.com.br> at 27/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("Duration",
    "https://schema.legytma.com.br/3.0.0/schema/duration.schema.json")
class DurationSchemaParser
    extends TypeSchemaParser<Duration, Map<String, dynamic>, Duration> {
  /// Create instance of parser using [JsonSchema] to validate values.
  DurationSchemaParser([JsonSchema jsonSchema]) : super("Duration", jsonSchema);

  @override
  Duration builder(BuildContext buildContext, Map<String, dynamic> value,
      [Duration defaultValue]) {
    return Duration(
      days: SchemaWidget.parse<int>(buildContext, value['days'], 0),
      hours: SchemaWidget.parse<int>(buildContext, value['hours'], 0),
      microseconds:
          SchemaWidget.parse<int>(buildContext, value['microseconds'], 0),
      milliseconds:
          SchemaWidget.parse<int>(buildContext, value['milliseconds'], 0),
      minutes: SchemaWidget.parse<int>(buildContext, value['minutes'], 0),
      seconds: SchemaWidget.parse<int>(buildContext, value['seconds'], 0),
    );
  }
}
