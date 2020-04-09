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

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_schema/json_schema.dart';

import 'schema_widget.dart';

enum PickerType {
  DateTimePicker,
  DatePicker,
  TimePicker,
}

enum NavigationType {
  popAndPush,
  push,
  pop,
}

/// Parse [TextAlign] from [String].
TextAlign parseTextAlign(dynamic value, [dynamic defaultValue]) {
  if (value == null || value is TextAlign) {
    return value ?? defaultValue;
  }

  if (value is String) {
    switch (value) {
      case "left":
        return TextAlign.left;
      case "right":
        return TextAlign.right;
      case "center":
        return TextAlign.center;
      case "justify":
        return TextAlign.justify;
      case "start":
        return TextAlign.start;
      case "end":
        return TextAlign.end;
      default:
      //left the system decide
        return defaultValue;
    }
  }

  return defaultValue;
}

/// Parse [TextOverflow] from [String].
TextOverflow parseTextOverflow(dynamic value, [dynamic defaultValue]) {
  if (value == null || value is TextOverflow) {
    return value ?? defaultValue;
  }

  if (value is String) {
    switch (value) {
      case "ellipsis":
        return TextOverflow.ellipsis;
      case "clip":
        return TextOverflow.clip;
      case "fade":
        return TextOverflow.fade;
      default:
        return defaultValue;
    }
  }

  return defaultValue;
}

/// Parse [TextDecoration] from [String].
TextDecoration parseTextDecoration(String textDecorationString) {
  switch (textDecorationString) {
    case "lineThrough":
      return TextDecoration.lineThrough;
    case "overline":
      return TextDecoration.overline;
    case "underline":
      return TextDecoration.underline;
    case "none":
    default:
      return TextDecoration.none;
  }
}

/// Parse [String] from [TextDecoration].
String textDecorationToString(TextDecoration textDecoration) {
  if (textDecoration.contains(TextDecoration.lineThrough)) {
    return "lineThrough";
  }

  if (textDecoration.contains(TextDecoration.overline)) {
    return "overline";
  }

  if (textDecoration.contains(TextDecoration.underline)) {
    return "underline";
  }

  return "none";
}

/// Convert [int] to Hex [String]
String intToHex(int number, int padSize) {
  if (number == null) {
    return null;
  }

  return "#${number.toRadixString(16).padLeft(padSize, '0').toUpperCase()}";
}

/// Parse [TextDirection] from [String].
TextDirection parseTextDirection(dynamic value, [dynamic defaultValue]) {
  if (value == null || value is TextDirection) {
    return value;
  }

  if (value is String) {
    switch (value) {
      case 'ltr':
        return TextDirection.ltr;
      case 'rtl':
        return TextDirection.rtl;
      default:
        return defaultValue;
    }
  }

  return defaultValue;
}

/// Parse [FontWeight] from [String].
FontWeight parseFontWeight(String textFontWeight) {
  switch (textFontWeight) {
    case 'w100':
      return FontWeight.w100;
    case 'w200':
      return FontWeight.w200;
    case 'w300':
      return FontWeight.w300;
    case 'normal':
    case 'w400':
      return FontWeight.w400;
    case 'w500':
      return FontWeight.w500;
    case 'w600':
      return FontWeight.w600;
    case 'bold':
    case 'w700':
      return FontWeight.w700;
    case 'w800':
      return FontWeight.w800;
    case 'w900':
      return FontWeight.w900;
    default:
      return FontWeight.normal;
  }
}

/// Parse [Color] from [String].
Color parseHexColor(String hexColorString) {
  if (hexColorString == null) {
    return null;
  }

  hexColorString = hexColorString.toUpperCase().replaceAll("#", "");

  if (hexColorString.length == 6) {
    hexColorString = "FF$hexColorString";
  }

  var colorInt = int.parse(hexColorString, radix: 16);

  return Color(colorInt);
}

MaterialColor parseMaterialColor(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  var primary = parseHexColor(map["primary"]);
  var swatch = _parseSwatchIntColor(map["swatch"], primary: primary);

  return MaterialColor(primary.value, swatch);
}

Map<int, Color> _parseSwatchIntColor(Map<int, dynamic> map,
    {Color primary = null}) {
  if (map == null) {
    if (primary == null) {
      return null;
    }

    return <int, Color>{
      50: primary.withOpacity(.1),
      100: primary.withOpacity(.2),
      200: primary.withOpacity(.3),
      300: primary.withOpacity(.4),
      400: primary.withOpacity(.5),
      500: primary.withOpacity(.6),
      600: primary.withOpacity(.7),
      700: primary.withOpacity(.8),
      800: primary.withOpacity(.9),
      900: primary.withOpacity(1),
    };
  }

  var swatch = <int, Color>{};

  swatch = _extractValue(swatch, map, 50);
  swatch = _extractValue(swatch, map, 100);
  swatch = _extractValue(swatch, map, 200);
  swatch = _extractValue(swatch, map, 300);
  swatch = _extractValue(swatch, map, 400);
  swatch = _extractValue(swatch, map, 500);
  swatch = _extractValue(swatch, map, 600);
  swatch = _extractValue(swatch, map, 700);
  swatch = _extractValue(swatch, map, 800);
  swatch = _extractValue(swatch, map, 900);

  return swatch;
}

Map<int, Color> _extractValue(Map<int, Color> swatch, Map<int, dynamic> map,
    int key) {
  if (map.containsKey(key)) {
    swatch[key] = parseHexColor(map[key]);
  }

  return swatch;
}

/// Parse [TextStyle] from [Map]<[String], [dynamic]>.
TextStyle parseTextStyle(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  //TODO: more properties need to be implemented, such as decorationColor, decorationStyle, wordSpacing and so on.
  return TextStyle(
    color: parseHexColor(map['color']),
    debugLabel: map['debugLabel'],
    decoration: parseTextDecoration(map['decoration']),
    fontSize: parseDouble(map['fontSize']),
    fontFamily: map['fontFamily'],
    fontStyle:
    'italic' == map['fontStyle'] ? FontStyle.italic : FontStyle.normal,
    fontWeight: parseFontWeight(map['fontWeight']),
    backgroundColor: parseHexColor(map["backgroundColor"]),
//    background: ,
    decorationColor: parseHexColor(map["decorationColor"]),
    decorationStyle: parseTextDecorationStyle(map['decoration']),
    decorationThickness: parseDouble(map["decorationThickness"]),
    fontFamilyFallback: map["fontFamilyFallback"],
//    fontFeatures: ,
//    foreground: ,
    height: parseDouble(map["height"]),
    inherit: map["inherit"] ?? true,
    letterSpacing: parseDouble(map["letterSpacing"]),
    locale: parseLocale(map["locale"]),
    package: map["package"],
//    shadows: ,
    textBaseline: parseTextBaseline(map["textBaseline"]),
    wordSpacing: parseDouble(map["wordSpacing"]),
  );
}

TextTheme parseTextTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return TextTheme(
    body1: parseTextStyle(map["body1"]),
    body2: parseTextStyle(map["body2"]),
    button: parseTextStyle(map["button"]),
    caption: parseTextStyle(map["caption"]),
    display1: parseTextStyle(map["display1"]),
    display2: parseTextStyle(map["display2"]),
    display3: parseTextStyle(map["display3"]),
    display4: parseTextStyle(map["display4"]),
    headline: parseTextStyle(map["headline"]),
    overline: parseTextStyle(map["overline"]),
    subhead: parseTextStyle(map["subhead"]),
    subtitle: parseTextStyle(map["subtitle"]),
    title: parseTextStyle(map["title"]),
  );
}

Locale parseLocale(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return Locale(map["languageCode"], map["countryCode"]);
}

TextDecorationStyle parseTextDecorationStyle(String decorationStyleName) {
  if (decorationStyleName == null) {
    return null;
  }

  switch (decorationStyleName) {
    case "dashed":
      return TextDecorationStyle.dashed;
    case "dotted":
      return TextDecorationStyle.dotted;
    case "double":
      return TextDecorationStyle.double;
    case "solid":
      return TextDecorationStyle.solid;
    case "wavy":
      return TextDecorationStyle.wavy;
    default:
      return null;
  }
}

