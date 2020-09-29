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

import 'enum/navigation_type.dart';
import 'schema_widget.dart';

/// Mixin RouteHandleMixin is used to implement navigation capability on
/// MaterialApp dynamically.
mixin RouteHandleMixin {
  /// Add handle on Map
  void addHandleOnMap(Map<String, dynamic> value, BuildContext buildContext,
      String handleName) {
    if (value.containsKey('navigationType') && value.containsKey('route')) {
      value[handleName] = () {
        routeNavigate(buildContext, value);
      };
    }
  }

  /// Navigate action
  void routeNavigate(BuildContext buildContext, Map<String, dynamic> value) {
    final navigator = Navigator.of(buildContext);

    switch (SchemaWidget.parse<NavigationType>(
        buildContext, value['navigationType'])) {
      case NavigationType.pop:
        navigator?.pop();
        break;
      case NavigationType.popAndPush:
        navigator?.popAndPushNamed(value['route']);
        break;
      case NavigationType.push:
      default:
        navigator?.pushNamed(value['route']);
    }
  }
}
