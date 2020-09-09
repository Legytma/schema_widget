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

/// [SchemaWidgetParser] to [SafeArea]
@SchemaParser("SafeArea",
    "https://schema.legytma.com.br/2.0.0/schema/widget/safe_area.schema.json")
class SafeAreaSchemaWidgetParser extends SchemaWidgetParser<SafeArea> {
  /// Create instance of parser
  SafeAreaSchemaWidgetParser([JsonSchema jsonSchema]) : super(jsonSchema);

  @override
  SafeArea builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    return SafeArea(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      left: SchemaWidget.parse<bool>(buildContext, value['left'], true),
      right: SchemaWidget.parse<bool>(buildContext, value['right'], true),
      top: SchemaWidget.parse<bool>(buildContext, value['top'], true),
      bottom: SchemaWidget.parse<bool>(buildContext, value['bottom'], true),
      minimum: SchemaWidget.parse<EdgeInsets>(
          buildContext, value['minimum'], EdgeInsets.zero),
      maintainBottomViewPadding: SchemaWidget.parse<bool>(
          buildContext, value['maintainBottomViewPadding'], false),
      child: SchemaWidget.parse<Widget>(buildContext, value["child"]),
    );
  }
}