/// Parse [Alignment] from [String].
Alignment parseAlignment(dynamic alignmentString,
    [Alignment defaultValue = Alignment.topLeft]) {
  if (alignmentString == null || alignmentString is Alignment) {
    return alignmentString ?? defaultValue;
  }

  if (alignmentString is String) {
    switch (alignmentString) {
      case 'topLeft':
        return Alignment.topLeft;
      case 'topCenter':
        return Alignment.topCenter;
      case 'topRight':
        return Alignment.topRight;
      case 'centerLeft':
        return Alignment.centerLeft;
      case 'center':
        return Alignment.center;
      case 'centerRight':
        return Alignment.centerRight;
      case 'bottomLeft':
        return Alignment.bottomLeft;
      case 'bottomCenter':
        return Alignment.bottomCenter;
      case 'bottomRight':
        return Alignment.bottomRight;
      default:
        return defaultValue;
    }
  }

  return defaultValue;
}

IconThemeData parseIconTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return IconThemeData(
    color: parseHexColor(map["color"]),
    opacity: parseDouble(map["opacity"]),
    size: parseDouble(map["opacity"]),
  );
}

AppBarTheme parseAppBarTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return AppBarTheme(
    color: parseHexColor(map["color"]),
    textTheme: parseTextTheme(map["textTheme"]),
    iconTheme: parseIconTheme(map["iconTheme"]),
    brightness: parseKeyboardAppearance(map["brightness"]),
    actionsIconTheme: parseIconTheme(map["actionsIconTheme"]),
    elevation: parseDouble("elevation"),
  );
}

MaterialBannerThemeData parseMaterialBannerTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return MaterialBannerThemeData(
    backgroundColor: parseHexColor(map["backgroundColor"]),
    contentTextStyle: parseTextStyle(map["contentTextStyle"]),
    leadingPadding: parseEdgeInsetsGeometry(map["leadingPadding"]),
    padding: parseEdgeInsetsGeometry(map["padding"]),
  );
}

BottomAppBarTheme parseBottomAppBarTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return BottomAppBarTheme(
    elevation: parseDouble(map['elevation']),
    color: parseHexColor(map["color"]),
//        shape: ,
  );
}

BottomSheetThemeData parseBottomSheetTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return BottomSheetThemeData(
//      shape: ,
    elevation: parseDouble(map["elevation"]),
    backgroundColor: parseHexColor(map['backgroundColor']),
    clipBehavior: parseClip(map['clipBehavior']),
    modalBackgroundColor: parseHexColor(map['modalBackgroundColor']),
    modalElevation: parseDouble(map['modalElevation']),
  );
}

ButtonTextTheme parseButtonTextTheme(String buttonTextTheme) {
  if (buttonTextTheme == null) {
    return null;
  }

  switch (buttonTextTheme) {
    case 'accent':
      return ButtonTextTheme.accent;
    case 'normal':
      return ButtonTextTheme.normal;
    case 'primary':
      return ButtonTextTheme.primary;
    default:
      return null;
  }
}

ButtonBarLayoutBehavior parseLayoutBehavior(String buttonBarLayoutBehavior) {
  if (buttonBarLayoutBehavior == null) {
    return null;
  }

  switch (buttonBarLayoutBehavior) {
    case 'constrained':
      return ButtonBarLayoutBehavior.constrained;
    case 'padded':
      return ButtonBarLayoutBehavior.padded;
    default:
      return null;
  }
}

ButtonBarThemeData parseButtonBarTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return ButtonBarThemeData(
    alignment: parseMainAxisAlignment(map['alignment']),
    buttonAlignedDropdown: map['buttonAlignedDropdown'],
    buttonHeight: parseDouble(map['buttonHeight']),
    buttonMinWidth: parseDouble(map['buttonMinWidth']),
    buttonPadding: parseEdgeInsetsGeometry(map['buttonPadding']),
    buttonTextTheme: parseButtonTextTheme(map['buttonTextTheme']),
    layoutBehavior: parseLayoutBehavior(map['layoutBehavior']),
    mainAxisSize: parseMainAxisSize(map['mainAxisSize']),
  );
}

MaterialTapTargetSize parseMaterialTapTargetSize(String materialTapTargetSize) {
  if (materialTapTargetSize == null) {
    return null;
  }

  switch (materialTapTargetSize) {
    case 'padded':
      return MaterialTapTargetSize.padded;
    case 'shrinkWrap':
      return MaterialTapTargetSize.shrinkWrap;
    default:
      return null;
  }
}

ColorScheme parseColorScheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return ColorScheme(
    primary: parseHexColor(map['primary']),
    primaryVariant: parseHexColor(map['primaryVariant']),
    secondary: parseHexColor(map['secondary']),
    secondaryVariant: parseHexColor(map['secondaryVariant']),
    surface: parseHexColor(map['surface']),
    background: parseHexColor(map['background']),
    error: parseHexColor(map['error']),
    onPrimary: parseHexColor(map['onPrimary']),
    onSecondary: parseHexColor(map['onSecondary']),
    onSurface: parseHexColor(map['onSurface']),
    onBackground: parseHexColor(map['onBackground']),
    onError: parseHexColor(map['onError']),
    brightness: parseKeyboardAppearance(map['brightness']),
  );
}

ButtonThemeData parseButtonTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return ButtonThemeData(
    layoutBehavior: parseLayoutBehavior(map['layoutBehavior']) ??
        ButtonBarLayoutBehavior.padded,
//      shape: ,
    padding: parseEdgeInsetsGeometry(map['padding']),
    textTheme: parseButtonTextTheme(map['textTheme']) ?? ButtonTextTheme.normal,
    height: parseDouble(map['height']) ?? 36.0,
    splashColor: parseHexColor(map['splashColor']),
    materialTapTargetSize:
    parseMaterialTapTargetSize(map['materialTapTargetSize']),
    hoverColor: parseHexColor(map['hoverColor']),
    highlightColor: parseHexColor(map['highlightColor']),
    focusColor: parseHexColor(map['focusColor']),
    disabledColor: parseHexColor(map['disabledColor']),
    colorScheme: parseColorScheme(map['colorScheme']),
    buttonColor: parseHexColor(map['buttonColor']),
    alignedDropdown: map['alignedDropdown'] ?? false,
    minWidth: parseDouble(map['minWidth']) ?? 88.0,
  );
}

CardTheme parseCardTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return CardTheme(
//      shape: ,
    clipBehavior: parseClip(map['clipBehavior']),
    elevation: parseDouble(map['elevation']),
    color: parseHexColor(map['color']),
    margin: parseEdgeInsetsGeometry(map['margin']),
  );
}

ChipThemeData parseChipTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return ChipThemeData(
    backgroundColor: parseHexColor(map['backgroundColor']),
    disabledColor: parseHexColor(map['disabledColor']),
    selectedColor: parseHexColor(map['selectedColor']),
    secondarySelectedColor: parseHexColor(map['secondarySelectedColor']),
    labelPadding: parseEdgeInsetsGeometry(map['labelPadding']),
    padding: parseEdgeInsetsGeometry(map['padding']),
//        shape: null,
    labelStyle: parseTextStyle(map['labelStyle']),
    secondaryLabelStyle: parseTextStyle(map['secondaryLabelStyle']),
    brightness: parseKeyboardAppearance(map['brightness']),
    elevation: parseDouble(map['elevation']),
    checkmarkColor: parseHexColor(map['checkmarkColor']),
    deleteIconColor: parseHexColor(map['deleteIconColor']),
    pressElevation: parseDouble(map['pressElevation']),
    selectedShadowColor: parseHexColor(map['selectedShadowColor']),
    shadowColor: parseHexColor(map['shadowColor']),
    showCheckmark: map['showCheckmark'],
  );
}

CupertinoTextThemeData parseCupertinoTextTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return CupertinoTextThemeData(
    primaryColor: parseHexColor(map['primaryColor']),
    actionTextStyle: parseTextStyle(map['actionTextStyle']),
    dateTimePickerTextStyle: parseTextStyle(map['dateTimePickerTextStyle']),
    navActionTextStyle: parseTextStyle(map['navActionTextStyle']),
    navLargeTitleTextStyle: parseTextStyle(map['navLargeTitleTextStyle']),
    navTitleTextStyle: parseTextStyle(map['navTitleTextStyle']),
    pickerTextStyle: parseTextStyle(map['pickerTextStyle']),
    tabLabelTextStyle: parseTextStyle(map['tabLabelTextStyle']),
    textStyle: parseTextStyle(map['textStyle']),
  );
}

CupertinoThemeData parseCupertinoTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return CupertinoThemeData(
    textTheme: parseCupertinoTextTheme(map['textTheme']),
    brightness: parseKeyboardAppearance(map['brightness']),
    scaffoldBackgroundColor: parseHexColor(map['scaffoldBackgroundColor']),
    primaryColor: parseHexColor(map['primaryColor']),
    barBackgroundColor: parseHexColor(map['barBackgroundColor']),
    primaryContrastingColor: parseHexColor(map['primaryContrastingColor']),
  );
}

