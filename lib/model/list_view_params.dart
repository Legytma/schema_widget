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

/// Class to store configuration values of List View
class ListViewParams {
  /// Scroll Direction
  Axis scrollDirection;

  /// Reverse
  bool reverse;

  /// Shrimk Wrap
  bool shrinkWrap;

  /// Cache Extent
  double cacheExtent;

  /// Padding
  EdgeInsetsGeometry padding;

  /// Item Extent
  double itemExtent;

  /// Children
  List<Widget> children;

  /// Page Size
  int pageSize;

  /// Load More URL
  String loadMoreUrl;

  /// Use for demo, if true, it will do the fake request.
  bool isDemo;

  /// Create [ListViewParams]
  ListViewParams(
      this.scrollDirection,
      // ignore: avoid_positional_boolean_parameters
      this.reverse,
      this.shrinkWrap,
      this.cacheExtent,
      this.padding,
      this.itemExtent,
      this.children,
      this.pageSize,
      this.loadMoreUrl,
      this.isDemo);
}
