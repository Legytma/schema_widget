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

/// [SchemaWidgetParser] to [ClipRRect]
@SchemaParser("ClipRRect",
    "https://schema.legytma.com.br/2.0.0/schema/widget/clip_r_rect.schema.json")
class ClipRRectSchemaWidgetParser extends SchemaWidgetParser<ClipRRect> {
  /// Create instance of parser
  ClipRRectSchemaWidgetParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
  ClipRRect builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    return ClipRRect(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      clipper: SchemaWidget.parse<CustomClipper<RRect>>(
          buildContext, value['clipper']),
      borderRadius: SchemaWidget.parse<BorderRadius>(
          buildContext, value['borderRadius'], BorderRadius.zero),
      clipBehavior: SchemaWidget.parse<Clip>(
          buildContext, value['clipBehavior'], Clip.antiAlias),
      child: SchemaWidget.parse<Widget>(buildContext, value["child"]),
    );
  }
}