DialogTheme parseDialogTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return DialogTheme(
    elevation: parseDouble(map['elevation']),
//      shape: ,
    backgroundColor: parseHexColor(map['backgroundColor']),
    contentTextStyle: parseTextStyle(map['contentTextStyle']),
    titleTextStyle: parseTextStyle(map['titleTextStyle']),
  );
}

DividerThemeData parseDividerTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return DividerThemeData(
    color: parseHexColor(map['color']),
    endIndent: parseDouble(map['endIndent']),
    indent: parseDouble(map['indent']),
    space: parseDouble(map['space']),
    thickness: parseDouble(map['thickness']),
  );
}

FloatingActionButtonThemeData parseFloatingActionButtonTheme(
    Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return FloatingActionButtonThemeData(
    backgroundColor: parseHexColor(map['backgroundColor']),
//      shape: ,
    elevation: parseDouble(map['elevation']),
    focusColor: parseHexColor(map['focusColor']),
    hoverColor: parseHexColor(map['hoverColor']),
    splashColor: parseHexColor(map['splashColor']),
    disabledElevation: parseDouble(map['disabledElevation']),
    focusElevation: parseDouble(map['focusElevation']),
    foregroundColor: parseHexColor(map['foregroundColor']),
    highlightElevation: parseDouble(map['highlightElevation']),
    hoverElevation: parseDouble(map['hoverElevation']),
  );
}

InputDecorationTheme parseInputDecorationTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return InputDecorationTheme(
    hoverColor: parseHexColor(map['hoverColor']),
    focusColor: parseHexColor(map['focusColor']),
    contentPadding: parseEdgeInsetsGeometry(map['contentPadding']),
    isDense: map['isDense'] ?? false,
    errorStyle: parseTextStyle(map['errorStyle']),
    alignLabelWithHint: map['alignLabelWithHint'] ?? false,
//      border: ,
    counterStyle: parseTextStyle(map['counterStyle']),
//      disabledBorder: ,
//      enabledBorder: ,
//      errorBorder: ,
    errorMaxLines: map['errorMaxLines'],
    fillColor: parseHexColor(map['fillColor']),
    filled: map['filled'] ?? false,
//      focusedBorder: ,
//      focusedErrorBorder: ,
    hasFloatingPlaceholder: map['hasFloatingPlaceholder'] ?? true,
    helperMaxLines: map['helperMaxLines'],
    helperStyle: parseTextStyle(map['helperStyle']),
    hintStyle: parseTextStyle(map['hintStyle']),
    isCollapsed: map['isCollapsed'] ?? false,
    labelStyle: parseTextStyle(map['labelStyle']),
    prefixStyle: parseTextStyle(map['prefixStyle']),
    suffixStyle: parseTextStyle(map['suffixStyle']),
  );
}

TargetPlatform parseTargetPlatform(String key) {
  if (key == null) {
    return null;
  }

  switch (key) {
    case 'android':
      return TargetPlatform.android;
    case 'fuchsia':
      return TargetPlatform.fuchsia;
    case 'iOS':
      return TargetPlatform.iOS;
    default:
      return null;
  }
}

PageTransitionsTheme parsePageTransitionsTheme(BuildContext buildContext,
    Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  var pageTransitionsBuilders = <TargetPlatform, PageTransitionsBuilder>{};

  map.forEach((key, value) {
    var targetPlatform = parseTargetPlatform(key);

    pageTransitionsBuilders[targetPlatform] =
        SchemaWidget.build(buildContext, value);
  });

  return PageTransitionsTheme(
    builders: pageTransitionsBuilders,
  );
}

PopupMenuThemeData parsePopupMenuTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return PopupMenuThemeData(
    elevation: parseDouble(map['elevation']),
//      shape: ,
    color: parseHexColor(map['color']),
    textStyle: parseTextStyle(map['textStyle']),
  );
}

ShowValueIndicator parseShowValueIndicator(String showValueIndicator) {
  if (showValueIndicator == null) {
    return null;
  }

  switch (showValueIndicator) {
    case 'always':
      return ShowValueIndicator.always;
    case 'never':
      return ShowValueIndicator.never;
    case 'onlyForContinuous':
      return ShowValueIndicator.onlyForContinuous;
    case 'onlyForDiscrete':
      return ShowValueIndicator.onlyForDiscrete;
    default:
      return null;
  }
}

SnackBarBehavior parseSnackBarBehavior(String snackBarBehavior) {
  if (snackBarBehavior == null) {
    return null;
  }

  switch (snackBarBehavior) {
    case 'fixed':
      return SnackBarBehavior.fixed;
    case 'floating':
      return SnackBarBehavior.floating;
    default:
      return null;
  }
}

SnackBarThemeData parseSnackBarTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return SnackBarThemeData(
//      shape: ,
    elevation: parseDouble(map['elevation']),
    backgroundColor: parseHexColor(map['backgroundColor']),
    contentTextStyle: parseTextStyle(map['contentTextStyle']),
    actionTextColor: parseHexColor(map['actionTextColor']),
    behavior: parseSnackBarBehavior(map['behavior']),
    disabledActionTextColor: parseHexColor(map['disabledActionTextColor']),
  );
}

SliderThemeData parseSliderTheme(BuildContext buildContext,
    Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return SliderThemeData(
    activeTrackColor: parseHexColor(map['activeTrackColor']),
    inactiveTrackColor: parseHexColor(map['inactiveTrackColor']),
    activeTickMarkColor: parseHexColor(map['activeTickMarkColor']),
    disabledActiveTickMarkColor:
    parseHexColor(map['disabledActiveTickMarkColor']),
    disabledActiveTrackColor: parseHexColor(map['disabledActiveTrackColor']),
    disabledInactiveTickMarkColor:
    parseHexColor(map['disabledInactiveTickMarkColor']),
    disabledInactiveTrackColor:
    parseHexColor(map['disabledInactiveTrackColor']),
    disabledThumbColor: parseHexColor(map['disabledThumbColor']),
    inactiveTickMarkColor: parseHexColor(map['inactiveTickMarkColor']),
    minThumbSeparation: parseDouble(map['minThumbSeparation']),
    overlappingShapeStrokeColor:
    parseHexColor(map['overlappingShapeStrokeColor']),
    overlayColor: parseHexColor(map['overlayColor']),
//      overlayShape: ,
//      rangeThumbShape: ,
//      rangeTickMarkShape: ,
//      rangeTrackShape: ,
//      rangeValueIndicatorShape: ,
    showValueIndicator: parseShowValueIndicator(map['showValueIndicator']),
    thumbColor: parseHexColor(map['thumbColor']),
    thumbSelector: SchemaWidget.build(buildContext, map['thumbSelector']),
//      thumbShape: ,
//      tickMarkShape: ,
    trackHeight: parseDouble(map['trackHeight']),
//      trackShape: ,
    valueIndicatorColor: parseHexColor(map['valueIndicatorColor']),
//      valueIndicatorShape: ,
    valueIndicatorTextStyle: parseTextStyle(map['valueIndicatorTextStyle']),
  );
}

TabBarIndicatorSize parseTabBarIndicatorSize(String tabBarIndicatorSize) {
  if (tabBarIndicatorSize == null) {
    return null;
  }

  switch (tabBarIndicatorSize) {
    case 'label':
      return TabBarIndicatorSize.label;
    case 'tab':
      return TabBarIndicatorSize.tab;
    default:
      return null;
  }
}

TabBarTheme parseTabBarTheme(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return TabBarTheme(
    labelStyle: parseTextStyle(map['labelStyle']),
//      indicator: ,
    indicatorSize: parseTabBarIndicatorSize(map['indicatorSize']),
    labelColor: parseHexColor(map['labelColor']),
    labelPadding: parseEdgeInsetsGeometry(map['labelPadding']),
    unselectedLabelColor: parseHexColor(map['unselectedLabelColor']),
    unselectedLabelStyle: parseTextStyle(map['unselectedLabelStyle']),
  );
}

