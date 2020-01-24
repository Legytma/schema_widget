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

library schema_widget;

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:json_schema_dart2/json_schema.dart';
import 'package:logging/logging.dart';

import 'parser/align_schema_widget_parser.dart';
import 'parser/aspect_ratio_schema_widget_parser.dart';
import 'parser/asset_image_schema_widget_parser.dart';
import 'parser/baseline_schema_widget_parser.dart';
import 'parser/center_schema_widget_parser.dart';
import 'parser/clip_r_rect_schema_widget_parser.dart';
import 'parser/column_schema_widget_parser.dart';
import 'parser/container_schema_widget_parser.dart';
import 'parser/expanded_schema_widget_parser.dart';
import 'parser/expanded_sized_box_schema_widget_parser.dart';
import 'parser/fitted_box_schema_widget_parser.dart';
import 'parser/grid_view_schema_widget_parser.dart';
import 'parser/indexed_stack_schema_widget_parser.dart';
import 'parser/list_tile_schema_widget_parser.dart';
import 'parser/list_view_schema_widget_parser.dart';
import 'parser/network_image_schema_widget_parser.dart';
import 'parser/opacity_schema_widget_parser.dart';
import 'parser/padding_schema_widget_parser.dart';
import 'parser/page_view_schema_widget_parser.dart';
import 'parser/placeholder_schema_widget_parser.dart';
import 'parser/positioned_schema_widget_parser.dart';
import 'parser/raised_button_schema_widget_parser.dart';
import 'parser/row_schema_widget_parser.dart';
import 'parser/safe_area_schema_widget_parser.dart';
import 'parser/sized_box_schema_widget_parser.dart';
import 'parser/stack_schema_widget_parser.dart';
import 'parser/text_schema_widget_parser.dart';
import 'parser/wrap_schema_widget_parser.dart';
import 'schema_widget_parser.dart';

export 'schema_widget_parser.dart';
export 'utils.dart';

/// Class to group functions to build Widgets using JSON.
class SchemaWidget {
  static final Logger _log = Logger('schema_widget');

  static final GetIt _getIt = GetIt.instance;

  /// Register implemented parsers
  static void registerParsers() {
    registerParser(AlignSchemaWidgetParser());
    registerParser(AspectRatioSchemaWidgetParser());
    registerParser(AssetImageSchemaWidgetParser());
    registerParser(BaselineSchemaWidgetParser());
    registerParser(CenterSchemaWidgetParser());
    registerParser(ClipRRectSchemaWidgetParser());
    registerParser(ColumnSchemaWidgetParser());
    registerParser(ContainerSchemaWidgetParser());
    registerParser(ExpandedSchemaWidgetParser());
    registerParser(ExpandedSizedBoxSchemaWidgetParser());
    registerParser(FittedBoxSchemaWidgetParser());
    registerParser(GridViewSchemaWidgetParser());
    registerParser(IndexedStackSchemaWidgetParser());
    registerParser(ListTileSchemaWidgetParser());
    registerParser(ListViewSchemaWidgetParser());
    registerParser(NetworkImageSchemaWidgetParser());
    registerParser(OpacitySchemaWidgetParser());
    registerParser(PaddingSchemaWidgetParser());
    registerParser(PageViewSchemaWidgetParser());
    registerParser(PlaceholderSchemaWidgetParser());
    registerParser(PositionedSchemaWidgetParser());
    registerParser(RaisedButtonSchemaWidgetParser());
    registerParser(RowSchemaWidgetParser());
    registerParser(SafeAreaSchemaWidgetParser());
    registerParser(SizedBoxSchemaWidgetParser());
    registerParser(StackSchemaWidgetParser());
    registerParser(TextSchemaWidgetParser());
    registerParser(WrapSchemaWidgetParser());
  }

  /// Register Schema Widget Parser on Instance Create
  static void registerParser(SchemaWidgetParser schemaWidgetParser) {
    if (schemaWidgetParser == null) {
      throw Exception("schemaWidgetParser is invalid");
    }

    if (schemaWidgetParser.parserName == null) {
      throw Exception("schemaWidgetParser.parserName is invalid");
    }

    var instanceName = 'parser_${schemaWidgetParser.parserName}';

    _getIt.registerSingleton<SchemaWidgetParser>(schemaWidgetParser,
        instanceName: instanceName, signalsReady: true);

    _log.finest("Parser $instanceName registered!");
  }

  /// Register Logic to apply to widget
  static void registerLogic(String logicName, dynamic logic) {
    if (logicName == null) {
      throw Exception("logicName is invalid");
    }

    var instanceName = 'logic_$logicName';

    _getIt.registerSingleton<dynamic>(logic,
        instanceName: instanceName, signalsReady: true);

    _log.finest("Logic $instanceName registered!");
  }

  /// Get [SchemaWidgetParser] to apply to widget
  static SchemaWidgetParser getParser(String parserName) {
    if (parserName == null) {
      throw Exception("parseName is invalid");
    }

    var instanceName = 'parser_$parserName';

    _log.finest("Getting parser $instanceName...");

    return _getIt.get(instanceName);
  }

  /// Get Logic to apply to widget
  static dynamic parseLogic(dynamic logic) {
    if (logic is String) {
      var instanceName = 'logic_$logic';

      _log.finest("Getting logic $instanceName...");

      return _getIt.get(instanceName);
    }

    return logic;
  }

  /// Build [Widget] from [Map]<[String], [dynamic]>
  static Widget buildFromMap(
      BuildContext buildContext, Map<String, dynamic> layoutMap) {
    if (layoutMap == null) {
      return null;
    }

    var jsonSchema = JsonSchema.createSchema({
      "\$schema": "http://json-schema.org/draft-06/schema#",
//    "\$id": "#widget-schema",
      "title": "Container Parser Schema",
      "description": "Schema to validation of JSON used to parse widget"
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
        },
      },
      "required": ["type"],
    });

    if (!jsonSchema.validate(layoutMap)) {
      _log.severe("Schema inválido!");

      return null;
    }

    var _schemaWidgetParser = getParser(layoutMap['type']);

    return _schemaWidgetParser.parse(buildContext, layoutMap);
  }

  /// Build [List]<[Widget]> from [List]<[dynamic]>
  static List<Widget> buildWidgets(
      BuildContext buildContext, List<dynamic> values) {
    var widgets = <Widget>[];

    if (values != null) {
      for (var value in values) {
        widgets.add(buildFromMap(buildContext, value));
      }
    }

    return widgets;
  }

  /// Do not create an instance...
  SchemaWidget() {
    throw Exception("Do not create instance of class SchemaWidget. All the"
        " methods are static.");
  }
}
