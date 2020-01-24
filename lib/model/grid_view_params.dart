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

/// Class to store configuration values of Grid View
class GridViewParams {
  /// Cross Axis Count
  int crossAxisCount;

  /// Scroll Direction
  Axis scrollDirection;

  /// Reverse
  bool reverse;

  /// Shrink Wrap
  bool shrinkWrap;

  /// Cache Extent
  double cacheExtent;

  /// Padding
  EdgeInsetsGeometry padding;

  /// Main Axis Spacing
  double mainAxisSpacing;

  /// Cross Axis Spacing
  double crossAxisSpacing;

  /// Child Aspect Ratio
  double childAspectRatio;

  /// Children
  List<Widget> children;

  /// Page Size
  int pageSize;

  /// Load More Url
  String loadMoreUrl;

  /// Use for demo, if true, it will do the fake request.
  bool isDemo;

  /// Create instance of [GridViewParams]
  GridViewParams(
      this.crossAxisCount,
      this.scrollDirection,
      // ignore: avoid_positional_boolean_parameters
      this.reverse,
      this.shrinkWrap,
      this.cacheExtent,
      this.padding,
      this.mainAxisSpacing,
      this.crossAxisSpacing,
      this.childAspectRatio,
      this.children,
      this.pageSize,
      this.loadMoreUrl,
      this.isDemo);
}
