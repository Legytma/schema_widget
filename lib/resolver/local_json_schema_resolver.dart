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

import '../json_schema_resolver.dart';

/// JsonSchema resolver abstract
class LocalJsonSchemaResolver extends JsonSchemaResolver {
  final JsonSchemaResolverStatistics _jsonSchemaResolverStatistics;
  final String Function(Uri uri) mapUriToPath;

  /// create instance
  LocalJsonSchemaResolver(
    this._jsonSchemaResolverStatistics,
    this.mapUriToPath,
  );

  @override
  JsonSchemaResolverStatistics get jsonSchemaResolverStatistics =>
      _jsonSchemaResolverStatistics;

  @override
  Future<dynamic> requestSchemaData(Uri uri) async {
    final filePath = mapUriToPath(uri);

    if (filePath != null) {
      final file = File(filePath);

      if (file != null && file.existsSync()) {
        return file.readAsStringSync();
      }
    }

    throw Exception("Error on request $uri: Failed to open file $filePath");
  }
}
