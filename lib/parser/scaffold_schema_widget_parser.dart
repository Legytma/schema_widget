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
import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to parse [Scaffold].
@SchemaParser("Scaffold",
    "https://schema.legytma.com.br/3.0.0/schema/widget/scaffold.schema.json")
class ScaffoldSchemaWidgetParser extends SchemaWidgetParser<Scaffold> {
  static final Logger _log = Logger("ScaffoldSchemaWidgetParser");

  /// Create instance of parser
  ScaffoldSchemaWidgetParser([JsonSchema jsonSchema])
      : super("Scaffold", jsonSchema);

  @override
  Scaffold builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    _log.finer(value);

    return Scaffold(
      key: SchemaWidget.parse<Key>(buildContext, value["key"]),
      backgroundColor:
          SchemaWidget.parse<Color>(buildContext, value['backgroundColor']),
      body: SchemaWidget.parse<Widget>(buildContext, value["body"]),
      drawer: SchemaWidget.parse<Widget>(buildContext, value["drawer"]),
      appBar: SchemaWidget.parse<PreferredSizeWidget>(
          buildContext, value["appBar"]),
      floatingActionButton: SchemaWidget.parse<Widget>(
          buildContext, value["floatingActionButton"]),
      primary: value['primary'] ?? true,
      bottomNavigationBar: SchemaWidget.parse<Widget>(
          buildContext, value["bottomNavigationBar"]),
      bottomSheet:
          SchemaWidget.parse<Widget>(buildContext, value["bottomSheet"]),
      drawerDragStartBehavior: SchemaWidget.parse<DragStartBehavior>(
          buildContext,
          value['drawerDragStartBehavior'],
          DragStartBehavior.start),
      drawerEdgeDragWidth: SchemaWidget.parse<double>(
          buildContext, value['drawerEdgeDragWidth']),
      drawerScrimColor:
          SchemaWidget.parse<Color>(buildContext, value['drawerScrimColor']),
      endDrawer: SchemaWidget.parse<Widget>(buildContext, value["endDrawer"]),
      extendBody: value['extendBody'] ?? false,
      extendBodyBehindAppBar: value['extendBodyBehindAppBar'] ?? false,
      floatingActionButtonAnimator:
          SchemaWidget.parse<FloatingActionButtonAnimator>(
              buildContext, value['floatingActionButtonAnimator']),
      floatingActionButtonLocation:
          SchemaWidget.parse<FloatingActionButtonLocation>(
              buildContext, value['floatingActionButtonLocation']),
      persistentFooterButtons: SchemaWidget.parse<List<Widget>>(
          buildContext, value["persistentFooterButtons"]),
      resizeToAvoidBottomInset: value['resizeToAvoidBottomInset'],
      resizeToAvoidBottomPadding: value['resizeToAvoidBottomPadding'],
    );
  }
}
