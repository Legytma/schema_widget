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

/// [SchemaWidgetParser] to parse [Divider].
@SchemaParser("Divider",
    "https://schema.legytma.com.br/3.0.0/schema/widget/divider.schema.json")
class DividerSchemaWidgetParser extends SchemaWidgetParser<Divider> {
  /// Create instance of parser
  DividerSchemaWidgetParser([JsonSchema jsonSchema]) : super(jsonSchema);

  @override
  Divider builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    return Divider(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      thickness: SchemaWidget.parse<double>(buildContext, value['thickness']),
      color: SchemaWidget.parse<Color>(buildContext, value['color']),
      endIndent: SchemaWidget.parse<double>(buildContext, value['endIndent']),
      height: SchemaWidget.parse<double>(buildContext, value['height']),
      indent: SchemaWidget.parse<double>(buildContext, value['indent']),
    );
  }
}
