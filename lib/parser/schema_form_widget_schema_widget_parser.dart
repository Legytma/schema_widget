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
class SchemaFormWidgetSchemaWidgetParser extends SchemaWidgetParser {
  static final Logger _log = Logger("SchemaFormWidgetSchemaWidgetParser");

  @override
  String get parserName => "SchemaForm";

  @override
  JsonSchema get jsonSchema => JsonSchema.createSchema({
        "\$schema": "http://json-schema.org/draft-06/schema#",
//        "\$id": "#widget-schema",
        "title": "Container Parser Schema",
        "description": "Schema to validation of JSON used to parse Container"
            " Widget.",
        "type": "object",
        "\$comment": "You can add all valid properties to complete validation.",
        "properties": {
          "type": {
            "\$comment": "Used to identify parser. Every parser can permit only"
                " one type",
            "title": "Type",
            "description": "Identify the widget type",
            "type": "string",
            "default": parserName,
            "examples": [parserName],
            "enum": [parserName],
            "const": parserName,
          },
          "jsonSchema": {
            "title": "JSON Schema",
            "description": "Schema used to validate and generate form",
            "type": "object",
          },
        },
        "required": ["type", "jsonSchema"],
      });

  @override
  Widget builder(BuildContext buildContext, Map<String, dynamic> map) {
    _log.finer(map);

    return SchemaFormWidget(
      key: SchemaWidget.build(buildContext, map["key"]),
      jsonSchema: _parseJsonSchema(map["jsonSchema"]),
      typeTemplateMap:
          _parseTypeTemplateMap(buildContext, map["typeTemplateMap"]),
      controlTemplateMap: _parseTemplateMap(
        buildContext,
        map["controlTemplateMap"],
      ),
      defaultHeader:
          SchemaWidget.build(buildContext, map["defaultHeader"]) ?? true,
      child: SchemaWidget.build(buildContext, map["child"]),
      onChanged: SchemaWidget.build(buildContext, map["onChanged"]),
      autovalidate:
          SchemaWidget.build(buildContext, map["autovalidate"]) ?? false,
      initialData: SchemaWidget.build(buildContext, map["initialData"]),
      onSave: SchemaWidget.build(buildContext, map["onSave"]),
      onWillPop: SchemaWidget.build(buildContext, map["onWillPop"]),
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

  Map<String, WidgetTemplate> _parseTemplateMap(
      BuildContext buildContext, Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    var result = <String, WidgetTemplate>{};

    map.forEach((key, value) {
      var widget = SchemaWidget.build(buildContext, value);

      if (widget != null && widget is WidgetTemplate) {
        result[key] = widget;
      }
    });

    return result;
  }

  Map<SchemaType, WidgetTemplate> _parseTypeTemplateMap(
      BuildContext buildContext, dynamic map) {
    var templateMap = _parseTemplateMap(buildContext, map);

    if (templateMap == null) {
      return null;
    }

    var result = <SchemaType, WidgetTemplate>{};

    templateMap.forEach((key, value) {
      result[SchemaType.fromString(key)] = value;
    });

    return result;
  }
}
