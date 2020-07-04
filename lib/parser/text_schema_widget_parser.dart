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
import 'package:json_schema/src/json_schema/json_schema.dart';

import '../schema_widget.dart';

/// Schema parser from [Map<String, dynamic>] to [Text]
///
/// Created by Windol <windol@legytma.com.br> at 14/05/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("Text", "https://schema.legytma.com.br/1.1.2/schema/widget/text.schema.json", <String>[
  "default",
  "rich",
])
class TextSchemaWidgetParser extends VariantSchemaWidgetParser<Text> {
  /// Create instance of parser using [JsonSchema] to validate values.
  TextSchemaWidgetParser(JsonSchema jsonSchema,
      [Map<String, VariantSchemaWidgetParser<Text>> typeSchemaParsers])
      : super(jsonSchema, typeSchemaParsers);

  @override
  String extractType(Map<String, dynamic> value) =>
      value.containsKey("textSpan") ? "rich" : "default";

  // FIXME: REMOVE-ME
  /*
  @override
  VariantSchemaWidgetParser<Text> newVariantInstance(String schemaUri) =>
      TextSchemaWidgetParser(schemaUri, null);
  */

  @override
   Text builderVariant(BuildContext buildContext, Map<String, dynamic> value,
      Widget defaultValue) {
    var key = SchemaWidget.parse<Key>(buildContext, value['key']);
    var style = SchemaWidget.parse<TextStyle>(buildContext, value['style']);
    var maxLines = SchemaWidget.parse<int>(buildContext, value['maxLines']);
    var textDirection =
        SchemaWidget.parse<TextDirection>(buildContext, value['textDirection']);
    var strutStyle =
        SchemaWidget.parse<StrutStyle>(buildContext, value['strutStyle']);
    var textAlign =
        SchemaWidget.parse<TextAlign>(buildContext, value['textAlign']);
    var locale = SchemaWidget.parse<Locale>(buildContext, value['locale']);
    var overflow =
        SchemaWidget.parse<TextOverflow>(buildContext, value['overflow']);
    var semanticsLabel = value['semanticsLabel'];
    var softWrap = SchemaWidget.parse<bool>(buildContext, value['softWrap']);
    var textScaleFactor =
        SchemaWidget.parse<double>(buildContext, value['textScaleFactor']);
    var textWidthBasis = SchemaWidget.parse<TextWidthBasis>(
        buildContext, value['textWidthBasis']);

    switch (extractType(value)) {
      case 'rich':
        return Text.rich(
          SchemaWidget.parse<InlineSpan>(buildContext, value['textSpan']),
          key: key,
          style: style,
          maxLines: maxLines,
          textDirection: textDirection,
          strutStyle: strutStyle,
          textAlign: textAlign,
          locale: locale,
          overflow: overflow,
          semanticsLabel: semanticsLabel,
          softWrap: softWrap,
          textScaleFactor: textScaleFactor,
          textWidthBasis: textWidthBasis,
        );
      case 'default':
        return Text(
          SchemaWidget.parse<String>(buildContext, value['data']),
          key: key,
          style: style,
          maxLines: maxLines,
          textDirection: textDirection,
          strutStyle: strutStyle,
          textAlign: textAlign,
          locale: locale,
          overflow: overflow,
          semanticsLabel: semanticsLabel,
          softWrap: softWrap,
          textScaleFactor: textScaleFactor,
          textWidthBasis: textWidthBasis,
        );
      default:
        return defaultValue;
    }
  }
}
