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
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'schema_widget.dart';

/// Parse [TextAlign] from [String].
TextAlign parseTextAlign(String textAlignString) {
  switch (textAlignString) {
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
      return TextAlign.start;
  }
}

/// Parse [TextOverflow] from [String].
TextOverflow parseTextOverflow(String textOverflowString) {
  switch (textOverflowString) {
    case "ellipsis":
      return TextOverflow.ellipsis;
    case "clip":
      return TextOverflow.clip;
    case "fade":
      return TextOverflow.fade;
    default:
      return TextOverflow.fade;
  }
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
TextDirection parseTextDirection(String textDirectionString) {
  switch (textDirectionString) {
    case 'ltr':
      return TextDirection.ltr;
    case 'rtl':
      return TextDirection.rtl;
    default:
      return TextDirection.ltr;
  }
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

/// Parse [int] from [String].
int parseInt(String hexString) {
  hexString = hexString?.toUpperCase()?.replaceAll("#", "");

  return int.parse(hexString, radix: 16);
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
    fontSize: map['fontSize'],
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
Alignment parseAlignment(String alignmentString) {
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
      return Alignment.topLeft;
  }
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
    clipBehavior: parseClipBehavior(map['clipBehavior']),
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
    clipBehavior: parseClipBehavior(map['clipBehavior']),
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

BorderRadius parseBorderRadius(String borderRadiusString) {
  //left,top,right,bottom
  if (borderRadiusString == null || borderRadiusString.trim() == '') {
    return null;
  }

  var values = borderRadiusString.split(",");

  return BorderRadius.only(
    topLeft: Radius.circular(double.parse(values[0])),
    topRight: Radius.circular(double.parse(values[1])),
    bottomLeft: Radius.circular(double.parse(values[2])),
    bottomRight: Radius.circular(double.parse(values[3])),
  );
}

ToggleButtonsThemeData parseToggleButtonsTheme(Map<String, dynamic> map) {
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
    borderRadius: parseBorderRadius(map['borderRadius']),
    borderWidth: parseDouble(map['borderWidth']),
    constraints: parseBoxConstraints(map['constraints']),
    disabledBorderColor: parseHexColor(map['disabledBorderColor']),
    fillColor: parseHexColor(map['fillColor']),
    selectedBorderColor: parseHexColor(map['selectedBorderColor']),
    selectedColor: parseHexColor(map['selectedColor']),
  );
}

Duration parseDuration(Map<String, dynamic> map) {
  if (map == null) {
    return null;
  }

  return Duration(
    days: map['days'],
    hours: map['hours'],
    microseconds: map['microseconds'],
    milliseconds: map['milliseconds'],
    minutes: map['minutes'],
    seconds: map['seconds'],
  );
}

TooltipThemeData parseTooltipTheme(Map<String, dynamic> map) {
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
    showDuration: parseDuration(map['showDuration']),
    verticalOffset: parseDouble(map['verticalOffset']),
    waitDuration: parseDuration(map['waitDuration']),
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
    toggleButtonsTheme: parseToggleButtonsTheme(map['toggleButtonsTheme']),
    tooltipTheme: parseTooltipTheme(map['tooltipTheme']),
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
EdgeInsetsGeometry parseEdgeInsetsGeometry(String edgeInsetsGeometryString) {
  //left,top,right,bottom
  if (edgeInsetsGeometryString == null ||
      edgeInsetsGeometryString.trim() == '') {
    return null;
  }
  var values = edgeInsetsGeometryString.split(",");
  return EdgeInsets.only(
      left: double.parse(values[0]),
      top: double.parse(values[1]),
      right: double.parse(values[2]),
      bottom: double.parse(values[3]));
}

/// Parse [CrossAxisAlignment] from [String].
CrossAxisAlignment parseCrossAxisAlignment(String crossAxisAlignmentString) {
  switch (crossAxisAlignmentString) {
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
  }
  return CrossAxisAlignment.center;
}

/// Parse [MainAxisAlignment] from [String].
MainAxisAlignment parseMainAxisAlignment(String mainAxisAlignmentString) {
  switch (mainAxisAlignmentString) {
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
  }
  return MainAxisAlignment.start;
}

/// Parse [MainAxisSize] from [String].
MainAxisSize parseMainAxisSize(String mainAxisSizeString) =>
    mainAxisSizeString == 'min' ? MainAxisSize.min : MainAxisSize.max;

/// Parse [TextBaseline] from [String].
TextBaseline parseTextBaseline(String parseTextBaselineString) =>
    'alphabetic' == parseTextBaselineString
        ? TextBaseline.alphabetic
        : TextBaseline.ideographic;

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
BoxFit parseBoxFit(String boxFitString) {
  if (boxFitString == null) {
    return null;
  }

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
  }

  return null;
}

/// Parse [ImageRepeat] from [String].
ImageRepeat parseImageRepeat(String imageRepeatString) {
  if (imageRepeatString == null) {
    return null;
  }

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
      return ImageRepeat.noRepeat;
  }
}

/// Parse [Rect] from [String].
Rect parseRect(String fromLTRBString) {
  var strings = fromLTRBString.split(',');
  return Rect.fromLTRB(double.parse(strings[0]), double.parse(strings[1]),
      double.parse(strings[2]), double.parse(strings[3]));
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
Axis parseAxis(String axisString) {
  if (axisString == null) {
    return Axis.horizontal;
  }

  switch (axisString) {
    case "horizontal":
      return Axis.horizontal;
    case "vertical":
      return Axis.vertical;
  }
  return Axis.horizontal;
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
Clip parseClipBehavior(String clipBehaviorString) {
  if (clipBehaviorString == null) {
    return Clip.antiAlias;
  }
  switch (clipBehaviorString) {
    case "antiAlias":
      return Clip.antiAlias;
    case "none":
      return Clip.none;
    case "hardEdge":
      return Clip.hardEdge;
    case "antiAliasWithSaveLayer":
      return Clip.antiAliasWithSaveLayer;
  }
  return Clip.antiAlias;
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
double parseDouble(dynamic _double) {
  if (_double is double) {
    return _double;
  }

  if (_double is String) {
    switch (_double) {
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
        return double.tryParse(_double);
    }
  }

  return double.nan;
}
