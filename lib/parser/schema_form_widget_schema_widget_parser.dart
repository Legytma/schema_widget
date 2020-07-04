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
import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';
import 'package:schema_form/schema_form.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to parse [SchemaFormWidget].
@SchemaParser("SchemaFormWidget", 
    "https://schema.legytma.com.br/1.1.2/schema/widget/schema_form_widget.schema.json")
class SchemaFormWidgetSchemaWidgetParser
    extends SchemaWidgetParser<SchemaFormWidget> {
  static final Logger _log = Logger("SchemaFormWidgetSchemaWidgetParser");

  /// Create instance of parser
  SchemaFormWidgetSchemaWidgetParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   SchemaFormWidget builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    _log.finer(value);

    return SchemaFormWidget(
      key: SchemaWidget.parse<Key>(buildContext, value["key"]),
      jsonSchema:
          SchemaWidget.parse<JsonSchema>(buildContext, value["jsonSchema"]),
      typeTemplateMap:
          SchemaWidget.parse<Map<SchemaType, WidgetTemplate<dynamic>>>(
              buildContext, value["typeTemplateMap"]),
      controlTemplateMap:
          SchemaWidget.parse<Map<String, WidgetTemplate<dynamic>>>(
              buildContext, value["controlTemplateMap"]),
      defaultHeader: value["defaultHeader"] ?? true,
      child: SchemaWidget.parse<Widget>(buildContext, value["child"]),
      onChanged:
          SchemaWidget.parse<VoidCallback>(buildContext, value["onChanged"]),
      autovalidate: value["autovalidate"] ?? false,
      initialData: SchemaWidget.parse<Map<String, dynamic>>(
          buildContext, value["initialData"]),
      onSave: SchemaWidget.parse<SaveCallback>(buildContext, value["onSave"]),
      onWillPop:
          SchemaWidget.parse<WillPopCallback>(buildContext, value["onWillPop"]),
    );
  }

  JsonSchema _parseJsonSchema(dynamic value) {
    if (value is JsonSchema) {
      return value;
    }

    if (value == null || !(value is Map<String, dynamic>)) {
      throw Exception("Invalid value on jsonSchema property: $value");
    }

    return JsonSchema.createSchema(value);
  }
}
