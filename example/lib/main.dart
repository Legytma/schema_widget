import 'package:flutter/material.dart';
import 'package:schema_widget/schema_widget.dart';

void main() {
  SchemaWidget.registerParsers();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme
        .of(context)
        .textTheme
        .display1;
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
              "type": "Text",
              "data": '$_counter',
              "style": {
                "type": "TextStyle",
                "color": "#${intToHex(textStyle.color.value, 6)}",
                "debugLabel": textStyle.debugLabel,
                "decoration": textDecorationToString(textStyle.decoration),
                "fontFamily": textStyle.fontFamily,
                "fontSize": textStyle.fontSize,
                "fontWeight": textStyle.fontWeight.toString().substring(11),
                "fontStyle": textStyle.fontStyle == FontStyle.italic
                    ? 'italic'
                    : 'normal',
              },
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
