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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_schema/src/json_schema/json_schema.dart';
import 'package:logging/logging.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to parse [MaterialApp].
class MaterialAppSchemaWidgetParser extends SchemaWidgetParser {
  static final Logger _log = Logger("MaterialAppSchemaWidgetParser");

  @override
  String get parserName => "MaterialApp";

  @override
  JsonSchema get jsonSchema => JsonSchema.createSchema({
        "\$schema": "http://json-schema.org/draft-06/schema#",
//        "\$id": "#widget-schema",
        "title": "Container Parser Schema",
        "description": "Schema to validation of JSON used to parse Container"
            " Widget.",
        "type": "object",
        "\$comment": "You can add all valid properties to complete validation.",
        "properties": {
          "type": {
            "\$comment": "Used to identify parser. Every parser can permit only"
                " one type",
            "title": "Type",
            "description": "Identify the widget type",
            "type": "string",
            "default": parserName,
            "examples": [parserName],
            "enum": [parserName],
            "const": parserName,
          },
          "title": {
            "title": "Title",
            "description": "App title",
            "type": "string",
          },
        },
        "required": ["type", "title"],
      });

  @override
  Widget builder(BuildContext buildContext, Map<String, dynamic> map) {
    _log.finer(map);

    Map<String, dynamic> localeMap =
        map.containsKey("locale") ? map["locale"] : null;

    return MaterialApp(
      locale: parseLocale(localeMap),
      title: map["title"] ?? '',
      home: SchemaWidget.build(buildContext, map["home"]),
      theme: parseThemeData(buildContext, map["theme"]),
      key: SchemaWidget.build(buildContext, map["key"]),
      color: parseHexColor(map['color']),
      routes: SchemaWidget.build(buildContext, map['routes']) ??
          const <String, WidgetBuilder>{},
      onUnknownRoute: SchemaWidget.build(buildContext, map['onUnknownRoute']),
      onGenerateTitle: SchemaWidget.build(buildContext, map['onGenerateTitle']),
      onGenerateRoute: SchemaWidget.build(buildContext, map['onGenerateRoute']),
      initialRoute: map['initialRoute'],
      navigatorObservers:
      SchemaWidget.build(buildContext, map['navigatorObservers']) ??
          const <NavigatorObserver>[],
      navigatorKey: SchemaWidget.build(buildContext, map['navigatorKey']),
      builder: SchemaWidget.build(buildContext, map['builder']),
      checkerboardOffscreenLayers: map['checkerboardOffscreenLayers'] ?? false,
      checkerboardRasterCacheImages:
      map['checkerboardRasterCacheImages'] ?? false,
      darkTheme: parseThemeData(buildContext, map['darkTheme']),
      debugShowCheckedModeBanner: map['debugShowCheckedModeBanner'] ?? true,
      debugShowMaterialGrid: map['debugShowMaterialGrid'] ?? false,
      localeListResolutionCallback:
      SchemaWidget.build(buildContext, map['localeListResolutionCallback']),
      localeResolutionCallback:
      SchemaWidget.build(buildContext, map['localeResolutionCallback']),
      localizationsDelegates:
      SchemaWidget.build(buildContext, map['localizationsDelegates']),
      showPerformanceOverlay: map['showPerformanceOverlay'] ?? false,
      showSemanticsDebugger: map['showSemanticsDebugger'] ?? false,
      supportedLocales:
      SchemaWidget.build(buildContext, map['supportedLocales']) ??
          const <Locale>[Locale('en', 'US')],
      themeMode: parseThemeMode(map['themeMode']) ?? ThemeMode.system,
    );
  }
}
