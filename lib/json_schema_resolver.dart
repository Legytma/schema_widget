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

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:json_schema/json_schema.dart';
import 'package:json_schema/src/json_schema/utils.dart';

/// JsonSchema resolver abstract
class JsonSchemaResolver {
  final DioCacheManager _dioCacheManager;
  final Options _cacheOptions;
  final Dio _dio;

  var _cache = <String, JsonSchema>{};

  /// Create a instance of [JsonSchemaResolver]
  JsonSchemaResolver([
    this._dioCacheManager,
    this._cacheOptions,
    this._dio,
  ]);

  /// [JsonSchema] resolver from URL string
  Future<JsonSchema> createSchemaFromUrl(String schemaUrl,
      {SchemaVersion schemaVersion}) async {
    if (_cache.containsKey(schemaUrl)) {
      return _cache[schemaUrl];
    }

    final uriWithFrag = Uri.parse(schemaUrl);
    final uri =
        schemaUrl.endsWith('#') ? uriWithFrag : uriWithFrag.removeFragment();
    final uriWithoutFragment = uri.toString();
    JsonSchema parentSchema;

    if (_cache.containsKey(uriWithoutFragment)) {
      parentSchema = _cache[uriWithoutFragment];
    } else {
      final response = await _dio.getUri(uri, options: _cacheOptions);

      // HTTP servers / file systems ignore fragments, so resolve a sub-map if a fragment was specified.
      parentSchema = await JsonSchema.createSchemaAsync(response.data,
          schemaVersion: schemaVersion, fetchedFromUri: uri);

      if (parentSchema != null) {
        _cache[uriWithoutFragment] = parentSchema;
      }
    }

    final schema =
        JsonSchemaUtils.getSubMapFromFragment(parentSchema, uriWithFrag);

    if (schema != null) {
      _cache[schemaUrl] = schema;
    }

    return schema ?? parentSchema;
  }
}
