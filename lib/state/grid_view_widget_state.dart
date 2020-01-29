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

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/grid_view_params.dart';
import '../schema_widget.dart';
import '../widget/grid_view_widget.dart';

/// [State]<[GridViewWidget]> of [CustomScrollView]
class GridViewWidgetState extends State<GridViewWidget> {
  final GridViewParams _params;
  final List<Widget> _items = [];

  final ScrollController _scrollController = ScrollController();

  /// Is performing request
  bool isPerformingRequest = false;

  /// If there are no more items, it should not try to load more data while
  /// scroll to bottom.
  bool loadCompleted = false;

  /// Create [GridViewWidgetState]
  GridViewWidgetState(this._params) {
    if (_params.children != null) {
      _items.addAll(_params.children);
    }
  }

  @override
  void initState() {
    super.initState();
    if (_params.loadMoreUrl == null || _params.loadMoreUrl.isEmpty) {
      loadCompleted = true;
      return;
    }
    _scrollController.addListener(() {
      if (!loadCompleted &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  _getMoreData() async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      var jsonString =
          _params.isDemo ? await _fakeRequest() : await _doRequest();
      var buildWidgets =
      SchemaWidget.build(widget.buildContext, jsonDecode(jsonString));
      setState(() {
        if (buildWidgets.isEmpty) {
          loadCompleted = true;
        }
        _items.addAll(buildWidgets);
        isPerformingRequest = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildProgressIndicator() {
    return SliverToBoxAdapter(
      child: Visibility(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Opacity(
              opacity: isPerformingRequest ? 1.0 : 0.0,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        visible: !loadCompleted,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var footer = _buildProgressIndicator();
    var sliverGrid = SliverPadding(
      padding: _params.padding,
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _params.crossAxisCount,
            mainAxisSpacing: _params.mainAxisSpacing,
            crossAxisSpacing: _params.crossAxisSpacing,
            childAspectRatio: _params.childAspectRatio),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _items[index];
          },
          childCount: _items.length,
        ),
      ),
    );

    return CustomScrollView(
      slivers: <Widget>[sliverGrid, footer],
      controller: _scrollController,
      scrollDirection: _params.scrollDirection,
      reverse: _params.reverse,
      shrinkWrap: _params.shrinkWrap,
      cacheExtent: _params.cacheExtent,
    );
  }

  _fakeRequest() async {
// 如果对Future不熟悉，可以参考 https://juejin.im/post/5b2c67a351882574a756f2eb
    return Future.delayed(Duration(seconds: 2), () {
      return """
[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
]          
      """;
    });
  }

  _doRequest() async {
    // Await the http get response, then decode the json-formatted responce.
    try {
      var response = await http.get(Uri.parse(getLoadMoreUrl(
          _params.loadMoreUrl, _items.length, _params.pageSize)));
      if (response.statusCode == 200) {
        return response.body;
      }
    } on Exception catch (e) {
      print(e);
    }
    return "";
  }
}
