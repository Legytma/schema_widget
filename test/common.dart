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
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:schema_widget/json_schema_resolver.dart';
import 'package:schema_widget/resolver/local_json_schema_resolver.dart';

final String schemasBaseUri = "https://schema.legytma.com.br/2.0.0/schema/";

void initLogger() {
  Logger.root.level = Level.WARNING;
  Logger.root.onRecord
      .listen((rec) => print('${rec.level.name}: ${rec.time}: ${rec.message}'));
}

String schemaLocator(Uri uri) {
  final uriString = uri.toString();
  final schemasBasePath = Directory.current.path;

  if (uriString.startsWith(schemasBaseUri)) {
    final fileName = uriString.substring(schemasBaseUri.length);

    return path.join(
        schemasBasePath, "assets", "LegytmaSchemas", "schema", fileName);
  }

  if (uriString.endsWith("://json-schema.org/draft-06/schema#")) {
    return path.join(schemasBasePath, "assets", "draft06.schema.json");
  }

  return null;
}

final LocalJsonSchemaResolver localJsonSchemaResolver = LocalJsonSchemaResolver(
  JsonSchemaResolverStatistics(),
  schemaLocator,
);