ToggleButtonsThemeData parseToggleButtonsTheme(BuildContext buildContext,
    Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return ToggleButtonsThemeData(
    splashColor: parseHexColor(map['splashColor']),
    hoverColor: parseHexColor(map['hoverColor']),
    highlightColor: parseHexColor(map['highlightColor']),
    focusColor: parseHexColor(map['focusColor']),
    disabledColor: parseHexColor(map['disabledColor']),
    color: parseHexColor(map['color']),
    textStyle: parseTextStyle(map['textStyle']),
    borderColor: parseHexColor(map['borderColor']),
    borderRadius: parseBorderRadius(buildContext, map['borderRadius']),
    borderWidth: parseDouble(map['borderWidth']),
    constraints: parseBoxConstraints(map['constraints']),
    disabledBorderColor: parseHexColor(map['disabledBorderColor']),
    fillColor: parseHexColor(map['fillColor']),
    selectedBorderColor: parseHexColor(map['selectedBorderColor']),
    selectedColor: parseHexColor(map['selectedColor']),
  );
}

BorderRadius parseBorderRadius(BuildContext buildContext, dynamic value) {
  if (value == null || value is BorderRadius) {
    return value;
  }

  if (value is String) {
    return SchemaWidget.build(buildContext, value);
  }

  if (value is Map<String, dynamic>) {
    switch (value['type']) {
      case 'only':
        return BorderRadius.only(
          topLeft: parseRadius(value['topLeft']),
          topRight: parseRadius(value['topRight']),
          bottomLeft: parseRadius(value['bottomLeft']),
          bottomRight: parseRadius(value['bottomRight']),
        );
      case 'all':
        return BorderRadius.all(parseRadius(value['all']));
      case 'circular':
        return BorderRadius.circular(parseDouble(value['radius']));
      case 'zero':
        return BorderRadius.zero;
      case 'horizontal':
        return BorderRadius.horizontal(
          right: parseRadius(value['right'], Radius.zero),
          left: parseRadius(value['left'], Radius.zero),
        );
      case 'vertical':
        return BorderRadius.vertical(
          bottom: parseRadius(value['bottom'], Radius.zero),
          top: parseRadius(value['top'], Radius.zero),
        );
      case 'lerp':
        return BorderRadius.lerp(
          parseBorderRadius(buildContext, value['a']),
          parseBorderRadius(buildContext, value['b']),
          parseDouble(value['t']),
        );
      default:
        return null;
    }
  }

  return null;
}

int parseInt(dynamic value, [dynamic defaultValue]) {
  if (value == null || value is int) {
    return value ?? defaultValue;
  }

  if (value is String) {
    if (value.startsWith("#")) {
      value = value.toUpperCase().replaceAll("#", "");

      return int.tryParse(value, radix: 16) ?? defaultValue;
    }

    return int.tryParse(value) ?? defaultValue;
  }

  return defaultValue;
}

Duration parseDuration(BuildContext buildContext, dynamic value,
    [dynamic defaultValue]) {
  if (value == null || value is Duration) {
    return value ?? defaultValue;
  }

  if (value is String) {
    return SchemaWidget.build(buildContext, value);
  }

  if (value is Map<String, dynamic>) {
    return Duration(
      days: value['days'] ?? 0,
      hours: value['hours'] ?? 0,
      microseconds: value['microseconds'] ?? 0,
      milliseconds: value['milliseconds'] ?? 0,
      minutes: value['minutes'] ?? 0,
      seconds: value['seconds'] ?? 0,
    );
  }
}

TooltipThemeData parseTooltipTheme(BuildContext buildContext,
    Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return TooltipThemeData(
    textStyle: parseTextStyle(map['textStyle']),
    margin: parseEdgeInsetsGeometry(map['margin']),
    height: parseDouble(map['height']),
    padding: parseEdgeInsetsGeometry(map['padding']),
//      decoration: ,
    excludeFromSemantics: map['excludeFromSemantics'],
    preferBelow: map['preferBelow'],
    showDuration: parseDuration(buildContext, map['showDuration']),
    verticalOffset: parseDouble(map['verticalOffset']),
    waitDuration: parseDuration(buildContext, map['waitDuration']),
  );
}

Typography parseTypography(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return Typography(
    platform: parseTargetPlatform(map['platform']) ?? TargetPlatform.android,
    black: parseTextTheme(map['black']),
    dense: parseTextTheme(map['dense']),
    englishLike: parseTextTheme(map['englishLike']),
    tall: parseTextTheme(map['tall']),
    white: parseTextTheme(map['white']),
  );
}

ThemeData parseThemeData(BuildContext buildContext, Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return ThemeData(
    primarySwatch: parseMaterialColor(map["primarySwatch"]),
    accentColor: parseHexColor(map["accentColor"]),
    accentColorBrightness:
    parseKeyboardAppearance(map["accentColorBrightness"]),
    accentIconTheme: parseIconTheme(map["accentIconTheme"]),
    accentTextTheme: parseTextTheme(map["accentTextTheme"]),
    appBarTheme: parseAppBarTheme(map["appBarTheme"]),
    applyElevationOverlayColor: map["applyElevationOverlayColor"],
    backgroundColor: parseHexColor(map["backgroundColor"]),
    bannerTheme: parseMaterialBannerTheme(map["bannerTheme"]),
    bottomAppBarColor: parseHexColor(map["bottomAppBarColor"]),
    bottomAppBarTheme: parseBottomAppBarTheme(map['bottomAppBarTheme']),
    bottomSheetTheme: parseBottomSheetTheme(map['bottomSheetTheme']),
    brightness: parseKeyboardAppearance(map["brightness"]),
    buttonBarTheme: parseButtonBarTheme(map['buttonBarTheme']),
    buttonColor: parseHexColor(map["buttonColor"]),
    buttonTheme: parseButtonTheme(map['buttonTheme']),
    canvasColor: parseHexColor(map["canvasColor"]),
    cardColor: parseHexColor(map["cardColor"]),
    cardTheme: parseCardTheme(map['cardTheme']),
    chipTheme: parseChipTheme(map['chipTheme']),
    colorScheme: parseColorScheme(map['colorScheme']),
    cupertinoOverrideTheme: parseCupertinoTheme(map['cupertinoOverrideTheme']),
    cursorColor: parseHexColor(map["cursorColor"]),
    dialogBackgroundColor: parseHexColor(map["dialogBackgroundColor"]),
    dialogTheme: parseDialogTheme(map['dialogTheme']),
    disabledColor: parseHexColor(map["disabledColor"]),
    dividerColor: parseHexColor(map["dividerColor"]),
    dividerTheme: parseDividerTheme(map['dividerTheme']),
    errorColor: parseHexColor(map["errorColor"]),
    floatingActionButtonTheme:
    parseFloatingActionButtonTheme(map['floatingActionButtonTheme']),
    focusColor: parseHexColor(map["focusColor"]),
    fontFamily: map['fontFamily'],
    highlightColor: parseHexColor(map["highlightColor"]),
    hintColor: parseHexColor(map["hintColor"]),
    hoverColor: parseHexColor(map["hoverColor"]),
    iconTheme: parseIconTheme(map["iconTheme"]),
    indicatorColor: parseHexColor(map["indicatorColor"]),
    inputDecorationTheme:
    parseInputDecorationTheme(map['inputDecorationTheme']),
    materialTapTargetSize:
    parseMaterialTapTargetSize(map['materialTapTargetSize']),
    pageTransitionsTheme:
    parsePageTransitionsTheme(buildContext, map['pageTransitionsTheme']),
    platform: parseTargetPlatform(map['platform']),
    popupMenuTheme: parsePopupMenuTheme(map['popupMenuTheme']),
    primaryColor: parseHexColor(map["primaryColor"]),
    primaryColorBrightness:
    parseKeyboardAppearance(map["primaryColorBrightness"]),
    primaryColorDark: parseHexColor(map["primaryColorDark"]),
    primaryColorLight: parseHexColor(map["primaryColorLight"]),
    primaryIconTheme: parseIconTheme(map['primaryIconTheme']),
    primaryTextTheme: parseTextTheme(map['primaryTextTheme']),
    scaffoldBackgroundColor: parseHexColor(map["scaffoldBackgroundColor"]),
    secondaryHeaderColor: parseHexColor(map["secondaryHeaderColor"]),
    selectedRowColor: parseHexColor(map["selectedRowColor"]),
    sliderTheme: parseSliderTheme(buildContext, map['sliderTheme']),
    snackBarTheme: parseSnackBarTheme(map['snackBarTheme']),
    splashColor: parseHexColor(map["splashColor"]),
//      splashFactory: ,
    tabBarTheme: parseTabBarTheme(map['tabBarTheme']),
    textSelectionColor: parseHexColor(map["textSelectionColor"]),
    textSelectionHandleColor: parseHexColor(map["textSelectionHandleColor"]),
    textTheme: parseTextTheme(map['textTheme']),
    toggleableActiveColor: parseHexColor(map["toggleableActiveColor"]),
    toggleButtonsTheme:
    parseToggleButtonsTheme(buildContext, map['toggleButtonsTheme']),
    tooltipTheme: parseTooltipTheme(buildContext, map['tooltipTheme']),
    typography: parseTypography(map['']),
    unselectedWidgetColor: parseHexColor(map["unselectedWidgetColor"]),
  );
}

