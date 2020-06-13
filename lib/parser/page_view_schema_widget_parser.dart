/*
 * Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br).
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:json_schema/json_schema.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to [PageView]
@SchemaParser("PageView", "https://legytma.com.br/schema/widget/page_view.schema.json")
class PageViewSchemaWidgetParser extends SchemaWidgetParser<PageView> {
  /// Create instance of parser
  PageViewSchemaWidgetParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   PageView builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    return PageView(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      controller:
          SchemaWidget.parse<PageController>(buildContext, value['controller']),
      physics:
          SchemaWidget.parse<ScrollPhysics>(buildContext, value['physics']),
      dragStartBehavior: SchemaWidget.parse<DragStartBehavior>(
          buildContext, value['dragStartBehavior'], DragStartBehavior.start),
      onPageChanged: SchemaWidget.parse<ValueChanged<int>>(
          buildContext, value['onPageChanged']),
      scrollDirection: SchemaWidget.parse<Axis>(
          buildContext, value['scrollDirection'], Axis.horizontal),
      reverse: value["reverse"] ?? false,
      pageSnapping: value["pageSnapping"] ?? true,
      children: SchemaWidget.parse<List<Widget>>(
          buildContext, value['children'], const <Widget>[]),
    );
  }
}
