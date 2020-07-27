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

/// Schema parser from [Map<String, dynamic>] to [ImageProviderDynamic]
///
/// Created by Windol <windol@legytma.com.br> at 30/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("ImageProvider<dynamic>",
    "https://schema.legytma.com.br/2.0.0/schema/image_provider_dynamic.schema.json")
class ImageProviderDynamicSchemaParser extends TypeSchemaParser<
    ImageProvider<dynamic>, Map<String, dynamic>, ImageProvider<dynamic>> {
  /// Create instance of parser using [JsonSchema] to validate values.
  ImageProviderDynamicSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  ImageProvider<dynamic> builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [ImageProvider<dynamic> defaultValue]) {
    switch (value['type']) {
      case 'NetworkImage':
        return SchemaWidget.parse<NetworkImage>(
                buildContext, value, defaultValue) ??
            defaultValue;
      default:
        return defaultValue;
    }
  }
}
