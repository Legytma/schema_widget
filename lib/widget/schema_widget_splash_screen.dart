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

import 'package:flutter/material.dart';

import '../json_schema_resolver.dart';
import '../schema_widget.dart';

///
class SchemaWidgetSplashScreen extends StatefulWidget {
  /// Child [Widget]
  final Widget child;

  /// Create [SchemaWidgetSplashScreen] instance
  const SchemaWidgetSplashScreen({Key key, this.child}) : super(key: key);

  @override
  _SchemaWidgetSplashScreenState createState() =>
      _SchemaWidgetSplashScreenState();
}

class _SchemaWidgetSplashScreenState extends State<SchemaWidgetSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
          image: AssetImage(
            "assets/LegytmaSolucoesInteligentes.png",
            package: "schema_widget",
          ),
        ),
        StreamBuilder<FactoryStatistics>(
          stream: SchemaWidget.factoryStream,
          builder: (buildContext, snapshot) {
            if (snapshot.hasData) {
              var factoryStatistics = snapshot.data;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    factoryStatistics.toString(),
                    style: TextStyle(
                      fontSize: 7,
                      color: Colors.black54,
                    ),
                  ),
                  LinearProgressIndicator(
                    value: factoryStatistics.value,
                  ),
                ],
              );
            }

            return CircularProgressIndicator();
          },
        ),
        StreamBuilder<JsonSchemaResolverStatistics>(
          stream: SchemaWidget.jsonSchemaResolverStream,
          builder: (buildContext, snapshot) {
            if (snapshot.hasData) {
              var jsonSchemaResolverStatistics = snapshot.data;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    jsonSchemaResolverStatistics.toString(),
                    style: TextStyle(
                      fontSize: 7,
                      color: Colors.black54,
                    ),
                  ),
                  LinearProgressIndicator(
                    value: jsonSchemaResolverStatistics.requestValue,
                  ),
                ],
              );
            }

            return CircularProgressIndicator();
          },
        ),
        widget.child ??
            StreamBuilder<FactoryStatistics>(
              stream: SchemaWidget.factoryStream,
              builder: (buildContext, snapshot) {
                if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return Container();
              },
            ),
      ],
    );
  }
}
