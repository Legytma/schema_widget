[![GitHub issues](https://img.shields.io/github/issues/Legytma/schema_widget)](https://github.com/Legytma/schema_widget/issues "GitHub issues")
[![GitHub forks](https://img.shields.io/github/forks/Legytma/schema_widget)](https://github.com/Legytma/schema_widget/network "GitHub forks")
[![GitHub stars](https://img.shields.io/github/stars/Legytma/schema_widget)](https://github.com/Legytma/schema_widget/stargazers "GitHub stars")
[![GitHub license](https://img.shields.io/github/license/Legytma/schema_widget)](https://github.com/Legytma/schema_widget/blob/master/LICENSE "GitHub license")
[![Pub](https://img.shields.io/pub/v/schema_widget)](https://pub.dev/packages/schema_widget "Pub")
[![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://github.com/tenhobi/effective_dart "style: effective dart")
![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/Legytma/schema_widget "GitHub tag (latest SemVer)")
![GitHub top language](https://img.shields.io/github/languages/top/Legytma/schema_widget "GitHub top language")
![GitHub contributors](https://img.shields.io/github/contributors/Legytma/schema_widget "GitHub contributors")
![GitHub last commit](https://img.shields.io/github/last-commit/Legytma/schema_widget "GitHub last commit")

# Convert JSON to Widget validating with JSON Schema for Flutter apps

* [What is it](#what-is-it "What is it")
  * [Motivation](#motivation "Motivation")
  * [How this work](#how-this-work "How this work")
    * [`TypeSchemaParser`](#typeschemaparser "TypeSchemaParser")
    * [Schemes](#schemes "Schemes")
* [Getting Started](#getting-started "Getting Started")
  * [Installation](#installation "Installation")
  * [Usage](#usage "Usage")
* [CHANGELOG](https://github.com/Legytma/schema_widget/blob/master/CHANGELOG.md "CHANGELOG")
* [Next steps](#next-steps "Next steps")
* [LICENSE](https://github.com/Legytma/schema_widget/blob/master/LICENSE "LICENSE")

## What is it

The [schema_widget](https://pub.dev/packages/schema_widget "schema_widget") is a Flutter package implemented with base on [dynamic_widget](https://pub.dev/packages/dynamic_widget "dynamic_widget") package that produces widgets dynamically interpreting JSON objects.

### Motivation
A major difficulty for any application developer is to ensure that all users keep their applications up to date to ensure the same user experience and to reduce the time required to fix bugs.

The most commonly used alternative to accelerate this process is [Code Push](https://github.com/Microsoft/code-push) which allows the application update without the need for a new deploy in the store. However in Code Push GitHub itself there is a [Code Push Support for Flutter](https://github.com/Microsoft/code-push/issues/624#issuecomment-532358395) request with comment saying that support depends on implementing dynamic update support in Flutter, there is also a reference to [Flutter Roadmap](https://github.com/flutter/flutter/wiki/Roadmap#changes) saying that support for This type of update is postponed according to the official comment [Code Push / Hot Update / out of band updates](https://github.com/flutter/flutter/issues/14330#issuecomment-485565194), which explains the reasons that led to the decision.

One possible solution to this deadlock is to implement a JSON interpreter that enables screen redesign, which can be obtained using [dynamic_widget](https://pub.dev/packages/dynamic_widget "dynamic_widget"). Although [dynamic_widget](https://pub.dev/packages/dynamic_widget "dynamic_widget") provides an easy way to extend support for other widgets through separate implementations. It limits the use of events and does not allow the use of complex business rules.

### How this work

The basic operation of [schema_widget](https://pub.dev/packages/schema_widget "schema_widget") is very similar to that of [dynamic_widget](https://pub.dev/packages/dynamic_widget "dynamic_widget"). Both interpret JSON and instantiate the widget for it.
The main difference with [schema_widget](https://pub.dev/packages/schema_widget "schema_widget") is that it allows the creation of parsers for any type of object and the use of pre-implemented rules. For this reason, it makes it possible to create much more complex business rules.

The [schema_widget](https://pub.dev/packages/schema_widget "schema_widget") package provides the `SchemaWidget` class, in most cases this will be the only class used. All methods in this class are static.

To add a new parser, the following methods can be used:

Default parsers: This method loads all the default parsers from [schema_widget](https://pub.dev/packages/schema_widget "schema_widget").
```dart
  SchemaWidget.registerParsers();
```

Synchronous: This method can be used to load a custom parser that can be loaded synchronously.
```dart
  TypeSchemaParser typeSchemaParserInstance = CustomTypeSchemaParser();

  SchemaWidget.registerTypeParser(typeSchemaParserInstance);
```

Asynchronous: This method can be used to load a custom parser that needs to be loaded asynchronously.
```dart
  String typeName = "Custom";
  Future<TypeSchemaParser> futureTypeSchemaParserInstance = () async => CustomTypeSchemaParser();

  SchemaWidget.registerTypeParserAsync(typeName, futureTypeSchemaParserInstance);
```

In addition to parsers, any type of function and object for use by parsers can also be registered. For this, the `SchemaWidget.registerLogic(logicName, logic)` method must be used. The logic name must be unique, otherwise the previously registered logic will be replaced.

Example:
```dart
  const string1 = "Hello World";
  const map1 = {"foo": "bar"};
  const object1 = Foo();
  var func1 = () => "Hello World";
  var asyncFunc1 = () async => "Hello World";
  var object2 = Bar();

  SchemaWidget.registerLogic("string1", string1);
  SchemaWidget.registerLogic("map1", map1);
  SchemaWidget.registerLogic("object1", object1);
  SchemaWidget.registerLogic("func1", func1);
  SchemaWidget.registerLogic("asyncFunc1", asyncFunc1);
  SchemaWidget.registerLogic("otherExemple", object2);
```

Both parsers and logics are registered using the [get_it](https://pub.dev/packages/get_it "get_it") package to manage everything.
After registering all the parsers and logic necessary for use. It may be necessary to wait for `GetIt` to finish loading asynchronous parsers. For this, `GetIt` makes `GetIt.I.allReady()` available for use in a `FutureBuilder` for the purpose of creating widgets only after all parsers are loaded as shown in the following example.

```dart
class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key) {
    SchemaWidget.registerParsers();
    SchemaWidget.registerLogic("funcHelloWorld", () => Text("Hello World"));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetIt.I.allReady(ignorePendingAsyncCreation: false),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        return SchemaWidget.parse<Widget>(
          context,
          {
            "type": "Scaffold",
            "appBar": {
              "type": "AppBar",
              "title": {
                "type": "Text",
                "data": "Hello World Example",
              },
            },
            "body": {
              "type": "Center",
              "child": "funcHelloWorld",
            },
          },
        );
      },
    );
  }
}
```

#### `TypeSchemaParser`

Everything in [schema_widget](https://pub.dev/packages/schema_widget "schema_widget") is based on `TypeSchemaParser`.

`TypeSchemaParser` is the implementation of a JSON interpreter that converts it into a complex object.

#### Schemes

The documentation of the schemes used in this version is available at [https://schema.legytma.com.br/2.0.0/docs](https://schema.legytma.com.br/2.0.0/docs "https://schema.legytma.com.br/2.0.0/docs") and all versions of available schemes can be accessed through the link [https://schema.legytma.com.br](https://schema.legytma.com.br "https://schema.legytma.com.br").

## Getting Started

* For help over SchemaWidget usage, view the [example](https://github.com/Legytma/schema_form/tree/master/example);
* For help over class documentation, view the [documentation](https://pub.dev/documentation/schema_widget/latest);
* For help getting started with Flutter, view our online [documentation](https://flutter.io/);
* For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).

### Installation

* Add this to your package's pubspec.yaml file:
```yaml
dependencies:
  get_it:
  schema_widget: ^1.0.0-0
```
* Install packages from the command line:
  with Flutter:
```shell script
$ flutter packages get
```
* Import it into the code file:
```dart
 import 'package:schema_form/schema_form.dart'; 
```

### Usage

```dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:schema_widget/schema_widget.dart';

void main() {
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  runApp(MyApp(navigatorKey: _navigatorKey));
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  MyApp({Key key, this.navigatorKey}) : super(key: key) {
    SchemaWidget.registerParsers();

    SchemaWidget.registerLogic(
      "onGenerateRoute",
      _onGenerateRoute,
    );
    SchemaWidget.registerLogic(
      "onUnknownRoute",
      _onUnknownRoute,
    );
    SchemaWidget.registerLogic(
      "navigatorKey",
      _navigatorKey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetIt.I.allReady(ignorePendingAsyncCreation: false),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        return SchemaWidget.parse<Widget>(
          context,
          {
            "type": "MaterialApp",
            "title": 'SchemaWidget Demo',
            "theme": {
              "primarySwatch": {
                "primary": 0xFF2196F3,
                "swatch": {
                  "50": 0xFFE3F2FD,
                  "100": 0xFFBBDEFB,
                  "200": 0xFF90CAF9,
                  "300": 0xFF64B5F6,
                  "400": 0xFF42A5F5,
                  "500": 0xFF2196F3,
                  "600": 0xFF1E88E5,
                  "700": 0xFF1976D2,
                  "800": 0xFF1565C0,
                  "900": 0xFF0D47A1,
                },
              },
            },
            "navigatorKey": "navigatorKey",
            "initialRoute": "home",
            "onGenerateRoute": "onGenerateRoute",
            "onUnknownRoute": "onUnknownRoute"
          },
        );
      },
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    _logMain.finest("_onGenerateRoute -> settings: $settings");
  
    return MaterialPageRoute(
      builder: (buildContext) => MyHomePage(),
      settings: settings,
    );
  }
  
  Route _onUnknownRoute(RouteSettings settings) {
    _logMain.finest("_onUnknownRoute -> settings: $settings");
  
    return MaterialPageRoute(
      builder: (buildContext) => MyHomePage(),
      settings: settings.copyWith(name: "home"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key) {
    SchemaWidget.registerLogic("funcHelloWorld", () => Text("Hello World"));
  }

  @override
  Widget build(BuildContext context) {
    return SchemaWidget.parse<Widget>(
      context,
      {
        "type": "Scaffold",
        "appBar": {
          "type": "AppBar",
          "title": {
            "type": "Text",
            "data": "Hello World Example",
          },
        },
        "body": {
          "type": "Center",
          "child": "funcHelloWorld",
        },
      },
    );
  }
}
```

## Next steps

- [x] Publish Package;
- [x] Make MVP;
- [x] Minimal documentation;
- [x] Change event binding of click event;
- [ ] Add list of default supported Widgets;
- [ ] Add list of default supported Types;
- [ ] Publish complementar packages;
- [ ] Create example full functional apps;
- [ ] Create content about;
- [ ] Make a commercial product using the package;
