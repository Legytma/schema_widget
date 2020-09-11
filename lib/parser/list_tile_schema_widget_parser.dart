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

/// [SchemaWidgetParser] to [ListTile]
@SchemaParser("ListTile",
    "https://schema.legytma.com.br/3.0.0/schema/widget/list_tile.schema.json")
class ListTileSchemaWidgetParser extends SchemaWidgetParser<ListTile>
    with RouteHandleMixin {
  /// Create instance of parser
  ListTileSchemaWidgetParser([JsonSchema jsonSchema]) : super(jsonSchema);

  @override
  ListTile builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    addHandleOnMap(value, buildContext, "onTap");

    return ListTile(
      key: SchemaWidget.parse<Key>(buildContext, value["key"]),
      isThreeLine: value["isThreeLine"] ?? false,
      leading: SchemaWidget.parse<Widget>(buildContext, value["leading"]),
      title: SchemaWidget.parse<Widget>(buildContext, value["title"]),
      subtitle: SchemaWidget.parse<Widget>(buildContext, value["subtitle"]),
      trailing: SchemaWidget.parse<Widget>(buildContext, value["trailing"]),
      dense: value["dense"],
      contentPadding: SchemaWidget.parse<EdgeInsetsGeometry>(
          buildContext, value["contentPadding"]),
      enabled: value["enabled"] ?? true,
      selected: value["selected"] ?? false,
      onLongPress: SchemaWidget.parse<GestureLongPressCallback>(
          buildContext, value["onLongPress"]),
      onTap:
          SchemaWidget.parse<GestureTapCallback>(buildContext, value["onTap"]),
    );
  }
}
