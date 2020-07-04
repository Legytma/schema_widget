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
import 'package:json_schema/src/json_schema/json_schema.dart';
import 'package:schema_form/schema_form.dart';

import '../../schema_widget.dart';

/// Schema parser from [Map<String, dynamic>] to [MapStringWidgetTemplate]
///
/// Created by Windol <windol@legytma.com.br> at 13/05/2020.
/// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br). All rights reserved.
@SchemaParser("Map<String, WidgetTemplate<dynamic>>",
    "https://schema.legytma.com.br/1.1.2/schema/map_string_widget_template_dynamic.schema.json")
class MapStringWidgetTemplateSchemaParser extends TypeSchemaParser<
    Map<String, WidgetTemplate<dynamic>>,
    Map<String, dynamic>,
    Map<String, WidgetTemplate<dynamic>>> {
  /// Create instance of parser using [JsonSchema] to validate values.
  MapStringWidgetTemplateSchemaParser(JsonSchema jsonSchema)
      : super(jsonSchema);

  @override
  Map<String, WidgetTemplate<dynamic>> builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [Map<String, WidgetTemplate<dynamic>> defaultValue]) {
    var result = <String, WidgetTemplate<dynamic>>{};

    value.forEach((key, val) {
      var widgetTemplate =
          SchemaWidget.parse<WidgetTemplate<dynamic>>(buildContext, val);

      if (widgetTemplate != null && widgetTemplate is WidgetTemplate<dynamic>) {
        result[key] = widgetTemplate;
      }
    });

    return result;
  }
}
