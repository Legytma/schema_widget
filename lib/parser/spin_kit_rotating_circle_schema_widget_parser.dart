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

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to parse [SpinKitRotatingCircle]
@SchemaParser("SpinKitRotatingCircle", 
    "https://legytma.com.br/schema/widget/spin_kit_rotating_circle.schema.json")
class SpinKitRotatingCircleSchemaWidgetParser
    extends SchemaWidgetParser<SpinKitRotatingCircle> {
  static final Logger _log = Logger("SpinKitRotatingCircleSchemaWidgetParser");

  /// Create instance of parser
  SpinKitRotatingCircleSchemaWidgetParser(JsonSchema jsonSchema)
      : super(jsonSchema);

  @override
   SpinKitRotatingCircle builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    _log.finer('map: $value');

    return SpinKitRotatingCircle(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      controller: SchemaWidget.parse<AnimationController>(
          buildContext, value['controller']),
      duration: SchemaWidget.parse<Duration>(
          buildContext, value['duration'], const Duration(milliseconds: 1200)),
      itemBuilder: SchemaWidget.parse<IndexedWidgetBuilder>(
          buildContext, value['itemBuilder']),
      color: SchemaWidget.parse<Color>(buildContext, value["color"]),
      size: SchemaWidget.parse<double>(buildContext, value["size"], 50.0),
    );
  }
}
