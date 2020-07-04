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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_schema/src/json_schema/json_schema.dart';

import '../schema_widget.dart';

/// Schema parser from [Map<String, dynamic>] to [Image]
///
/// Created by Windol <windol@legytma.com.br> at 09/05/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("Image", 
    "https://schema.legytma.com.br/1.1.2/schema/widget/image.schema.json", <String>[
  "asset",
  "network",
  "file",
  "memory",
  "default",
])
class ImageSchemaWidgetParser extends VariantSchemaWidgetParser<Image> {
  /// Create instance of parser using [JsonSchema] to validate values.
  ImageSchemaWidgetParser(JsonSchema jsonSchema,
      [Map<String, VariantSchemaWidgetParser<Image>> typeSchemaParsers])
      : super(jsonSchema, typeSchemaParsers);

  @override
  String extractType(Map<String, dynamic> value) => value['imageType'];

  // FIXME: REMOVE-ME
  /*
  @override
  VariantSchemaWidgetParser<Image> newVariantInstance(String schemaUri) =>
      ImageSchemaWidgetParser(schemaUri, null);
  */

  @override
   Image builderVariant(BuildContext buildContext, Map<String, dynamic> value,
      Widget defaultValue) {
    var key = SchemaWidget.parse<Key>(buildContext, value['key']);
    var frameBuilder = SchemaWidget.parse<ImageFrameBuilder>(
        buildContext, value['frameBuilder']);
    var loadingBuilder = SchemaWidget.parse<ImageLoadingBuilder>(
        buildContext, value['loadingBuilder']);
    var cacheHeight =
        SchemaWidget.parse<int>(buildContext, value['cacheHeight']);
    var cacheWidth = SchemaWidget.parse<int>(buildContext, value['cacheWidth']);
    String semanticLabel = value['semanticLabel'];
    bool excludeFromSemantics = value['excludeFromSemantics'] ?? false;
    var scale = SchemaWidget.parse<double>(buildContext, value['scale'], 1.0);
    var width = SchemaWidget.parse<double>(buildContext, value['width']);
    var height = SchemaWidget.parse<double>(buildContext, value['height']);
    var color = SchemaWidget.parse<Color>(buildContext, value['color']);
    var blendMode =
        SchemaWidget.parse<BlendMode>(buildContext, value['blendMode']);
    var boxFit = SchemaWidget.parse<BoxFit>(buildContext, value['boxFit']);
    var alignment = SchemaWidget.parse<AlignmentGeometry>(
        buildContext, value['alignment'], Alignment.center);
    var repeat = SchemaWidget.parse<ImageRepeat>(
        buildContext, value['repeat'], ImageRepeat.noRepeat);
    var centerSlice =
        SchemaWidget.parse<Rect>(buildContext, value['centerSlice']);
    bool matchTextDirection = value['matchTextDirection'] ?? false;
    var gaplessPlayback = value['gaplessPlayback'] ?? false;
    var filterQuality = SchemaWidget.parse<FilterQuality>(
        buildContext, value['filterQuality'], FilterQuality.low);

    switch (value['imageType']) {
      case 'asset':
        return Image.asset(
          value['name'],
          package: value['package'],
          bundle:
              SchemaWidget.parse<AssetBundle>(buildContext, value['bundle']),
          key: key,
          frameBuilder: frameBuilder,
          cacheHeight: cacheHeight,
          cacheWidth: cacheWidth,
          semanticLabel: semanticLabel,
          excludeFromSemantics: excludeFromSemantics,
          scale: SchemaWidget.parse<double>(buildContext, value['scale']),
          width: width,
          height: height,
          color: color,
          colorBlendMode: blendMode,
          fit: boxFit,
          alignment: alignment,
          repeat: repeat,
          centerSlice: centerSlice,
          matchTextDirection: matchTextDirection,
          gaplessPlayback: gaplessPlayback,
          filterQuality: filterQuality,
        );
      case 'network':
        return Image.network(
          value['src'],
          headers: value['headers'],
          key: key,
          frameBuilder: frameBuilder,
          cacheWidth: cacheWidth,
          cacheHeight: cacheHeight,
          loadingBuilder: loadingBuilder,
          semanticLabel: semanticLabel,
          excludeFromSemantics: excludeFromSemantics,
          scale: scale,
          width: width,
          height: height,
          color: color,
          colorBlendMode: blendMode,
          fit: boxFit,
          alignment: alignment,
          repeat: repeat,
          centerSlice: centerSlice,
          matchTextDirection: matchTextDirection,
          gaplessPlayback: gaplessPlayback,
          filterQuality: filterQuality,
        );
      case 'file':
        return Image.file(
          SchemaWidget.parse<File>(buildContext, value['file']),
          key: key,
          frameBuilder: frameBuilder,
          cacheHeight: cacheHeight,
          cacheWidth: cacheWidth,
          semanticLabel: semanticLabel,
          excludeFromSemantics: excludeFromSemantics,
          scale: scale,
          width: width,
          height: height,
          color: color,
          colorBlendMode: blendMode,
          fit: boxFit,
          alignment: alignment,
          repeat: repeat,
          centerSlice: centerSlice,
          matchTextDirection: matchTextDirection,
          gaplessPlayback: gaplessPlayback,
          filterQuality: filterQuality,
        );
      case 'memory':
        return Image.memory(
          value['bytes'],
          key: key,
          frameBuilder: frameBuilder,
          cacheWidth: cacheWidth,
          cacheHeight: cacheHeight,
          semanticLabel: semanticLabel,
          excludeFromSemantics: excludeFromSemantics,
          scale: scale,
          width: width,
          height: height,
          color: color,
          colorBlendMode: blendMode,
          fit: boxFit,
          alignment: alignment,
          repeat: repeat,
          centerSlice: centerSlice,
          matchTextDirection: matchTextDirection,
          gaplessPlayback: gaplessPlayback,
          filterQuality: filterQuality,
        );
      case 'default':
        return Image(
          image: SchemaWidget.parse<ImageProvider<dynamic>>(
              buildContext, value['image']),
          key: key,
          frameBuilder: frameBuilder,
          loadingBuilder: loadingBuilder,
          semanticLabel: semanticLabel,
          excludeFromSemantics: excludeFromSemantics,
          width: width,
          height: height,
          color: color,
          colorBlendMode: blendMode,
          fit: boxFit,
          alignment: alignment,
          repeat: repeat,
          centerSlice: centerSlice,
          matchTextDirection: matchTextDirection,
          gaplessPlayback: gaplessPlayback,
          filterQuality: filterQuality,
        );
      default:
        return defaultValue;
    }
  }
}
