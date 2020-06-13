/*
 * Copyright (c) 2020 Legytma Soluções Inteligentes (https://legytma.com.br).
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';

import '../model/list_view_params.dart';
import '../state/list_view_widget_state.dart';

/// Widget of custom list view
class ListViewWidget extends StatefulWidget {
  final BuildContext _buildContext;
  final ListViewParams _params;

  /// Get build context used to create GridViewWidget
  BuildContext get buildContext => _buildContext;

  /// Create instance of [ListViewWidget] using [BuildContext] and
  /// [ListViewParams]
  ListViewWidget(this._buildContext, this._params);

  @override
  ListViewWidgetState createState() => ListViewWidgetState(_params);
}
