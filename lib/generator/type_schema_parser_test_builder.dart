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

      runTypeSchemaParserTests.add("  runTypeSchemaParserTests<$className>();");
    }

    var content = "// Copyright (c) 2020 Legytma Soluções Inteligentes"
        " (https://legytma.com.br).\n";

    content = "$content//\n";
    content = '$content//  Licensed under the Apache License, Version 2.0'
        ' (the "License");\n';
    content = "$content//  you may not use this file except in compliance"
        " with the License.\n";
    content = "$content//  You may obtain a copy of the License at\n";
    content = "$content//\n";
    content = "$content//       http://www.apache.org/licenses/LICENSE-2.0\n";
    content = "$content//\n";
    content = "$content// Unless required by applicable law or agreed to in"
        " writing, software\n";
    content = '$content// distributed under the License is distributed on an'
        ' "AS IS" BASIS,\n';
    content = "$content// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,"
        " either express or implied.\n";
    content = "$content// See the License for the specific language governing"
        " permissions and\n";
    content = "$content// limitations under the License.\n\n";

    content = "$content// GENERATED CODE - DO NOT MODIFY BY HAND\n\n";

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
