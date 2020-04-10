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
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';

import '../../lib/schema_widget.dart';

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord
      .listen((rec) => print('${rec.level.name}: ${rec.time}: ${rec.message}'));

  SchemaWidget.registerParsers();

  final schema = {"type": "Card"};
  final reference = Card();

  test('create card', () {
    final widget = SchemaWidget.build(null, schema);

    expect(widget != null, true, reason: "Widget not created.");
    expect(widget is Card, true);
  });

  test('verify default values card', () {
    final Card widget = SchemaWidget.build(null, schema);

    expect(widget != null, true, reason: "Widget not created.");
    expect(widget.key, reference.key);
    expect(widget.child, reference.child);
    expect(widget.borderOnForeground, reference.borderOnForeground);
    expect(widget.clipBehavior, reference.clipBehavior);
    expect(widget.color, reference.color);
    expect(widget.elevation, reference.elevation);
    expect(widget.margin, reference.margin);
    expect(widget.semanticContainer, reference.semanticContainer);
    expect(widget.shape, reference.shape);
  });
}
