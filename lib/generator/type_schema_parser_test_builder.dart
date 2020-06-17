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
//
// Created by Windol <windol@legytma.com.br> at 19/05/2020.
//

import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as path;

/// Schema Parser Initiator Builder
class TypeSchemaParserTestBuilder implements Builder {
  static const String _outputFileName = 'type_schema_parser_test.g.dart';
  static const String _spectedExtension = ".test.schema.json";

  @override
  Map<String, List<String>> get buildExtensions {
    return const {
      r'$test$': ["parser/$_outputFileName"]
    };
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    final runTypeSchemaParserTests = <String>[];

    await for (final input
        in buildStep.findAssets(Glob('test/**$_spectedExtension'))) {
      var fileName = input.pathSegments.last;
      var className =
          fileName.substring(0, fileName.length - _spectedExtension.length);

      while (className.contains("_")) {
        className = className.replaceFirst("_", "<");
        className = String.fromCharCodes(className.runes.toList().reversed);
        className = className.replaceFirst("_", ">");
        className = String.fromCharCodes(className.runes.toList().reversed);
      }

      className = className.replaceAllMapped(
          RegExp(r"((\WDynamic\W)|(^Dynamic$))"),
          (match) => match.group(0).toLowerCase());

      runTypeSchemaParserTests.add("\trunTypeSchemaParserTests<$className>();");
    }

    var content = "// GENERATED CODE - DO NOT MODIFY BY HAND\n\n";

    content = "${content}part of 'type_schema_parser_test.dart';\n\n";
    content =
        "$content// **************************************************************************\n";
    content = "$content// SchemaParserInitiatorBuilder\n";
    content =
        "$content// **************************************************************************\n\n";
    content = "$content/// Auto generated TypeSchemaParserTests runner\n";
    content = "${content}void runAllTypeSchemaParserTests() {\n";
    content = "$content${runTypeSchemaParserTests.join('\n')}\n";
    content = "$content}\n";

    await buildStep.writeAsString(
      AssetId(
        buildStep.inputId.package,
        path.join('test', 'parser', _outputFileName),
      ),
      content,
    );
  }
}
