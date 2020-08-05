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

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:source_gen/source_gen.dart';

import '../schema_parser_annotation.dart';

/// Type Schema Parser Support Builder
class TypeSchemaParserSupportBuilder implements Builder {
  static const String _outputFileName = 'TYPE_SCHEMA_PARSER_SUPPORT.md';

  @override
  Map<String, List<String>> get buildExtensions {
    return const {
      r'$lib$': ["../$_outputFileName"]
    };
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    final typeParserList = <String>[];
    final widgetParserList = <String>[];

    await for (final input in buildStep.findAssets(Glob('**/*.dart'))) {
      final library = await buildStep.resolver.libraryFor(input);
      final classesInLibrary = LibraryReader(library)
          .annotatedWith(TypeChecker.fromRuntime(SchemaParser));

      for (var c in classesInLibrary) {
        final elemetName = c.element.name;
        final annotationsInElement =
            TypeChecker.fromRuntime(SchemaParser).annotationsOf(c.element);

        if (annotationsInElement.isEmpty || annotationsInElement.length > 1) {
          throw Exception("No @$SchemaParser() annotation added or "
              "You tried to add multiple @$SchemaParser() annotations to the "
              "same element ($elemetName), but that's not possible.");
        }

        final annotationDartObject = annotationsInElement.single;
        final annotationConstantReader = ConstantReader(annotationDartObject);

        String typeName;

        if (c.element is ClassElement) {
          final classElement = c.element as ClassElement;
          final builderReturnType =
              classElement.lookUpMethod("builder", library).returnType;

          typeName = "$builderReturnType";

          if (typeName == "T") {
            final builderVariantReturnType =
                classElement.lookUpMethod("builderVariant", library).returnType;

            typeName = "$builderVariantReturnType";
          }
        }

        final schemaId = annotationConstantReader.read('schemaId')?.stringValue;
        final documentUrl = schemaId.replaceAllMapped(
          RegExp(r'(.*)(schema\/.*)(\/.*)(\.schema\.json)'),
          (match) => "${match.group(1)}docs${match.group(3)}.html",
        );

//        print(c.element.library.identifier);
//        print(buildStep.inputId.package);

        final parserName = c.element.displayName;
        final baseIndex = buildStep.inputId.package.length + 8;
        final parserSuffix = c.element.library.identifier.substring(baseIndex);
        final parserUri = "lib$parserSuffix";
        final parserColumn = '[$parserName]($parserUri "$parserName")';
        final typeColumn = '[`$typeName`]($documentUrl "$typeName")';
        final schemaIdColumn = '[`$schemaId`]($schemaId "$schemaId")';
        final line = '$parserColumn | $typeColumn | $schemaIdColumn';

        if (c.element.library.identifier.contains("/parser/type/")) {
          typeParserList.add(line);
        } else {
          widgetParserList.add(line);
        }
      }
    }

    var content = "# List of Type Schema Parsers Supported\n\n";

    content = "${content}The implemented parsers are listed in two tables:";
    content = '$content [Widgets Parsers](#widgets-parsers "Widgets Parsers")';
    content = '$content and [Other Objects Parsers](#other-objects-parsers';
    content = '$content "Other Objects Parsers").\n';
    content = "${content}Both tables show:\n";
    content = "$content* In the Parser column, the name of the implemented";
    content = "$content parser class;\n";
    content = "$content* In the Schema Documentation column, the name of the";
    content = "$content object, with the link to the JSON schema";
    content = "$content documentation;\n";
    content = "$content* In the Schema ID column, the URL of the schema.\n\n";
    content = "${content}The documentation of all the schemes used in this";
    content = "$content version is available at";
    content = '$content [https://schema.legytma.com.br/2.0.0/docs]';
    content = '$content(https://schema.legytma.com.br/2.0.0/docs';
    content = '$content "https://schema.legytma.com.br/2.0.0/docs"). The';
    content = "$content documentation for all versions of the schemes can be";
    content = "$content accessed through the link";
    content = '$content [https://schema.legytma.com.br]';
    content = '$content(https://schema.legytma.com.br';
    content = '$content "https://schema.legytma.com.br").\n\n';

    content = "$content## Widgets Parsers\n\n";
    content = "${content}Parser | Schema Documentation | Schema ID\n";
    content = "$content--- | --- | ---\n";
    content = "$content${widgetParserList.join('\n')}\n\n";

    content = "$content## Other Objects Parsers\n\n";
    content = "${content}Parser | Schema Documentation | Schema ID\n";
    content = "$content--- | --- | ---\n";
    content = "$content${typeParserList.join('\n')}\n";

    await buildStep.writeAsString(
      AssetId(buildStep.inputId.package, _outputFileName),
      content,
    );
  }
}