ThemeMode parseThemeMode(String themeMode) {
  if (themeMode == null || themeMode.trim() == '') {
    return null;
  }

  switch (themeMode) {
    case 'dark':
      return ThemeMode.dark;
    case 'light':
      return ThemeMode.light;
    case 'system':
      return ThemeMode.system;
    default:
      return null;
  }
}

/// Number to consider infinity value.
const double infinity = 9999999999;

/// Parse [BoxConstraints] from [Map]<[String], [dynamic]>.
BoxConstraints parseBoxConstraints(Map<String, dynamic> map) {
  var minWidth = 0.0;
  var maxWidth = double.infinity;
  var minHeight = 0.0;
  var maxHeight = double.infinity;

  if (map != null) {
    if (map.containsKey('minWidth')) {
      var minWidthValue = map['minWidth'];

      if (minWidthValue != null) {
        if (minWidthValue >= infinity) {
          minWidth = double.infinity;
        } else {
          minWidth = minWidthValue;
        }
      }
    }

    if (map.containsKey('maxWidth')) {
      var maxWidthValue = map['maxWidth'];

      if (maxWidthValue != null) {
        if (maxWidthValue >= infinity) {
          maxWidth = double.infinity;
        } else {
          maxWidth = maxWidthValue;
        }
      }
    }

    if (map.containsKey('minHeight')) {
      var minHeightValue = map['minHeight'];

      if (minHeightValue != null) {
        if (minHeightValue >= infinity) {
          minHeight = double.infinity;
        } else {
          minHeight = minHeightValue;
        }
      }
    }

    if (map.containsKey('maxHeight')) {
      var maxHeightValue = map['maxHeight'];

      if (maxHeightValue != null) {
        if (maxHeightValue >= infinity) {
          maxHeight = double.infinity;
        } else {
          maxHeight = maxHeightValue;
        }
      }
    }
  }

  return BoxConstraints(
    minWidth: minWidth,
    maxWidth: maxWidth,
    minHeight: minHeight,
    maxHeight: maxHeight,
  );
}

/// Parse [EdgeInsetsGeometry] from [String].
EdgeInsetsGeometry parseEdgeInsetsGeometry(dynamic value,
    [dynamic defaultValue]) {
  //left,top,right,bottom
  if (value == null || value is EdgeInsetsGeometry) {
    return value ?? defaultValue;
  }

  if (value is String) {
    if (value.trim() == '' || !value.contains(",")) {
      return defaultValue;
    }

    var values = value.split(",");

    if (values.isEmpty || values.length != 4) {
      return defaultValue;
    }

    return EdgeInsets.only(
      left: parseDouble(values[0], 0.0),
      top: parseDouble(values[1], 0.0),
      right: parseDouble(values[2], 0.0),
      bottom: parseDouble(values[3], 0.0),
    );
  }

  return defaultValue;
}

/// Parse [CrossAxisAlignment] from [String].
CrossAxisAlignment parseCrossAxisAlignment(dynamic value,
    [dynamic defaultValue]) {
  if (value == null || value is CrossAxisAlignment) {
    return value ?? defaultValue;
  }

  if (value is String) {
    switch (value) {
      case 'start':
        return CrossAxisAlignment.start;
      case 'end':
        return CrossAxisAlignment.end;
      case 'center':
        return CrossAxisAlignment.center;
      case 'stretch':
        return CrossAxisAlignment.stretch;
      case 'baseline':
        return CrossAxisAlignment.baseline;
      default:
        return defaultValue;
    }
  }

  return defaultValue;
}

/// Parse [MainAxisAlignment] from [String].
MainAxisAlignment parseMainAxisAlignment(dynamic value,
    [dynamic defaultValue]) {
  if (value == null || value is MainAxisAlignment) {
    return value ?? defaultValue;
  }

  if (value is String) {
    switch (value) {
      case 'start':
        return MainAxisAlignment.start;
      case 'end':
        return MainAxisAlignment.end;
      case 'center':
        return MainAxisAlignment.center;
      case 'spaceBetween':
        return MainAxisAlignment.spaceBetween;
      case 'spaceAround':
        return MainAxisAlignment.spaceAround;
      case 'spaceEvenly':
        return MainAxisAlignment.spaceEvenly;
      default:
        return defaultValue;
    }
  }

  return defaultValue;
}

/// Parse [MainAxisSize] from [String].
MainAxisSize parseMainAxisSize(dynamic value, [dynamic defaultValue]) {
  if (value == null || value is MainAxisSize) {
    return value ?? defaultValue;
  }

  if (value is String) {
    switch (value) {
      case 'min':
        return MainAxisSize.min;
      case 'max':
        return MainAxisSize.max;
      default:
        return defaultValue;
    }
  }

  return defaultValue;
}

/// Parse [TextBaseline] from [String].
TextBaseline parseTextBaseline(dynamic value, [dynamic defaultValue]) {
  if (value == null || value is TextBaseline) {
    return value ?? defaultValue;
  }

  if (value is String) {
    switch (value) {
      case 'alphabetic':
        return TextBaseline.alphabetic;
      case 'ideographic':
        return TextBaseline.ideographic;
      default:
        return defaultValue;
    }
  }

  return defaultValue;
}

/// Parse [VerticalDirection] from [String].
VerticalDirection parseVerticalDirection(String verticalDirectionString) =>
    'up' == verticalDirectionString
        ? VerticalDirection.up
        : VerticalDirection.down;

/// Parse [BlendMode] from [String].
BlendMode parseBlendMode(String blendModeString) {
  if (blendModeString == null || blendModeString.trim().length == 0) {
    return null;
  }

  switch (blendModeString.trim()) {
    case 'clear':
      return BlendMode.clear;
    case 'src':
      return BlendMode.src;
    case 'dst':
      return BlendMode.dst;
    case 'srcOver':
      return BlendMode.srcOver;
    case 'dstOver':
      return BlendMode.dstOver;
    case 'srcIn':
      return BlendMode.srcIn;
    case 'dstIn':
      return BlendMode.dstIn;
    case 'srcOut':
      return BlendMode.srcOut;
    case 'dstOut':
      return BlendMode.dstOut;
    case 'srcATop':
      return BlendMode.srcATop;
    case 'dstATop':
      return BlendMode.dstATop;
    case 'xor':
      return BlendMode.xor;
    case 'plus':
      return BlendMode.plus;
    case 'modulate':
      return BlendMode.modulate;
    case 'screen':
      return BlendMode.screen;
    case 'overlay':
      return BlendMode.overlay;
    case 'darken':
      return BlendMode.darken;
    case 'lighten':
      return BlendMode.lighten;
    case 'colorDodge':
      return BlendMode.colorDodge;
    case 'colorBurn':
      return BlendMode.colorBurn;
    case 'hardLight':
      return BlendMode.hardLight;
    case 'softLight':
      return BlendMode.softLight;
    case 'difference':
      return BlendMode.difference;
    case 'exclusion':
      return BlendMode.exclusion;
    case 'multiply':
      return BlendMode.multiply;
    case 'hue':
      return BlendMode.hue;
    case 'saturation':
      return BlendMode.saturation;
    case 'color':
      return BlendMode.color;
    case 'luminosity':
      return BlendMode.luminosity;

    default:
      return BlendMode.srcIn;
  }
}

/// Parse [BoxFit] from [String].
BoxFit parseBoxFit(dynamic boxFitString) {
  if (boxFitString == null || boxFitString is BoxFit) {
    return boxFitString;
  }

  if (boxFitString is String) {
    switch (boxFitString) {
      case 'fill':
        return BoxFit.fill;
      case 'contain':
        return BoxFit.contain;
      case 'cover':
        return BoxFit.cover;
      case 'fitWidth':
        return BoxFit.fitWidth;
      case 'fitHeight':
        return BoxFit.fitHeight;
      case 'none':
        return BoxFit.none;
      case 'scaleDown':
        return BoxFit.scaleDown;
      default:
        return null;
    }
  }

  return null;
}

