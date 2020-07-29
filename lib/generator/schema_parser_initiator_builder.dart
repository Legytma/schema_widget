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
import 'package:path/path.dart' as path;
import 'package:source_gen/source_gen.dart';

import '../schema_parser_annotation.dart';

/// Schema Parser Initiator Builder
class SchemaParserInitiatorBuilder implements Builder {
  static const String _outputFileName = 'schema_parser_initiator.g.dart';
  static const String _packageSchemaWidgetBase = "package:schema_widget/";

  @override
  Map<String, List<String>> get buildExtensions {
    return const {
      r'$lib$': [_outputFileName]
    };
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    final typeParserImporters = <String>[];
    final typeParserRegisters = <String>[];
    var addBasePackage = true;

    await for (final input in buildStep.findAssets(Glob('lib/**'))) {
      final library = await buildStep.resolver.libraryFor(input);
      final classesInLibrary = LibraryReader(library)
          .annotatedWith(TypeChecker.fromRuntime(SchemaParser));

      typeParserImporters.addAll(classesInLibrary.map((c) {
        var importDeclaration = "${c.element.location.components.first}";

        if (importDeclaration.startsWith(_packageSchemaWidgetBase)) {
          addBasePackage = false;
          importDeclaration =
              importDeclaration.substring(_packageSchemaWidgetBase.length);
        }

        return "import '$importDeclaration';";
      }));

      typeParserRegisters.addAll(classesInLibrary.map((c) {
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
          var classElement = c.element as ClassElement;
          var builderReturnType =
              classElement.lookUpMethod("builder", library).returnType;

          typeName = "$builderReturnType";

          if (typeName == "T") {
            var builderVariantReturnType =
                classElement.lookUpMethod("builderVariant", library).returnType;

            typeName = "$builderVariantReturnType";
          }
        }

        var schemaId = annotationConstantReader.read('schemaId')?.stringValue;
        final elementIdBase = schemaId?.substring(0, schemaId.length - 12);

        var line = "\tSchemaWidget.registerTypeParserAsync(\n";
        line = '$line\t\t"$typeName",\n';
        line = "$line\t\t() async => $elemetName(\n";
        line = "$line\t\t\tawait JsonSchema.createSchemaFromUrl(\n";
        line = '$line\t\t\t\t"$schemaId",\n';
        line = "$line\t\t\t),\n";

        final subTypesConstantReader =
            annotationConstantReader.read('subTypes');

        if (!subTypesConstantReader.isNull) {
          var varants = "";

          var subTypes = subTypesConstantReader?.listValue;

          if (subTypes != null && subTypes.length > 0) {
            varants = "$varants\t\t\t<String, $elemetName>{\n";

            for (var subType in subTypes) {
              final subTypeValue = subType.toStringValue();
              varants = '$varants\t\t\t\t"$subTypeValue": $elemetName(\n';
              varants =
                  "$varants\t\t\t\t\tawait JsonSchema.createSchemaFromUrl(\n";
              varants = '$varants\t\t\t\t\t\t"'
                  '${elementIdBase}_$subTypeValue.schema.json",\n';
              varants = "$varants\t\t\t\t\t),\n";
              varants = '$varants\t\t\t\t),\n';
            }

            varants = "$varants\t\t\t},\n";
          }

          line = "$line$varants";
        }

        line = "$line\t\t),\n";
        line = "$line\t);\n";

        return line;
      }));
    }

    var content = "// GENERATED CODE - DO NOT MODIFY BY HAND\n\n";

    content = "${content}import 'package:json_schema/json_schema.dart';\n";

    if (addBasePackage) {
      content =
          "${content}import '${_packageSchemaWidgetBase}schema_widget.dart';\n";
    }

    content = "$content\n${typeParserImporters.join('\n')}\n";

    if (!addBasePackage) {
      content = "${content}import 'schema_widget.dart';\n";
    }

    content =
        "$content\n// **************************************************************************\n";
    content = "$content// SchemaParserInitiatorBuilder\n";
    content =
        "$content// **************************************************************************\n\n";
    content = "$content/// Auto generated TypeSchemaParser initialization\n";
    content = "${content}void schemaParserRegisterAllTypeParsers() {\n";
    content = "$content${typeParserRegisters.join('\n')}";
    content = "$content}\n";

    await buildStep.writeAsString(
      AssetId(
        buildStep.inputId.package,
        path.join('lib', _outputFileName),
      ),
      content,
    );
  }
}
