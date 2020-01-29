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
import 'package:json_schema_dart2/src/json_schema/json_schema.dart';

import '../model/grid_view_params.dart';
import '../schema_widget.dart';
import '../widget/grid_view_widget.dart';

/// [SchemaWidgetParser] to [GridViewWidget]
class GridViewSchemaWidgetParser extends SchemaWidgetParser {
  @override
  String get parserName => "GridView";

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
          "children": {
            "title": "Children",
            "description": "Array of widgets",
            "type": "array",
          }
        },
        "required": ["type", "children"],
      });

  @override
  Widget builder(BuildContext buildContext, Map<String, dynamic> map) {
    var scrollDirection = Axis.vertical;

    if (map.containsKey("scrollDirection") && "horizontal" == map[""]) {
      scrollDirection = Axis.horizontal;
    }

    int crossAxisCount = map['crossAxisCount'];
    bool reverse = map.containsKey("reverse") ? map['reverse'] : false;
    bool shrinkWrap = map.containsKey("shrinkWrap") ? map["shrinkWrap"] : false;
    double cacheExtent =
        map.containsKey("cacheExtent") ? map["cacheExtent"] : 0.0;
    var padding = map.containsKey('padding')
        ? parseEdgeInsetsGeometry(map['padding'])
        : null;
    double mainAxisSpacing =
        map.containsKey('mainAxisSpacing') ? map['mainAxisSpacing'] : 0.0;
    double crossAxisSpacing =
        map.containsKey('crossAxisSpacing') ? map['crossAxisSpacing'] : 0.0;
    double childAspectRatio =
        map.containsKey('childAspectRatio') ? map['childAspectRatio'] : 1.0;
    var children = SchemaWidget.build(buildContext, map['children']);

    var pageSize = map.containsKey("pageSize") ? map["pageSize"] : 10;
    var loadMoreUrl =
        map.containsKey("loadMoreUrl") ? map["loadMoreUrl"] : null;
    var isDemo = map.containsKey("isDemo") ? map["isDemo"] : false;

    var params = GridViewParams(
        crossAxisCount,
        scrollDirection,
        reverse,
        shrinkWrap,
        cacheExtent,
        padding,
        mainAxisSpacing,
        crossAxisSpacing,
        childAspectRatio,
        children,
        pageSize,
        loadMoreUrl,
        isDemo);

    return GridViewWidget(buildContext, params);
  }
}
