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

import '../../schema_widget.dart';

/// Schema parser from [Map<String, dynamic>] to [NetworkImage]
///
/// Created by Windol <windol@legytma.com.br> at 30/04/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("NetworkImage", "https://legytma.com.br/schema/network_image.schema.json")
class NetworkImageSchemaParser
    extends TypeSchemaParser<NetworkImage, Map<String, dynamic>, NetworkImage> {
  /// Create instance of parser using [JsonSchema] to validate values.
  NetworkImageSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   NetworkImage builder(BuildContext buildContext, Map<String, dynamic> value,
      [NetworkImage defaultValue]) {
    return NetworkImage(
      value['url'],
      headers: value['headers'],
      scale: SchemaWidget.parse<double>(buildContext, value['scale']),
    );
  }
}
