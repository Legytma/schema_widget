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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

/// Parse [TextStyle] from [Map]<[String], [dynamic]>.
TextStyle parseTextStyle(Map<String, dynamic> map) {
  //TODO: more properties need to be implemented, such as decorationColor, decorationStyle, wordSpacing and so on.
  String color = map['color'];
  String debugLabel = map['debugLabel'];
  String decoration = map['decoration'];
  String fontFamily = map['fontFamily'];
  double fontSize = map['fontSize'];
  String fontWeight = map['fontWeight'];
  var fontStyle =
      'italic' == map['fontStyle'] ? FontStyle.italic : FontStyle.normal;

  return TextStyle(
    color: parseHexColor(color),
    debugLabel: debugLabel,
    decoration: parseTextDecoration(decoration),
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontStyle: fontStyle,
    fontWeight: parseFontWeight(fontWeight),
  );
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

///// Parse [MapType] from [String].
//MapType parseMapType(String mapType) {
//  switch (mapType) {
//    case 'none':
//      return MapType.none;
//    case 'hybrid':
//      return MapType.hybrid;
//    case 'normal':
//      return MapType.normal;
//    case 'satellite':
//      return MapType.satellite;
//    case 'terrain':
//      return MapType.terrain;
//  }
//
//  return null;
//}

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
