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

import '../../schema_widget.dart';

/// Schema parser from [Map<String, dynamic>] to [FlutterLogoDecoration]
///
/// Created by Windol <windol@legytma.com.br> at 29/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("FlutterLogoDecoration",
    "https://schema.legytma.com.br/2.0.0/schema/flutter_logo_decoration.schema.json")
class FlutterLogoDecorationSchemaParser extends TypeSchemaParser<
    FlutterLogoDecoration, Map<String, dynamic>, FlutterLogoDecoration> {
  /// Create instance of parser using [JsonSchema] to validate values.
  FlutterLogoDecorationSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  FlutterLogoDecoration builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [FlutterLogoDecoration defaultValue]) {
    return FlutterLogoDecoration(
      style: SchemaWidget.parse<FlutterLogoStyle>(
          buildContext, value['style'], FlutterLogoStyle.markOnly),
      margin: SchemaWidget.parse<EdgeInsets>(
          buildContext, value['margin'], EdgeInsets.zero),
      darkColor: SchemaWidget.parse<Color>(
          buildContext, value['darkColor'], const Color(0xFF0D47A1)),
      lightColor: SchemaWidget.parse<Color>(
          buildContext, value['lightColor'], const Color(0xFF42A5F5)),
      textColor: SchemaWidget.parse<Color>(
          buildContext, value['textColor'], const Color(0xFF616161)),
    );
  }
}
