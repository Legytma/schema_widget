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

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';

import '../../lib/schema_widget.dart';

final Logger _logger = Logger('align_schema_widget_parser_test');

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  Logger.root.level = Level.ALL;
  Logger.root.onRecord
      .listen((rec) => print('${rec.level.name}: ${rec.time}: ${rec.message}'));

  return SchemaWidget.registerParsers().then((_) {
    runSchemaWidgetParserTests<Align>();
    runSchemaWidgetParserTests<Alignment>();
  });
}

void runSchemaWidgetParserTests<T>() {
  final type = T;
  final file = File("./test/parser/schema/$type.json");
  final fileContent = file.readAsStringSync();
  final Map<String, dynamic> fileMap = json.decode(fileContent);
  final String groupDescription = fileMap['description'];
  final List<dynamic> validTestMaps = fileMap['valid_schemas'];
  final List<dynamic> invalidTestMaps = fileMap['invalid_schemas'];

  group(groupDescription, () {
    group('$groupDescription (Valid)', () {
      for (final validTestMap in validTestMaps) {
        final String testDescription = validTestMap['description'];
        final validTestValue = validTestMap['value'];

        test(testDescription, () {
          try {
            final object = SchemaWidget.parse<T>(null, validTestValue);

            expect(object != null, true, reason: "$type not created.");
            expect(object is T, true, reason: "Object is not $type");
            // ignore: avoid_catches_without_on_clauses
          } catch (e, stack) {
            _logger.severe("Fail on run '$testDescription':", e, stack);

            fail('Schema is expected to be valid, but was not.');
          }
        });
      }
    });

    group('$groupDescription (Invalid)', () {
      for (final invalidTestMap in invalidTestMaps) {
        final String testDescription = invalidTestMap['description'];
        final invalidTestValue = invalidTestMap['value'];

        test(testDescription, () {
          try {
            final object = SchemaWidget.parse<T>(null, invalidTestValue);

            expect(object == null && object is! T, true,
                reason: "Schema is expected to be valid, but was not.");
            // ignore: avoid_catches_without_on_clauses
          } catch (e, stack) {
            _logger.info(
                "Fail on run '$testDescription': ${e.runtimeType}", e, stack);
          }
        });
      }
    });
  });
}
