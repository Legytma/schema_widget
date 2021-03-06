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

/// Schema parser from [Map<String, dynamic>] to [FocusNode]
///
/// Created by Windol <windol@legytma.com.br> at 27/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("FocusNode",
    "https://schema.legytma.com.br/3.0.0/schema/focus_node.schema.json")
class FocusNodeSchemaParser
    extends TypeSchemaParser<FocusNode, Map<String, dynamic>, FocusNode> {
  /// Create instance of parser using [JsonSchema] to validate values.
  FocusNodeSchemaParser([JsonSchema jsonSchema])
      : super("FocusNode", jsonSchema);

  @override
  FocusNode builder(BuildContext buildContext, Map<String, dynamic> value,
      [FocusNode defaultValue]) {
    return FocusNode(
      canRequestFocus: value['canRequestFocus'] ?? true,
      debugLabel: value['debugLabel'],
      onKey:
          SchemaWidget.parse<FocusOnKeyCallback>(buildContext, value['onKey']),
      skipTraversal: value['skipTraversal'] ?? false,
    );
  }
}
