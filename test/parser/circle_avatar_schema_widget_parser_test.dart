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

  test('create circle avatar', () {
    SchemaWidget.registerParsers();

    final widget = SchemaWidget.build(null, {"type": "CircleAvatar"});

    expect(widget is CircleAvatar, true);
  });
}
