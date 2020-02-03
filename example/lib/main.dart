import 'dart:async';

import 'package:flutter/material.dart';
import 'package:schema_widget/schema_widget.dart';

void main() {
  SchemaWidget.registerParsers();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SchemaWidget.build(context, {
      "type": "MaterialApp",
      "title": 'Flutter Demo',
      "theme": ThemeData(
        primarySwatch: Colors.blue,
      ),
      "home": MyHomePage(title: 'Flutter Demo Home Page'),
    });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final StreamController<int> _streamControllerInt = StreamController<int>();

  _MyHomePageState() {
    SchemaWidget.registerLogic("streamInt", _streamControllerInt.stream);
    SchemaWidget.registerLogic("buildTextCounter", _buildTextCounter);
  }

  void _incrementCounter() {
    _streamControllerInt.add(++_counter);
  }

  Widget _buildTextCounter(
      BuildContext buildContext, AsyncSnapshot<dynamic> snapshot) {
    var textStyle = Theme.of(buildContext).textTheme.display1;

    return SchemaWidget.build(buildContext, {
      "type": "Text",
      "data": '${snapshot.data}',
      "style": {
        "type": "TextStyle",
        "color": "#${intToHex(textStyle.color.value, 6)}",
        "debugLabel": textStyle.debugLabel,
        "decoration": textDecorationToString(textStyle.decoration),
        "fontFamily": textStyle.fontFamily,
        "fontSize": textStyle.fontSize,
        "fontWeight": textStyle.fontWeight.toString().substring(11),
        "fontStyle":
            textStyle.fontStyle == FontStyle.italic ? 'italic' : 'normal',
      },
    });
  }

  @override
  Widget build(BuildContext context) {
    var iconData = Icons.add;

    return SchemaWidget.build(context, {
      "type": "Scaffold",
      "appBar": {
        "type": "AppBar",
        "title": {
          "type": "Text",
          "data": widget.title,
        },
      },
      "body": {
        "type": "Center",
        "child": {
          "type": "Column",
          "mainAxisAlignment": "center",
          "children": [
            {
              "type": "Text",
              "data": 'You have pushed the button this many times:',
            },
            {
              "type": "StreamBuilder",
              "stream": "streamInt",
              "initialData": _counter,
              "builder": "buildTextCounter",
            },
          ],
        },
      },
      "floatingActionButton": {
        "type": "FloatingActionButton",
        "onPressed": _incrementCounter,
        "tooltip": 'Increment',
        "child": {
          "type": "Icon",
          "codePoint": "#${intToHex(iconData.codePoint, 5)}",
          "fontFamily": iconData.fontFamily,
          "matchTextDirection": iconData.matchTextDirection,
        },
      },
    });
  }
}
