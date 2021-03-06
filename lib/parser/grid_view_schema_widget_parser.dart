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

import '../model/grid_view_params.dart';
import '../schema_widget.dart';
import '../widget/grid_view_widget.dart';

/// [SchemaWidgetParser] to [GridViewWidget]
@SchemaParser("GridViewWidget",
    "https://schema.legytma.com.br/3.0.0/schema/widget/grid_view_widget.schema.json")
class GridViewSchemaWidgetParser extends SchemaWidgetParser<GridViewWidget> {
  /// Create instance of parser
  GridViewSchemaWidgetParser([JsonSchema jsonSchema])
      : super("GridViewWidget", jsonSchema);

  @override
  GridViewWidget builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    return GridViewWidget(
      buildContext,
      SchemaWidget.parse<GridViewParams>(buildContext, value['params']),
    );
  }
}
