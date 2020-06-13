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

/// Mount url paginated string from url string, current page and page size.
String getLoadMoreUrl(String url, int currentNo, int pageSize) {
  if (url == null) {
    return null;
  }

  url = url.trim();

  if (url.contains("?")) {
    return "$url&startNo=${currentNo.toString()}&pageSize="
        "${pageSize.toString()}";
  }

  return "$url?startNo=${currentNo.toString()}&pageSize=${pageSize.toString()}";
}

//Map<String, WidgetTemplate> parseTemplateMap(
//    BuildContext buildContext, Map<String, dynamic> map) {
//  if (map == null) {
//    return null;
//  }
//
//  var result = <String, WidgetTemplate>{};
//
//  map.forEach((key, value) {
//    var widget = SchemaWidget.build(buildContext, value);
//
//    if (widget != null && widget is WidgetTemplate) {
//      result[key] = widget;
//    }
//  });
//
//  return result;
//}
//
//Map<SchemaType, WidgetTemplate> parseTypeTemplateMap(
//    BuildContext buildContext, dynamic map) {
//  var templateMap = parseTemplateMap(buildContext, map);
//
//  if (templateMap == null) {
//    return null;
//  }
//
//  var result = <SchemaType, WidgetTemplate>{};
//
//  templateMap.forEach((key, value) {
//    result[SchemaType.fromString(key)] = value;
//  });
//
//  return result;
//}