/// Parse [ImageRepeat] from [String].
ImageRepeat parseImageRepeat(dynamic imageRepeatString,
    [ImageRepeat defaultValue = ImageRepeat.noRepeat]) {
  if (imageRepeatString == null || imageRepeatString is ImageRepeat) {
    return imageRepeatString ?? defaultValue;
  }

  if (imageRepeatString is String) {
    switch (imageRepeatString) {
      case 'repeat':
        return ImageRepeat.repeat;
      case 'repeatX':
        return ImageRepeat.repeatX;
      case 'repeatY':
        return ImageRepeat.repeatY;
      case 'noRepeat':
        return ImageRepeat.noRepeat;

      default:
        return defaultValue;
    }
  }

  return defaultValue;
}

/// Parse [Rect] from [String].
Rect parseRect(dynamic value, [dynamic defaultValue]) {
  if (value == null || value is Rect) {
    return value ?? defaultValue;
  }

  if (value is String) {
    var strings = value.split(',');

    return Rect.fromLTRB(
      double.parse(strings[0]),
      double.parse(strings[1]),
      double.parse(strings[2]),
      double.parse(strings[3]),
    );
  }

  return defaultValue;
}

/// Parse [FilterQuality] from [String].
FilterQuality parseFilterQuality(String filterQualityString) {
  if (filterQualityString == null) {
    return null;
  }
  switch (filterQualityString) {
    case 'none':
      return FilterQuality.none;
    case 'low':
      return FilterQuality.low;
    case 'medium':
      return FilterQuality.medium;
    case 'high':
      return FilterQuality.high;
    default:
      return FilterQuality.low;
  }
}

/// Mount url paginated string from url string, current page and page size.
String getLoadMoreUrl(String url, int currentNo, int pageSize) {
  if (url == null) {
    return null;
  }

  url = url.trim();

  if (url.contains("?")) {
    return "$url&startNo=${currentNo.toString()}&pageSize="
        "${pageSize.toString()}";
  }

  return "$url?startNo=${currentNo.toString()}&pageSize=${pageSize.toString()}";
}

/// Parse [StackFit] from [String].
StackFit parseStackFit(String value) {
  if (value == null) return null;

  switch (value) {
    case 'loose':
      return StackFit.loose;
    case 'expand':
      return StackFit.expand;
    case 'passthrough':
      return StackFit.passthrough;
    default:
      return StackFit.loose;
  }
}

/// Parse [Overflow] from [String].
Overflow parseOverflow(String value) {
  if (value == null) {
    return null;
  }

  switch (value) {
    case 'visible':
      return Overflow.visible;
    case 'clip':
      return Overflow.clip;
    default:
      return Overflow.clip;
  }
}

/// Parse [Axis] from [String].
Axis parseAxis(dynamic value, [dynamic defaultValue]) {
  if (value == null || value is Axis) {
    return value ?? defaultValue;
  }

  if (value is String) {
    switch (value) {
      case "horizontal":
        return Axis.horizontal;
      case "vertical":
        return Axis.vertical;
      default:
        return defaultValue;
    }
  }

  return defaultValue;
}

/// Parse [WrapAlignment] from [String].
WrapAlignment parseWrapAlignment(String wrapAlignmentString) {
  if (wrapAlignmentString == null) {
    return WrapAlignment.start;
  }

  switch (wrapAlignmentString) {
    case "start":
      return WrapAlignment.start;
    case "end":
      return WrapAlignment.end;
    case "center":
      return WrapAlignment.center;
    case "spaceBetween":
      return WrapAlignment.spaceBetween;
    case "spaceAround":
      return WrapAlignment.spaceAround;
    case "spaceEvenly":
      return WrapAlignment.spaceEvenly;
  }
  return WrapAlignment.start;
}

/// Parse [WrapCrossAlignment] from [String].
WrapCrossAlignment parseWrapCrossAlignment(String wrapCrossAlignmentString) {
  if (wrapCrossAlignmentString == null) {
    return WrapCrossAlignment.start;
  }

  switch (wrapCrossAlignmentString) {
    case "start":
      return WrapCrossAlignment.start;
    case "end":
      return WrapCrossAlignment.end;
    case "center":
      return WrapCrossAlignment.center;
  }

  return WrapCrossAlignment.start;
}

/// Parse [Clip] from [String].
Clip parseClip(dynamic value, [dynamic defaultValue]) {
  if (value == null || value is Clip) {
    return value ?? defaultValue;
  }

  if (value is String) {
    switch (value) {
      case "antiAlias":
        return Clip.antiAlias;
      case "none":
        return Clip.none;
      case "hardEdge":
        return Clip.hardEdge;
      case "antiAliasWithSaveLayer":
        return Clip.antiAliasWithSaveLayer;
      default:
        return defaultValue;
    }
  }

  return defaultValue;
}

/// Parse [TextInputType] from [String].
TextInputType parseKeyboardType(String keyboardTypeName) {
  switch (keyboardTypeName) {
    case 'datetime':
      return TextInputType.datetime;
    case 'emailAddress':
      return TextInputType.emailAddress;
    case 'multiline':
      return TextInputType.multiline;
    case 'number':
      return TextInputType.number;
    case 'phone':
      return TextInputType.phone;
    case 'text':
      return TextInputType.text;
    case 'url':
      return TextInputType.url;
  }

  return null;
}

/// Parse [Brightness] from [String].
Brightness parseKeyboardAppearance(String keyboardAppearance) {
  switch (keyboardAppearance) {
    case 'dark':
      return Brightness.dark;
    case 'light':
      return Brightness.light;
  }

  return null;
}

/// Parse [TextCapitalization] from [String].
TextCapitalization parseTextCapitalization(String textCapitalization) {
  switch (textCapitalization) {
    case 'characters':
      return TextCapitalization.characters;
    case 'none':
      return TextCapitalization.none;
    case 'sentences':
      return TextCapitalization.sentences;
    case 'words':
      return TextCapitalization.words;
  }

  return null;
}

/// Parse [TextInputAction] from [String].
TextInputAction parseTextInputAction(String textInputAction) {
  switch (textInputAction) {
    case 'none':
      return TextInputAction.none;
    case 'continueAction':
      return TextInputAction.continueAction;
    case 'done':
      return TextInputAction.done;
    case 'emergencyCall':
      return TextInputAction.emergencyCall;
    case 'go':
      return TextInputAction.go;
    case 'join':
      return TextInputAction.join;
    case 'newline':
      return TextInputAction.newline;
    case 'next':
      return TextInputAction.next;
    case 'previous':
      return TextInputAction.previous;
    case 'route':
      return TextInputAction.route;
    case 'search':
      return TextInputAction.search;
    case 'send':
      return TextInputAction.send;
    case 'unspecified':
      return TextInputAction.unspecified;
  }

  return null;
}

/// Parse [MapType] from [String].
MapType parseMapType(String mapType) {
  switch (mapType) {
    case 'none':
      return MapType.none;
    case 'hybrid':
      return MapType.hybrid;
    case 'normal':
      return MapType.normal;
    case 'satellite':
      return MapType.satellite;
    case 'terrain':
      return MapType.terrain;
  }

  return null;
}

/// Parse [double] from [String] or [double].
double parseDouble(dynamic value, [dynamic defaultValue]) {
  if (value == null || value is double) {
    return value ?? defaultValue;
  }

  if (value is String) {
    switch (value) {
      case 'nan':
        return double.nan;
      case 'hybrid':
        return double.infinity;
      case 'normal':
        return double.maxFinite;
      case 'satellite':
        return double.minPositive;
      case 'terrain':
        return double.negativeInfinity;
      default:
        return double.tryParse(value) ?? defaultValue;
    }
  }

  return defaultValue;
}

JsonSchema parseJsonSchema(BuildContext buildContext, dynamic value) {
  if (value is JsonSchema) {
    return value;
  }

  if (value is Map<String, dynamic>) {
    return JsonSchema.createSchema(value);
  }

  if (value is String) {
    return SchemaWidget.build(buildContext, value);
  }

  throw Exception("Invalid value on jsonSchema property: $value");
}

//Map<String, WidgetTemplate> parseTemplateMap(
//    BuildContext buildContext, Map<String, dynamic> map) {
//  if (map == null) {
//    return null;
//  }
//
//  var result = <String, WidgetTemplate>{};
//
//  map.forEach((key, value) {
//    var widget = SchemaWidget.build(buildContext, value);
//
//    if (widget != null && widget is WidgetTemplate) {
//      result[key] = widget;
//    }
//  });
//
//  return result;
//}
//
//Map<SchemaType, WidgetTemplate> parseTypeTemplateMap(
//    BuildContext buildContext, dynamic map) {
//  var templateMap = parseTemplateMap(buildContext, map);
//
//  if (templateMap == null) {
//    return null;
//  }
//
//  var result = <SchemaType, WidgetTemplate>{};
//
//  templateMap.forEach((key, value) {
//    result[SchemaType.fromString(key)] = value;
//  });
//
//  return result;
//}

