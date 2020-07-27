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

import '../../model/list_view_params.dart';
import '../../schema_widget.dart';

/// Schema parser from [Map<String, dynamic>] to [ListViewParams]
///
/// Created by Windol <windol@legytma.com.br> at 12/05/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("ListViewParams",
    "https://schema.legytma.com.br/2.0.0/schema/list_view_params.schema.json")
class ListViewParamsSchemaParser extends TypeSchemaParser<ListViewParams,
    Map<String, dynamic>, ListViewParams> {
  /// Create instance of parser using [JsonSchema] to validate values.
  ListViewParamsSchemaParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  ListViewParams builder(BuildContext buildContext, Map<String, dynamic> value,
      [ListViewParams defaultValue]) {
    return ListViewParams(
      SchemaWidget.parse<Axis>(buildContext, value['scrollDirection']),
      value['reverse'],
      value["shrinkWrap"],
      SchemaWidget.parse<double>(buildContext, value["cacheExtent"]),
      SchemaWidget.parse<EdgeInsetsGeometry>(buildContext, value['padding']),
      SchemaWidget.parse<double>(buildContext, value['itemExtent']),
      SchemaWidget.parse<List<Widget>>(buildContext, value['children']),
      SchemaWidget.parse<int>(buildContext, value["pageSize"]),
      value["loadMoreUrl"],
      value["isDemo"],
    );
  }
}
