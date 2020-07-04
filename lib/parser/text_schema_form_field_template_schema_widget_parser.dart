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
import 'package:flutter/services.dart';
import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/subjects.dart';
import 'package:schema_form/enum/PickerType.dart';
import 'package:schema_form/widget/control/schema/template/text_schema_form_field_template.dart';

import '../schema_widget.dart';

/// [SchemaWidgetParser] to parse [SchemaFormWidget].
@SchemaParser("TextSchemaFormFieldTemplate", 
    "https://schema.legytma.com.br/1.1.2/schema/widget/text_schema_form_field_template.schema.json")
class TextSchemaFormFieldTemplateSchemaWidgetParser
    extends SchemaWidgetParser<TextSchemaFormFieldTemplate> {
  static final Logger _log =
      Logger("TextSchemaFormFieldTemplateSchemaWidgetParser");

  /// Create instance of parser
  TextSchemaFormFieldTemplateSchemaWidgetParser(JsonSchema jsonSchema)
      : super(jsonSchema);

  @override
   TextSchemaFormFieldTemplate builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    _log.finer(value);

    return TextSchemaFormFieldTemplate(
      key: SchemaWidget.parse<Key>(buildContext, value["key"]),
      fieldName: value['fieldName'],
      onChanged: SchemaWidget.parse<ValueChanged<String>>(
          buildContext, value["onChanged"]),
      autovalidate: value["autovalidate"],
      autofocus: value['autofocus'],
      focusNode:
          SchemaWidget.parse<FocusNode>(buildContext, value['focusNode']),
      keyboardAppearance: SchemaWidget.parse<Brightness>(
          buildContext, value['keyboardAppearance']),
      keyboardType: SchemaWidget.parse<TextInputType>(
          buildContext, value['keyboardType']),
      controller: SchemaWidget.parse<BehaviorSubject<String>>(
          buildContext, value['controller']),
      pickerType:
          SchemaWidget.parse<PickerType>(buildContext, value['pickerType']),
      onTap:
          SchemaWidget.parse<GestureTapCallback>(buildContext, value['onTap']),
      enabled: value['enabled'],
      decoration: SchemaWidget.parse<InputDecoration>(
          buildContext, value['decoration']),
      initialValue: value['initialValue'],
      onSaved: SchemaWidget.parse<FormFieldSetter<String>>(
          buildContext, value['onSaved']),
      validator: SchemaWidget.parse<FormFieldValidator<String>>(
          buildContext, value['validator']),
      textAlign:
          SchemaWidget.parse<TextAlign>(buildContext, value['textAlign']),
      strutStyle:
          SchemaWidget.parse<StrutStyle>(buildContext, value['strutStyle']),
      toolbarOptions: SchemaWidget.parse<ToolbarOptions>(
          buildContext, value['toolbarOptions']),
      textInputAction: SchemaWidget.parse<TextInputAction>(
          buildContext, value['textInputAction']),
      textCapitalization: SchemaWidget.parse<TextCapitalization>(
          buildContext, value['textCapitalization']),
      textAlignVertical: SchemaWidget.parse<TextAlignVertical>(
          buildContext, value['textAlignVertical']),
      showCursor: value['showCursor'],
      scrollPadding:
          SchemaWidget.parse<EdgeInsets>(buildContext, value['scrollPadding']),
      readOnly: value['readOnly'],
      onFieldSubmitted: SchemaWidget.parse<ValueChanged<String>>(
          buildContext, value['onFieldSubmitted']),
      onEditingComplete: SchemaWidget.parse<VoidCallback>(
          buildContext, value['onEditingComplete']),
      obscureText: value['obscureText'],
      maxLengthEnforced: value['maxLengthEnforced'],
      minLines: SchemaWidget.parse<int>(buildContext, value['minLines']),
      maxLength: SchemaWidget.parse<int>(buildContext, value['maxLength']),
      inputFormatters: SchemaWidget.parse<List<TextInputFormatter>>(
          buildContext, value['inputFormatters']),
      expands: value['expands'],
      enableSuggestions: value['enableSuggestions'],
      enableInteractiveSelection: value['enableInteractiveSelection'],
      cursorWidth:
          SchemaWidget.parse<double>(buildContext, value['cursorWidth']),
      cursorRadius:
          SchemaWidget.parse<Radius>(buildContext, value['cursorRadius']),
      cursorColor:
          SchemaWidget.parse<Color>(buildContext, value['cursorColor']),
      buildCounter: SchemaWidget.parse<InputCounterWidgetBuilder>(
          buildContext, value['buildCounter']),
      autocorrect: value['autocorrect'],
      textDirection: SchemaWidget.parse<TextDirection>(
          buildContext, value['textDirection']),
      maxLines: SchemaWidget.parse<int>(buildContext, value['maxLines']),
      style: SchemaWidget.parse<TextStyle>(buildContext, value['style']),
      dateFormat: value['dateFormat'],
    );
  }
}
