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

/// [SchemaWidgetParser] to parse [AppBar].
@SchemaParser("AppBar",
    "https://schema.legytma.com.br/3.0.0/schema/widget/app_bar.schema.json")
class AppBarSchemaWidgetParser extends SchemaWidgetParser<AppBar> {
  static final Logger _log = Logger("AppBarSchemaWidgetParser");

  /// Create instance of parser
  AppBarSchemaWidgetParser([JsonSchema jsonSchema])
      : super("AppBar", jsonSchema);

  @override
  AppBar builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    _log.finer(value);

    return AppBar(
      key: SchemaWidget.parse<Key>(buildContext, value["key"]),
      title: SchemaWidget.parse<Widget>(buildContext, value["title"]),
      primary: value["primary"] ?? true,
      actions: SchemaWidget.parse<List<Widget>>(buildContext, value["actions"]),
      actionsIconTheme: SchemaWidget.parse<IconThemeData>(
          buildContext, value["actionsIconTheme"]),
      automaticallyImplyLeading: value["automaticallyImplyLeading"] ?? true,
      backgroundColor:
          SchemaWidget.parse<Color>(buildContext, value["backgroundColor"]),
      bottom: SchemaWidget.parse<PreferredSizeWidget>(
          buildContext, value["bottom"]),
      bottomOpacity: value["bottomOpacity"] ?? 1.0,
      brightness:
          SchemaWidget.parse<Brightness>(buildContext, value["brightness"]),
      centerTitle: value["centerTitle"],
      elevation: value["elevation"],
      flexibleSpace:
          SchemaWidget.parse<Widget>(buildContext, value["flexibleSpace"]),
      iconTheme:
          SchemaWidget.parse<IconThemeData>(buildContext, value["iconTheme"]),
      leading: SchemaWidget.parse<Widget>(buildContext, value["leading"]),
      shape: SchemaWidget.parse<ShapeBorder>(buildContext, value["shape"]),
      textTheme:
          SchemaWidget.parse<TextTheme>(buildContext, value["textTheme"]),
      titleSpacing: SchemaWidget.parse<double>(buildContext,
          value["titleSpacing"], NavigationToolbar.kMiddleSpacing),
      toolbarOpacity: SchemaWidget.parse<double>(
          buildContext, value["toolbarOpacity"], 1.0),
    );
  }
}
