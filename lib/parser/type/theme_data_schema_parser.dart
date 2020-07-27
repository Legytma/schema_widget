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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_schema/json_schema.dart';

import '../../schema_widget.dart';

/// Schema parser from [Map<String, dynamic>] to [ThemeData]
///
/// Created by Windol <windol@legytma.com.br> at 27/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("ThemeData",
    "https://schema.legytma.com.br/2.0.0/schema/theme_data.schema.json")
class ThemeDataSchemaParser
    extends TypeSchemaParser<ThemeData, Map<String, dynamic>, ThemeData> {
  /// Create instance of parser using [JsonSchema] to validate values.
  ThemeDataSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  ThemeData builder(BuildContext buildContext, Map<String, dynamic> value,
      [ThemeData defaultValue]) {
    return ThemeData(
      primarySwatch: SchemaWidget.parse<MaterialColor>(
          buildContext, value["primarySwatch"]),
      accentColor:
          SchemaWidget.parse<Color>(buildContext, value["accentColor"]),
      accentColorBrightness: SchemaWidget.parse<Brightness>(
          buildContext, value["accentColorBrightness"]),
      accentIconTheme: SchemaWidget.parse<IconThemeData>(
          buildContext, value["accentIconTheme"]),
      accentTextTheme:
          SchemaWidget.parse<TextTheme>(buildContext, value["accentTextTheme"]),
      appBarTheme:
          SchemaWidget.parse<AppBarTheme>(buildContext, value["appBarTheme"]),
      applyElevationOverlayColor: value["applyElevationOverlayColor"],
      backgroundColor:
          SchemaWidget.parse<Color>(buildContext, value["backgroundColor"]),
      bannerTheme: SchemaWidget.parse<MaterialBannerThemeData>(
          buildContext, value["bannerTheme"]),
      bottomAppBarColor:
          SchemaWidget.parse<Color>(buildContext, value["bottomAppBarColor"]),
      bottomAppBarTheme: SchemaWidget.parse<BottomAppBarTheme>(
          buildContext, value['bottomAppBarTheme']),
      bottomSheetTheme: SchemaWidget.parse<BottomSheetThemeData>(
          buildContext, value['bottomSheetTheme']),
      brightness:
          SchemaWidget.parse<Brightness>(buildContext, value["brightness"]),
      buttonBarTheme: SchemaWidget.parse<ButtonBarThemeData>(
          buildContext, value['buttonBarTheme']),
      buttonColor:
          SchemaWidget.parse<Color>(buildContext, value["buttonColor"]),
      buttonTheme: SchemaWidget.parse<ButtonThemeData>(
          buildContext, value['buttonTheme']),
      canvasColor:
          SchemaWidget.parse<Color>(buildContext, value["canvasColor"]),
      cardColor: SchemaWidget.parse<Color>(buildContext, value["cardColor"]),
      cardTheme:
          SchemaWidget.parse<CardTheme>(buildContext, value['cardTheme']),
      chipTheme:
          SchemaWidget.parse<ChipThemeData>(buildContext, value['chipTheme']),
      colorScheme:
          SchemaWidget.parse<ColorScheme>(buildContext, value['colorScheme']),
      cupertinoOverrideTheme: SchemaWidget.parse<CupertinoThemeData>(
          buildContext, value['cupertinoOverrideTheme']),
      cursorColor:
          SchemaWidget.parse<Color>(buildContext, value["cursorColor"]),
      dialogBackgroundColor: SchemaWidget.parse<Color>(
          buildContext, value["dialogBackgroundColor"]),
      dialogTheme:
          SchemaWidget.parse<DialogTheme>(buildContext, value['dialogTheme']),
      disabledColor:
          SchemaWidget.parse<Color>(buildContext, value["disabledColor"]),
      dividerColor:
          SchemaWidget.parse<Color>(buildContext, value["dividerColor"]),
      dividerTheme: SchemaWidget.parse<DividerThemeData>(
          buildContext, value['dividerTheme']),
      errorColor: SchemaWidget.parse<Color>(buildContext, value["errorColor"]),
      floatingActionButtonTheme:
          SchemaWidget.parse<FloatingActionButtonThemeData>(
              buildContext, value['floatingActionButtonTheme']),
      focusColor: SchemaWidget.parse<Color>(buildContext, value["focusColor"]),
      fontFamily: value['fontFamily'],
      highlightColor:
          SchemaWidget.parse<Color>(buildContext, value["highlightColor"]),
      hintColor: SchemaWidget.parse<Color>(buildContext, value["hintColor"]),
      hoverColor: SchemaWidget.parse<Color>(buildContext, value["hoverColor"]),
      iconTheme:
          SchemaWidget.parse<IconThemeData>(buildContext, value["iconTheme"]),
      indicatorColor:
          SchemaWidget.parse<Color>(buildContext, value["indicatorColor"]),
      inputDecorationTheme: SchemaWidget.parse<InputDecorationTheme>(
          buildContext, value['inputDecorationTheme']),
      materialTapTargetSize: SchemaWidget.parse<MaterialTapTargetSize>(
          buildContext, value['materialTapTargetSize']),
      pageTransitionsTheme: SchemaWidget.parse<PageTransitionsTheme>(
          buildContext, value['pageTransitionsTheme']),
      platform:
          SchemaWidget.parse<TargetPlatform>(buildContext, value['platform']),
      popupMenuTheme: SchemaWidget.parse<PopupMenuThemeData>(
          buildContext, value['popupMenuTheme']),
      primaryColor:
          SchemaWidget.parse<Color>(buildContext, value["primaryColor"]),
      primaryColorBrightness: SchemaWidget.parse<Brightness>(
          buildContext, value["primaryColorBrightness"]),
      primaryColorDark:
          SchemaWidget.parse<Color>(buildContext, value["primaryColorDark"]),
      primaryColorLight:
          SchemaWidget.parse<Color>(buildContext, value["primaryColorLight"]),
      primaryIconTheme: SchemaWidget.parse<IconThemeData>(
          buildContext, value['primaryIconTheme']),
      primaryTextTheme: SchemaWidget.parse<TextTheme>(
          buildContext, value['primaryTextTheme']),
      scaffoldBackgroundColor: SchemaWidget.parse<Color>(
          buildContext, value["scaffoldBackgroundColor"]),
      secondaryHeaderColor: SchemaWidget.parse<Color>(
          buildContext, value["secondaryHeaderColor"]),
      selectedRowColor:
          SchemaWidget.parse<Color>(buildContext, value["selectedRowColor"]),
      sliderTheme: SchemaWidget.parse<SliderThemeData>(
          buildContext, value['sliderTheme']),
      snackBarTheme: SchemaWidget.parse<SnackBarThemeData>(
          buildContext, value['snackBarTheme']),
      splashColor:
          SchemaWidget.parse<Color>(buildContext, value["splashColor"]),
      splashFactory: SchemaWidget.parse<InteractiveInkFeatureFactory>(
          buildContext, value['splashFactory']),
      tabBarTheme:
          SchemaWidget.parse<TabBarTheme>(buildContext, value['tabBarTheme']),
      textSelectionColor:
          SchemaWidget.parse<Color>(buildContext, value["textSelectionColor"]),
      textSelectionHandleColor: SchemaWidget.parse<Color>(
          buildContext, value["textSelectionHandleColor"]),
      textTheme:
          SchemaWidget.parse<TextTheme>(buildContext, value['textTheme']),
      toggleableActiveColor: SchemaWidget.parse<Color>(
          buildContext, value["toggleableActiveColor"]),
      toggleButtonsTheme: SchemaWidget.parse<ToggleButtonsThemeData>(
          buildContext, value['toggleButtonsTheme']),
      tooltipTheme: SchemaWidget.parse<TooltipThemeData>(
          buildContext, value['tooltipTheme']),
      typography:
          SchemaWidget.parse<Typography>(buildContext, value['typography']),
      unselectedWidgetColor: SchemaWidget.parse<Color>(
          buildContext, value["unselectedWidgetColor"]),
    );
  }
}
