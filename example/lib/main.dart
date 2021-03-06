import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:schema_widget/schema_widget.dart';
import 'package:schema_widget/widget/schema_widget_splash_screen.dart';

void main() {
  const _logIgnore = <String>[
    "JsonSchema",
    "JsonSchemaResolverStatistics",
    "FactoryStatistics",
//    "Validator",
  ];

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    if (_logIgnore.contains(rec.loggerName)) {
      return;
    }

    print('${rec.loggerName} - ${rec.level.name}: ${rec.time}: ${rec.message}');
    // developer.log(
    //   rec.message,
    //   level: rec.level.value,
    //   error: rec.error,
    //   name: rec.loggerName,
    //   sequenceNumber: rec.sequenceNumber,
    //   stackTrace: rec.stackTrace,
    //   time: rec.time,
    //   zone: rec.zone,
    // );
  });

  return runApp(MyApp());
}

/// App widget
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Logger _log = Logger("_MyAppState");

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  Route _onGenerateRoute(RouteSettings settings) {
    _log.finest("_onGenerateRoute -> settings: $settings");

    return MaterialPageRoute(
      builder: (buildContext) => MyHomePage(),
      settings: settings,
    );
  }

  Route _onUnknownRoute(RouteSettings settings) {
    _log.finest("_onUnknownRoute -> settings: $settings");

    return MaterialPageRoute(
      builder: (buildContext) => MyHomePage(),
      settings: settings.copyWith(name: "home"),
    );
  }

  @override
  void initState() {
    super.initState();

    SchemaWidget.registerLogic("onGenerateRoute", _onGenerateRoute);
    SchemaWidget.registerLogic("onUnknownRoute", _onUnknownRoute);
    SchemaWidget.registerLogic("navigatorKey", _navigatorKey);
  }

  @override
  Widget build(BuildContext context) {
    return SchemaWidget(
      {
        "type": "MaterialApp",
        "title": 'Flutter Demo',
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
      loadParsers: true,
      loadSchemas: false,
      waitBuilder: (context) {
        _log.info("Loading SplashScreen...");
        return MaterialApp(
          home: Scaffold(
            body: SchemaWidgetSplashScreen(),
          ),
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}

/// Home widget
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final StreamController<int> _streamControllerInt = StreamController<int>();

  _MyHomePageState() {
    SchemaWidget.registerLogic("streamInt", _streamControllerInt.stream);
    SchemaWidget.registerLogic("buildTextCounter", _buildTextCounter);
    SchemaWidget.registerLogic("incrementCounter", _incrementCounter);
  }

  void _incrementCounter() {
    _streamControllerInt.add(++_counter);
  }

  Widget _buildTextCounter(
      BuildContext buildContext, AsyncSnapshot<dynamic> snapshot) {
    var textStyle = Theme.of(buildContext).textTheme.headline4;

    return SchemaWidget({
      "type": "Text",
      "data": 'You have pushed the button this many times: ${snapshot.data}',
      "style": {
        "type": "TextStyle",
        "color": "#${textStyle.color.value.toRadixString(16)}",
        "debugLabel": textStyle.debugLabel,
        "decoration": textStyle.decoration.toString().substring(15),
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
    return SchemaWidget({
      "type": "Scaffold",
      "appBar": {
        "type": "AppBar",
        "title": {
          "type": "Text",
          "data": "SchemaWidget Demo",
        },
      },
      "body": {
        "type": "Center",
        "child": {
          "type": "Column",
          "mainAxisAlignment": "center",
          "children": [
            {
              "type": "StreamBuilder<dynamic>",
              "stream": "streamInt",
              "initialData": 0,
              "builder": "buildTextCounter",
            },
          ],
        },
      },
      "floatingActionButton": {
        "type": "FloatingActionButton",
        "onPressed": "incrementCounter",
        "tooltip": 'Increment',
        "child": {
          "type": "Icon",
          "icon": {
            "codePoint": Icons.add.codePoint,
            "fontFamily": "MaterialIcons",
          },
        },
      },
    });
  }

  // @override
  // void dispose() {
  //   SchemaWidget.unregisterLogic("streamInt");
  //   SchemaWidget.unregisterLogic("buildTextCounter");
  //   SchemaWidget.unregisterLogic("incrementCounter");

  //   super.dispose();
  // }
}
