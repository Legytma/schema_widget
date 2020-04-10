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
import 'package:json_schema/src/json_schema/json_schema.dart';
import 'package:logging/logging.dart';
import 'package:schema_form/widget/control/schema/text_schema_form_field_widget.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to parse [TextSchemaFormFieldWidget]
class TextSchemaFormFieldWidgetSchemaWidgetParser extends SchemaWidgetParser {
  static final Logger _log =
      Logger("TextSchemaFormFieldWidgetSchemaWidgetParser");

  @override
  String get parserName => "TextSchemaFormField";

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
          "fieldName": {
            "title": "Field Name",
            "description": "Name of field into schema",
            "type": "string",
          }
        },
        "required": ["type", "fieldName"],
      });

  @override
  Widget builder(BuildContext buildContext, Map<String, dynamic> map) {
    _log.finer('map: $map');

    return TextSchemaFormFieldWidget(
      key: SchemaWidget.build(buildContext, map["key"]),
      fieldName: map['fieldName'],
      onChanged: SchemaWidget.build(buildContext, map["onChanged"]),
      autovalidate: map["autovalidate"],
      autofocus: map['autofocus'],
      focusNode: parseFocusNode(buildContext, map['focusNode']),
      keyboardAppearance: parseKeyboardAppearance(map['keyboardAppearance']),
      keyboardType: parseKeyboardType(map['keyboardType']),
      controller: SchemaWidget.build(buildContext, map['controller']),
      pickerType: parsePickerType(map['pickerType']),
      onTap: SchemaWidget.build(buildContext, map['onTap']),
      enabled: map['enabled'],
      decoration: parseInputDecoration(buildContext, map['decoration']),
      initialValue: map['initialValue'],
      onSaved: SchemaWidget.build(buildContext, map['onSaved']),
      validator: SchemaWidget.build(buildContext, map['validator']),
      textAlign: parseTextAlign(map['textAlign']),
      strutStyle: parseStrutStyle(map['strutStyle']),
      toolbarOptions: parseToolbarOptions(map['toolbarOptions']),
      textInputAction: parseTextInputAction(map['textInputAction']),
      textCapitalization: parseTextCapitalization(map['textCapitalization']),
      textAlignVertical: parseTextAlignVertical(map['textAlignVertical']),
      showCursor: map['showCursor'],
      scrollPadding: parseEdgeInsetsGeometry(map['scrollPadding']),
      readOnly: map['readOnly'],
      onFieldSubmitted:
          SchemaWidget.build(buildContext, map['onFieldSubmitted']),
      onEditingComplete:
          SchemaWidget.build(buildContext, map['onEditingComplete']),
      obscureText: map['obscureText'],
      maxLengthEnforced: map['maxLengthEnforced'],
      minLines: map['minLines'],
      maxLength: map['maxLength'],
      inputFormatters: SchemaWidget.build(buildContext, map['inputFormatters']),
      expands: map['expands'],
      enableSuggestions: map['enableSuggestions'],
      enableInteractiveSelection: map['enableInteractiveSelection'],
      cursorWidth: parseDouble(map['cursorWidth']),
      cursorRadius: parseRadius(map['cursorRadius']),
      cursorColor: parseHexColor(map['cursorColor']),
      buildCounter: SchemaWidget.build(buildContext, map['buildCounter']),
      autocorrect: map['autocorrect'],
      textDirection: parseTextDirection(map['textDirection']),
      maxLines: map['maxLines'],
      style: parseTextStyle(map['style']),
      dateFormat: map['dateFormat'],
    );
  }
}
