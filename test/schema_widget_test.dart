// Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br).
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:schema_widget/schema_widget.dart';

void main() {
  final _log = Logger('schema_widget_test');

  setUpAll(() async {
//    TestWidgetsFlutterBinding.ensureInitialized();

    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen(
        (rec) => print('${rec.level.name}: ${rec.time}: ${rec.message}'));
  });

  test('Register Parsers', () async {
    try {
      var registerParsersFuture =
          SchemaWidget.registerParsersWithDefaultJsonSchemaResolver();

      expect(registerParsersFuture != null, true,
          reason: "registerParsersFuture not instancied.");
      expect(registerParsersFuture is Future, true);

      await registerParsersFuture;

      expect(GetIt.instance.isRegistered(instanceName: "type_parser_widget"),
          false);
      expect(GetIt.instance.isRegistered(instanceName: "type_parser_Widget"),
          true);

      final widget = SchemaWidget.parse<Widget>(null, {"type": "Align"});

      expect(widget != null, true, reason: "Widget not created.");
      expect(widget is Align, true);
      // ignore: avoid_catches_without_on_clauses
    } catch (error, stack) {
      _log.severe(error, stack);
    }
  });
}
