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

import 'package:build/build.dart';

import 'schema_parser_initiator_builder.dart';
import 'type_schema_parser_support_builder.dart';
import 'type_schema_parser_test_builder.dart';

/// Schema Parser Initiator Builder Factory
Builder schemaParserInitiatorBuilder(BuilderOptions options) =>
    SchemaParserInitiatorBuilder();

/// Type Schema Parser Test Builder Factory
Builder typeSchemaParserTestBuilder(BuilderOptions options) =>
    TypeSchemaParserTestBuilder();

/// Type Schema Parser Test Builder Factory
Builder typeSchemaParserSupportBuilder(BuilderOptions options) =>
    TypeSchemaParserSupportBuilder();
