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
library schema_parser_annotation;

/// Schema parser annotation
class SchemaParser {
  /// Schema URI ID
  final String schemaId;

  /// Name of type to parse
  final String typeName;

  /// Variant subtypes
  final List<String> subTypes;

  /// Create annotation instance
  const SchemaParser(this.typeName, this.schemaId, [this.subTypes]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchemaParser &&
          runtimeType == other.runtimeType &&
          schemaId == other.schemaId &&
          typeName == other.typeName &&
          subTypes == other.subTypes;

  @override
  int get hashCode => schemaId.hashCode ^ typeName.hashCode ^ subTypes.hashCode;

  @override
  String toString() {
    return schemaId;
  }
}
