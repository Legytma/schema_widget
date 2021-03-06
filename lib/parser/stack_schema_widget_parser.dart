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

/// [SchemaWidgetParser] to [Stack]
@SchemaParser("Stack",
    "https://schema.legytma.com.br/3.0.0/schema/widget/stack.schema.json")
class StackSchemaWidgetParser extends SchemaWidgetParser<Stack> {
  /// Create instance of parser
  StackSchemaWidgetParser([JsonSchema jsonSchema]) : super("Stack", jsonSchema);

  @override
  Stack builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    return Stack(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      alignment: SchemaWidget.parse<AlignmentGeometry>(
          buildContext, value['alignment'], AlignmentDirectional.topStart),
      textDirection: SchemaWidget.parse<TextDirection>(
          buildContext, value["textDirection"]),
      fit: SchemaWidget.parse<StackFit>(
          buildContext, value['fit'], StackFit.loose),
      overflow: SchemaWidget.parse<Overflow>(
          buildContext, value['overflow'], Overflow.clip),
      children: SchemaWidget.parse<List<Widget>>(
          buildContext, value['children'], const <Widget>[]),
    );
  }
}
