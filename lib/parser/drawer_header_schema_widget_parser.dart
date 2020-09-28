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
import 'package:logging/logging.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to parse [DrawerHeader].
@SchemaParser("DrawerHeader",
    "https://schema.legytma.com.br/3.0.0/schema/widget/drawer_header.schema.json")
class DrawerHeaderSchemaWidgetParser extends SchemaWidgetParser<DrawerHeader> {
  static final Logger _log = Logger("DrawerHeaderSchemaWidgetParser");

  /// Create instance of parser
  DrawerHeaderSchemaWidgetParser([JsonSchema jsonSchema])
      : super("DrawerHeader", jsonSchema);

  @override
  DrawerHeader builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    _log.finer(value);

    return DrawerHeader(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      child: SchemaWidget.parse<Widget>(buildContext, value["child"]),
      decoration:
          SchemaWidget.parse<Decoration>(buildContext, value['decoration']),
      margin: SchemaWidget.parse<EdgeInsetsGeometry>(
          buildContext, value['margin'], const EdgeInsets.only(bottom: 8.0)),
      padding: SchemaWidget.parse<EdgeInsetsGeometry>(buildContext,
          value['padding'], const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0)),
      curve: SchemaWidget.parse<Curve>(
          buildContext, value['curve'], Curves.fastOutSlowIn),
      duration: SchemaWidget.parse<Duration>(
          buildContext, value['duration'], const Duration(milliseconds: 250)),
    );
  }
}
