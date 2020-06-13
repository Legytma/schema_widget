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
import 'package:flutter/src/widgets/framework.dart';
import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';

import '../schema_widget.dart';

@SchemaParser("CircleAvatar", "https://legytma.com.br/schema/widget/circle_avatar.schema.json")
class CircleAvatarSchemaWidgetParser extends SchemaWidgetParser<CircleAvatar> {
  Logger _log = Logger("CircleAvatarSchemaWidgetParser");

  /// Create instance of parser
  CircleAvatarSchemaWidgetParser(JsonSchema jsonSchema) : super(jsonSchema);

  @override
   CircleAvatar builder(BuildContext buildContext, Map<String, dynamic> value,
      [Widget defaultValue]) {
    _log.finest(value);

    return CircleAvatar(
      key: SchemaWidget.parse<Key>(buildContext, value['key']),
      child: SchemaWidget.parse<Widget>(buildContext, value['child']),
      backgroundColor:
          SchemaWidget.parse<Color>(buildContext, value['backgroundColor']),
      backgroundImage: SchemaWidget.parse<ImageProvider<dynamic>>(
          buildContext, value['backgroundImage']),
      foregroundColor:
          SchemaWidget.parse<Color>(buildContext, value['foregroundColor']),
      maxRadius: SchemaWidget.parse<double>(buildContext, value['maxRadius']),
      minRadius: SchemaWidget.parse<double>(buildContext, value['minRadius']),
      radius: SchemaWidget.parse<double>(buildContext, value['radius']),
    );
  }
}