FocusNode parseFocusNode(BuildContext buildContext, Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return FocusNode(
    canRequestFocus: map['canRequestFocus'] ?? true,
    debugLabel: map['debugLabel'],
    onKey: SchemaWidget.build(buildContext, map['onKey']),
    skipTraversal: map['skipTraversal'] ?? false,
  );
}

PickerType parsePickerType(String pickerType) {
  if (pickerType == null) {
    return null;
  }

  switch (pickerType) {
    case 'TimePicker':
      return PickerType.TimePicker;
    case 'DatePicker':
      return PickerType.DatePicker;
    case 'DateTimePicker':
      return PickerType.DateTimePicker;
    default:
      return null;
  }
}

InputDecoration parseInputDecoration(BuildContext buildContext, dynamic map) {
  if (map == null || map is InputDecoration) {
    return map;
  }

  if (map is String) {
    return SchemaWidget.build(buildContext, map);
  }

  if (map is Map<String, dynamic>) {
    return InputDecoration(
      labelStyle: parseTextStyle(map['labelStyle']),
      suffixStyle: parseTextStyle(map['suffixStyle']),
      prefixStyle: parseTextStyle(map['prefixStyle']),
      hintStyle: parseTextStyle(map['hintStyle']),
      helperStyle: parseTextStyle(map['helperStyle']),
      helperMaxLines: map['helperMaxLines'],
      hasFloatingPlaceholder: map['hasFloatingPlaceholder'] ?? true,
      focusedErrorBorder:
      SchemaWidget.build(buildContext, map['focusedErrorBorder']),
      focusedBorder: SchemaWidget.build(buildContext, map['focusedBorder']),
      filled: map['filled'],
      fillColor: parseHexColor(map['fillColor']),
      errorMaxLines: map['errorMaxLines'],
      errorBorder: SchemaWidget.build(buildContext, map['errorBorder']),
      enabledBorder: SchemaWidget.build(buildContext, map['enabledBorder']),
      disabledBorder: SchemaWidget.build(buildContext, map['disabledBorder']),
      counterStyle: parseTextStyle(map['counterStyle']),
      border: SchemaWidget.build(buildContext, map['border']),
      alignLabelWithHint: map['alignLabelWithHint'],
      errorStyle: parseTextStyle(map['errorStyle']),
      isDense: map['isDense'],
      contentPadding: parseEdgeInsetsGeometry(map['contentPadding']),
      focusColor: parseHexColor(map['focusColor']),
      hoverColor: parseHexColor(map['hoverColor']),
      suffixIcon: SchemaWidget.build(buildContext, map['suffixIcon']),
      enabled: map['enabled'] ?? true,
      errorText: map['errorText'],
      hintText: map['hintText'],
      labelText: map['labelText'],
      helperText: map['helperText'],
      semanticCounterText: map['semanticCounterText'],
      prefixText: map['prefixText'],
      counterText: map['counterText'],
      counter: SchemaWidget.build(buildContext, map['counter']),
      hintMaxLines: map['hintMaxLines'],
      icon: SchemaWidget.build(buildContext, map['icon']),
      prefix: SchemaWidget.build(buildContext, map['prefix']),
      prefixIcon: SchemaWidget.build(buildContext, map['prefixIcon']),
      suffix: SchemaWidget.build(buildContext, map['suffix']),
      suffixText: map['suffixText'],
    );
  }

  return null;
}

FontStyle parseFontStyle(String fontStyle) {
  if (fontStyle == null) {
    return null;
  }

  switch (fontStyle) {
    case 'italic':
      return FontStyle.italic;
    case 'normal':
      return FontStyle.normal;
    default:
      return null;
  }
}

StrutStyle parseStrutStyle(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return StrutStyle(
    debugLabel: map['debugLabel'],
    height: parseDouble(map['height']),
    package: map['package'],
    fontFamilyFallback: map['fontFamilyFallback'],
    fontFamily: map['fontFamily'],
    fontSize: parseDouble(map['fontSize']),
    fontStyle: parseFontStyle(map['fontStyle']),
    fontWeight: parseFontWeight(map['fontWeight']),
    forceStrutHeight: map['forceStrutHeight'],
    leading: parseDouble(map['leading']),
  );
}

ToolbarOptions parseToolbarOptions(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return ToolbarOptions(
    copy: map['copy'] ?? false,
    cut: map['cut'] ?? false,
    paste: map['paste'] ?? false,
    selectAll: map['selectAll'] ?? false,
  );
}

TextAlignVertical parseTextAlignVertical(String y) {
  if (y == null) {
    return null;
  }

  return TextAlignVertical(y: parseDouble(y));
}

Radius parseRadius(dynamic map, [Radius defaultValue]) {
  if (map == null || map is Radius) {
    return map ?? defaultValue;
  }

  if (map is Map<String, dynamic>) {
    switch (map["type"]) {
      case 'zero':
        return Radius.zero;
      case 'circular':
        return Radius.circular(parseDouble(map['radius']));
      case 'elliptical':
        return Radius.elliptical(parseDouble(map['x']), parseDouble(map['y']));
      case 'lerp':
        return Radius.lerp(
          parseRadius(map['a']),
          parseRadius(map['b']),
          parseDouble(map['t']),
        );
      default:
        return defaultValue;
    }
  }

  return defaultValue;
}

ImageProvider<dynamic> parseImageProvider(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  switch (map['type']) {
    case 'NetworkImage':
      return NetworkImage(map['url']);
    default:
      return null;
  }
}

dynamic parseDecoration(BuildContext buildContext, dynamic map) {
  if (map == null || map is Decoration) {
    return map;
  }

  if (map is String) {
    return SchemaWidget.build(buildContext, map);
  }

  if (map is Map<String, dynamic>) {
    switch (map['type']) {
      case 'BoxDecoration':
        return parseBoxDecoration(buildContext, map);
      case 'InputDecoration':
        return parseInputDecoration(buildContext, map);
    }
  }

  return null;
}

BoxDecoration parseBoxDecoration(BuildContext buildContext, dynamic map) {
  if (map == null || map is Decoration) {
    return map;
  }

  if (map is String) {
    return SchemaWidget.build(buildContext, map);
  }

  if (map is Map<String, dynamic>) {
    return BoxDecoration(
      shape: parseBoxShape(map['shape']) ?? BoxShape.rectangle,
      border: parseBoxBorder(map['border']),
      color: parseHexColor(map['color']),
      backgroundBlendMode: parseBlendMode(map['backgroundBlendMode']),
      borderRadius: parseBorderRadius(buildContext, map['borderRadius']),
      boxShadow: parseListBoxShadow(buildContext, map['boxShadow']),
      gradient: SchemaWidget.build(buildContext, map['gradient']),
      image: parseDecorationImage(buildContext, map['image']),
    );
  }

  return null;
}

DecorationImage parseDecorationImage(BuildContext buildContext, dynamic value) {
  if (value == null || value is DecorationImage) {
    return value;
  }

  if (value is String) {
    return SchemaWidget.build(buildContext, value);
  }

  if (value is Map<String, dynamic>) {
    return DecorationImage(
      image: parseImageProvider(value['image']),
      alignment: parseAlignment(value['alignment'], Alignment.center),
      centerSlice: parseRect(value['centerSlice']),
      colorFilter: parseColorFilter(buildContext, value['colorFilter']),
      fit: parseBoxFit(value['fit']),
      matchTextDirection: value['matchTextDirection'] ?? false,
      repeat: parseImageRepeat(value['repeat']),
    );
  }

  return null;
}

ColorFilter parseColorFilter(BuildContext buildContext, dynamic value) {
  if (value == null || value is ColorFilter) {
    return value;
  }

  if (value is String) {
    return SchemaWidget.build(buildContext, value);
  }

  if (value is Map<String, dynamic>) {
    switch (value['type']) {
      case 'linearToSrgbGamma':
        return ColorFilter.linearToSrgbGamma();
      case 'srgbToLinearGamma':
        return ColorFilter.srgbToLinearGamma();
      case 'mode':
        return ColorFilter.mode(
          value['color'],
          value['blendMode'],
        );
      case 'matrix':
        return ColorFilter.matrix(
            parseListDouble(buildContext, value['matrix']));
      default:
        return null;
    }
  }

  return null;
}

