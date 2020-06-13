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

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:json_schema/src/json_schema/json_schema.dart';

import '../../schema_widget.dart';

/// Schema parser from [String] to [DragStartBehavior]
///
/// Created by Windol <windol@legytma.com.br> at 28/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("DragStartBehavior", "https://legytma.com.br/schema/drag_start_behavior.schema.json")
class DragStartBehaviorSchemaParser
    extends TypeSchemaParser<DragStartBehavior, String, DragStartBehavior> {
  /// Create instance of parser using [JsonSchema] to validate values.
  DragStartBehaviorSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   DragStartBehavior builder(BuildContext buildContext, String value,
      [DragStartBehavior defaultValue]) {
    switch (value) {
      case 'down':
        return DragStartBehavior.down;
      case 'start':
        return DragStartBehavior.start;
      default:
        return defaultValue;
    }
  }
}
