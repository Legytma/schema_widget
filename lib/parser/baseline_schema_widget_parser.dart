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

import '../schema_widget.dart';

/// [SchemaWidgetParser] to [Baseline]
@SchemaParser("Baseline",
    "https://schema.legytma.com.br/2.0.0/schema/widget/base_line.schema.json")
class BaselineSchemaWidgetParser extends SchemaWidgetParser<Baseline> {
  /// Create instance of parser
  BaselineSchemaWidgetParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  Baseline builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    return Baseline(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      baseline: SchemaWidget.parse<double>(buildContext, value["baseline"]),
      baselineType:
          SchemaWidget.parse<TextBaseline>(buildContext, value["baselineType"]),
      child: SchemaWidget.parse<Widget>(buildContext, value["child"]),
    );
  }
}