List<double> parseListDouble(BuildContext buildContext, dynamic value) {
  if (value == null || value is List<double>) {
    return value;
  }

  if (value is String) {
    return SchemaWidget.build(buildContext, value);
  }

  if (value is List) {
    var result = <double>[];

    for (var item in value) {
      var itemParsed = parseDouble(item);

      if (itemParsed != null) {
        result.add(itemParsed);
      }
    }

    return result;
  }

  return null;
}

List<BoxShadow> parseListBoxShadow(BuildContext buildContext, dynamic value) {
  if (value == null || value is List<BoxShadow>) {
    return value;
  }

  if (value is String) {
    return SchemaWidget.build(buildContext, value);
  }

  if (value is List) {
    var result = <BoxShadow>[];

    for (var item in value) {
      BoxShadow parsedItem = parseBoxShadow(buildContext, item);

      if (parsedItem != null) {
        result.add(parsedItem);
      }
    }

    return result;
  }

  return null;
}

BoxShadow parseBoxShadow(BuildContext buildContext, value) {
  if (value == null || value is List<BoxShadow>) {
    return value;
  }

  if (value is String) {
    return SchemaWidget.build(buildContext, value);
  }

  if (value is Map<String, dynamic>) {
    return BoxShadow(
      color: parseHexColor(value['color']) ?? const Color(0xFF000000),
      blurRadius: parseDouble(value['blurRadius'], 0.0),
      offset: parseOffset(buildContext, value['offset']),
      spreadRadius: parseDouble(value['spreadRadius'], 0.0),
    );
  }

  return null;
}

Offset parseOffset(BuildContext buildContext, dynamic value) {
  if (value == null || value is Offset) {
    return value;
  }

  if (value is String) {
    return SchemaWidget.build(buildContext, value);
  }

  if (value is Map<String, dynamic>) {
    switch (value['type']) {
      case 'zero':
        return Offset.zero;
      case 'infinite':
        return Offset.infinite;
      case 'fromDirection':
        return Offset.fromDirection(parseDouble(value['direction']),
            parseDouble(value['distance'], 1.0));
      case 'default':
      default:
        return Offset(
          parseDouble(value['dx']),
          parseDouble(value['dy']),
        );
    }
  }

  return null;
}

BoxBorder parseBoxBorder(dynamic value) {
  if (value == null || value is BoxBorder) {
    return value;
  }

  if (value is Map<String, dynamic>) {
    switch (value['type']) {
      case 'all':
        return Border.all(
          color: parseHexColor(value['color']) ?? const Color(0xFF000000),
          style: parseBorderStyle(value['style']) ?? BorderStyle.solid,
          width: parseDouble(value['width'], 1.0),
        );
    }
  }

  return null;
}

BorderStyle parseBorderStyle(dynamic value) {
  if (value == null || value is BorderStyle) {
    return value;
  }

  if (value is String) {
    switch (value) {
      case 'solid':
        return BorderStyle.solid;
      case 'none':
        return BorderStyle.none;
      default:
        return null;
    }
  }

  return null;
}

BoxShape parseBoxShape(dynamic value) {
  if (value == null || value is BoxShape) {
    return value;
  }

  if (value is String) {
    switch (value) {
      case 'circle':
        return BoxShape.circle;
      case 'rectangle':
        return BoxShape.rectangle;
      default:
        return null;
    }
  }

  return null;
}

Curve parseCurve(dynamic map, [dynamic defaultValue]) {
  if (map == null || map is Curve) {
    return map ?? defaultValue;
  }

  if (map is String) {
    switch (map) {
      case 'bounceIn':
        return Curves.bounceIn;
      case 'bounceInOut':
        return Curves.bounceInOut;
      case 'bounceOut':
        return Curves.bounceOut;
      case 'decelerate':
        return Curves.decelerate;
      case 'ease':
        return Curves.ease;
      case 'easeIn':
        return Curves.easeIn;
      case 'easeInBack':
        return Curves.easeInBack;
      case 'easeInCirc':
        return Curves.easeInCirc;
      case 'easeInCubic':
        return Curves.easeInCubic;
      case 'easeInExpo':
        return Curves.easeInExpo;
      case 'easeInOut':
        return Curves.easeInOut;
      case 'easeInOutBack':
        return Curves.easeInOutBack;
      case 'easeInOutCirc':
        return Curves.easeInOutCirc;
      case 'easeInOutCubic':
        return Curves.easeInOutCubic;
      case 'easeInOutExpo':
        return Curves.easeInOutExpo;
      case 'easeInOutQuad':
        return Curves.easeInOutQuad;
      case 'easeInOutQuart':
        return Curves.easeInOutQuart;
      case 'easeInOutQuint':
        return Curves.easeInOutQuint;
      case 'easeInOutSine':
        return Curves.easeInOutSine;
      case 'easeInQuad':
        return Curves.easeInQuad;
      case 'easeInQuart':
        return Curves.easeInQuart;
      case 'easeInQuint':
        return Curves.easeInQuint;
      case 'easeInSine':
        return Curves.easeInSine;
      case 'easeInToLinear':
        return Curves.easeInToLinear;
      case 'easeOut':
        return Curves.easeOut;
      case 'easeOutBack':
        return Curves.easeOutBack;
      case 'easeOutCirc':
        return Curves.easeOutCirc;
      case 'easeOutCubic':
        return Curves.easeOutCubic;
      case 'easeOutExpo':
        return Curves.easeOutExpo;
      case 'easeOutQuad':
        return Curves.easeOutQuad;
      case 'easeOutQuart':
        return Curves.easeOutQuart;
      case 'easeOutQuint':
        return Curves.easeOutQuint;
      case 'easeOutSine':
        return Curves.easeOutSine;
      case 'elasticIn':
        return Curves.elasticIn;
      case 'elasticInOut':
        return Curves.elasticInOut;
      case 'elasticOut':
        return Curves.elasticOut;
      case 'fastLinearToSlowEaseIn':
        return Curves.fastLinearToSlowEaseIn;
      case 'fastOutSlowIn':
        return Curves.fastOutSlowIn;
      case 'linear':
        return Curves.linear;
      case 'linearToEaseOut':
        return Curves.linearToEaseOut;
      case 'slowMiddle':
        return Curves.slowMiddle;
      default:
        return defaultValue;
    }
  }

  return defaultValue;
}

DragStartBehavior parseDragStartBehavior(dynamic value,
    [dynamic defaultValue]) {
  if (value == null || value is DragStartBehavior) {
    return value ?? defaultValue;
  }

  if (value is String) {
    switch (value) {
      case 'down':
        return DragStartBehavior.down;
      case 'start':
        return DragStartBehavior.start;
      default:
        return defaultValue;
    }
  }

  return defaultValue;
}

FloatingActionButtonLocation parseFloatingActionButtonLocation(
    BuildContext buildContext, dynamic value,
    [dynamic defaultValue]) {
  if (value == null || value is FloatingActionButtonLocation) {
    return value ?? defaultValue;
  }

  if (value is String) {
    return SchemaWidget.build(buildContext, value);
  }

  if (value is Map<String, dynamic>) {
    switch (value['type']) {
      case 'centerDocked':
        return FloatingActionButtonLocation.centerDocked;
      case 'centerFloat':
        return FloatingActionButtonLocation.centerFloat;
      case 'endDocked':
        return FloatingActionButtonLocation.endDocked;
      case 'endFloat':
        return FloatingActionButtonLocation.endFloat;
      case 'endTop':
        return FloatingActionButtonLocation.endTop;
      case 'miniStartTop':
        return FloatingActionButtonLocation.miniStartTop;
      case 'startTop':
        return FloatingActionButtonLocation.startTop;
      default:
        return defaultValue;
    }
  }

  return defaultValue;
}

FloatingActionButtonAnimator parseFloatingActionButtonAnimator(
    BuildContext buildContext, dynamic value,
    [dynamic defaultValue]) {
  if (value == null || value is FloatingActionButtonAnimator) {
    return value ?? defaultValue;
  }

  if (value is String) {
    return SchemaWidget.build(buildContext, value);
  }

  if (value is Map<String, dynamic>) {
    switch (value['type']) {
      case 'scaling':
        return FloatingActionButtonAnimator.scaling;
      default:
        return defaultValue;
    }
  }

  return defaultValue;
}

NavigationType parseNavigationType(dynamic value, [dynamic defaultValue]) {
  if (value == null || value is NavigationType) {
    return value ?? defaultValue;
  }

  if (value is String) {
    switch (value) {
      case 'pop':
        return NavigationType.pop;
      case 'popAndPush':
        return NavigationType.popAndPush;
      case 'push':
        return NavigationType.push;
      default:
        return defaultValue;
    }
  }

  return defaultValue;
}
