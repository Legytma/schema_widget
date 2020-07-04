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
import 'package:flutter_test/flutter_test.dart';
import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';

import '../lib/schema_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Logger.root.level = Level.ALL;
  Logger.root.onRecord
      .listen((rec) => print('${rec.level.name}: ${rec.time}: ${rec.message}'));

  test('Verify Double validation', () async {
    await SchemaWidget.registerParsers();

    final schemaUrl = "https://schema.legytma.com.br/1.1.2/schema/double.schema.json";
    final jsonSchema = await JsonSchema.createSchemaFromUrl(schemaUrl);

    var validationResults = jsonSchema.validateWithErrors(1.0);

    if (validationResults != null && validationResults.isNotEmpty) {
      fail(validationResults.toString());
    }
  });

  test('Verify Double Named validation', () async {
    await SchemaWidget.registerParsers();

    final schemaUrl = "https://schema.legytma.com.br/1.1.2/schema/double.schema.json";
    final jsonSchema = await JsonSchema.createSchemaFromUrl(schemaUrl);

    var validationResults = jsonSchema.validateWithErrors("normal");

    if (validationResults != null && validationResults.isNotEmpty) {
      fail(validationResults.toString());
    }
  });

  test('Verify Double as String validation', () async {
    await SchemaWidget.registerParsers();

    final schemaUrl = "https://schema.legytma.com.br/1.1.2/schema/double.schema.json";
    final jsonSchema = await JsonSchema.createSchemaFromUrl(schemaUrl);

    var validationResults = jsonSchema.validateWithErrors("-1.2");

    if (validationResults != null && validationResults.isNotEmpty) {
      fail(validationResults.toString());
    }
  });

  test('Create Json Schema widget', () async {
    await SchemaWidget.registerParsers();

    var schemaUrl = "https://schema.legytma.com.br/1.1.2/schema/widget.schema.json";
    var futureJsonSchema = JsonSchema.createSchemaFromUrl(schemaUrl);

    expect(futureJsonSchema != null, true,
        reason: "FutureJsonSchema not instancied.");

    var jsonSchema = await futureJsonSchema;

    expect(jsonSchema != null, true, reason: "JsonSchema not instancied.");
    expect(jsonSchema is JsonSchema, true);
  });

  test('Create Json Schema axis', () async {
    await SchemaWidget.registerParsers();

    var schemaUrl = "https://schema.legytma.com.br/1.1.2/schema/axis.schema.json";
    var futureJsonSchema = JsonSchema.createSchemaFromUrl(schemaUrl);

    expect(futureJsonSchema != null, true,
        reason: "FutureJsonSchema not instancied.");

    var jsonSchema = await futureJsonSchema;

    expect(jsonSchema != null, true, reason: "JsonSchema not instancied.");
    expect(jsonSchema is JsonSchema, true);
  });

  test('Create Json Schema edge_insets', () async {
    await SchemaWidget.registerParsers();

    var schemaUrl = "https://schema.legytma.com.br/1.1.2/schema/edge_insets.schema.json";
    var futureJsonSchema = JsonSchema.createSchemaFromUrl(schemaUrl);

    expect(futureJsonSchema != null, true,
        reason: "FutureJsonSchema not instancied.");

    var jsonSchema = await futureJsonSchema;

    expect(jsonSchema != null, true, reason: "JsonSchema not instancied.");
    expect(jsonSchema is JsonSchema, true);
  });

  test('Create Json Schema safe_area', () async {
    await SchemaWidget.registerParsers();

    var schemaUrl =
        "https://schema.legytma.com.br/1.1.2/schema/widget/safe_area.schema.json";
    var futureJsonSchema = JsonSchema.createSchemaFromUrl(schemaUrl);

    expect(futureJsonSchema != null, true,
        reason: "FutureJsonSchema not instancied.");

    var jsonSchema = await futureJsonSchema;

    expect(jsonSchema != null, true, reason: "JsonSchema not instancied.");
    expect(jsonSchema is JsonSchema, true);
  });
}
