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

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:json_schema/json_schema.dart';
import 'package:json_schema/src/json_schema/global_platform_functions.dart';
import 'package:logging/logging.dart';

import 'json_schema_resolver.dart';
import 'schema_parser_initiator.g.dart';
import 'schema_widget_parser.dart';
import 'type_schema_parser.dart';

export 'route_handle_mixin.dart';
export 'schema_parser_annotation.dart';
export 'schema_widget_parser.dart';
export 'type_schema_parser.dart';
export 'utils.dart';
export 'variant_schema_widget_parser.dart';
export 'variant_type_schema_parser.dart';

/// Class to group functions to build Widgets using JSON.
class SchemaWidget {
  static final Logger _log = Logger('schema_widget');

  static final GetIt _getIt = GetIt.instance;

  static Map<String, Map<String, dynamic>> _assetCache;
  static Map<String, JsonSchema> _jsonSchemaCache = <String, JsonSchema>{};

  // ignore: prefer_final_fields
  static bool _initialized = false;

  /// Return default [JsonSchemaResolver]
  static JsonSchemaResolver get _defaultJsonSchemaResolver =>
      JsonSchemaResolver(
        DioCacheManager(CacheConfig()),
        buildCacheOptions(Duration(days: 7)),
        Dio(),
      );

  /// Register implemented parsers with default [JsonSchemaResolver]
  static Future<void> registerParsersWithDefaultJsonSchemaResolver() {
    return registerParsers(_defaultJsonSchemaResolver);
  }

  /// Register implemented parsers
  static Future<void> registerParsers(
      JsonSchemaResolver jsonSchemaResolver) async {
    if (!_initialized) {
      _initialized = true;

      try {
        WidgetsFlutterBinding.ensureInitialized();

        _configureJsonSchema(jsonSchemaResolver);

        await schemaParserRegisterAllTypeParsers();

        await _getIt.allReady(timeout: Duration(seconds: 15));
        // ignore: avoid_catches_without_on_clauses
      } catch (e) {
        _log.severe(e);
      }

      _log.info("_getIt.allReadySync() = ${_getIt.allReadySync()}");
    }
  }

  static void registerTypeParser<T>(
      TypeSchemaParser<T, dynamic, dynamic> typeSchemaParser) {
//    if (typeSchemaParser is SchemaWidgetParser &&
//        typeSchemaParser.parserName == "Widget") {
//      throw Exception("Invalid declaration of WidgetSchemaParser."
//          " WidgetSchemaParser type must be descendent of Widget and must be"
//          " specified: typeSchemaParser -> ${typeSchemaParser.runtimeType},"
//          " T -> $T, parserName: ${typeSchemaParser.parserName}");
//    }

    var instanceName = "type_parser_${typeSchemaParser.parserName}";

    if (_getIt.isRegistered<TypeSchemaParser<T, dynamic, dynamic>>(
        instanceName: instanceName)) {
      var currentTypeParser = _getIt.get<TypeSchemaParser<T, dynamic, dynamic>>(
          instanceName: instanceName);

      if (currentTypeParser == typeSchemaParser) {
        _log.finest("Type parser $instanceName already registered!");

        return;
      }

      _getIt.unregister<TypeSchemaParser<T, dynamic, dynamic>>(
          instanceName: instanceName);

      _log.warning("Other instance of $instanceName type parser registered,"
          " removing...");
    }

    _getIt.registerSingleton<TypeSchemaParser<T, dynamic, dynamic>>(
        typeSchemaParser,
        instanceName: instanceName,
        signalsReady: true);

    _log.finest("Type parser $instanceName registered!");
  }

  static void registerTypeParserAsync<T>(
      String typeName,
      FactoryFuncAsync<TypeSchemaParser<T, dynamic, dynamic>>
          typeSchemaParserFuture) {
//    if (typeSchemaParser is SchemaWidgetParser &&
//        typeSchemaParser.parserName == "Widget") {
//      throw Exception("Invalid declaration of WidgetSchemaParser."
//          " WidgetSchemaParser type must be descendent of Widget and must be"
//          " specified: typeSchemaParser -> ${typeSchemaParser.runtimeType},"
//          " T -> $T, parserName: ${typeSchemaParser.parserName}");
//    }

    var instanceName = "type_parser_$typeName";

    if (_getIt.isRegistered<TypeSchemaParser<T, dynamic, dynamic>>(
        instanceName: instanceName)) {
//      var currentTypeParser = _getIt.get<TypeSchemaParser<T, dynamic, dynamic>>(
//          instanceName: instanceName);
//
//      if (currentTypeParser == typeSchemaParser) {
//        _log.finest("Type parser $instanceName already registered!");
//
//        return;
//      }

      _getIt.unregister<TypeSchemaParser<T, dynamic, dynamic>>(
          instanceName: instanceName);

      _log.warning("Other instance of $instanceName type parser registered,"
          " removing...");
    }

    _getIt.registerSingletonAsync<TypeSchemaParser<T, dynamic, dynamic>>(
      typeSchemaParserFuture,
      instanceName: instanceName,
    );

    _log.finest("Type parser $instanceName registered!");
  }

