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
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_schema/src/json_schema/json_schema.dart';

import '../../schema_widget.dart';

/// Schema parser from [Map<String, dynamic>] to [LatLng]
///
/// Created by Windol <windol@legytma.com.br> at 07/05/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("LatLng", "https://schema.legytma.com.br/1.1.2/schema/lat_lng.schema.json")
class LatLngSchemaParser
    extends TypeSchemaParser<LatLng, Map<String, dynamic>, LatLng> {
  /// Create instance of parser using [JsonSchema] to validate values.
  LatLngSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   LatLng builder(BuildContext buildContext, Map<String, dynamic> value,
      [LatLng defaultValue]) {
    return LatLng(
      SchemaWidget.parse<double>(buildContext, value['latitude']),
      SchemaWidget.parse<double>(buildContext, value['longitude']),
    );
  }
}
