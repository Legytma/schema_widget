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
import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to parse [MaterialApp].
@SchemaParser("MaterialApp", "https://schema.legytma.com.br/1.1.2/schema/widget/material_app.schema.json")
class MaterialAppSchemaWidgetParser extends SchemaWidgetParser<MaterialApp> {
  static final Logger _log = Logger("MaterialAppSchemaWidgetParser");

  /// Create instance of parser
  MaterialAppSchemaWidgetParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   MaterialApp builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    _log.finer(value);

    return MaterialApp(
      locale: SchemaWidget.parse<Locale>(buildContext, value["locale"]),
      title: value["title"] ?? '',
      home: SchemaWidget.parse<Widget>(buildContext, value["home"]),
      theme: SchemaWidget.parse<ThemeData>(buildContext, value["theme"]),
      key: SchemaWidget.parse<Key>(buildContext, value["key"]),
      color: SchemaWidget.parse<Color>(buildContext, value['color']),
      routes: SchemaWidget.parse<Map<String, WidgetBuilder>>(
          buildContext, value['routes'], const <String, WidgetBuilder>{}),
      onUnknownRoute: SchemaWidget.parse<RouteFactory>(
          buildContext, value['onUnknownRoute']),
      onGenerateTitle: SchemaWidget.parse<GenerateAppTitle>(
          buildContext, value['onGenerateTitle']),
      onGenerateRoute: SchemaWidget.parse<RouteFactory>(
          buildContext, value['onGenerateRoute']),
      initialRoute: value['initialRoute'],
      navigatorObservers: SchemaWidget.parse<List<NavigatorObserver>>(
          buildContext,
          value['navigatorObservers'], const <NavigatorObserver>[]),
      navigatorKey: SchemaWidget.parse<GlobalKey<NavigatorState>>(
          buildContext, value['navigatorKey']),
      builder:
          SchemaWidget.parse<TransitionBuilder>(buildContext, value['builder']),
      checkerboardOffscreenLayers:
          value['checkerboardOffscreenLayers'] ?? false,
      checkerboardRasterCacheImages:
          value['checkerboardRasterCacheImages'] ?? false,
      darkTheme:
          SchemaWidget.parse<ThemeData>(buildContext, value['darkTheme']),
      debugShowCheckedModeBanner: value['debugShowCheckedModeBanner'] ?? true,
      debugShowMaterialGrid: value['debugShowMaterialGrid'] ?? false,
      localeListResolutionCallback:
          SchemaWidget.parse<LocaleListResolutionCallback>(
              buildContext, value['localeListResolutionCallback']),
      localeResolutionCallback: SchemaWidget.parse<LocaleResolutionCallback>(
          buildContext, value['localeResolutionCallback']),
      localizationsDelegates:
          SchemaWidget.parse<Iterable<LocalizationsDelegate<dynamic>>>(
              buildContext, value['localizationsDelegates']),
      showPerformanceOverlay: value['showPerformanceOverlay'] ?? false,
      showSemanticsDebugger: value['showSemanticsDebugger'] ?? false,
      supportedLocales: SchemaWidget.parse<Iterable<Locale>>(buildContext,
          value['supportedLocales'], const <Locale>[Locale('en', 'US')]),
      themeMode: SchemaWidget.parse<ThemeMode>(
          buildContext, value['themeMode'], ThemeMode.system),
    );
  }
}
