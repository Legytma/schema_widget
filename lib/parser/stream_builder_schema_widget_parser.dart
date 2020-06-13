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

import '../schema_widget.dart';

/// [SchemaWidgetParser] to [StreamBuilder]
@SchemaParser("StreamBuilder<dynamic>",
    "https://legytma.com.br/schema/widget/stream_builder_dynamic.schema.json")
class StreamBuilderSchemaWidgetParser
    extends SchemaWidgetParser<StreamBuilder<dynamic>> {
  /// Create instance of parser
  StreamBuilderSchemaWidgetParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   StreamBuilder<dynamic> builder(
      BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    return StreamBuilder<dynamic>(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      initialData:
          SchemaWidget.parse<dynamic>(buildContext, value['initialData']),
      stream:
          SchemaWidget.parse<Stream<dynamic>>(buildContext, value['stream']),
      builder: SchemaWidget.parse<AsyncWidgetBuilder<dynamic>>(
          buildContext, value['builder']),
    );
  }
}