  static void unregisterTypeParser<T>(Type type) {
    var instanceName = 'type_parser_$type';

    if (_getIt.isRegistered<TypeSchemaParser<T, dynamic, dynamic>>(
        instanceName: instanceName)) {
      _getIt.unregister<TypeSchemaParser<T, dynamic, dynamic>>(
          instanceName: instanceName);
    }
  }

  static TypeSchemaParser<T, dynamic, dynamic> getParserByType<T>(Type type) {
    var instanceName = "type_parser_$type";

    _log.finest("Getting type parser $instanceName...");

    return _getIt.get<TypeSchemaParser<T, dynamic, dynamic>>(
        instanceName: instanceName);
  }

  /// Get [SchemaWidgetParser] to apply to widget
  static TypeSchemaParser<T, dynamic, dynamic> getParserByName<T>(String type) {
    if (type == null) {
      throw Exception("parseName is invalid");
    }

    var instanceName = "type_parser_$type";

    _log.finest("Getting parser $instanceName...");

    return _getIt.get<TypeSchemaParser<T, dynamic, dynamic>>(
        instanceName: instanceName);
  }

  /// Register Logic to apply to widget
  static void registerLogic(String logicName, dynamic logic) {
    if (logicName == null) {
      throw Exception("logicName is invalid");
    }

    var instanceName = 'logic_$logicName';

    if (_getIt.isRegistered(instanceName: instanceName)) {
      var currentLogic = _getIt.get(instanceName: instanceName);

      if (currentLogic == logic) {
        _log.finest("Logic $instanceName already registered!");

        return;
      }

      _getIt.unregister(instanceName: instanceName);

      _log.warning("Other instance of $instanceName logic registered,"
          " removing...");
    }

    _getIt.registerSingleton<dynamic>(logic,
        instanceName: instanceName, signalsReady: true);

    _log.finest("Logic $instanceName registered!");
  }

  static void unregisterLogic(String logicName) {
    var instanceName = 'logic_$logicName';

    if (_getIt.isRegistered(instanceName: instanceName)) {
      _getIt.unregister(instanceName: instanceName);
    }
  }

  /// Get Logic to apply to widget
  static dynamic parseLogic(dynamic logic) {
    if (logic is String) {
      var instanceName = 'logic_$logic';

      _log.finest("Getting logic $instanceName...");

      return _getIt.get(instanceName: instanceName);
    }

    return logic;
  }

  static T parse<T>(BuildContext buildContext, dynamic value,
      [dynamic defaultValue]) {
    if (value == null || value is T) {
      _log.finest("$value == null || $value is $T");

      return value ?? defaultValue;
    }

    try {
      final typeSchemaParser = getParserByType<T>(T);

      _log.finest("typeSchemaParser: $typeSchemaParser");

      if (typeSchemaParser == null || !typeSchemaParser.isFromType(value)) {
        _log.finer("value.runtimeType: ${value.runtimeType},"
            " typeSchemaParser.parserFromType:"
            " ${typeSchemaParser?.parserFromType}"
            " typeSchemaParser.parserFromName:"
            " ${typeSchemaParser?.parserFromName}");
        _log.finest("Parsing logic...");

        return parseLogic(value) ?? defaultValue;
      }

      return typeSchemaParser.parse(buildContext, value, defaultValue) ??
          defaultValue;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      _log.warning("Cannot be found parser to $T: $e");
      _log.finest("Parsing logic...");

      return parseLogic(value) ?? defaultValue;
    }
  }

  /// Do not create an instance...
  SchemaWidget() {
    throw Exception("Do not create instance of class SchemaWidget. All the"
        " methods are static.");
  }

  static void _configureJsonSchema(JsonSchemaResolver jsonSchemaResolver) {
    globalCreateJsonSchemaFromUrl =
        jsonSchemaResolver.createSchemaFromUrl;
  }
}
